----------------------------------------------------------------------
-- PlayNet ZeroMQ Instancing Management Interface.
-- Copyright (C) 2011, PlayNet Inc, All Rights Reserved.
-- Not for redistribution.
--
-- Originating Programmer: Oliver "kfsone" Smith
-- Created: 2011/04/27 20:01.13 CDT
--
--[[
	Provides the "Instancing" interface for implementing
	a Lua-based ZeroMQ Instance client or server.

	Instancing.Config defines the default address,
	along with properties of the known interfaces.

	Instancing:Start(<role> [, <address>])
		Configures the Instancing object and establishes
		the communications connections.
		role := "Client" or "Server"
		address := overrides the default server address.

	Instancing:SetInstance(<numeric instance UniqueID>)
		In the Client role, tells ZeroMQ only to receive
		events for the specified instance. Provide a
		value of "0" if you are not in an instance.

	Instancing.getMessage(<zmqSocket> [, <zmqSocketOptions>])
		Reads the next complete message from the specified
		zmqSocket and returns it as an array of parts, even
		if there is only one message part.

	See InstancingClient.lua for Client specific functions,
	See InstancingServer.lua for Server specific functions.
]]--

-- The ZeroMQ API
if game ~= nil and game.LoadLib ~= nil and type(game.LoadLib) == "function" then
	game.LoadLib("zmq") 	-- We're on the client.
else
	require "zmq"			-- We're on the server.
end

require 'string'	-- For the string format function
require 'table'		-- For table.insert
require "InstancingCommands"


Instancing =
{
	--------- --------- --------- --------- --------- ---------
	-- CONFIGURATION
	--------- --------- --------- --------- --------- ---------

	--------- --------- --------- --------- --------- ---------
	-- Server parameters and default values.
	Config =
	{
	  ['DefaultAddress']	=	'192.168.0.61'
	, ['Interfaces'] =
	  {
		['Console']	=	{ ['Port'] = '27020', ['Type'] = { ['Client'] = zmq.REQ, ['Server'] = zmq.REP } }
	  , ['Command']	=	{ ['Port'] = '27021', ['Type'] = { ['Client'] = zmq.PUSH, ['Server'] = zmq.PULL } }
	  , ['Events']	=	{ ['Port'] = '27022', ['Type'] = { ['Client'] = zmq.SUB, ['Server'] = zmq.PUB } }
	  }
	}

	--------- --------- --------- --------- --------- ---------
	-- Ordered list of commands.
	-- This must be shared between client/host to keep them in
	-- synchronization.
,	Commands =
	{
		"GetInstanceState"
	,	"SetStateValue"
	,	"InstanceEvent"
	}

	-- Number of IO threads to tell ZeroMQ to use.
,	IOThreads		=	{ ['Client'] = 1, ['Server'] = 2 }

,	Role			=	nil		-- Will be either "Client" or "Server".
,	Context			=	nil		-- ZeroMQ context wrapper.
,	HostAddress		=	nil		-- Host address we connected to.
,	ConsoleSock		=	nil		-- Will be the bi-directional socket to the lua command process.
,	CommandSock		=	nil		-- Will be the send-only socket to the lua trigger processor.
,	EventSock		=	nil		-- Will be the read-only socket for broadcasted events.
,	CurrentInstance	=	nil		-- The instance we've subscribed to.

,	SuccessCode		=	'OK'	-- Returned to indicate things went well
,	ErrorCode		=	'ERR'	-- Returned to indicate something failed.

, 	InstanceHandlers =	{}		-- Routines for handling changes to instances.
,	InstanceStates	=	{}
,	InstanceId		=	nil		-- Current instance (formatted)
,	InstanceNo		=	nil		-- Current instance (number)

,	Running			=	false	-- Gets set to true by Start

	--------- --------- --------- --------- --------- ---------
	-- Functions
	-- - Functions marked 'private' are not for use outside of
	--   the class itself.
	-- - Functions marked 'public' are usable by anyone.
	-- - Functions are called using Instancing:FunctionName()
	-- - Except where marked "static" (names start with lowercase)
	--------- --------- --------- --------- --------- ---------

	--------- --------- --------- --------- --------- ---------
	-- Return true/false whether we are the client.

,	IsClient = function(self)
		return self.Role and self.Role == "Client"
	end

	--------- --------- --------- --------- --------- ---------
	-- Return true/false whether we are the server.

,	IsServer = function(self)
		return self.Role and self.Role == "Server"
	end

	--------- --------- --------- --------- --------- ---------
	-- Turn an instance's unique ID into a hex 16-char string
	-- public: static

,	formatInstanceNo = function (instanceNo)
		return string.format("%016u", tonumber(instanceNo))
	end

	--------- --------- --------- --------- --------- ---------
	-- Create and connect a socket for a given interface based on our current role.
	-- private:

,	_OpenInterface = function (self, ifName)
		-- Gotta have a context to do anything.
		if self.Context == nil then
			return error("Tried to call OpenInterface without a Context")
		end

		local interface = self.Config.Interfaces[ifName]
		if not interface then
			return error("Unknown interface name: " .. ifName)
		end

		local ifType = interface.Type[self.Role]
		if not ifType then
			return error("Interface " .. ifName .. " not supported in " .. self.Type .. " role")
		end

		local sock = self.Context:socket(ifType)
		if not sock then
			return error("Unable to create socket for " .. ifName .. " interface")
		end

		-- The host always binds ports, the client always connects to them.
		local uri = "tcp://" .. self.HostAddress .. ":" .. interface.Port
		if self:IsClient() then
			sock:connect(uri)
		else
			sock:bind(uri)
		end

		return sock
	end

	--------- --------- --------- --------- --------- --------- --------- ---------
	-- Look up a command by name.

,	LookupCommand = function (self, cmdName)
		for cNum, cName in ipairs(self.Commands)
		do
			if cName == cmdName then
				return { Instancing.SuccessCode, cNum }
			end
		end
		return { Instancing.ErrorCode, "No such command "..cmdName.."." }
	end

	--------- --------- --------- --------- --------- --------- --------- ---------
	-- Invoke (run locally) a command by index number along with variable args.
	-- e.g. Instancing:InvokeCommand(3, "hello", "world")

,	InvokeCommand = function (self, cmdNum, ...)
		-- Command number argument must be numeric.
		if type(cmdNum) ~= "number" then
			return { Instancing.ErrorCode, "Invalid InvokeCommand usage (arg #1)" }
		end

		-- It must also be in the range 1 .. len(Commands)
		-- Note, because Lua tables are 1 based, being == #Commands
		-- is quite legal.
		if cmdNum < 1 or cmdNum > #self.Commands then
			return { Instancing.ErrorCode, "Invalid command number #"..cmdNum }
		end

		-- Name of the command.
		local cmdName = self[cmdNum]
		if cmdName == nil then
			return { Instancing.ErrorCode, "No function registered for #"..cmdNum..". Something is foobar." }
		end

		local fn = self[cmdName]
		if not fn then
			return { Instancing.ErrorCode, "Could not find registered function Instancing."..cmdName.."." }
		end
		if type(fn) ~= "function" then
			return { Instancing.ErrorCode, "Instancing."..cmdName.." does not appear to be a function." }
		end

		-- Invoke the function, passing any remaining args to it.
		table.insert(arg, 1, self)	-- Needs self at the start of the arg list.

		local success, output = pcall( fn(unpack(arg)) )
		if success then
			return { Instancing.SuccessCode, output }
		else
			return { Instancing.ErrorCode, output }
		end
	end

	--------- --------- --------- --------- --------- --------- --------- ---------
	-- Send an instruction to execute a command to the remote.
	-- Takes a registered command name and a vararg list of arguments.

,	SendCommand = function (self, zmqSocket, cmdName, ...)
		if zmqSocket == nil or type(zmqSocket) ~= "userdata" then
			return { Instancing.ErrorCode, "Invalid zms argument - expected socket." }
		end

		-- First argument must be a string.
		if type(cmdName) ~= string then
			return { Instancing.ErrorCode, "Invalid cmd argument - expected string." }
		end

		-- Look for the command.
		local lookup = self:LookupCommand(cmdName)
		if lookup[1] ~= Instancing.SuccessCode then
			return lookup
		end

		-- Send all of the arguments as parts.
		for _, val in arg
		do
			zmqSocket:send(string.format("%q", arg), zmq.SNDMORE)
		end

		-- Finish the message with the cmd number.
		zmqSocket:send(tonumber(lookup[2]), zmq.NOBLOCK)

		return { Instancing.SuccessCode, "-- data passed to zmq, may not actually have been sent yet." }
	end

	--------- --------- --------- --------- --------- ---------
	-- Tear up the ZeroMQ communications system and open the interfaces.
	-- public:

,	Start = function (self, role, address)
		print(string.format("D Instancing:Start(%s, %s)", tostring(role), tostring(address)))

		-- Validate the role argument, must be client or server.
		if not role or (role ~= "Client" and role ~= "Server") then
			return error("Invalid use of Instancing.Start. Usage: Instancing:Start(\"Client\"|\"Server\" [, \"host.ip.addr\" ]")
		end

		-- Establish the role.
		self.Role = role
		print("D Role is " .. self.Role)

		-- Use the default address if none is supplied
		if not address then
			address = self.Config.DefaultAddress
			print("D Using Default Address of " .. address)
		end

		self.HostAddress = address
		print("D Using server address " .. self.HostAddress)

		-- Start a ZMQ thread if one isn't already started.
		if not self.Context then
			self.Context = zmq.init(self.IOThreads[self.Role])
		end

		-- Create the interfaces.
		self.ConsoleSock = self:_OpenInterface("Console")
		self.CommandSock = self:_OpenInterface("Command")
		self.EventSock   = self:_OpenInterface("Events")

		-- On the client, we need to subscribe to something
		-- if we're going to receive events;
		-- Start with a default instance of 0 (the campaign).
		if self:IsClient() and self.EventSock then
			self:SetInstance(0)
		end

		self.Running = true

		print("I " .. self.Role .. " ready.")
	end

	--------- --------- --------- --------- --------- ---------
	-- Retrieve a message, or a set of multi-part messages,
	-- as an array of message parts.
	-- optional argument 'zmqOptions' can be set to zmq.NOBLOCK
	-- if you want to avoid blocking.
	-- Returns NIL if no messages were received.
	-- public: static

,	getMessage = function (zmqSocket, zmqOptions)
		local parts = {}
		local msg
		while true
		do
			msg = zmqSocket:recv(zmqOptions)
			if not msg then break end
			table.insert(parts, msg)
			print("part #" .. #parts .. ": " .. tostring(msg))
			-- ui.ChatPrint("part #" .. #parts .. ": " .. tostring(msg))

			-- ZMQ will set the "RCVMORE" value on a socket
			-- if the message was a non-terminal part of a
			-- multi-part message.
			-- If RCVMORE is not set, it's time to stop.
			if zmqSocket:getopt(zmq.RCVMORE) == 0 then break end
		end

		-- No parts, no array.
		if #parts == 0 then return nil end

		return parts
	end



	--------- --------- --------- --------- --------- ---------
	-- Register a handler function for tracking changes to a
	-- particular state.

	function Instancing.RegisterHandler(self, state, handler)
		Instancing.InstanceHandlers[state] = handler
	end

	--------- --------- --------- --------- --------- ---------
	-- Apply a change to an instance value and, if there is a
	-- handler (trigger) associated with the valueName, call it.

,	ChangeValue = function (self, instanceNo, valueName, value)
		local instanceId = self.formatInstanceNo(tonumber(instanceNo))
		-- Client needs to make sure it only processes changes for
		-- it's instance.
		if self:IsClient() and self.InstanceId ~= instanceId then
			return { Instancing.ErrorCode, "Message does not apply to current state." }
		end

		-- Grab the old value and swap in the new.
		local state = Instancing.InstanceStates[instanceId]
		local oldValue = state[valueName]
		state[valueName] = value

		local handlers = Instancing.InstanceHandles[instanceId]
		if type(handlers) == 'table' then
			local handler = handlers[state]
				if handler ~= nil and type(_G[handler]) == "function" then
					local status, msg = pcall(_G[handler](state, value, oldValue))
					if not status then
						return { Instancing.ErrorCode, valueName.." state change handler error: "..msg.."." }
					end
				end
			end
		end

		return { Instancing.SuccessCode, "-- "..valueName.." value changed '"..oldValue.."' -> '"..value.."'." }
	end

	--------- --------- --------- --------- --------- ---------
	-- Translate an instance ID into a numeric value.

, 	formatInstanceId = function(instanceId)
		return tonumber(instanceNo)
	end
}

--------- --------- --------- --------- --------- ---------
-- Helper function that will unpack results from the instancing routines.

function write(x)
	if type(x) == "table" then
		print(unpack(x))
	else
		print(tostring(x))
	end
end

--------- --------- --------- --------- --------- ---------
-- Display a textual representation of the structure of a
-- Lua table.
--	e.g.
--	crawl(myTable)

function crawl(tbl, indent)
	local str = ""
	if indent == nil then indent = "" end

	for k, v in pairs(tbl)
	do
		str = str .. string.format("%s%s %s %s\n", indent, k, type(v), tostring(v))
		if type(v) == "table" then
			str = str .. crawl(v, indent .. "  ")
		end
	end
	return str
end

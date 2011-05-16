--
-- Lua server code
--

require 'Instancing'
require 'string'

--------- --------- --------- --------- --------- ---------
function Instancing.PublishCmd(self, instanceNo, cmdName, ...)
	if self.Context == nil then
		return { Instancing.ErrorCode, "Called SendEvent without a Context." }
	end

	local sock = self.EventSock
	if sock == nil or type(sock) ~= "userdata" then
		return { Instancing.ErrorCode, "EventSock not connected." }
	end

	local instanceId = self.formatInstanceNo(instanceNo)

	print( "sending event " .. instanceId .. ", " .. code )

	local lookup = self:LookupCommand(cmdName)
	if lookup[1] ~= Instancing.SuccessCode then
		return lookup
	end
	local cmdNum = lookup[2]

	-- Send the instanceId as the first part of the message,
	-- the code as the second.
	self.EventSock:send(instanceId, zmq.SNDMORE)
	for _, v in arg
	do
		self.EventSock:send(arg, zmq.SNDMORE)
	end
	self.EventSock:send(cmdNum, zmq.NOBLOCK)

	return { Instancing.SuccessCode, "-- event passed to zmq, data may not actually have been sent yet." }
end

--------- --------- --------- --------- --------- ---------
-- Apply an instance state change.

function Instancing.SetStateValue(self, instanceNo, stateName, value)
	if instanceNo == nil or stateName == nil then
		return { Instancing.ErrorCode, "-- invalid arguments to SetStateValue" }
	end

	-- Convert to hex format for better hashing.
	local instanceId = self.formatInstanceNo(instanceNo)

	-- Check to see if the value needs modifying.
	local instanceStates = self.InstanceStates[instanceId]
	if not instanceStates then
		instanceStates = { ['id'] = instanceId, ['no'] = instanceNo }
		self.InstanceStates[instanceId] = instanceStates
	end

	local currentValue = instanceStates[stateName]
	if tostring(currentValue) == tostring(value) then
		return { Instancing.SuccessCode, "-- No change made" }
	end

	instanceStates[state] = value

	return self:PublishCmd(tonumber(instanceId), "SetStateValue", stateName, value)
end

function Instancing.InstanceEvent(self, instanceNo, state, value, broadcast, forward)
	if instanceNo == nil
	or state == nil or type(state) ~= "string"
	or broadcast == nil
	or forward == nil
		then return { Instancing.ErrorCode, "Incorrect usage of InstanceEvent: expects instanceNo, state, value, broadcast, forward" }
	end

	-- Handle the case where we received an instanceId instead of an instanceNo.
	instanceNo = tonumber(instanceNo)
	if instanceNo == 0 then
		return { Instancing.ErrorCode, "InstanceEvent needs an instanceNo" }
	end

	self:PublishCmd(instanceNo, "ChangeStateValue",
	-- Client and Server implement SendEvent themselves,
	-- which means we can't access it as self.Event
	local bcastFn = self['SendEvent']
	if bcastFn then
		-- Always pass "false" in the forward column.
		-- We can't use : notation, so we have to manually
		-- pass the "self" argument.
		print("forwarding")
		print( unpack( bcastFn(self, instanceNo, string.format("return Instancing:DoInstanceEvent(%u, %q, %q, %s, false)", instanceId, state, tostring(value), tostring(forward))) ) )
	end

	-- Only update state on the server or when we are the
	return { Instancing.SuccessCode, "-- Instance event sent" }
end


--------- --------- --------- --------- --------- ---------
-- Retrieve a dump of instance state variables etc.
-- Course, this doesn't provide timers and stuff.

function Instancing.GetInstanceState(self, instanceNo)
	local instanceId = self.formatInstanceNo(instanceNo)
	local instanceStates = self.InstanceStates[instanceId]
	if not instanceStates or type(intanceStates) ~= "table" then
		return { Instancing.ErrorCode, "No such instance "..instanceNo.."." }
	end

	local keyvalues = ""
	for k, v in pairs(instanceStates)
	do
		keyvalues = keyvalues .. string.format("[%q]=%q,", k, v)
	end
	return { Instancing.SuccessCode, "{"..keyvalues.."}" }
end

-- Start the communications stuff.
Instancing:Start("Server")

local parts

function drainConsole(zmqSocket)
	while true
	do
		local parts = Instancing.getMessage(zmqSocket, zmq.NOBLOCK)
		if parts == nil or #parts == 0 then
			return
		end

		-- Pop the command number off the end of the list,
		-- leaving "parts" as the argument list.
		local cmdNum = tonumber(parts, #parts)
		print("D --con-> cmd#"..cmdNum)

		-- Execute and get the result pair.
		local result = Instancing:InvokeCommand(cmdNum, parts)

		print("D <-con-- " .. result[1] .. ", " .. tostring(result[2]))
		zmqSocket:send(result[1], zmq.SNDMORE)
		zmqSocket:send(result[2], zmq.NOBLOCK)
	end
end

function drainCommand(zmqSocket)
	while true
	do
		local parts = Instancing.getMessage(zmqSocket, zmq.NOBLOCK)
		if parts == nil or #parts == 0 then
			return
		end

		-- Pop the command number off the end of the list,
		-- leaving "parts" as the argument list.
		local cmdNum = tonumber(parts, #parts)
		print("D --con-> cmd#"..cmdNum)

		-- Execute and get the result pair.
		local result = Instancing:InvokeCommand(cmdNum, parts)
		print("D result: " .. result[1] .. ", " .. tostring(result[2]))
	end
end

-- Set up a poller for the incoming sockets.
zmq.poller = require "zmq/poller"
poller = zmq.poller(2)

poller:add(Instancing.CommandSock, zmq.POLLIN, drainCommand)
poller:add(Instancing.ConsoleSock, zmq.POLLIN, drainConsole)

-- Ok, now sit and watch.
while Instancing.Running
do
	-- Wait upto 100ms for events.
	poller:poll(100 * 1000)

	-- TODO:PERSIST: If we have a timer/event queue, process it here.
end

print("N shutting down.")


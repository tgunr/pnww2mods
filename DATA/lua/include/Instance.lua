----------------------------------------------------------------------
-- PlayNet Instancing Management Interface.
-- Copyright (C) 2012, PlayNet Inc, All Rights Reserved.
-- Not for redistribution.
--
-- Originating Programmer: Oliver "kfsone" Smith
-- Supporting Programmer: Troy "Ramp" Lowe
-- Created: 2012/01/19 16:00:00 CDT
--
--[[
	Instance class definition
]]--

-- base class
Include("Instancing")

Instance = InstanceState:create()
InstanceInterface = { __index = Instance }
 
-- constructor with no arguments
function Instance:create()
	local data = InstanceState:create()
	
	-- string instance id
	data.id = ""
	
	-- our send data callback
	data.sendCallback = nil
	
	-- our list of players
	data.players = {}
	
	return setmetatable(data, InstanceInterface)
end

-- constructor with arguments
-- i = string id of instance
-- s = send data callback
function Instance:new(i, s)
	local instance = Instance:create()
	
	-- string instance id
	instance.id = i
	
	-- our send data callback
	instance.sendCallback = s
	
	return instance
end

-- string id of instance
function Instance:Id()
	return self.id
end

-- number id of instance
function Instance:No()
	return tonumber(self.id)
end

-- look up a command by number
-- returns a InstanceResult object
function Instance:CommandNumber(cmdName)
	-- these are shared between the host and the client
	-- defined in Instancing.lua
	for cNum, cName in ipairs(Instancing.Commands)
	do
		if cName == cmdName then
			return InstanceResult:success(cNum)
		end
	end
	return InstanceResult:failure("No such command "..cmdName..".")
end

-- look up a command by name
-- returns a InstanceResult object
function Instance:CommandName(cmdNum)
	-- these are shared between the host and the client
	-- defined in Instance.lua
	for cNum, cName in ipairs(Instancing.Commands)
	do
		if cNum == cmdNum then
			return InstanceResult:success(cName)
		end
	end
	return InstanceResult:failure("No such command "..cmdNum..".")
end


-- sends off a json argument
-- cmdName must be a valid shared command
-- returns a InstanceResult object
function Instance:SendCommand(cmdName, ...)
	-- First argument must be a string.
	if type(cmdName) ~= "string" then
		return InstanceResult:failure("Invalid cmd argument - expected string.")
	end
	
	-- Look for the command.
	local lookup = self:CommandNumber(cmdName)
	
	-- bad command, bail
	if lookup:IsFailure() then
		return lookup
	end
	
	-- setup our arguments
	-- lookup.data as the command number in it
	local args = {self.id, lookup.data};
	
	-- add all of the arguments as parts.
	for _, val in ipairs(arg)
	do
		if type(val) == "number" then
			table.insert(args, val);
		else
			table.insert(args, string.format('%q', val));
		end
	end
	
	-- send it as a json string using the send callback
	if self.sendCallback ~= nil then
		self.sendCallback(self.id, json.encode(args))
		return InstanceResult:success("-- data sent, may not actually have been sent yet.")
	else
		return InstanceResult:failure("-- send callback not defined.")
	end
end

-- takes a json argument from some external source (host or client)
-- returns a InstanceResult object
function Instance:RecvCommand(data)

	if type(data) ~= "string" then
		return InstanceResult:failure("Invalid ReceiveCommand - expected string")
	end
	
	-- get our arguments
	local args = json.decode(data);
	
	Instancing.report('D', 'RecvCommand', crawl(args))
	
	-- must be atable
	if type(args) ~= "table" then
		return InstanceResult:failure("Invalid ReceiveCommand - unable to parse table")
	end
	
	-- make sure this was for our instance
	if args[1] ~= self.id then
		return InstanceResult:failure("Invalid ReceiveCommand - incorrect id")
	end
	
	-- instance id
	local id = table.remove(args, 1)
	
	-- command number
	local cmdNum = tonumber(table.remove(args, 1))
	
	-- lookup our command
	local lookup = self:CommandName(cmdNum)
	
	-- bad command, bail
	if lookup:IsFailure() then
		return InstanceResult:failure("Invalid command number #" .. cmdNum)
	end
	
	-- Name of the command.
	local cmdName = lookup.data
	
	-- get our recv function
	local fn = self["Recv" .. cmdName]
	
	-- bad function bail
	if not fn then
		return InstanceResult:failure("Could not find registered function Instance."..cmdName..".")
	end
	
	if type(fn) ~= "function" then
		return InstanceResult:failure("Instance."..cmdName.." does not appear to be a function.")
	end
	
	-- debug it
	local dbug = "Invoking "..cmdName.."("
	for i, v in ipairs(args) do dbug = dbug .. tostring(v).." " end
	dbug = dbug .. ")"
	Instancing:report('D', 'ReceiveCommand', dbug)

	-- Invoke the function, passing any remaining args to it.
	local success, output = pcall(fn, self, unpack(args))
	if success == false then
		return InstanceResult:failure(output)
	end
	
	-- Handle case where we return {code, result}
	if type(output) == "table" and output["_result"] == true then
		return output
	else
		return InstanceResult:success(output)
	end
end

-- create a player if we didn't already have him
function Instance:CreatePlayer(callsign)
	-- make sure callsign is lower case
	callsign = string.lower(callsign)	
	
	if self.players[callsign] == nil then
		self.players[callsign] = InstancePlayer:new(self, callsign)
	end
end

-- remove a player if we had him
function Instance:DeletePlayer(callsign)
	-- make sure callsign is lower case
	callsign = string.lower(callsign)
	
	if self.players[callsign] ~= nil then
		self.players[callsign] = nil
	end
end

-- get a player, creating him on the fly as needed
function Instance:GetPlayer(callsign)
	-- make sure callsign is lower case
	callsign = string.lower(callsign)
	
	-- ensure the player is created
	self.CreatePlayer(callsign)
	
	-- return it
	return self.players[callsign]
end

--------------------------------------------------------------
-- functions that can be overriden
--------------------------------------------------------------

-- all of these return a InstanceResult object
-- there is a ClientInstance class but the default
-- behavior defined here is the client behavior

--------- --------- --------- --------- --------- ---------
-- SetState

-- shortcut to SendSetState
function Instance:SetState(valueName, value)
	return self:SendSetState(valueName, value)
end

-- sends a shared state off to the other side
function Instance:SendSetState(valueName, value)
	return self:SendCommand("SetState", valueName, value)
end

-- recvs a shared state from to the other side
function Instance:RecvSetState(valueName, value)
	return self:ChangeState(valueName, value)
end

--------- --------- --------- --------- --------- ---------
-- Tell the server to add a new state value.

-- shortcut for SendAddState
function Instance:AddState(valueName, value)
	return self:SendAddState(valueName, value)
end

-- sends a shared add state off to the other side
function Instance:SendAddState(valueName, value)
	return self:SendCommand("AddState", valueName, value)
end

-- recvs a shared add state from to the other side
-- add simply adds to the state (could be positive or negative)
-- only numbers are supported
function Instance:RecvAddState(valueName, value)
	local oldValue = self:GetStateNumber(valueName)
	local newValue = oldValue + tonumber(value)
	return self:ChangeState(valueName, newVale)
end

--------- --------- --------- --------- --------- ---------
-- Tell the server to change a state value.

-- shortcut to SendKeepAlive
function Instance:KeepAlive(valueName, value)
	return self:SendKeepAlive(valueName, value)
end

-- send a keep alive to the other side
function Instance:SendKeepAlive(valueName, value)
	return self:SendCommand("KeepAlive", valueName, value)
end

-- recv a keep alive from the other side
function Instance:RecvKeepAlive(valueName, value)
	return self:ChangeState(valueName, newVale)
end

--------- --------- --------- --------- --------- ---------
-- Tell the server to do something with a timed event?

-- shortcut for SendSetTimer
function Instance:SetTimer(timerName, duration)
	return self:SendSetTimer(timerName, duration)
end

-- sends a timer off to the other side
function Instance:SendSetTimer(timerName, duration)
	return self:SendCommand("SetTimer", timerName, duration)
end

-- recvs a timer from the other side
function Instance:RecvSetTimer(timerName, duration)
	return self:ChangeState(timerName, duration)
end

--------- --------- --------- --------- --------- ---------
-- General broadcast - nothing is saved, just relayed

-- shotcur for SendBroadcastEvent
function Instance:BroadcastEvent(valueName, value)
	return self:SendBroadcastEvent(valueName, value)
end

-- sends a broadcast to the other side
function Instance:SendBroadcastEvent(valueName, value)
	return self:SendCommand("BroadcastEvent", valueName, value)
end

-- broadcasts aren't saved, just handled if a handler was defined for the state
function Instance:RecvBroadcastEvent(valueName, value)
	return self:HandleState(valueName, value)
end

--------- --------- --------- --------- --------- ---------
-- Send updated info about myself

-- shortcut for SendSetPlayerState
function Instance:SetPlayerState(callsign, valueName, value)
	return self:SendSetPlayerState(callsign, valueName, value)
end

-- send a player state change to the other side
function Instance:SendSetPlayerState(callsign, valueName, value)
	return self:SendCommand("SetPlayerState", string.lower(callsign), valueName, value)
end

-- recv a player state change from the other side
function Instance:RecvSetPlayerState(callsign, valueName, value)
	local player = self:GetPlayer(string.lower(callsign))
	player:SetState(valueName, value)
end

--------- --------- --------- --------- --------- ---------
-- Send incremental info about myself

-- shortcut for SendAddPlayerState
function Instance:AddPlayerState(callsign, valueName, value)
	return self:SendAddPlayerState(callsign, valueName, value)
end

-- send a player add state to the other side
function Instance:SendAddPlayerState(callsign, valueName, value)
	return self:SendCommand("AddPlayerState", string.lower(callsign), valueName, value)
end

-- recv a player add state from the other side
function Instance:RecvAddPlayerState(callsign, valueName, value)
	local player = self:GetPlayer(string.lower(callsign))
	player:AddState(valueName, value)
end

--------- --------- --------- --------- --------- ---------
-- Let the instance know about us

-- shortcut for SendRegisterClient
function Instance:RegisterClient(callsign)
	return self:SendRegisterClient(callsign)
end

-- tells the other side about our client
-- passes our callsign
function Instance:SendRegisterClient(callsign)
	return self:SendCommand("RegisterClient", string.lower(callsign))
end

-- the default response is to get back the full state
-- and players of the instance
function Instance:RecvRegisterClient(state, players)
	for k,v in pairs(state)
	do
		-- this will cause handlers to be called, desired?
		self:ChangeState(k, v)
	end
	
	-- set our current list of players
	self.players = players
end


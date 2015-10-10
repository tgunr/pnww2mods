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

	local lookup = self:LookupCommand(cmdName)
	if lookup[1] ~= Instancing.SuccessCode then
		return lookup
	end
	local cmdNum = lookup[2]

	local dbug = "Publishing cmd " .. cmdName .. "(" .. instanceId .. ","
	for i, v in ipairs(arg) do dbug = dbug .. tostring(v).."," end
	dbug = dbug .. ") -- #" .. cmdNum
	self:report('D', 'PublishCmd', dbug)

	-- Send the instanceId as the first part of the message,
	-- the code as the second.
	self.EventSock:send(instanceId, zmq.SNDMORE)
	for _, v in ipairs(arg)
	do
		local value = v
		if type(value) ~= "number" then value = string.format("%q", v) end
		self.EventSock:send(value, zmq.SNDMORE)
	end
	self.EventSock:send(cmdNum, zmq.NOBLOCK)

	return { Instancing.SuccessCode, "-- event passed to zmq, data may not actually have been sent yet." }
end

--------- --------- --------- --------- --------- ---------
-- Setup an instance timer

function Instancing.SetTimer(self, instanceNo, name, duration)
		instanceNo = tonumber(instanceNo)
		duration = tonumber(duration)
		local now = os.time()
		-- see if we already have this timer
		for i,t in ipairs(self.InstanceTimers) do
				if t[1] == instanceNo and t[5] == name then
						if duration > 0 then
								self:report('N', 'SetTimer', string.format("Updating timer %s to %u minutes", name, duration))
								self:SetStateValue(t[1], t[5], duration)
								t[2] = 0
								t[3] = now
								t[4] = now + duration
						else
								self:report('N', 'SetTimer', string.format("Removing timer %s", name))
								table.remove(self.InstanceTimers, i)
						end
						return
				end
		end
		if duration > 0 then
				self:report('I', "Adding timer for instance " .. instanceNo .. " named " .. name .. " " .. (tonumber(duration) / 60) .. " minutes from now.")
				self:SetStateValue(instanceNo, name, duration)
				table.insert(self.InstanceTimers, {instanceNo, 0, now, now + duration, name})
		end
end

--------- --------- --------- --------- --------- ---------
-- Set player data

function Instancing.SetPlayer(self, instanceNo, callsign, stateName, value)
	if instanceNo == nil or callsign == nil or stateName == nil then
		return { Instancing.ErrorCode, "-- invalid arguments to SetPlayer" }
	end
	
	-- Convert to hex format for better hashing.
	-- local instanceId = self.formatInstanceNo(instanceNo)

	-- get our player
	local player = self:GetPlayer(instanceNo, callsign)
	
	if stateName == "team" and tonumber(value) == 0 then
		-- we need to remove this player
		self:RemovePlayer(instanceNo, callsign)
	else
		local currentValue = player[stateName]
		
		if tostring(currentValue) == tostring(value) then
			return { Instancing.SuccessCode, "-- No change made" }
		end
		
		player[stateName] = value
	end
	
	-- return self:PublishCmd(tonumber(instanceId), "SetPlayer", callsign, stateName, value)
	return self:PublishCmd(instanceNo, "SetPlayer", callsign, stateName, value)
end

--------- --------- --------- --------- --------- ---------
-- Set player data

function Instancing.AddPlayer(self, instanceNo, callsign, stateName, value)
	if instanceNo == nil or callsign == nil or stateName == nil then
		return { Instancing.ErrorCode, "-- invalid arguments to SetPlayer" }
	end
	
	-- Convert to hex format for better hashing.
	-- local instanceId = self.formatInstanceNo(instanceNo)
	
	-- get our player
	local player = self:GetPlayer(instanceNo, callsign)
	
	local currentValue = player[stateName]
	
	if currentValue == nil then
		currentValue = 0
	end
	
	local newValue = currentValue + tonumber(value)
	
	if currentValue == newValue then
		return { Instancing.SuccessCode, "-- No change made" }
	end
	
	player[stateName] = newValue
	
	-- Convert to hex format for better hashing.
	-- local instanceId = self.formatInstanceNo(instanceNo)
	
	-- return self:PublishCmd(tonumber(instanceId), "SetPlayer", callsign, stateName, newValue)
	return self:PublishCmd(instanceNo, "SetPlayer", callsign, stateName, newValue)
end

--------- --------- --------- --------- --------- ---------
-- Apply an instance state change.

function Instancing.SetStateValue(self, instanceNo, stateName, value)
	if instanceNo == nil or stateName == nil then
		return { Instancing.ErrorCode, "-- invalid arguments to SetStateValue" }
	end

	-- Convert to hex format for better hashing.
	-- local instanceId = self.formatInstanceNo(instanceNo)

	-- grab our state
	local instanceStates = self:GetState(instanceNo)

	-- this might cause new clients to miss updated data?
	local currentValue = instanceStates[stateName]
	
	if tostring(currentValue) == tostring(value) then
		return { Instancing.SuccessCode, "-- No change made" }
	end

	instanceStates[stateName] = value

	-- return self:PublishCmd(tonumber(instanceId), "SetStateValue", stateName, value)
	return self:PublishCmd(instanceNo, "SetStateValue", stateName, value)
end

--------- --------- --------- --------- --------- ---------
-- Add an instance state value to the current state value.

function Instancing.AddStateValue(self, instanceNo, stateName, value)
	if instanceNo == nil or stateName == nil then
		return { Instancing.ErrorCode, "-- invalid arguments to AddStateValue" }
	end

	-- Convert to hex format for better hashing.
	-- local instanceId = self.formatInstanceNo(instanceNo)

	-- grab our state
	local instanceStates = self:GetState(instanceNo)

	if(instanceStates[stateName] == nil) then
		instanceStates[stateName] = 0
	end

	-- increment our value
	local newValue = instanceStates[stateName] + tonumber(value)

	-- save it
	instanceStates[stateName] = newValue

	-- pass it along
	-- return self:PublishCmd(tonumber(instanceId), "SetStateValue", stateName, newValue)
	return self:PublishCmd(instanceNo, "SetStateValue", stateName, newValue)
end

--------- --------- --------- --------- --------- ---------
-- Broadcast a generic event to each client.
-- Don't save anything in the state though.

function Instancing.InstanceEvent(self, instanceNo, stateName, value)
	if instanceNo == nil or stateName == nil then
		return { Instancing.ErrorCode, "-- invalid arguments to SetStateValue" }
	end

	-- Convert to hex format for better hashing.
	-- local instanceId = self.formatInstanceNo(instanceNo)

	-- instance events don't save, they just get passed along

	-- return self:PublishCmd(tonumber(instanceId), "InstanceEvent", stateName, value)
	return self:PublishCmd(instanceNo, "InstanceEvent", stateName, value)
end

--------- --------- --------- --------- --------- ---------
-- Keep alive - only works with numbers for now

function Instancing.KeepAlive(self, instanceNo, stateName, value)
	if instanceNo == nil or stateName == nil then
		return { Instancing.ErrorCode, "-- invalid arguments to KeepAlive" }
	end

	-- Convert to hex format for better hashing.
	-- local instanceId = self.formatInstanceNo(instanceNo)

	-- grab our state
	local instanceStates = self:GetState(instanceNo)

	if instanceStates[stateName] == nil then
		instanceStates[stateName] = 0
	end

	local newValue = tonumber(value)
	local curValue = tonumber(instanceStates[stateName])

	-- 0 or same value is ok; different value is skipped
	if curValue == 0 or curValue == newValue then
		-- update keepalive; this will add a keep alive as needed
		self:UpdateKeepAlive(instanceNo, stateName)

		-- go ahead and set it, might already be the same value
		return self:SetStateValue(instanceNo, stateName, newValue)
	end

	return { Instancing.ErrorCode, "-- keep alive already set to another value" }
end

--------- --------- --------- --------- --------- ---------
-- Retrieve a dump of instance state variables etc.
-- Course, this doesn't provide timers and stuff.

function Instancing.GetInstanceState(self, instanceNo)

	-- grab our state
	local instanceStates = self:GetState(instanceNo)

	local keyvalues = ""
	for k, v in pairs(instanceStates)
	do
		-- build a list of states except for any state beginning with the _ character
		if string.find(k, "^_") == nil then
			if type(v) ~= "number" then
				keyvalues = keyvalues .. string.format("[%q]=%q,", k, v)
			else
				keyvalues = keyvalues .. string.format("[%q]=", k) .. tostring(v) .. ","
			end
		end
	end
	return { Instancing.SuccessCode, "{"..keyvalues.."}" }
end

-------- --------- --------- --------- --------- ---------
-- Retrieve a dump of instance player states

function Instancing.GetInstancePlayers(self, instanceNo)
	-- grab our player list
	local players = self:GetStatePlayers(instanceNo)
	
	-- build out player list in here
	local keyvalues = ""
	
	for player, states in pairs(players)
	do
		for k, v in pairs(states)
		do
			local playerKey = string.format("%s_%s", player, k)
			
			if type(v) ~= "number" then
				keyvalues = keyvalues .. string.format("[%q]=%q,", playerKey, v)
			else
				keyvalues = keyvalues .. string.format("[%q]=", playerKey) .. tostring(v) .. ","
			end
		end
	end
	
	return { Instancing.SuccessCode, "{"..keyvalues.."}" }
end


--------- --------- --------- --------- --------- ---------
-- Retrieve a dump of instance state variables etc.
-- Course, this doesn't provide timers and stuff.

function Instancing.GetState(self, instanceNo)
	-- format our index
	local instanceId = self.formatInstanceNo(instanceNo)

	-- return it if we have one
	local instanceStates = self.InstanceStates[instanceId]

	-- if we found one, return it
	if instanceStates ~= nil and type(instanceStates) == "table" then
		return instanceStates
	end

	-- create a blank one
	self.InstanceStates[instanceId] = self._BlankInstance(instanceId, instanceNo)
	
	-- return it
	return self.InstanceStates[instanceId]
end

--------- --------- --------- --------- --------- ---------
-- Retrieve a dump of instance state variables etc.
-- Course, this doesn't provide timers and stuff.

function Instancing.GetStatePlayers(self, instanceNo)
	-- grab our state
	local states = self:GetState(instanceNo)
	
	-- grab our player list
	if states['_players_'] == nil then
		states['_players_'] = {}
	end
	
	-- return it
	return states['_players_']
end

--------- --------- --------- --------- --------- ---------
-- Retrieve a player from the instance's player list
-- Adds an entry for the player if he's not there

function Instancing.GetPlayer(self, instanceNo, callsign)
	-- grab our player list
	local players = self:GetStatePlayers(instanceNo)
	
	-- add an entry for the player if he wasn't there
	if players[callsign] == nil then
		players[callsign] = {}
	end
	
	-- return it
	return players[callsign]
end

--------- --------- --------- --------- --------- ---------
-- Retrieve a player from the instance's player list
-- Adds an entry for the player if he's not there

function Instancing.RemovePlayer(self, instanceNo, callsign)
	-- grab our player list
	local players = self:GetStatePlayers(instanceNo)
	
	-- remove it and return true if he was there
	if players[callsign] ~= nil then
		players[callsign] = nil
		return true
	end
	
	-- he wasn't in our list
	return false
end

--------- --------- --------- --------- --------- ---------
-- Retrieve the current list of keep alives for this instance

function Instancing.GetKeepAlives(self, instanceNo)
	-- format our index
	local instanceId = self.formatInstanceNo(instanceNo)

	-- return it if we have one
	local keepAlives = self.InstanceKeepAlives[instanceId]

	-- if we found one, return it
	if keepAlives ~= nil and type(keepAlives) == "table" then
		return keepAlives
	end

	-- create a blank one
	self.InstanceKeepAlives[instanceId] = {}

	-- return it
	return self.InstanceKeepAlives[instanceId]
end

--------- --------- --------- --------- --------- ---------
-- Retrieve the current list of keep alives for this instance

function Instancing.UpdateKeepAlive(self, instanceNo, stateName)
	local ka = self:GetKeepAlives(instanceNo);

	for i,v in ipairs(ka) do
		if(v[2] == stateName) then
			v[3] = os.time() + 2
			return;
		end
	end

	table.insert(ka, {instanceNo, stateName, os.time() + 2})
end


-- ##################################################################
-- ### Main
-- ##################################################################

require "os"
local serverIp = os.getenv("INST_SERVER")
if serverIp == nil or serverIp == "" then
  Instancing:report('F', 'Main', "No INST_SERVER variable defined.")
  exit(1)
end

local enableDebug = os.getenv("DEBUG_EVENTS")
if enableDebug and enableDebug == 'TRUE' or tonumber(enableDebug) == 1 then
  Instancing.EnableDebug = true
  Instancing:report('D', 'Main', 'Debug reporting enabled.')
end

-- Start the communications stuff.
-- Listen on all IP addresses.
Instancing:Start("Server", "0.0.0.0")

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
		local cmdNum = tonumber(table.remove(parts, #parts))
		Instancing:report('D', 'drainConsole', "--con-> cmd#"..cmdNum)

		-- Execute and get the result pair.
		local result = Instancing:InvokeCommand(cmdNum, unpack(parts))

		Instancing:report('D', 'drainConsole', "<-con-- " .. result[1] .. ", " .. tostring(result[2]))
		zmqSocket:send('"'..result[1]..'"', zmq.SNDMORE)
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
		local cmdNum = tonumber(table.remove(parts, #parts))
		Instancing:report('D', 'drainCommand', "--con-> cmd#"..cmdNum)

		-- Execute and get the result pair.
		local result = Instancing:InvokeCommand(cmdNum, unpack(parts))
		Instancing:report('D', 'drainCommand', "result: " .. result[1] .. ", " .. tostring(result[2]))
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

	-- update our timers
	local now 			= os.time()
	local completed	= 0

	-- handle instance timers
	for i,t in ipairs(Instancing.InstanceTimers) do

			-- is this one complete?
			if(completed == 0 and now >= t[4]) then
					completed = i
					Instancing:report('N', 'Main', "Found completed timer for instance " .. t[1] .. ": " .. t[5])
			end

			-- push our time remaining for each timer every minute
			if now >= t[2] and i ~= completed then
					Instancing:SetStateValue(t[1], t[5], t[4] - now)
					t[2] = now + 60
			end
	end

	-- remove the completed timer if one was found
	if completed > 0 then
			local t = Instancing.InstanceTimers[completed]
			Instancing:SetStateValue(t[1], t[5], 0)
			table.remove(Instancing.InstanceTimers, completed)
	end

	-- now lets handle any keep alives and remove any that have expired
	for id,ka in pairs(Instancing.InstanceKeepAlives) do
		for i,t in ipairs(ka) do
			if now > t[3] then
				Instancing:SetStateValue(t[1], t[2], 0)
				table.remove(ka, i)
				break -- only handle one keep alive a frame
			end
		end
	end
end

Instancing:report('N', 'Main', 'Shutting down.')


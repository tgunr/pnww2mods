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

	local dbug = "D Publishing cmd " .. cmdName .. "(" .. instanceId .. ","
	for i, v in ipairs(arg) do dbug = dbug .. tostring(v).."," end
	dbug = dbug .. ") -- #" .. cmdNum
	print(dbug)

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
						if(duration > 0) then
								print(string.format("Updating timer %s to %d minutes", name, duration))
								Instancing:SetStateValue(t[1], t[5], -1)
								t[2] = 0
								t[3] = now
								t[4] = now + duration
						else
								print(string.format("Removing timer %s", name))
								table.remove(self.InstanceTimers, i)
						end
						return
				end
		end
		if duration > 0 then
				print("Adding timer for instance " .. instanceNo .. " named " .. name .. " " .. (tonumber(duration) / 60) .. " minutes from now.")
				Instancing:SetStateValue(instanceNo, name, -1)
				table.insert(self.InstanceTimers, {instanceNo, 0, now, now + duration, name})
		end
end

--------- --------- --------- --------- --------- ---------
-- Apply an instance state change.

function Instancing.SetStateValue(self, instanceNo, stateName, value)
	if instanceNo == nil or stateName == nil then
		return { Instancing.ErrorCode, "-- invalid arguments to SetStateValue" }
	end

	-- Convert to hex format for better hashing.
	local instanceId = self.formatInstanceNo(instanceNo)
	
	-- grab our state
	local instanceStates = self:GetState(instanceNo)
	
	-- this might cause new clients to miss updated data?
	local currentValue = instanceStates[stateName]
	if tostring(currentValue) == tostring(value) then
		return { Instancing.SuccessCode, "-- No change made" }
	end

	instanceStates[stateName] = value

	return self:PublishCmd(tonumber(instanceId), "SetStateValue", stateName, value)
end

--------- --------- --------- --------- --------- ---------
-- Add an instance state value to the current state value.

function Instancing.AddStateValue(self, instanceNo, stateName, value)
	if instanceNo == nil or stateName == nil then
		return { Instancing.ErrorCode, "-- invalid arguments to AddStateValue" }
	end

	-- Convert to hex format for better hashing.
	local instanceId = self.formatInstanceNo(instanceNo)

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
	return self:PublishCmd(tonumber(instanceId), "SetStateValue", stateName, newValue)
end

--------- --------- --------- --------- --------- ---------
-- Broadcast a generic event to each client.
-- Don't save anything in the state though.

function Instancing.InstanceEvent(self, instanceNo, stateName, value)
	if instanceNo == nil or stateName == nil then
		return { Instancing.ErrorCode, "-- invalid arguments to SetStateValue" }
	end

	-- Convert to hex format for better hashing.
	local instanceId = self.formatInstanceNo(instanceNo)
	
	-- instance events don't save, they just get passed along

	return self:PublishCmd(tonumber(instanceId), "InstanceEvent", stateName, value)
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
		if type(v) ~= "number" then
			keyvalues = keyvalues .. string.format("[%q]=%q,", k, v)
		else
			keyvalues = keyvalues .. string.format("[%q]=", k) .. tostring(v) .. ","
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
		local cmdNum = tonumber(table.remove(parts, #parts))
		print("D --con-> cmd#"..cmdNum)

		-- Execute and get the result pair.
		local result = Instancing:InvokeCommand(cmdNum, unpack(parts))

		print("D <-con-- " .. result[1] .. ", " .. tostring(result[2]))
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
		print("D --con-> cmd#"..cmdNum)

		-- Execute and get the result pair.
		local result = Instancing:InvokeCommand(cmdNum, unpack(parts))
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

	-- update our timers
	local now 			= os.time()
	local completed	= 0
	
	for i,t in ipairs(Instancing.InstanceTimers) do

			-- is this one complete?
			if(completed == 0 and now >= t[4]) then
					completed = i
					print("Found completed timer for instance " .. t[1] .. ": " .. t[5])
			end

			-- push our time remaining for each timer every minute
			if now >= t[2] and i ~= completed then
					Instancing:InstanceEvent(t[1], t[5], t[4] - now)
					t[2] = now + 60
			end
	end

	if completed > 0 then
			local t = Instancing.InstanceTimers[completed]
			Instancing:SetStateValue(t[1], t[5], 0)
			table.remove(Instancing.InstanceTimers, completed)
	end
end

print("N shutting down.")


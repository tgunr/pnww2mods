--
-- Lua client code
--
--[[

To send a console-command (one that waits for a response)

	Instancing:DoRemoteLua("your code here")

To send a command (without waiting or wanting a response)

	Instancing:SendLua("your code here")

To set your current instance:

	Instancing:SetInstance(instanceNo)

To get the current value of a state of the current instance...

	result, error = Instancing:GetStateValue(stateName)
	if result == nil and error ~= nil then
		-- If result is nil, error will contain text explaining why.
		print("I couldn't get " .. stateName .. " because " .. error)
	else
		-- process your state value here
	end

To check for and process any incoming event messages:

	Instancing:PollEvents()

	(This will consume all outstanding events in the network buffer)
]]--

-- Adds
--	Instancing:DoRemoteLua(code) [blocking]
--	Instancing:SendLua(code)     [non-blocking]
--  Instancing:SendEvent(instanceNo, code)   [non-blocking]
--	Instancing:GetInstanceState()
--	Instancing:PollEvents()		 [non-blocking]

if game == nil or game.LoadLib == nil or type(game.LoadLib) ~= "function" then
	require "Instancing"
end
	--------- --------- --------- --------- --------- ---------
	-- Set our instance ID.
	-- public:

function Instancing.SetInstance(self, instanceNo)
	-- Numeric argument required.
	if type(instanceNo) ~= "number" then
		return { Instancing.ErrorCode, "SetInstance requires a numeric instance argument." }
	end

	local instanceId = self.formatInstanceNo(instanceNo)

	-- set up some subscriptions if we have a context
	if self.Context ~= nil then
		-- Only mess with ZeroMQ stuff if we have an EventSock connected.
		-- Also, the server doesn't do any sub/unsub stuff.
		if self.InstanceId ~= nil then
			-- Purge the old state information.
			self.InstanceStates[self.InstanceId] = nil
			-- self.InstanceHandlers = nil

			if self.EventSock ~= nil then
				-- Unsubscribe from whatever instance we were previously in.
				self.EventSock:setopt(zmq.UNSUBSCRIBE, self.InstanceId)
				self.InstanceId = nil
				self.InstanceNo = nil
			end
		end
	end

	self.InstanceId = instanceId
	self.InstanceNo = instanceNo

	self.InstanceStates[instanceId] = {}

	if self.InstanceHandlers == nil then
		self.InstanceHandlers = {}
	end

	return { Instancing.SuccessCode, "Instance " .. instanceNo .. "(" .. instanceId .. ") selected." }
end

	--------- --------- --------- --------- --------- ---------
	-- Tune the Events interface to a specific instance ID.
	-- public:

function Instancing.Subscribe(self, instanceNo)
	-- Numeric argument required.
	if type(instanceNo) ~= "number" then
		return { Instancing.ErrorCode, "Subscribe requires a numeric instance argument." }
	end

	local instanceId = self.formatInstanceNo(instanceNo)

	-- set up some subscriptions if we have a context
	if self.Context ~= nil then
		-- Only mess with ZeroMQ stuff if we have an EventSock connected.
		-- Also, the server doesn't do any sub/unsub stuff.
		if self.EventSock ~= nil then
			self.EventSock:setopt(zmq.SUBSCRIBE, instanceId)
			self:report('D', 'Subscribe', "Subscribed EventSock to " .. instanceId)
		else
			return { Instancing.ErrorCode, "EventSock not found while trying to subscribe!" }
		end
	else
		return { Instancing.ErrorCode, "Context not found while trying to subscribe!" }
	end

	return { Instancing.SuccessCode, "Instance " .. instanceNo .. "(" .. instanceId .. ") subscribed." }
end

--------- --------- --------- --------- --------- ---------
-- Grab any events that we haven't picked up yet, and
-- process them. Defaults to BLOCKING.

function Instancing.GetEvents(self, zmqOptions, maxEvents)
	if self.Context == nil then
		return { Instancing.ErrorCode, "No Context" }
	end
	if self.EventSock == nil then
		return { Instancing.ErrorCode, "EventSock not connected" }
	end

	if not maxEvents or type(maxEvents) ~= "number" then
		maxEvents = 64
	end

	-- If we haven't selected an instance, do nothing.
	while self.Running == true and self.InstanceId ~= nil and maxEvents > 0
	do
		local parts = self.getMessage(self.EventSock, zmqOptions)
		if parts == nil or #parts == 0 then break end
		if #parts < 2 then
			self:report('W', 'GetEvents', "Event format error (short)")
		else
			-- Make sure it's for our current instance, lest we are
			-- late in picking up a message for an instance we left.
			write( parts )

			-- Final part of the list should be the command.
			local cmdNum = table.remove(parts, #parts)
			local result = self:InvokeCommand(cmdNum, unpack(parts))
			if result[1] ~= Instancing.SuccessCode then
				self:report('W', 'GetEvents', "event execution error: " .. result[2])
			end
		end
		maxEvents = maxEvents - 1
	end

	return { Instancing.SuccessCode, "" }
end

--------- --------- --------- --------- --------- ---------
-- Grab any events that we haven't picked up yet, and
-- process them. NON-BLOCKING version.

function Instancing.PollEvents(self)
	return self:GetEvents(zmq.NOBLOCK)
end

--------- --------- --------- --------- --------- ---------
-- Execute a piece of remote code on the host using the
-- relevant socket.
-- If "wantResult" is true then this call will require the
-- host to send a response, and will block until it
-- receives one.

function Instancing._doRemote(self, wantResult, command, ...)
	if self.Context == nil then
		return { Instancing.ErrorCode, "No Context" }
	end

	local sock
	if wantResult then
		sock = self.ConsoleSock
	else
		sock = self.CommandSock
	end

	if sock == nil then
		return { Instancing.ErrorCode, "Socket not connected." }
	end

	local parts = self:SendCommand(sock, command, ...)
	if wantResult and parts[1] == Instancing.SuccessCode then
		parts = self.getMessage(sock)
		if not parts then
			return { Instancing.ErrorCode, "GetInstanceState result error (nil)" }
		elseif #parts < 2 then
			return { Instancing.ErrorCode, "GetInstanceState result error (short)" }
		elseif #parts > 2 then
			return { Instancing.ErrorCode, "GetInstanceState result error (long)" }
		end
	end

	return parts
end

--------- --------- --------- --------- --------- ---------
-- Send an instruction to the remote host which produces
-- no response.

function Instancing.SendRemoteInstruction(self, ...)
	return self:_doRemote(false, ...)
end

--------- --------- --------- --------- --------- ---------
-- Send an instruction to the remote host which anticipates
-- a [BLOCKING!] response from the server.

function Instancing.GetRemoteResults(self, ...)
	return self:_doRemote(true, ...)
end

--------- --------- --------- --------- --------- ---------
-- Tell the server to change a state value.

function Instancing.SendStateValue(self, valueName, value)
	if self.Context == nil then
		return { Instancing.ErrorCode, "Tried to call SetState with no Context." }
	end
	if self.InstanceNo == nil or self.InstanceNo == 0 then
		return { Instancing.ErrorCode, "Tried to call SetState with no Instance selected." }
	end
	if valueName == nil then
		return { Instancing.ErrorCode, "Called SetState with no valueName." }
	end
	return self:SendRemoteInstruction("SetStateValue", self.InstanceNo, valueName, value)
end

Instancing.SetState = Instancing.SendStateValue

--------- --------- --------- --------- --------- ---------
-- Tell thes erver to add a new state value.

function Instancing.SendAddState(self, valueName, value)
	if self.Context == nil then
		return { Instancing.ErrorCode, "Tried to call SendAddState with no Context." }
	end
	if self.InstanceNo == nil or self.InstanceNo == 0 then
		return { Instancing.ErrorCode, "Tried to call SendAddState with no Instance selected." }
	end
	if valueName == nil then
		return { Instancing.ErrorCode, "Called SendAddState with no valueName." }
	end
	return self:SendRemoteInstruction("AddStateValue", self.InstanceNo, valueName, value)
end

Instancing.AddState = Instancing.SendAddState

--------- --------- --------- --------- --------- ---------
-- Tell the server to change a state value.

function Instancing.SendKeepAlive(self, valueName, value)
	if self.Context == nil then
		return { Instancing.ErrorCode, "Tried to call KeepAlive with no Context." }
	end
	if self.InstanceNo == nil or self.InstanceNo == 0 then
		return { Instancing.ErrorCode, "Tried to call KeepAlive with no Instance selected." }
	end
	if valueName == nil then
		return { Instancing.ErrorCode, "Called KeepAlive with no valueName." }
	end
	return self:SendRemoteInstruction("KeepAlive", self.InstanceNo, valueName, value)
end

Instancing.KeepAlive = Instancing.SendKeepAlive

--------- --------- --------- --------- --------- ---------
-- Tell the server to do something with a timed event?

function Instancing.TimedEvent(self, timerName, duration)
	if self.Context == nil then
		return { Instancing.ErrorCode, "Tried to call TimedEvent with no Context." }
	end
	if self.InstanceNo == nil or self.InstanceNo == 0 then
		return { Instancing.ErrorCode, "Tried to call TimedEvent with no Instance selected." }
	end
	if timerName == nil then
		return { Instancing.ErrorCode, "Called TimedEvent with no valueName." }
	end
	return self:SendRemoteInstruction("SetTimer", self.InstanceNo, timerName, duration)
end

--------- --------- --------- --------- --------- ---------
-- Some kind of general broadcast???

function Instancing.BroadcastEvent(self, valueName, value)
	if self.Context == nil then
		return { Instancing.ErrorCode, "Tried to call BroadcastEvent with no Context." }
	end
	if self.InstanceNo == nil or self.InstanceNo == 0 then
		return { Instancing.ErrorCode, "Tried to call BroadcastEvent with no Instance selected." }
	end
	if valueName == nil then
		return { Instancing.ErrorCode, "Called BroadcastEvent with no valueName." }
	end
	return self:SendRemoteInstruction("InstanceEvent", self.InstanceNo, valueName, value)
end

--------- --------- --------- --------- --------- ---------
-- Get current instance state variables from the server.

function Instancing.GetInstanceState(self)
	if self.InstanceId == nil then
		return { Instancing.ErrorCode, "GetInstanceState called with no instance selected" }
	end

	local parts = self:GetRemoteResults("GetInstanceState", self.InstanceId)
	if parts[1] ~= Instancing.SuccessCode then
		return parts
	end

	local result = parts[2]
	if type(result) ~= "table" then
		return { Instancing.ErrorCode, "GetInstanceState expected a table result." }
	end

	self.InstanceStates[self.InstanceId] = result

	return { Instancing.SuccessCode, "-- got instance state" }
end

--------- --------- --------- --------- --------- ---------
-- Returns the local copy of the states table, note that
-- unless GetInstanceState() has been called once, this
-- will be empty or partial.

function Instancing.GetLocalStatesTable(self)
	local states = self.InstanceStates[self.InstanceId]
	if states == nil then
		return { Instancing.ErrorCode, "No state table for current instance." }
	end

	return { Instancing.SuccessCode, states }
end

--------- --------- --------- --------- --------- ---------
-- Get the current value of a state or nil.

function Instancing.GetStateValue(self, stateName)
	if self.InstanceId == nil then
		return { nil, "No Instance selected" }
	end
	local states = self.InstanceStates[self.InstanceId]
	if states == nil then
		return { nil, "No state table for current instance." }
	end

	local state = states[stateName]
	if state == nil then
		return { nil, "not set" }
	end

	return { state, nil }
end

function Instancing.GetStateString(self, stateName, defValue)
	local state = Instancing:GetStateValue(stateName)

	if(state[1] == nil) then
		if(defValue ~= nil) then
			return tostring(defValue)
		else
			return ""
		end
	end

	return tostring(state[1])
end

function Instancing.GetStateNumber(self, stateName, defValue)
	local state = Instancing:GetStateValue(stateName)

	if(state[1] == nil) then
		if(defValue ~= nil) then
			return tonumber(defValue)
		else
			return 0
		end
	end

	return tonumber(state[1])
end

function Instancing.GetStateBool(self, stateName, defValue)
	local state = Instancing:GetStateValue(stateName)

	if(state[1] == nil) then
		if(defValue ~= nil and defValue ~= 0 and defValue ~= "false" and defValue ~= false) then
			return true
		else
			return false
		end
	end

	if(state[1] ~= nil and state[1] ~= 0 and state[1] ~= "false" and state[1] ~= false) then
		return true
	else
		return false
	end
end

--------- --------- --------- --------- --------- ---------
-- Instruction to change a state value from the server.

function Instancing.SetStateValue(self, instanceNo, stateName, value)
	local instanceId = self.formatInstanceNo(instanceNo)
	if instanceId ~= self.InstanceId then
		return { Instancing.ErrorCode, "Message no-longer applies." }
	end

	-- Make sure that states for this instance exist.
	local states = self.InstanceStates[self.InstanceId]
	if states == nil then
		local result = self:GetInstanceState()
		if result[1] ~= Instancing.SuccessCode then
			return result
		end
		states = self.InstanceStates[self.InstanceId]
		if states == nil then
			return { Instancing.ErrorCode, "No data available for instance." }
		end
	end

	-- Update the value in our local copy and, if there
	-- is a handler registered, execute it.
	self:ChangeValue(self.InstanceNo, stateName, value)

	return { Instancing.SuccessCode, "-- value applied" }
end

--------- --------- --------- --------- --------- ---------
-- Instruction to handle a named broadcast from the server

function Instancing.InstanceEvent(self, instanceNo, stateName, value)
	local instanceId = self.formatInstanceNo(instanceNo)

	if instanceId ~= self.InstanceId then
		return { Instancing.ErrorCode, "Message no-longer applies." }
	end

	-- run any hooks we have
	local handler = Instancing.InstanceHandlers[stateName]

	if handler ~= nil and type(_G[handler]) == "function" then
		local status, msg = pcall(_G[handler](stateName, value))
		if not status then
			return { Instancing.ErrorCode, stateName.." event handler error: "..msg.."." }
		end
	end

	return { Instancing.SuccessCode, "-- event handled" }
end


--------- --------- --------- --------- --------- ---------
-- Main entry point.

--local serverIp = "192.168.0.61"
--Instancing:Start("Client", "192.168.0.61")
--TODO: Call from the C++ layer with the correct IP address.


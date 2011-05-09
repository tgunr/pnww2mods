--
-- Lua client code
--

-- require 'Instancing'

-- Adds
--	Instancing:DoRemoteLua(code) [blocking]
--	Instancing:SendLua(code)     [non-blocking]
--  Instancing:SendEvent(instanceNo, code)   [non-blocking]
--	Instancing:GetInstanceState()
--	Instancing:PollEvents()		 [non-blocking]

--------- --------- --------- --------- --------- ---------
-- Grab any events that we haven't picked up yet, and
-- process them.

function Instancing.PollEvents(self)
	if self.Context == nil then
		return { Instancing.ErrorCode, "No Context" }
	end
	if self.EventSock == nil then
		return { Instancing.ErrorCode, "EventSock not connected" }
	end

	-- If we haven't selected an instance, do nothing.
	while self.Running == true and self.InstanceId ~= nil
	do
		local parts = self.getMessage(self.EventSock, zmq.NOBLOCK)
		if parts == nil or #parts == 0 then break end
		if #parts < 2 then
			print("W Event format error (short)")
		elseif #parts > 2 then
			print("W Event format error (long)")
		else
			-- Make sure it's for our current instance, lest we are
			-- late in picking up a message for an instance we left.
			if parts[1] == self.InstanceId then
				local success, message = pcall(loadstring(parts[2]))
				if success == false then
					print("W event execution error: " .. message)
				end
			end
		end
	end

	return { self.SuccessCode, "" }
end

--------- --------- --------- --------- --------- ---------
-- Send code to the Console socket and retrieve the result
-- from the server.
-- Returns ( SuccessCode, <result> ) or ( ErrorCode, <message> )
-- Note: This is BLOCKING.
function Instancing.DoRemoteLua(self, code)
	if self.Context == nil then
		return { Instancing.ErrorCode, "No Context" }
	end
	if self.ConsoleSock == nil then
		return { Instancing.ErrorCode, "Console not connected." }
	end

	if not self.ConsoleSock:send(code) then
		return { Instancing.ErrorCode, "Send failed" }
	end

	local parts = self.getMessages(self.ConsoleSock)
	if not parts then
		return { Instancing.ErrorCode, "Communications error (probably disconnected)" }
	end
	if #parts < 2 then
		return { Instancing.ErrorCode, "Communication error (short)" }
	elseif #parts > 2 then
		return { Instancing.ErrorCode, "Communication error (long)" }
	end

	return parts
end

--------- --------- --------- --------- --------- ---------
-- Send code to the Command Socket without blocking or
-- receiving any feedback on the result.
function Instancing.SendLua(self, code)
	if self.Context == nil then
		return { Instancing.ErrorCode, "No Context" }
	end
	if self.CommandSock == nil then
		return { Instancing.ErrorCode, "CommandSock not connected." }
	end

	-- Send without blocking.
	if not self.CommandSock:send(code, zmq.NOBLOCK) then
		return { Instancing.ErrorCode, "Send failed" }
	end

	return { self.SuccessCode, "-- passed to zmq, data may not actually have been sent or received." }
end

--------- --------- --------- --------- --------- ---------
-- Get current instance state variables from the server.

function Instancing.GetInstanceState(self)
	if self.InstanceId == nil then
		return { Instancing.ErrorCode, "GetInstanceState called with no instance selected" }
	end

	local query = string.format([[
		local keyvalues = ""
		local instanceStates = Instancing.InstanceStates[%q]
		if instanceStates then
			for k, v in ipairs(instanceStates)
			do
				keyvalues = keyvalues .. string.format("['%%q']=['%%v'],", k, v)
			end
		end
		return "{"..keyvalues.."}"
	]], self.InstanceId)
	
	local parts = self:DoRemoteLua(query)
	if not parts then
		return { Instancing.ErrorCode, "GetInstanceState result error (nil)" }
	elseif #parts < 2 then
		return { Instancing.ErrorCode, "GetInstanceState result error (short)" }
	elseif #results > 2 then
		return { Instancing.ErrorCode, "GetInstanceState result error (long)" }
	else
		print("D inst:"..self.InstanceNo.." state:" .. parts[2])
		local results = pcall(loadstring(parts[2]))
		if results[1] == false then
			return { Instancing.ErrorCode, "GetInstanceState execution error: " .. results[2] }
		end
	end

	return { self.SuccessCode, "" }
end

--------- --------- --------- --------- --------- ---------
-- Send an event message up to the server.

function Instancing.SendEvent(self, instanceNo, code)
	return self.SendLua(code)
end

function Instancing.GetCurrentStatesTable(self)
	local states = self.Instances[self.InstanceId]
	if states == nil then
		return { Instancing.ErrorCode, "No state table for current instance." }
	end

	return { Instancing.SuccessCode, states }
end

--------- --------- --------- --------- --------- ---------
-- Get the current value of a state or nil.

function Instancing.GetStateValue(self, stateName)
	if self.InstanceId == nil then
		return nil, "No Instance selected"
	end
	local states = self.Instances[self.InstanceId]
	if states == nil then
		return nil, "No state table for current instance."
	end

	local state = states[stateName]
	if state == nil then
		return nil, "not set"
	end

	return state, nil
end

Instancing:Start("Client", "192.168.0.61")
-- Or: Instancing:Start("Client", "ser.ver.ip.addr")

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

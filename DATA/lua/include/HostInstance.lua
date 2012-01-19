Include("Instance")

HostInstance = Instance:create()
HostInstanceInterface = { __index = HostInstance }

function HostInstance:create()
	
	local instance = Instance:create()
	
	-- our server instance
	instance.server = nil
	
	-- states we are tracking
	instance.track = {}
	
	setmetatable(instance, HostInstanceInterface)
	
	-- set our initial status
	instance:SetStatus("New")
	
	return instance
end

-- id, send callback and server
function HostInstance:new(i, s, svr)
	
	local instance = Instance:new(i, s)
	
	-- so we can call into our server 
	instance.server = svr
	
	-- states we are tracking
	instance.track = {}
	
	setmetatable(instance, HostInstanceInterface)
	
	-- set our initial status
	instance:SetStatus("New")
	
	return instance
end

function HostInstance:SetStatus(status)
	return self:RecvSetState("status", status)
end

function HostInstance:Update(frametime)
	
	local removes = {}
	local now = os.time()
	
	for k,t in pairs(self.track) do
		if t.handler(self, t, now) == false then
			-- false means its done tracking
			table.insert(removes, k)
		end
		
		-- remember when we were last updated
		t.updated = now 
	end
	
	-- handle any trackers that need removing
	for i,v in pairs(removes) do
		self:RemoveTracker(v)
	end
	
	-- continue to track if we still have some to track
	if getn(self.track) > 0 then
		return true
	end
	
	-- stop updating because we're no longer tracking any states
	return false
end

function HostInstance:AddTracker(valueName, handler, userdata)
	-- register ourself as an updater
	self.server:RegisterUpdate(self)
	
	local now = os.time()
	
	-- create a tracker if needed
	if self.track[valueName] == nil then
		-- our new tracker
		local tracker =
		{
			name = valueName,
			handler = handler,
			data	= userdata
			created = now,
			modified = now,
			updated = now
		}
		
		-- remember it
		self.track[valueName] = tracker
	else
		-- our value has been modified
		self.track[valueName].modified = now
	end
end

function HostInstance:RemoveTracker(valueName)
	if self.track[valueName] then
		self.track[valueName] = nil
	end
end

--------- --------- --------- --------- --------- ---------
-- SetState

function HostInstance:RecvSetState(valueName, value)
	local result = self:ChangeState(valueName, value)
	
	if result:IsFailure() then
		return result
	end
	
	-- relay the change to other clients
	return self:SetState(valueName, value)
end

--------- --------- --------- --------- --------- ---------
-- Tell thes erver to add a new state value.

function HostInstance:RecvAddState(valueName, value)
	local oldValue = self:GetStateNumber(valueName)
	local newValue = oldValue + tonumber(value)
	
	local result = self:ChangeState(valueName, value)
	
	if result:IsFailure() then
		return result
	end
	
	-- relay the change to other clients
	return self:SetState(valueName, value)
end

--------- --------- --------- --------- --------- ---------
-- Tell the server to change a state value.

function HostInstance:RecvKeepAlive(valueName, value)

	local newValue = tonumber(value)
	local curValue = self:GetStateNumber(valueName)

	-- 0 or same value is ok; different value is skipped
	if curValue == 0 or curValue == newValue then
		local result = self:ChangeState(valueName, value)
		
		-- track this state
		self:AddTracker(valueName, _G["_trackKeepAlive"])
		
		if result:IsFailure() then
			return result
		end
		
		-- relay the change to other clients
		return self:KeepAlive(valueName, value)
	end
	
	return InstanceResult:failure("KeepAlive occupied or unchanged")
end

--------- --------- --------- --------- --------- ---------
-- Tell the server to do something with a timed event?

function HostInstance:RecvSetTimer(timerName, duration)
	local result = self:ChangeState(valueName, value)
	
	-- start tracking this state
	self:AddTracker(valueName, _G["_trackTimer"], 0)
	
	if result:IsFailure() then
		return result
	end
	
	-- relay the change to other clients
	return self:SetTimer(valueName, value)
end

--------- --------- --------- --------- --------- ---------
-- General broadcast - nothing is saved, just relayed

function HostInstance:RecvBroadcastEvent(valueName, value)
	-- simply see if we need to handle the event
	self:HandleState(valueName, value)
	
	-- then send it along to the other clients
	return self:BroadcastEvent(valueName, value)
end

--------- --------- --------- --------- --------- ---------
-- Send updated info about myself

function HostInstance:SendSetPlayerState(callsign, valueName, value)
	return self:SendCommand("SetPlayerState", callsign, valueName, value)
end

function HostInstance:RecvSetPlayerState(callsign, valueName, value)
	local player = self:GetPlayer(callsign)
	local result = player:SetState(valueName, value)
	
	if result:IsFailure() then
		return result
	end
	
	-- let the clients kknow
	return self:SetPlayerState(callsign, valueName, value) 
end


--------- --------- --------- --------- --------- ---------
-- Send incremental info about myself

function HostInstance:RecvAddPlayerState(callsign, valueName, value)
	local player = self:GetPlayer(callsign)
	local result = player:AddState(valueName, value)
	
	if result:IsFailure() then
		return result
	end
	
	-- we send a set so the client doesn't also increment the value
	return self:SetPlayerState(callsign, valueName, value) 
end

--------- --------- --------- --------- --------- ---------
-- Let the instance know about us

function HostInstance:SendRegisterClient(state, players)
	return self:SendCommand("RegisterClient", state, players)
end

-- client doesn't implement this
function HostInstance:RecvRegisterClient(callsign)
	local result = self:CreatePlayer(callsign)
	
	if result:IsFailure() then
		return result
	end
	
	return self:RegisterClient(self.state, self.players)
end

-- timer tracker
function _trackTimer(instance, tracker, now)
	
	-- see if we need to init
	if tracker.data == 0 then
		-- make data be the time we're looking for
		tracker.data = now + instance:GetStateNumber(tracker.name)
		tracker.lastsend = now - 1
	end
	
	-- how much time is left
	local timeleft = tracker.data - now
	
	if timeleft <= 0 then
		-- we are done
		instance:SetTimer(tracker.name, 0)
		return false
	end
	
	-- send it at most once ever second
	if now - tracker.lastsend >= 1 then
		instance:SetTimer(tracker.name, timeleft)
		tracker.lastsend = now
	end
	
	return true
end

-- keep alive tracker
function _trackKeepAlive(instance, tracker, now)
	
	if instance:GetStateNumber(tracker.name) == 0 then
		-- instance:KeepAlive(tracker.name, 0)
		return false
	end
	
	if (now - tracker.modified) < 3 then
		-- keep tracking
		return true
	else
		-- send a 0 indicating the keep alive is no longer occupied
		instance:KeepAlive(tracker.name, 0)
		return false
	end
	
end

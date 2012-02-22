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
	HostInstance class definition
]]--

-- base class
require 'math'
require 'string'
require 'table'
require 'Instance'

HostInstance = Instance:create()
HostInstanceInterface = { __index = HostInstance }

-- constructor with no arguments
function HostInstance:create()
	
	local instance = Instance:create()
	
	-- our server instance
	instance.server = nil
	
	-- states we are tracking
	instance.track = {}
	
	-- we're a Host instance
	instance.type = 'H'
	-- instance.level = 'F'
	
	setmetatable(instance, HostInstanceInterface)
	
	return instance
end

-- constructor with arguments
-- i = string id of instance
-- s = sendcallback to use for sending out data
-- svr = InstanceServer managing this instance
function HostInstance:new(i, s, svr)
	
	local instance = Instance:new(i, s)
	
	-- so we can call into our server 
	instance.server = svr
	
	-- states we are tracking
	instance.track = {}
	
	-- we're a Host instance
	instance.type = 'H'
	
	setmetatable(instance, HostInstanceInterface)
	
	return instance
end

-- shortcut function for setting an instance's status
-- relays the status to each client via a call to RecvSetState
-- returns a result object
-- statuses are defined in Instancing.lua
function HostInstance:SetStatus(status)
	
	local currentStatus = inst.GetState(self.id)
	
	if status <= currentStatus then
		InstanceResult:failure(self:GetType() .. " HostInstance:SetStatus", "status " .. value .. " <= " .. currentStatus, self:GetLevel('I'))
	end
	
	-- lets set it to the new status
	inst.CASState(self.id, currentStatus, status)
	self:ChangeState("status", inst.GetState(self.id))
	
	-- new status set
	return InstanceResult:success(self:GetType() .. " HostInstance:SetStatus", "status set " .. currentStatus .. " -> " .. value, self:GetLevel('I'))
end

-- called by InstanceServer in response to this
-- instance register itself as an updater
-- allows an instance to process timers and keep alives
-- and possibly other data later
-- returns true to tell the server to keep updating it
-- returns false to tell the server not to update it anymore
function HostInstance:Update(ft)

	-- Instancing.report('F', ' =========== HostInstance:Update', "Updating at " .. tostring(ft))

	local removes = {}
	local tracking = 0
	
	-- update any states we are currently tracking
	-- keepalives and timers for now
	for k,t in pairs(self.track) do
		-- Instancing.report('F', ' =========== HostInstance:Update', "Calling Tracker - " .. k)
		if t.handler(self, k, ft) == true then
			-- Instancing.report('F', ' =========== HostInstance:Update', "Tracker - " .. k .. " returned true!")
			tracking = tracking + 1
		else
			-- Instancing.report('F', ' =========== HostInstance:Update', "Tracker - " .. k .. " returned false!")
			-- false means its done tracking
			table.insert(removes, k)
		end
		
		-- remember when we were last updated
		t.updated = ft 
	end
	
	-- handle any trackers that need removing
	for i,k in ipairs(removes) do
		-- Instancing.report('F', ' =========== HostInstance:Update', "Removing Tracker - " .. k)
		self:RemoveTracker(k)
	end
	
	-- Instancing.report('F', ' =========== HostInstance:Update', "Tracking " .. tostring(tracking))
	
	-- continue to get updated if we still have some to states to track
	if tracking > 0 then
		-- Instancing.report('F', ' =========== HostInstance:Update', "Tracking " .. tostring(tracking))
		return true
	end
	
	-- stop updating because we're no longer tracking any states
	return false
end

-- function for adding/updating a state tracker
-- tells the InstanceServer that manages this instance that 
-- it wants to be updated
function HostInstance:AddTracker(valueName, handler, data)
	-- time
	local now = FrameTime()
	
	-- create a tracker if needed
	if self.track[valueName] == nil then
		
		-- Instancing.report('F', ' =========== HostInstance:AddTracker', "Adding tracker - " .. valueName)
		
		-- our new tracker
		local tracker =
		{
			init = true,
			name = valueName,
			handler = handler,
			data	= data,
			created = now, -- when the tracker was created
			modified = now, -- when the tracked state was last modified
			updated = now -- when this tracker was last updated
		}
		
		-- remember it
		self.track[valueName] = tracker
	else
		--Instancing.report('F', ' =========== HostInstance:AddTracker', "Updating tracker - " .. valueName)
		-- our value has been modified, remember when
		self.track[valueName].modified = now
	end
	
	-- register ourself as an updater
	self.server:RegisterUpdate(self)
end

-- remove a tracker
function HostInstance:RemoveTracker(valueName)
	if self.track[valueName] then
		-- Instancing.report('F', ' =========== HostInstance:AddTracker', "Removing tracker - " .. valueName)
		self.track[valueName] = nil
	end
end

--------- --------- --------- --------- --------- ---------
-- SetState

-- override Instance:RecvSetState
-- returns a result object
-- behavior is to update the state and then relay the changes to the clients
function HostInstance:RecvSetState(valueName, value)
		
	if valueName == "victory" and tonumber(value) ~= 0 then
		self:SetState("nextmap", inst.SpawnClone(self.id))
		self:SetStatus(inst.Instance.Completed)
	elseif valueName == "status" then
		return self:SetStatus(tonumber(value))
	end
	
	local result = self:ChangeState(valueName, value)
	
	-- if the value didn't change, no need to send it
	if result:IsNOK() then
		return result
	end
	
	-- relay the change to other clients
	return self:SetState(valueName, value)
end

--------- --------- --------- --------- --------- ---------
-- Tell thes erver to add a new state value.

-- override Instance:RecvAddState
-- returns a result object
-- behavior is to update the state and then relay the changes to the clients
function HostInstance:RecvAddState(valueName, value)
	local oldValue = self:GetStateNumber(valueName)
	local newValue = oldValue + tonumber(value)
	
	local result = self:ChangeState(valueName, newValue)
	
	-- if the value didn't change, no need to send it
	if result:IsNOK() then
		return result
	end
	
	-- relay the change to other clients
	return self:SetState(valueName, newValue)
end

--------- --------- --------- --------- --------- ---------
-- Tell the server to change a state value.

-- override Instance:RecvKeepAlive
-- returns a result object
-- start tracking the keepalive
function HostInstance:RecvKeepAlive(valueName, value)

	local newValue = tonumber(value)
	local curValue = self:GetStateNumber(valueName)
	
	-- Instancing.report('F', ' =========== HostInstance:RecvKeepAlive', printState(curValue, newValue))

	-- 0 or same value is ok; different value is skipped
	if curValue == 0 or curValue == newValue then
		local result = self:ChangeState(valueName, newValue)
		
		-- track this state
		self:AddTracker(valueName, _trackKeepAlive)
		
		-- Instancing.report('F', ' =========== _trackKeepAlive', "Adding - state " .. name)
		
		if result:IsNOK() then
			return result
		end
		
		-- Instancing.report('F', ' =========== _trackKeepAlive', "Sending - state " .. name)
		
		-- relay the change to other clients
		return self:KeepAlive(valueName, newValue)
	end
	
	return InstanceResult:failure(self:GetType() .. " HostInstance:RecvKeepAlive", "keepAlive occupied or unchanged", self:GetLevel('DD'))
end

--------- --------- --------- --------- --------- ---------
-- Tell the server to do something with a timed event?


-- override Instance:RecvSetTimer
-- returns a result object
-- start tracking the timer
function HostInstance:RecvSetTimer(timerName, duration)
	local result = self:ChangeState(timerName, duration)
	
	-- Instancing.report('F', ' =========== HostInstance:RecvSetTimer', "Setting timer - " .. timerName)
	
	-- start tracking this state
	self:AddTracker(timerName, _trackTimer, 0)
	
	if result:IsNOK() then
		return result
	end
	
	-- relay the change to other clients
	return self:SetTimer(timerName, duration)
end

--------- --------- --------- --------- --------- ---------
-- General broadcast - nothing is saved, just relayed

-- override Instance:RecvBroadcastEvent
-- returns a result object
-- try to see if any handlers need to be called
-- relay the broadcast to all clients 
function HostInstance:RecvBroadcastEvent(valueName, value)
	-- simply see if we need to handle the event
	self:HandleState(valueName, value)
	
	-- then send it along to the other clients
	return self:BroadcastEvent(valueName, value)
end

--------- --------- --------- --------- --------- ---------
-- Player State

-- override Instance:RecvSetPlayerState
-- returns a result object
-- update the player, then relay the change to all clients
function HostInstance:RecvSetPlayerState(callsign, valueName, value)
	
	-- Instancing.report('D', 'HostInstance:RecvSetPlayerState', callsign .. "/" .. valueName .. "/" .. value)
	
	local player = inst.PlayerState:Lookup(self.id, callsign)
	
	-- add better logging on success
	if player ~= nil then
		if valueName == "weapon" then player:weaponSpec(tonumber(value))
		elseif valueName == "team" then player:team(tonumber(value))
		elseif valueName == "state" then player:state(tonumber(value))
		elseif valueName == "rank" then player:state(tonumber(value)) end
	end
	
	return InstanceResult:success(self:GetType() .. " Instance:RecvSetPlayerState", callsign .. "/" .. valueName .. "/" .. value, self:GetLevel('I'))
	-- make sure callsign is lower case
	-- callsign = string.lower(callsign)
	
	-- local player = self:GetPlayer(callsign)
	-- local result = player:SetState(valueName, value)
	
	-- no need to send if there was no change
	-- if result:IsNOK() then
	-- 	return result
	-- end
	
	-- let the clients kknow
	-- return self:SetPlayerState(callsign, valueName, value) 
end


--------- --------- --------- --------- --------- ---------
-- Player State

-- override Instance:RecvAddPlayerState
-- returns a result object
-- update the player, then relay the change to all clients
function HostInstance:RecvAddPlayerState(callsign, valueName, value)
	
	-- Instancing.report('D', 'HostInstance:RecvAddPlayerState', callsign .. "/" .. valueName .. "/" .. value)
	
	local player = inst.PlayerState:Lookup(self.id, callsign)
	
	-- add better logging on success
	if player ~= nil then
		if valueName == "objpoints" then player:addPoints(tonumber(value), 0)
		elseif valueName == "bonpoints" then player:addPoints(0, tonumber(value))
		elseif valueName == "death" then player:addDeath()
		elseif valueName == "kill" then player:addKill() end
	end
	
	return InstanceResult:success(self:GetType() .. " Instance:RecvAddPlayerState", callsign .. "/" .. valueName .. "/" .. value, self:GetLevel('I'))


	-- make sure callsign is lower case
	--callsign = string.lower(callsign)
	
	--local player = self:GetPlayer(callsign)
	--local result = player:AddState(valueName, value)
	
	-- no need to send if there was no change
	--if result:IsNOK() then
	--	return result
	--end
	
	-- we send a set so the client doesn't also increment the value
	-- we there was a change, the results data will contain the updated
	-- state value
	--return self:SetPlayerState(callsign, valueName, result.data) 
end

--------- --------- --------- --------- --------- ---------
-- Send the full state down to the client

-- override Instance:SendRegisterClient
-- returns a result object
-- sends the current state and player list down to the client
function HostInstance:SendRegisterClient(state, players)
	return self:SendCommand("RegisterClient", state, players)
end

-- override Instance:RecvRegisterClient
-- returns a result object
-- recvs a callsign and creates a new player with it
-- causes a full state and players list to be sent down to the client
function HostInstance:RecvRegisterClient(callsign)

	-- Instancing.report('D', 'HostInstance:RecvRegisterClient', "callsign is " .. tostring(callsign))
	
	-- make sure callsign is lower case
	callsign = string.lower(callsign)
	
	local player = self:GetPlayer(callsign)
	
	if player == nil then
		return InstanceResult:failure(self:GetType() .. " HostInstance:RecvRegisterClient", "unable to create player "  .. callsign, self:GetLevel('E'))
	end
	
	return self:SendRegisterClient(self.state, self.players)
end

------------------------------------------------------------------------------------
---------- trackers are short functions that track state information
---------- in some way. Trackers return true to indicate they want
---------- to continue being tracked or false to indicate they have
---------- completed.
------------------------------------------------------------------------------------

-- timer tracker
-- this might be ported to using Oli's eventd queue system
function _trackTimer(instance, name, now)
	
	if instance.track[name] == nil then
		-- Instancing.report('F', ' =========== _trackTimer', "Bailing - state " .. name .. " is not being tracked!")
		return false
	end
	
	-- perform inits
	if instance.track[name].init then
		-- Instancing.report('F', ' =========== _trackTimer', "Initing - state " .. name)
		instance.track[name].init = false
		instance.track[name].data = now + (instance:GetStateNumber(name) * 1000)
		instance.track[name].lastsend = 0
		return true
	end
	
	-- Instancing.report('D', 'TrackTimer', crawl(instance))
	
	-- how much time is left
	local msLeft = instance.track[name].data - now
	local secondsLeft = math.floor(msLeft / 1000)
	
	if secondsLeft <= 0 then
		-- update our host state
		instance:ChangeState(name, 0)
		
		-- we are done, let everyone know
		instance:SetTimer(name, 0)
		
		-- Instancing.report('F', ' =========== _trackTimer', "Finished Tracking - state " .. name .. " at " .. tostring(now))
		
		-- don't track anymore!
		return false
	end
	
	-- send it at most once ever second
	if (secondsLeft - instance.track[name].lastsend) >= 1 then
		-- update our host state
		instance:ChangeState(name, secondsLeft)
		
		-- send it
		instance:SetTimer(name, secondsLeft)
		
		-- Instancing.report('F', ' =========== _trackTimer', "Updating - state " .. name .. " at " .. tostring(now))
		
		-- save it
		instance.track[name].lastsend = secondsLeft
	end
	
	-- Instancing.report('F', ' =========== _trackTimer', "Sending - state " .. name .. " at " .. tostring(now))
	
	-- keep tracking!
	return true
end

-- keep alive tracker
-- basically this handles being in an area
function _trackKeepAlive(instance, name, now)
	
	if instance.track[name] == nil then
		-- Instancing.report('F', ' =========== _trackKeepAlive', "Bailing - state " .. name .. " is not being tracked!")
		return false
	end
	
	-- perform inits
	if instance.track[name].init then
		-- Instancing.report('F', ' =========== _trackKeepAlive', "Initing - state " .. name)
		instance.track[name].init = false
		return true
	end
	
	-- Instancing.report('D', 'TrackKeepAlive', crawl(instance))
	
	-- make sure someone is actually in the area, it will be non-zero in that case
	-- and see if we've gotten an update within the last 2 seconds
	if instance:GetStateNumber(name) > 0 and (now - instance.track[name].modified) < 2000 then
		-- ok, keep tracking
		-- Instancing.report('F', ' =========== _trackKeepAlive', "Tracking - state " .. name .. " at " .. tostring(now))
		return true
	end
	
	-- Instancing.report('F', ' =========== _trackKeepAlive', "Finished Tracking - state " .. name .. " at " .. tostring(now))
	
	-- update our host state
	instance:ChangeState(name, 0)
	
	-- send a 0 indicating the keep alive is no longer occupied
	instance:KeepAlive(name, 0)
	
	-- stop tracking
	return false
end

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
	
	setmetatable(instance, HostInstanceInterface)
	
	-- set our initial status
	instance:SetStatus("New")
	
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
	
	setmetatable(instance, HostInstanceInterface)
	
	-- set our initial status
	instance:SetStatus("New")
	
	return instance
end

-- shortcut function for setting an instance's status
-- relays the status to each client via a call to RecvSetState
-- returns a result object
-- statuses are defined in Instancing.lua
function HostInstance:SetStatus(status)
	return self:RecvSetState("status", status)
end

-- called by InstanceServer in response to this
-- instance register itself as an updater
-- allows an instance to process timers and keep alives
-- and possibly other data later
-- returns true to tell the server to keep updating it
-- returns false to tell the server not to update it anymore
function HostInstance:Update(frametime)
	
	local removes = {}
	
	-- update any states we are currently tracking
	-- keepalives and timers for now
	for k,t in pairs(self.track) do
		if t.handler(self, t, frametime) == false then
			-- false means its done tracking
			table.insert(removes, k)
		end
		
		-- remember when we were last updated
		t.updated = frametime 
	end
	
	-- handle any trackers that need removing
	for i,v in pairs(removes) do
		self:RemoveTracker(v)
	end
	
	-- continue to get updated if we still have some to states to track
	if table.getn(self.track) > 0 then
		return true
	end
	
	-- stop updating because we're no longer tracking any states
	return false
end

-- function for adding/updating a state tracker
-- tells the InstanceServer that manages this instance that 
-- it wants to be updated
function HostInstance:AddTracker(valueName, handler, userdata)
	-- register ourself as an updater
	self.server:RegisterUpdate(self)
	
	local now = FrameTime()
	
	-- create a tracker if needed
	if self.track[valueName] == nil then
		-- our new tracker
		local tracker =
		{
			name = valueName,
			handler = handler,
			data	= userdata,
			created = now,
			modified = now,
			updated = now
		}
		
		-- remember it
		self.track[valueName] = tracker
	else
		-- our value has been modified, remember when
		self.track[valueName].modified = now
	end
end

-- remove a tracker
function HostInstance:RemoveTracker(valueName)
	if self.track[valueName] then
		self.track[valueName] = nil
	end
end

--------- --------- --------- --------- --------- ---------
-- SetState

-- override Instance:RecvSetState
-- returns a result object
-- behavior is to update the state and then relay the changes to the clients
function HostInstance:RecvSetState(valueName, value)
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
	
	local result = self:ChangeState(valueName, value)
	
	-- if the value didn't change, no need to send it
	if result:IsNOK() then
		return result
	end
	
	-- relay the change to other clients
	return self:SetState(valueName, value)
end

--------- --------- --------- --------- --------- ---------
-- Tell the server to change a state value.

-- override Instance:RecvKeepAlive
-- returns a result object
-- start tracking the keepalive
function HostInstance:RecvKeepAlive(valueName, value)

	local newValue = tonumber(value)
	local curValue = self:GetStateNumber(valueName)

	-- 0 or same value is ok; different value is skipped
	if curValue == 0 or curValue == newValue then
		local result = self:ChangeState(valueName, value)
		
		-- track this state
		self:AddTracker(valueName, _G["_trackKeepAlive"])
		
		if result:IsNOK() then
			return result
		end
		
		-- relay the change to other clients
		return self:KeepAlive(valueName, value)
	end
	
	return InstanceResult:failure("keepAlive occupied or unchanged")
end

--------- --------- --------- --------- --------- ---------
-- Tell the server to do something with a timed event?


-- override Instance:RecvSetTimer
-- returns a result object
-- start tracking the timer
function HostInstance:RecvSetTimer(timerName, duration)
	local result = self:ChangeState(timerName, duration)
	
	-- start tracking this state
	self:AddTracker(timerName, _G["_trackTimer"], 0)
	
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
	
	Instancing.report('D', 'HostInstance:RecvSetPlayerState', "callsign is " .. tostring(callsign))
	Instancing.report('D', 'HostInstance:RecvSetPlayerState', "valueName is " .. tostring(valueName))
	Instancing.report('D', 'HostInstance:RecvSetPlayerState', "value is " .. tostring(value))
	
	-- make sure callsign is lower case
	-- callsign = string.lower(callsign)
	
	local player = self:GetPlayer(callsign)
	local result = player:SetState(valueName, value)
	
	-- no need to send if there was no change
	if result:IsNOK() then
		return result
	end
	
	-- let the clients kknow
	return self:SetPlayerState(callsign, valueName, value) 
end


--------- --------- --------- --------- --------- ---------
-- Player State

-- override Instance:RecvAddPlayerState
-- returns a result object
-- update the player, then relay the change to all clients
function HostInstance:RecvAddPlayerState(callsign, valueName, value)

	Instancing.report('D', 'HostInstance:RecvAddPlayerState', "callsign is " .. tostring(callsign))
	Instancing.report('D', 'HostInstance:RecvAddPlayerState', "valueName is " .. tostring(valueName))
	Instancing.report('D', 'HostInstance:RecvAddPlayerState', "value is " .. tostring(value))

	-- make sure callsign is lower case
	-- callsign = string.lower(callsign)
	
	local player = self:GetPlayer(callsign)
	local result = player:AddState(valueName, value)
	
	-- no need to send if there was no change
	if result:IsNOK() then
		return result
	end
	
	-- we send a set so the client doesn't also increment the value
	return self:SetPlayerState(callsign, valueName, value) 
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

	Instancing.report('D', 'HostInstance:RecvRegisterClient', "callsign is " .. tostring(callsign))
	
	-- make sure callsign is lower case
	-- callsign = string.lower(callsign)
	
	local player = self:GetPlayer(callsign)
	
	if player == nil then
		return InstanceResult:failure("HostInstance:RecvRegisterClient", "unable to create player "  .. callsign)
	end
	
	return self:RegisterClient(self.state, self.players)
end

------------------------------------------------------------------------------------
---------- trackers are short functions that track state information
---------- in some way. Trackers return true to indicate they want
---------- to continue being tracked or false to indicate they have
---------- completed.
------------------------------------------------------------------------------------

-- timer tracker
-- this might be ported to using Oli's eventd queue system
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
		-- we are done, let everyone know
		instance:SetTimer(tracker.name, 0)
		
		-- don't track anymore!
		return false
	end
	
	-- send it at most once ever second
	if now - tracker.lastsend >= 1 then
		instance:SetTimer(tracker.name, timeleft)
		tracker.lastsend = now
	end
	
	-- keep tracking!
	return true
end

-- keep alive tracker
-- basically this handles being in an area
function _trackKeepAlive(instance, tracker, now)
	
	-- make sure someone is actually in the area
	-- it will be non-zero in that case
	if instance:GetStateNumber(tracker.name) == 0 then
		-- instance:KeepAlive(tracker.name, 0)
		return false
	end
	
	-- see if we've gotten an update within the last 2 seconds
	if (now - tracker.modified) < 3 then
		-- keep tracking
		return true
	else
		-- send a 0 indicating the keep alive is no longer occupied
		instance:KeepAlive(tracker.name, 0)
		
		-- stop tracking
		return false
	end
	
end

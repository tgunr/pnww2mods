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
	InstancePlayer class definition
]]--

-- base class
Include("InstanceState")

-- class container
InstancePlayer = InstanceState:create()
InstancePlayerInterface = { __index = InstancePlayer }
 
-- constructor with arguments
-- i = the instance the player belongs too
-- c = the players callsign
function InstancePlayer:new(i, c)
	local player = InstanceState:create()
	
	player.instance = i
	player.callsign = string.lower(c)
	
	return setmetatable(player, InstancePlayerInterface)
end

--------- --------- --------- --------- --------- ---------
-- Set a state
-- returns a result object

function InstancePlayer:SetState(valueName, value)
	self:ChangeState(valueName, value)
	self.instance:HandleState("OnPlayer", self.callsign, valueName, value)
	return InstanceResult:success("SetPlayerState success")
end

--------- --------- --------- --------- --------- ---------
-- Add a state
-- returns a result object

function InstancePlayer:AddState(valueName, value)
	local oldValue = self:GetStateNumber(valueName)
	local newValue = oldValue + tonumber(value)
	return self:SetState(valueName, newValue)
end



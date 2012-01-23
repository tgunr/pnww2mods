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
require 'InstanceState'

-- class container
InstancePlayer = InstanceState:create()
InstancePlayerInterface = { __index = InstancePlayer }
 
-- constructor with arguments
-- i = the instance the player belongs too
-- c = the players callsign
function InstancePlayer:new(i, c)
	local player = InstanceState:create()
	
	player.instance = i
	player.callsign = c --string.lower(c)
	player.type = 'P'
	
	return setmetatable(player, InstancePlayerInterface)
end

--------- --------- --------- --------- --------- ---------
-- Set a state
-- returns a result object

function InstancePlayer:SetState(valueName, value)
	self:ChangeState(valueName, value)
	self.instance:HandleState("OnPlayer", self.callsign, valueName, value)
	return InstanceResult:success(self:GetType() .. " InstancePlayer:SetState", printState(valueName, value))
end

--------- --------- --------- --------- --------- ---------
-- Add a state
-- returns a result object

function InstancePlayer:AddState(valueName, value)
	local oldValue = self:GetStateNumber(valueName)
	local newValue = oldValue + tonumber(value)
	
	if Instancing.EnableDebug then
		InstanceResult:success(self:GetType() .. " InstancePlayer:AddState", printChange(valueName, oldValue, NewValue))
	end
	
	return self:SetState(valueName, newValue)
end



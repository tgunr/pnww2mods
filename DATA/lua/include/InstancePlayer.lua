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
	player.callsign = string.lower(c)
	player.type = 'P'
	--player.level = 'D'
	
	return setmetatable(player, InstancePlayerInterface)
end

--------- --------- --------- --------- --------- ---------
-- Set a state
-- returns a result object

function InstancePlayer:SetState(valueName, value)
	local result = self:ChangeState(valueName, value)
	
	-- return early is the value wasn't changed
	if result:IsNOK() then
		return result
	end
	
	self.instance:HandleState("OnPlayer", self.callsign, valueName, value)
	
	return InstanceResult:success(self:GetType() .. " InstancePlayer:SetState", printState(valueName, value), value, self:GetLevel('D'))
end

--------- --------- --------- --------- --------- ---------
-- Add a state
-- returns a result object

function InstancePlayer:AddState(valueName, value)
	local oldValue = self:GetStateNumber(valueName)
	local newValue = oldValue + tonumber(value)
	
	-- log it
	InstanceResult:success(self:GetType() .. " InstancePlayer:AddState", printChange(valueName, oldValue, NewValue), nil, self:GetLevel('D'))
	
	return self:SetState(valueName, newValue)
end



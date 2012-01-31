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
	
	return InstanceResult:success(self:GetType() .. " InstancePlayer:SetState", printState(valueName, value), value, self:GetLevel('D'))
end

-- state change handling
-- returns a result object
-- fires off a handler if one is found for the state name
function InstancePlayer:HandleState(valueName, value)
	-- players always simply look for an onplayer handler in the parent instance
	-- this might be changed to something more flexible later
	local handler = self.instance.handlers["OnPlayer"]
	
	if handler ~= nil and type(_G[handler]) == "function" then
		local status, msg = pcall(_G[handler], self.callsign, valueName, value)
		if status then
			return InstanceResult:success(self:GetType() .. " InstancePlayer:HandleState", self.callsign .. ": " .. printChange(valueName, oldValue, value) .. " handled", nil, self:GetLevel('I'))
		else
			return InstanceResult:failure(self:GetType() .. " InstancePlayer:HandleState", self.callsign .. ": " .. printChange(valueName, oldValue, value) .. " not handled", self:GetLevel('E'))
		end
	end
	
	return InstanceResult:success(self:GetType() .. " InstancePlayer:HandleState",  self.callsign .. ": " .. printChange(valueName, oldValue, value) .. " no handler", nil, self:GetLevel('X'))
end

--------- --------- --------- --------- --------- ---------
-- Add a state
-- returns a result object

function InstancePlayer:AddState(valueName, value)
	local oldValue = self:GetStateNumber(valueName)
	local newValue = oldValue + tonumber(value)
	
	-- log it
	InstanceResult:success(self:GetType() .. " InstancePlayer:AddState", printChange(valueName, oldValue, newValue), nil, self:GetLevel('D'))
	
	return self:SetState(valueName, newValue)
end



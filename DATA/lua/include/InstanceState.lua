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
	InstanceState class definition
]]--

-- used for responses
-- all subclasses of InstanceState use this too so we
-- might as well include it here
require 'InstanceResult'

InstanceState = {}
InstanceStateInterface = { __index = InstanceState }
 
-- constructor no arguments
function InstanceState:create()
	local data = 
	{
		-- our instance state
		state = {},
		
		-- handlers that have been registered
		handlers = {},
	}
	
	return setmetatable(data, InstanceStateInterface)
end

-- handlers are state hooks that fire off functions on state change

-- register a handler with this instance by state name
function InstanceState:RegisterHandler(stateName, handler)
	self.handlers[stateName] = handler
end

-- unregister a handler by state name
function InstanceState:UnregisterHandler(stateName)
	self.handlers[stateName] = nil
end

-- state change handling
-- returns a result object
-- fires off a handler if one is found for the state name
function InstanceState:HandleState(valueName, value, oldValue)
	local handler = self.handlers[valueName]
	
	if handler ~= nil and type(_G[handler]) == "function" then
		local status, msg = pcall(_G[handler], valueName, value, oldValue)
		if not status then
			return InstanceResult:failure("InstanceState:HandleState", printState(valueName, value) .. " not handled")
		else
			return InstanceResult:success("InstanceState:HandleState", printState(valueName, value) .. " handled")
		end
	end
	
	return InstanceResult:success("InstanceState:HandleState",  printState(valueName, value) .. " no handler")
end

-- main function for changing our state
-- causes any handlers to fire
-- returns a result object
function InstanceState:ChangeState(valueName, value)
	-- Grab the old value and swap in the new.
	local oldValue = self.state[valueName]
	
	-- set our state
	self.state[valueName] = value
	
	if oldValue == value then
		return InstanceResult:failure("InstanceState:ChangeState", printChange(valueName, oldValue, value) .. " (unchanged)")
	end
	
	-- execute any associated handlers
	self:HandleState(valueName, value, oldValue)
	
	return InstanceResult:success("InstanceState:ChangeState", printChange(valueName, oldValue, value) .. " (changed)")
end

--------- --------- --------- --------- --------- ---------
-- Get the current value of a state or nil.

-- get a value
-- returns a result object
-- on success, result objects' data member holds the value
function InstanceState:GetStateValue(stateName)
	local state = self.state[stateName]
	if state == nil then
		return InstanceResult:failure("InstanceState:GetStateValue", printState(stateName, state) .. " not set")
	end
	return InstanceResult:success("InstanceState:GetStateValue", printState(stateName, state) .. " returned", state)
end

-- get a value as a string
-- takes optional default value
-- empty string "" is the value of last resort
function InstanceState:GetStateString(stateName, defValue)
	local state = self:GetStateValue(stateName)
	
	if(state:IsNOK()) then
		if(defValue ~= nil) then
			return tostring(defValue)
		else
			return ""
		end
	end

	return tostring(state.data)
end

-- get a value as a number
-- takes optional default value
-- 0 is the value of last resort
function InstanceState:GetStateNumber(stateName, defValue)
	local state = self:GetStateValue(stateName)

	if(state:IsNOK()) then
		if(defValue ~= nil) then
			return tonumber(defValue)
		else
			return 0
		end
	end

	return tonumber(state.data)
end

-- get a value as a boolean
-- takes optional default value
-- false is the value of last resort
function InstanceState:GetStateBool(stateName, defValue)
	local state = self:GetStateValue(stateName)

	if(state:IsNOK()) then
		if(defValue ~= nil and defValue ~= 0 and defValue ~= "false" and defValue ~= false) then
			return true
		else
			return false
		end
	end

	if(state.data ~= nil and state.data ~= 0 and state.data ~= "false" and state.data ~= false) then
		return true
	else
		return false
	end
end


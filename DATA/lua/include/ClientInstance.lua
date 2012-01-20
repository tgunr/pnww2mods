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
	ClientInstance class definition
]]--

Include("Instancing")
Include("Instance")

ClientInstance = Instance:create()
ClientInstanceInterface = { __index = ClientInstance }

-- by default this class just uses the default behavior of Instance
-- but we may implement client specific handling later

-- blank constructor
function ClientInstance:create()
	return setmetatable(Instance:create(), ClientInstanceInterface)
end

-- constructor with arguments
-- i = string id of instance
-- s = sendcallback to use for sending out data
function ClientInstance:new(i, s)
	return setmetatable(Instance:new(i, s), ClientInstanceInterface)
end


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
	InstanceServer class definition
]]--

require 'Instancing'
require 'HostInstance'

InstanceServer = {}
InstanceServerInterface = { __index = InstanceServer }

-- constructor no arguments
function InstanceServer:create()
	local newServer = 
	{
		-- our list of instances to handle
		instances = {},
		
		-- instances that need updating
		updates = {},
		
		-- last timer we did an update
		lastUpdate = 0
	}
	
	return setmetatable(newServer, InstanceServerInterface)
end

--------- --------- --------- --------- --------- ---------
-- Main update call

-- this call updates all instances that have registered themself
-- as wanting to be updated, probably because they are monitoring
-- a state variable in some way
function InstanceServer:Update(frametime)
	
	-- instances that need removing from the update list
	local removes = {}

	for id,instance in pairs(self.updates) do
		-- a host instance's update function will return
		-- false when it no longer wants to be updated
		if not instance:Update(frametime) then
			table.insert(removes, instance)
		end
	end
	
	-- remove any instances that no longer
	-- want to be updated
	for index,instance in ipairs(removes) 	do
		self:UnregisterUpdate(instance)
	end
	
	-- remember last time we were updated
	-- might be useful
	self.lastUpdate = frametime 
end

-- called by an instance this server manages
-- to indicate the server should start the update it
-- returns a result object
function InstanceServer:RegisterUpdate(instance)
	-- instance string id
	local id = instance:Id()
	
	-- add it if we're not already updating it
	if self.updates[id] == nil then
		self.updates[id] = instance
	end
	
	return InstanceResult:success("S InstanceServer:RegisterUpdate", "instance " .. id .. " registered")
end

-- called by an instance this server manages
-- to indicate the server should stop updating it
-- returns a result object
function InstanceServer:UnregisterUpdate(instance)
	-- instance string id
	local id = instance:Id()
	
	-- remove it if we were updating it
	if self.updates[id] ~= nil then
		self.updates[id] = nil
	end
	
	return InstanceResult:success("S InstanceServer:UnregisterUpdate", "instance " .. id .. " unregistered")
end

-- add a new instance
-- id = string id of new instance
-- returns a result object
function InstanceServer:AddInstance(id)
	-- see if we already have this instance
	local result = self:GetInstance(id)
	
	-- if so, bail early
	if result:IsSuccess() then
		return InstanceResult:failure("S InstanceServer:AddInstance", "instance " .. id .. " exists, nothing to do!")
	end
	
	-- create it
	self.instances[id] = HostInstance:new(id, sendServerData, self)
	
	-- don't call this, it results in a recursive loop
	-- Instancing.report('N', 'InstanceServer:AddInstance', crawl(self.instances[id]));
	
	-- return the lookup result
	-- result.data will contain the instance
	return self:GetInstance(id)
end

-- remove an instance
-- id = string id of new instance
-- returns a result object
function InstanceServer:RemoveInstance(id)
	-- see if this instance exists
	local result = self:GetInstance(id)
	
	-- instance didn't exit, bail
	if result.IsNOK() then
		return InstanceResult:failure("S InstanceServer:RemoveInstance", "instance " .. id .. " does not exist, nothing to do!")
	end
	
	-- kill it
	self.instances[id] = nil
	
	return InstanceResult:success("S InstanceServer:RemoveInstance", "instance " .. id .. " removed!")
end

-- lookup an instance
-- id = string id of instance
-- returns a result object
function InstanceServer:GetInstance(id)
	if self.instances[id] ~= nil then
		return InstanceResult:success("S InstanceServer:GetInstance", "instance " .. id .. " returned!", self.instances[id])
	else
		return InstanceResult:failure("S InstanceServer:GetInstance", "instance " .. id .. " does not exist!")
	end
end

-- ##################################################################
-- ### Main
-- ##################################################################

--Instancing:report('D', 'Main', 'Debug reporting enabled.')

-- our server instance
server = InstanceServer:create()

-- host create instance callback
-- returns true on success, false on failure
function createInstance(id)
	return getResult(server:AddInstance(id))
end

-- host remove instance callback
-- returns true on success, false on failure
function removeInstance(id)
	return getResult(server:RemoveInstance(id))
end

-- host status callback
-- returns true on success, false on failure
function setInstanceStatus(id, status)
	-- lookup our instance
	local result = server:GetInstance(id)
	
	-- if it wasn't found, bail
	if getResult(result) == false then
		return false
	end
	
	-- set it
	return getResult(result.data:SetStatus(status))
end

-- host update callback
-- returns true on success, false on failure
function updateServer()
	return getResult(server:Update(FrameTime()))
end

-- host send data callback
function sendServerData(id, data)
	if IsOnline() then
		inst.SendData(tostring(id), tostring(data))
	elseif IsClient() then
		recvClientData(id, data)
	end
end

-- host recv data callback
-- returns true on success, false on failure
function recvServerData(id, data)
	-- lookup instance
	local result = server:GetInstance(id)
	
	-- if the instance doesn't exist, bail
	if getResult(result) == false then
		return false
	end
	
	-- process the command
	return getResult(result.data:RecvCommand(data))
end

-- Instancing:report('N', 'Main', 'Shutting down.')


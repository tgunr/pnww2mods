Include("Instancing")
Include("HostInstance")

InstanceServer = {}
InstanceServerInterface = { __index = InstanceServer }
 
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

function InstanceServer:Update(frametime)
	
	-- instances that need removing from the update list
	local removes = {}

	for id,instance in pairs(self.updaters)
	do
		-- a host states update function will return
		-- false when it no longer wants to be updated
		if not instance:Update(frametime) then
			table.insert(removes, instance)
		end
	end
	
	-- remove any updaters that no longer
	-- want to be updated
	for index,instance in ipairs(removes)
	do
		self:UnregisterUpdate(instance)
	end
	
	self.lastUpdate = frametime 
end

function InstanceServer:RegisterUpdate(instance)
	local id = instance:Id()
	
	if self.updaters[id] == nil then
		self.updaters[id] = instance
	end
	
	return InstanceResult:success(" - updating " .. id)
end

function InstanceServer:UnregisterUpdate(instance)
	local id = instance:Id()
	
	if self.updaters[id] ~= nil then
		self.updaters[id] = nil
	end
	
	return InstanceResult:success(" - removed " .. id)
end

function InstanceServer:AddInstance(id)
	local result = self:GetInstance(id)
	
	if result.IsSuccess() then
		InstanceResult:failure(" - instance " .. id .. " already exists!")
	end
	
	-- create it
	self.instances[id] = HostInstance:new(id, _G["sendData"], self)
	
	return self:GetInstance(id)
end

function InstanceServer:RemoveInstance(id)
	local result = self:GetInstance(id)
	
	if result.IsFailure() then
		InstanceResult:failure(" - instance " .. id .. " does not exist!")
	end
	
	-- kill it
	self.instances[id] = nil
	
	return InstanceResult:success(" - instance " .. id .. " removed!")
end

function InstanceServer:GetInstance(id)
	if self.instances[id] ~= nil then
		return InstanceResult:success(self.instances[id])
	else
		return InstanceResult:failure(" - no such instance " .. id)
	end
end

-- ##################################################################
-- ### Main
-- ##################################################################

--Instancing:report('D', 'Main', 'Debug reporting enabled.')

server = InstanceServer:create()

-- host create instance callback
function createInstance(id)
	return getResult(server:AddInstance(id))
end

-- host remove instance callback
function removeInstance(id)
	return getResult(server:RemoveInstance(id))
end

-- host status callback
function setInstanceStatus(id, status)
	local result = server:GetInstance(id)
	
	if getResult(result) == false then
		return false
	end
	
	return getResult(result.data:SetStatus(status))
end

-- host update callback
function updateServer(frametime)
	return getResult(server:Update(frametime))
end

-- host send data callback
function sendData(id, data)
	-- need some sort of host c-layer callback here?
end

-- host recv data callback
function recvData(id, data)
	local result = server:GetInstance(id)
	
	if getResult(result) == false then
		return false
	end
	
	return getResult(result.data:RecvCommand(data))
end

-- Instancing:report('N', 'Main', 'Shutting down.')


Include("Instance")

ClientInstance = Instance:create()
ClientInstanceInterface = { __index = ClientInstance }

function ClientInstance:create()
	return setmetatable(Instance:create(), ClientInstanceInterface)
end

function ClientInstance:new(i, s)
	return setmetatable(Instance:new(i, s), ClientInstanceInterface)
end


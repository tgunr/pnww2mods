Include("InstanceResult")

InstanceState = {}
InstanceStateInterface = { __index = InstanceState }
 
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

-- handler support
function InstanceState:RegisterHandler(stateName, handler)
	self.handlers[stateName] = handler
end

function InstanceState:UnregisterHandler(stateName)
	self.handlers[stateName] = nil
end

-- state change handling
function InstanceState:HandleState(valueName, value, oldValue)
	local handler = self.handlers[valueName]
	
	if handler ~= nil and type(_G[handler]) == "function" then
		local status, msg = pcall(_G[handler], valueName, value, oldValue)
		if not status then
			return InstanceResult:failure("--  Handler failure -- "..msg..".")
		else
			return InstanceResult:success("--  Handler success -- "..msg..".")
		end
	end
	
	return InstanceResult:success("--  Handler success -- no handler.")
end

-- main function for change our state
function InstanceState:ChangeState(valueName, value)
	-- Grab the old value and swap in the new.
	local oldValue = self.state[valueName]
	
	-- set our state
	self.state[valueName] = value
	
	if oldValue == newValue then
		return InstanceResult:failure("-- "..valueName.." did not change '"..oldValue.."' -> '"..value.."'.")
	end
	
	-- execute any associated handlers
	self:HandleState(valueName, value, oldValue)
	
	if oldValue == nil then
		oldValue = "nil"
	end
	
	return InstanceResult:success("-- "..valueName.." value changed '"..oldValue.."' -> '"..value.."'.")
end

--------- --------- --------- --------- --------- ---------
-- Get the current value of a state or nil.

function InstanceState:GetStateValue(stateName)
	local state = self.state[stateName]
	if state == nil then
		return InstanceResult:failure("not set")
	end
	return InstanceResult:success(state)
end

function InstanceState:GetStateString(stateName, defValue)
	local state = self:GetStateValue(stateName)
	
	if(state:IsFailure()) then
		if(defValue ~= nil) then
			return tostring(defValue)
		else
			return ""
		end
	end

	return tostring(state.data)
end

function InstanceState:GetStateNumber(stateName, defValue)
	local state = self:GetStateValue(stateName)

	if(state:IsFailure()) then
		if(defValue ~= nil) then
			return tonumber(defValue)
		else
			return 0
		end
	end

	return tonumber(state.data)
end

function InstanceState:GetStateBool(stateName, defValue)
	local state = self:GetStateValue(stateName)

	if(state:IsFailure()) then
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

--------- --------- --------- --------- --------- ---------
-- Helper function that will unpack results from the instancing routines.

function InstanceState.write(x)
	if type(x) == "table" then
		print(unpack(x))
	else
		print(tostring(x))
	end
end

--------- --------- --------- --------- --------- ---------
-- Display a textual representation of the structure of a
-- Lua table.
--	e.g.
--	crawl(myTable)

function InstanceState.crawl(tbl, indent)
	local str = ""
	if indent == nil then indent = "" end

	for k, v in pairs(tbl)
	do
		str = str .. string.format("%s%s %s %s\n", indent, k, type(v), tostring(v))
		if type(v) == "table" then
			str = str .. crawl(v, indent .. "  ")
		end
	end
	return str
end

-- Create a new class that inherits from a base class
--
function BaseClass(baseClass, ...)
	return baseClass:new({...})
end

function BaseClass2( baseClass )

    -- Create the table and metatable representing the class.
    local new_class = {}
    local class_mt = { __index = new_class }

    -- Note that this function uses class_mt as an upvalue, so every instance
    -- of the class will share the same metatable.
    --
    function new_class:new()
        local newinst = {}
        setmetatable( newinst, class_mt )
        return newinst
    end

    -- The following is the key to implementing inheritance:

    -- The __index member of the new class's metatable references the
    -- base class.  This implies that all methods of the base class will
    -- be exposed to the sub-class, and that the sub-class can override
    -- any of these methods.
    --
    if baseClass then
        setmetatable( new_class, { __index = baseClass } )
    end

    return new_class
end

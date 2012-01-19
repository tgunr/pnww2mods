InstanceResult = {}
InstanceResultInterface = { __index = InstanceResult }
 
-- generic constructor
function InstanceResult:new(c, d)
	local result = 
	{
		-- our result code
		code = c
		
		-- data associated with the result
		data = d,
		
		-- what created this result object
		source = nil,
		
		-- identify this as a result table
		_result = true
	}
	
	if Instancing.EnableDebug and _G["debug"] then
		-- get info about the caller
        local info = debug.getinfo(2, "nSl")
        
        if info ~= nil then
			if info.what == "C" then   -- is a C function?
				result.source = "C function"
			else   -- a Lua function
				result.source = string.format("[%s] %s: %d", info.short_src, info.name, info.currentline)
			end
		end
	end
	
	return setmetatable(result, InstanceResultInterface)
end

-- convenience constructor for successes
function InstanceResult:success(d)
	return InstanceResult:new(Instancing.SuccessCode, d);
end

-- convenience constructor for failures
function InstanceResult:failure(d)
	return InstanceResult:new(Instancing.ErrorCode, d);
end

function InstanceResult:IsSuccess()
		if self.code == Instancing.SuccessCode then
			return true
		else
			return false
		end
end

function InstanceResult:IsFailure()
		if self.code == Instancing.ErrorCode then
			return true
		else
			return false
		end
end

function InstanceResult:ToString()
	local out = ""
	
	if Instancing.EnableDebug and self.source ~= nil then
		out = self.source .. " > "
	end
	
	if self:IsSuccess() then
		out = Instancing.SuccessCode
	else
		out = Instancing.ErrorCode .. " " .. self.data
	end
	
	return out
end


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
	InstanceResult class definition
]]--

InstanceResult = {}
InstanceResultInterface = { __index = InstanceResult }
 
-- generic constructor
-- c = result code, see Instancing success and error codes
-- d = userdata associated with error code
function InstanceResult:new(c, d)
	local result = 
	{
		-- our result code
		code = c,
		
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
	
	setmetatable(result, InstanceResultInterface)
	
	-- debug it
	Instancing.report('N', 'InstanceResult:new', result:toString())
	
	return result
end

-- convenience constructor for successes
-- d = optional user data
function InstanceResult:success(d)
	return InstanceResult:new(Instancing.SuccessCode, d);
end

-- convenience constructor for failures
-- d is a string indicating the failure
function InstanceResult:failure(d)
	return InstanceResult:new(Instancing.ErrorCode, d);
end

-- returns true on success, false on failure
function InstanceResult:IsSuccess()
		if self.code == Instancing.SuccessCode then
			return true
		else
			return false
		end
end

-- returns true on failure, false on success
function InstanceResult:IsFailure()
		if self.code == Instancing.ErrorCode then
			return true
		else
			return false
		end
end

-- returns a string representation of the result
-- used for logging
function InstanceResult:toString()
	local out = ""
	
	if Instancing.EnableDebug and self.source ~= nil then
		out = self.source .. " > "
	end
	
	if self:IsSuccess() then
		out = Instancing.SuccessCode
	else
		if self.data ~= nil then
			out = Instancing.ErrorCode .. " " .. self.data
		else
			out = Instancing.ErrorCode
		end
	end
	
	return out
end


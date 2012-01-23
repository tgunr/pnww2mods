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
function InstanceResult:new(c, s, m, d)
	local result = 
	{
		-- our result code
		code = c,
		
		-- data associated with the result
		data = d or nil,
		
		-- message associated with the result
		message = m,
		
		-- what created this result object
		source = s,
		
		-- identify this as a result table
		_result = true
	}
	
	setmetatable(result, InstanceResultInterface)
	
	-- debug it
	Instancing.report('N', result:GetSource(), result:GetMessage())
	
	return result
end

-- convenience constructor for successes
-- d = optional user data
function InstanceResult:success(s, m, d)
	return InstanceResult:new(Instancing.SuccessCode, s, m, d);
end

-- convenience constructor for failures
-- d is a string indicating the failure
function InstanceResult:failure(s, m)
	return InstanceResult:new(Instancing.FailureCode, s, m, nil);
end

-- convenience constructor for errors
-- d is a string indicating the error condition
function InstanceResult:error(s, m)
	return InstanceResult:new(Instancing.ErrorCode, s, m, nil);
end

-- returns true on success, false on other
function InstanceResult:IsSuccess()
	if self.code == Instancing.SuccessCode then
		return true
	else
		return false
	end
end

-- returns true on failure, false on other
function InstanceResult:IsFailure()
	if self.code == Instancing.FailureCode then
		return true
	else
		return false
	end
end

-- returns true on error, false on other
function InstanceResult:IsError()
	if self.code == Instancing.ErrorCode then
		return true
	else
		return false
	end
end

-- returns true on success, false on failure or error
function InstanceResult:IsOK()
	if self:IsSuccess() then
		return true
	else
		return false
	end
end

-- returns true on failure or error, false on success
function InstanceResult:IsNOK()
	if self:IsSuccess() then
		return false
	else
		return true
	end
end

function InstanceResult:GetSource()
	return self.source or 'InstanceResult:' .. self.code
end

-- returns a string representation of the result
-- used for logging
function InstanceResult:GetMessage()
	local m = self.code
	if type(self.message) == "string" then
		m = m .. ": " .. self.message
	end
	return m
end


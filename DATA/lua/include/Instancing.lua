----------------------------------------------------------------------
-- PlayNet Instancing Management Interface.
-- Copyright (C) 2011, PlayNet Inc, All Rights Reserved.
-- Not for redistribution.
--
-- Originating Programmer: Oliver "kfsone" Smith
-- Created: 2011/04/27 20:01.13 CDT
--
--[[
	Provides the "Instancing" interface for implementing
	a Lua-based Instance client or server.
]]--

require 'debug'
require 'string'
require 'json'
require 'shared'
require 'InstanceResult'
require 'InstanceState'

Instancing =
{
	--------- --------- --------- --------- --------- ---------
	-- CONFIGURATION
	--------- --------- --------- --------- --------- ---------

	--------- --------- --------- --------- --------- ---------
	-- Ordered list of commands.
	-- This must be shared between client/host to keep them in
	-- synchronization.
	Commands = 
	{
		"RegisterClient" 		-- used by client to let the host know its there
	,	"SetState"				-- set a state value
	,	"AddState"				-- add to a state value (only numbers are supported)
	,	"SetTimer"				-- set a timer that fires off a state value
	,	"KeepAlive"				-- non-zero values keep it alive
	,	"BroadcastEvent"		-- one off events that aren't saved, but are sent 
	,	"SetPlayerState"		-- sets some player data
	,	"AddPlayerState"		-- adds to player data (only numbers are supported)
	}
	
	-- our instance statuses
,	{
		"New"
	,	"Staging"
	,	"Active"
	,	"Closed"
	,	"Dead"
	}
	
,	SuccessCode		=	'OK'		-- Returned to indicate things went well
,	FailureCode			=	'NOK'	-- Returned to indicate something failed.
,	ErrorCode			=	'ERR'		-- Returned to indicate an error.
,	EnableDebug		=	true	-- Set true to allow 'D' messages to log.
,	LoggingCallback	= nil -- what to call when trying to output loggin

-- reporting function
,	report = function(code, funcname, msg)
		if (code ~= 'D' or Instancing.EnableDebug) and Instancing.LoggingCallback ~= nil then
			Instancing.LoggingCallback("[" .. funcname .. "] " .. msg)
		end
	end

}

--------- --------- --------- --------- --------- ---------
-- Helper function that will unpack results from the instancing routines.

function string:split( inSplitPattern, outResults )
	if not outResults then
		outResults = { }
	end
	local theStart = 1
	local theSplitStart, theSplitEnd = string.find( self, inSplitPattern, theStart )
	while theSplitStart do
		table.insert( outResults, string.sub( self, theStart, theSplitStart-1 ) )
		theStart = theSplitEnd + 1
		theSplitStart, theSplitEnd = string.find( self, inSplitPattern, theStart )
	end
	table.insert( outResults, string.sub( self, theStart ) )
	return outResults
end


--------- --------- --------- --------- --------- ---------
-- Helper function that will unpack results from the instancing routines.

function write(x)
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

crawl_recursions = 0

function crawl(tbl, indent, recursionCheck)

	local str = ""
	if indent == nil then indent = "" end
	
	if recursionCheck == nil then
		str = "\n"
		crawl_recursions = 0
	else
		crawl_recursions = crawl_recursions + 1
	end
	
	if crawl_recursions >= 100 then
		str = str .. "max recurssions\n"
		return str
	end
	
	if type(tbl) ~= "table" then
		str = str .. tostring(tbl)
	else
		for k, v in pairs(tbl) do
			str = str .. string.format("%s%s %s %s\n", indent, k, type(v), tostring(v))
			if type(v) == "table" then
				str = str .. crawl(v, indent .. "  ", true)
			end
		end
	end

	return str
end

function printState(vName, vFrom)
	return string.format("%s : %s", tostring(vName), tostring(vFrom))
end

function printChange(vName, vFrom, vTo)
	return string.format("%s : %s -> %s", tostring(vName), tostring(vFrom), tostring(vTo))
end

-- takes a result object and returns true is the result was a success and false if not
-- optionally debugs the result if debugging in on
function getResult(r)
	if r == nil then
		return false
	end
	
	-- log it
	--Instancing.report('D', 'getResult', r:toString())
	
	return r:IsSuccess()
end

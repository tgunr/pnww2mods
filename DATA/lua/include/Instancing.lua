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

-- remove unsued features from the core libs

--io 		= nil;
--file 	= nil;
--os 		= nil;

-- add some common functions

--function Include(lib, force)
--	if(_G[lib] == nil or force == true) then
--		game.RunScript("include/"..lib..".lua");
--	end
--end

-- add it to the game lib for consistency sake
-- game.Include = Include; 

-- compatibility with client
-- how does the host handle loading of files?
if _G["Include"] == nil then
	_G["Include"] = function(file)
		require(file)
	end
end

Include("string")
Include("json")
Include("InstanceResult")
Include("InstanceState")

Instancing =
{
	--------- --------- --------- --------- --------- ---------
	-- CONFIGURATION
	--------- --------- --------- --------- --------- ---------

	--------- --------- --------- --------- --------- ---------
	-- Ordered list of commands.
	-- This must be shared between client/host to keep them in
	-- synchronization.
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
	
,	SuccessCode		=	'OK'	-- Returned to indicate things went well
,	ErrorCode			=	'NOK'	-- Returned to indicate something failed.
,	EnableDebug		=	true	-- Set true to allow 'D' messages to log.
,	LoggingCallback	= nil -- what to call when trying to output loggin

-- reporting function
,	report = function(code, funcname, msg)
		if (code ~= 'D' or Instancing.EnableDebug) and self.LoggingCallback ~= nil then
			self.LoggingCallback(text)
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

function crawl(tbl, indent)
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

-- takes a result object and returns true is the result was a success and false if not
-- optionally debugs the result if debugging in on
function getResult(r)
	if r == nil then
		return false
	end
	
	-- log it
	Instancing:report('D', 'getResult', r:ToString())
	
	return r:IsSuccess()
end

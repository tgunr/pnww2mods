--
-- Common initialization file for lua in a server
-- default file can be overridden with LUA_RC_FILE
--

require 'debug'		-- For debugging stuff.

ENGLAND = WWII_ENGLAND ; FRANCE = WWII_FRANCE ; GERMANY = WWII_GERMANY ; CHINA = WWII_CHINA ; USA = WWII_USA ; NO_COUNTRY = WWII_NO_COUNTRY
AIRCRAFT = _AIRCRAFT ; INFANTRY = _INFANTRY ; GROUND_VEHICLE = _GROUND_VEHICLE ; SEA_VEHICLE = _SEA_VEHICLE

if not game then game = { ['adjustTime'] = 0, ['debug'] = 0 } end

gluehelp = {}

function getCallStack(n)
  local str = ""
  for k,v in pairs(debug.getinfo(n))
  do
    local val = ''
    if type(v) ~= 'function' then val = " " .. v end
    if str ~= "" then str = str .. "; " end
    str = str .. k..": <"..type(v)..">"..val
  end
  return str
end

----------------------------------------------------------------------
-- Script-based logging
--   level: D=Debug, I=Info, N=Nominal, M=Minor, W=Warning, A=Alert

gluehelp['log'] = "(L, facil, msg) Reports 'msg' to the log file with level 'L' under facility 'facil'." ;
function log(level, facil, msg)
  -- Don't print debug messages unless it's enabled.
  if level == 'D' then
    if game.debug ~= true and game.debug ~= facil then
      return
    end
  end
  -- Obtain stack info on the caller.
  local info = debug.getinfo(2)
  local file, line, func
  if info.lastlinedefined > 0 then file = info.short_src else file = '<lua>' end
  line = info.currentline
  if info.name ~= nil then func = info.name else func = '<'..info.what..'>' end

  writeToLog(file, func, line, level, facil, msg)
end

----------------------------------------------------------------------
-- Turn a list of strings into a sep-separated string
--   sep: separator
--   l: list of strings to join
-- returns
--   s: joined up string
----------------------------------------------------------------------

function join(sep, l)
  local len = table.getn(l)
  if len == 0 then return "" end
  local s = l[1]
  for i = 2, len do s = s .. sep .. l[i] end
  return s
end

----------------------------------------------------------------------
-- Determine if a country is a useable country
----------------------------------------------------------------------

gluehelp['activeCountry'] = "(country) Returns true if the specified country is an active (playable) country"
function activeCountry (country)
  if country == WWII_ENGLAND then return true end
  if country == WWII_FRANCE then return true end
  if country == WWII_GERMANY then return true end
  if country == WWII_USA then return true end
  return false
end

----------------------------------------------------------------------
-- Parse a time struct containing time members
-- e.g. timeInSeconds( { days = 5, hour = 1, minutes = 30 })
-- units can be days, day, hours, hour, minutes, minute, seconds or
-- second. The singular versions (day/hour/minute/second) will
-- always expand to one single second regardless of what value
-- you supply with them, thus timeInSeconds({ minute = 5 }) will
-- return a value of 60.
----------------------------------------------------------------------

gluehelp['timeInSeconds'] = "({ [day[s] = value], [hour[s] = value], [minute[s] = value], [second[s] = value] }) Converts the combined specified units into seconds."
function timeInSeconds (time)
  if not time then return 0 end
  local seconds = 0
  function parseMember (plural, single, mult)
   if plural and plural > 0 then return plural * mult end
   if single and single == 1 then return mult end
   return 0
  end
  seconds = seconds + parseMember(time.days, time.day, 24*60*60)
  seconds = seconds + parseMember(time.hours, time.hour, 60*60)
  seconds = seconds + parseMember(time.minutes, time.minute, 60)
  seconds = seconds + parseMember(time.seconds, time.second, 1)
  return seconds
end

----------------------------------------------------------------------
-- Look up a side by it's name or value

gluehelp['getSide'] = "(side) Translates 'side' to a WWII_SIDE value"
function getSide(side)
  if tolua.type(side) == 'number' then
    return side
  elseif type(side) == 'string' then
    if side == 'ALLIED' or side == 'Allied' or side == 'allied' then return 1
    elseif side == 'AXIS' or side == 'Axis' or side == 'axis' then return 2
    elseif side == 'NO_SIDE' or side == 'no_side' or side == 'none' then return 0
    elseif side == 'NEUTRAL' or side == 'Neutral' or side == 'neutral' then return 3
    end
  end
  log('A', 'glue', "Invalid side: " .. side)
  return 0
end
   
----------------------------------------------------------------------
-- Look up a country
----------------------------------------------------------------------

gluehelp['getCountry'] = "(country) Translates 'country' (a number or 2-letter abbreviation) to a WWII_COUNTRY value"
function getCountry(country)
  if tolua.type(country) == 'number' then
    return country
  elseif type(country) == 'string' then
    if country == 'UK' or country == 'uk' or country == 'ENGLAND' or country == 'England' then
      return ENGLAND
    elseif country == 'FR' or country == 'fr' or country == 'FRANCE' or country == 'France' then
      return FRANCE
    elseif country == 'DE' or country == 'de' or country == 'GERMANY' or country == 'Germany' then
      return GERMANY
    elseif country == 'CN' or country == 'cn' or country == 'CHINA' or country == 'China' then
      return CHINA
	elseif country == 'US' or country == 'us' or country == 'USA' or country == 'usa' then
	  return USA
    else
      return error("Unrecognized country: " .. country)
    end
  else
   return error("Unrecognized country: " .. type(country))
  end
end

----------------------------------------------------------------------
-- Returns the Unix concept of 'current time', which is the number of
-- seconds since Jan 1st 1970. You can use this value to measure
-- durations or check for elapsed time.

gluehelp['currentTime'] = "() Returns the teulKit 'clockTime' value, which is the number of seconds since Jan 1st 1970"
function currentTime()
 if game.adjustTime then
  return teulClockTime + math.floor(game.adjustTime)
 else
  return teulClockTime
 end
end

----------------------------------------------------------------------
-- Get the name of a side

gluehelp['getSideName'] = "(side) Returns the displayable name for a given side"
function getSideName(forSide)
 local side = getSide(forSide)
 return _sideName[side]
end

----------------------------------------------------------------------
-- Get the posessive form of a side's name

gluehelp['getSideNameAdj'] = "(side) Returns the adjectival name for a given side"
function getSideNameAdj(forSide)
  local side = getSide(forSide)
  return _sideNameAdj[forSide]
end

----------------------------------------------------------------------
-- Get a weapon spec based on a weapon name or weap description

function getWeaponSpec(key)
 if tolua.type(key) == 'WEAPON_SPEC' then
  return key
 elseif type(key) == 'table' then
  local spec = weapCreateSpec("")
  spec.wCountry = key[1]
  spec.wCategory = key[2]
  spec.wClass = key[3]
  spec.wType = key[4]
  return spec
 elseif type(key) == 'string' then
  return weapFindWeaponByName(key)
 else
  error("Unknown weapon spec key type: "..type(key))
 end
end

----------------------------------------------------------------------
-- Tell me what side is opposite to this one

function otherSide(forSide)
 return wwiiOtherSide(forSide)
end

----------------------------------------------------------------------
-- Return the LSTR_ for a side.

function sideLstring(side)
 local sideNo = getSide(side)
 if not sideNo then error("Invalid side: " .. side) end
 if side == ALLIED then return LSTR_ALLIED end
 if side == AXIS then return LSTR_AXIS end
 return LSTR_SYSTEM
end

-- My shift-key is sticky ;-P
function sideLString(side) return sideLstring(side) end

----------------------------------------------------------------------
-- Send a message to all the players on a side

function sideMessage(instance, side, prefix, message, ...)
 local sideLstr
 if side == ALLIED or side == LSTR_ALLIED then sideLstr = LSTR_ALLIED
 elseif side == AXIS or side == LSTR_AXIS then sideLstr = LSTR_AXIS
 else
  return error("Called sideMessage with unknown side: " .. side)
 end

 if prefix == nil then
  return error("Called sideMessage with nil prefix")
 end

 if type(prefix) == "number" then
   chatSendSideMessage(instance, side, sideLstr, prefix, message)
 elseif message == nil then
   chatSendSideMessage(instance, side, sideLstr, LSTR_GENERIC, prefix)
 else
   chatSendSideMessage(instance, side, sideLstr, LSTR_LABELLED_GENERIC, prefix, message)
 end
end

----------------------------------------------------------------------
-- Send a message to all players, identified as "SYSTEM"

function systemMessage(instance, message)
 if message == nil then return error("Called systemMessage() with nil message???") end
 print("SYSTEM: "..message)
 chatSendBroadcastAll(instance, LSTR_SYSTEM, LSTR_GENERIC, message)
end

----------------------------------------------------------------------
-- Warn all players

function warnAll(instance, message)
 if message == nil then return error("Called warnAll() with nil message???") end
 print("WARNING:ALL:"..message)
 chatSendBroadcastAll(instance, LSTR_WARNING, LSTR_GENERIC, message)
end

----------------------------------------------------------------------
-- Set the game time to a given hour and minute in hh:mm format.

function setGameTime(timestr)
  local hour, minute = string.match(timestr, "^%s*(%d+)[:.](%d+)")
  if hour == nil or hour == "" or minute == nil or minute == "" then
    return error("Invalid time string passed to setGameTime: "..timestr)
  end
  hour = math.floor(hour)
  minute = math.floor(minute)
  if hour < 0 or hour > 23 then
    return error("Invalid hour in time string: "..timestr)
  end
  if minute < 0 or minute > 59 then
    return error("Invalid minute in time string: "..timestr)
  end

  local seconds = timeInSeconds({ ['hours'] = hour, ['minutes'] = minute })
  wthrSetGameTime(seconds)
  cnvyUpdateTime()

  print("Time set to "..hour..":"..minute)
  
end

----------------------------------------------------------------------
-- Report on game time and weather

local Weather = { ['skyPatterns']  = { 'Sunny', 'Overcast', 'Chance of rain' } }

function weatherReport()
  -- Query the weather system for the clock and convert to a HH:MM format.
  local gameTime = wthrConvertTimeToString(wthrGetGameTime())
  local skyPattern = wthrGetWeatherPattern()
  local rainPattern = wthrGetFogPattern()

  print("Game Time: " .. gameTime .. ". " ..
	"Sky: " .. Weather.skyPatterns[skyPattern] .. " ("..skyPattern.."/"..rainPattern.."). ")
end

----------------------------------------------------------------------
-- Generate next weather forecast

function advanceDay()
  strtStartNewDay()
  cnvyUpdateTime()
  local expect = wthrGetWeatherPattern()
  if expect == 0 then expect = "sunny" else expect = "overcast" end
end

function changeWeather()
  local current = wthrGetWeatherPattern()
  if current == 1 then -- sunny
    systemMessage("Changing weather to overcast/chance of rain")
    wthrSetWeatherPattern(3)
    wthrSetFogPattern(5)
  else
    systemMessage("Changing weather to sunny")
    wthrSetWeatherPattern(1)
  end
  cnvyUpdateTime()
end

----------------------------------------------------------------------
-- For testing: add some time to the time system.

function addSeconds(n)
  game.adjustTime = game.adjustTime + n
  print("Lua time now adjusted by " .. game.adjustTime .. " seconds")
end

function resetSeconds()
  game.adjustTime = 0
  print("Lua time now back to normal.")
end

----------------------------------------------------------------------
-- Returns a string value of something you input.

local stringTranslations = {
	['string']	= function (value) return value end
,	['number']	= function (value) return value end
,	['boolean']	= function (value) if value then return '<true>' else return '<false>' end end
}

stringUserdataTranslations = {
	['CPStruct'] = function (cp) return '<cp:'..cp.name..'>' end
,	['FacilityStruct'] = function (fac) return '<fac:'..fac.name..'>' end
,	['ObjectStruct'] = function (obj) return '<obj:'..obj.name..'>' end
,	['FULL_OBJ_ID'] = function (fid)
		return '<fid:'..fid.cell.ox..','..fid.cell.oy..'/'..fid.id..'>'
	end
}

function toString(value)
	if not value then return '<not set>' end
	local fn = stringTranslations[type(value)]
	if fn then return fn(value) end
	fn = stringUserdataTranslations[tolua.type(value)]
	if fn then return fn(value) end
	return value
end


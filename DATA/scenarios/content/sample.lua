
-- in lua, comments are double dashes: --
-- all commands can be named or anonymous
-- named commands are used as targets for events or other triggers from the lua layer
-- anonymous commands are executed right away when you start the scenario

-- positions are in world x,y,z coorindates in meters from 0,0,0
-- rotations like roll pitch and yaw are in degrees (0 to 360)
-- scales are from 0 to some real number, 1 means no scale, 2 means twice the size, .5 means half the size and so on

-- commands can be in any order its probably best to group them

if(true) then
	-- content we're going to add
	local content = 
	{
		-- INCLUDE A LUA FILE --
		
		-- could be for content or for functionality
		-- must be under DATA\lua or DATA\scenarios
		
		-- include commands don't have to be at the top, they can
		-- be anywhere in the list
		
		-- command path
		"include scenarios/terrain/riverrun/map.lua",
		
		-- ADD CLONE VEHICLE TO THE WORLD --
		
		-- named version
		-- command name typeid x y z roll pitch yaw
		"clone bedford1 bedford 273239.41 3016934.89 481 0 0 90",
		
		-- anonymous version
		-- command name typeid x y z roll pitch yaw
		"clone bedford 273239.41 3016934.89 481 0 0 90",
		
		-- ADD A BLOCKING VOLUME TO THE WORLD --
		
		-- the scale parameters are from 0 to some real number
		-- 1 means no scale, 2 means twice the size and .5 means
		-- half the size, etc...
		
		-- named version
		-- command name filename x y z roll pitch yaw scalex scaley scalez
		"block block1 blockvolume 273239.41 3016934.89 481 0 0 90 1 1 1",
		
		-- anonymous version
		-- command name filename x y z roll pitch yaw scalex scaley scalez
		"block blockvolume 273239.41 3016934.89 481 0 0 90 1 1 1",
		
		-- ADD A CHAT TO THE CHAT WINDOW
		
		-- these are always named
		-- the lockey is a lockey looked up from the scenario content in the web translation tool
		-- command name lockey
		"chat spawnin spawnin.moveout",
		
		-- ADD A HUD ALERT
		
		-- these are always named
		-- the lockey is a lockey looked up from the scenario content in the web translation tool
		-- command name lockey
		"alert spawnin spawnin.moveout",
		
		-- PLACE AN OBJECT IN THE TERRAIN --
		
		-- named version
		-- command name filename x y z roll pitch yaw scalex scaley scalez damage
		"place waterplane water1 0 0 2 0 0 0 0 0 0 0",
		
		-- anonymous version
		-- command filename x y z roll pitch yaw scalex scaley scalez damage
		"place water1 0 0 2 0 0 0 0 0 0 0",
		
		-- PLACE AN FX EMITTER --
		
		-- named version
		-- command name effectname x y z
		"emitter myeffects1 hulksmoke 273239.41 3016934.89 481",
		
		-- anonymous version
		-- command effectname x y z
		"emitter hulksmoke 273239.41 3016934.89 481",
		
		-- ADD A SOUND --

		-- sound volumes are always from 0 to 1 (1 == 100%, .5 = 50%)
		-- distance and attenuation are in meters from the player position
		-- loop of 0 means no loop, anything else means loop it
		
		-- Absolute Sounds
		
		-- named version
		-- command name filename volume loop
		"sound planes sounds/scenarios/ambient_aircraft_squadron1.wav .4 0",
		
		-- anonymous version
		-- command filename volume loop
		"sound sounds/scenarios/ambient_aircraft_squadron1.wav .4 0",

		-- Positional Sounds
		
		-- named version
		-- command name filename volume loop x y z mindistance attenuation
		"sound planes sounds/scenarios/ambient_aircraft_squadron1.wav .4 0 273239.41 3016934.89 481 10 30",
		
		-- anonymous version
		-- command filename volume loop x y z mindistance attenuation
		"sound sounds/scenarios/ambient_aircraft_squadron1.wav .4 1 273239.41 3016934.89 481 10 30",
		
		-- BOMBING RUN --
		
		-- named version	-- you probably always want these to be named and tied to events
		-- command name ammo x1 y1 z1 x2 y2 z2
		"bombingrun bombing1 gp250 -184.65 -279.50 22.84 46.61 -297.32 22.54",
		"bombingrun bombing1 gp250 210.96 -227.13 19.97 274.58 -85.40 19.97",
		
		-- BOMBING BARRAGE --
		
		-- named version	-- you probably always want these to be named and tied to events
		-- the x,y,z is the center of the barrage
		-- the distance is the radius of a circle around the center to randomly fire off the ammo in
		
		-- command name ammo x y z distance
		"barrage barrage1 gp40 210.96 -227.13 19.97 100",
		
		-- TIMED EVENTS -- 
		
		-- intervals are in miliseconds; 1000 = 1 second, 60000 = 60 seconds and so on
		-- events always need to be named
		
		-- event names tie them to other object types
		-- when an event fires, it finds all other object types 
		-- of the same name and executes them, if it finds
		-- more than one, it will randomly choose one
		
		-- normal usage
		-- command name chance eventinterval  
		"event planes .25 60000",
		
		-- extended usage; some event objects types use the extra data to run the event
		-- command name chance eventinterval runinterval numruns 
		"event barrage1 .3 10000 500 6",
		
		-- DEFINE AN AREA IN THE WORLD
		
		-- get with the script writer to find out what 
		-- handlers are available; OnBoundary is a
		-- handler that handles the case when a player
		-- leaves the playable area for example
		
		-- below the barrage1 area has na for the handler
		-- there is no lua handler called na and thats okay, 
		-- this area is simply used to define the area in
		-- which the barrage named barrage1 defined
		-- above will bomb
		
		-- named version
		-- command name scripthandler x y z
		"area spawnin OnTrigger 272792.27 3016974.34 481",
		"area spawnin OnTrigger 272792.27 3016974.34 481",
		"area spawnin OnTrigger 272792.27 3016974.34 481",
		"area spawnin OnTrigger 272792.27 3016974.34 481",
		"area spawnin OnTrigger 272792.27 3016974.34 481",
		"area spawnin OnTrigger 272792.27 3016974.34 481",
		
		-- anonymous version
		-- command scripthandler x y z
		"area OnBoundary 272792.27 3016974.34 481",
		"area OnBoundary 272879.85 3017243.51 481",
		"area OnBoundary 273290.72 3017060.01 481.01",
		"area OnBoundary 273241.15 3016784.37 482.88",
		"area OnBoundary 272810.72 3016884.47 481",
		"area OnBoundary 272765.70 3017002.75 481.00",
		
		-- ADD A SPAWN POINT FOR VEHICLES AND TROOPS
		
		-- yaw is the vehicle facing on spawn and is given in degrees
		-- spawn points are always named
		
		-- command name x y z yaw
		"spawn alliedtroops 183.78 -15.14 7.50 1",
		"spawn alliedtrucks 190.62 -22.67 7.11 1",
		
		-- MAKE A VEHICLE AVAILABLE FOR SPAWNING
		
		-- the vehicles block controls what vehicles can be spawned
		-- 	
		-- vehicle masks are defined like IP addresess...as dotted quads and
		-- are based on the following members in this order:
		-- 
		-- country.category.class.type
		-- 
		-- an asterisk (*) can be placed in any field and is the default for
		-- any defined mask
		-- 
		-- countries:
		-- 1 - england
		-- 3 - france
		-- 4 - germany
		-- 
		-- categories:
		-- 1 - aircraft
		-- 2 - ground vehicle
		-- 3 - sea vehicle
		-- 4 - infantry
		-- 
		-- classes:
		-- 1 - bombers
		-- 2 - fighters
		-- 4 - tank
		-- 5 - artillery
		-- 6 - truck
		-- 7 - gun
		-- 9 - troop
		-- 14 - para
		-- 12 - riverine
		-- 13 - sea
		--
		-- types:
		-- type ids can be found the in the DATA\th_blitz\weap files
		
		-- a 0 is considered a wildcard (any)
		
		-- command spawngroup country category class type
		"vehicle alliedtroops 1 0 9 0",

		-- alternatively you can use a vehicle's string id 
		-- command spawngroup id
		"vehicle alliedtrucks bedford",
	};

	for i,v in ipairs(content) do 
		scenario.manager:AddContent(v);
	end
end



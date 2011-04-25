

if(true) then
	-- content we're going to add
	local content = 
	{
		-- INCLUDE A LUA FILE --
		-- command path
		"include scenarios/terrain/luxembourg/map.lua",
				
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
		"area boundingbox OnBoundary 294148.65 2978115.09 274.00",
		"area boundingbox OnBoundary 292250.70 2978133.30 274.00",
		"area boundingbox OnBoundary 292220.53 2976287.02 274.00",
		"area boundingbox OnBoundary 294165.63 2976271.93 274.00",
				
		-- ADD A SPAWN POINT FOR VEHICLES AND TROOPS
		
		-- yaw is the vehicle facing on spawn and is given in degrees
		-- spawn points are always named
		
		-- command name x y z yaw

		-- Allied tank spawns --
		
		"spawn alliedtanks 293771.56 2978035.74 274.00 275",
		"spawn alliedtanks 293772.42 2978050.57 274.00 275",
		"spawn alliedtanks 293703.56 2978054.89 274.00 90",
		"spawn alliedtanks 293727.11 2978022.63 274.00 90",

		-- German tank spawns --

		"spawn axistanks 293640.49 2976346.94 274.00 90",
		"spawn axistanks 293639.40 2976334.24 274.00 90",
		"spawn axistanks 293820.24 2976329.96 274.00 275",
		"spawn axistanks 293821.55 2976345.00 274.00 275",


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

		-- Allied tank types --		

		"vehicle alliedtanks m4a2",
		"vehicle alliedtanks m10",

		-- German tank types --

		"vehicle axistanks pzivg",
		"vehicle axistanks stug3g",
		

		-- alternatively you can use a vehicle's string id 
		-- command spawngroup id
		"vehicle alliedtrucks bedford",
	};

	for i,v in ipairs(content) do 
		scenario.manager:AddContent(v);
	end
end



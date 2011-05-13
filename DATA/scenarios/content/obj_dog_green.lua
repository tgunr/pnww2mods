

if(true) then
	-- content we're going to add
	local content = 
	{
		-- we're using minefields, so include that functionality
		"include scenarios/content/minefields.lua",
		
		-- include lua file
		-- command,path
		"include scenarios/terrain/dog_green/map.lua",
		
		-- landmines
		"ammo axisminefield1 landmine",
		"ammo pathfield1 landmine",
		"ammo pathfield2 landmine",
		
-- DEFINE THE PLAY AREA
	-- boundary name x y z

		

-- DEFINE WHERE PLAYERS SPAWN		
		
	-- spawn points
	-- command spawngroup worldx worldy worldz yaw

		-- Allied Infantry Spawn Points

		-- "spawn alliedtroops 213.11 152.80 5.55 -1.35",


		-- Axis Infantry spawn Points

		--"spawn axistroops 210.55 -15.95 7.81 -2.20",


-- DEFINE BLOCKED AREAS OF NO ACCESS TO PLAYERS
	
	-- blockname x1 y1 z1 x2 y2 z2 thickness height



		
-- FX EMMITERS
		
	-- command,effectname,worldx,worldy,worldz
	-- smoke effects
		
		-- SMOKING BARRELS

		-- "emitter hulksmoke -25.16 -97.95 8.75",

				
		-- SMOKING CRATERS

		--"emitter cratersmoke 173.40 -38.89 8",

				
		-- SMOKESCREEN

		-- "emitter smokescreen 140.63 209.79 8.70",

				
		-- SMOKING VEHICLES
		
		-- "emitter hulksmoke 96.32 156.61 8.39",

		
		-- BURNING VEHICLES

		-- "emitter vehiclefire 152.80 64.43 3.21",



		-- FIRES

		-- "emitter smallfire 95.18 -27.96 8.85",

		
-- SOUNDS
		
	-- ABSOLUTE SOUNDS
	-- command name filename minvol, maxvol

		"sound planes sounds/scenarios/ambient_aircraft_squadron1.wav .2 0",
		"sound planes sounds/scenarios/ambient_aircraft_squadron2.wav .3 0",
		"sound bombs sounds/scenarios/ambient_bombs_distantshells1.wav .4 0",
		"sound bombs sounds/scenarios/ambient_bombs_distantshells2.wav .4 0",
		"sound explosions sounds/scenarios/ambient_explosions_fourinarow.wav .60 0",
		"sound explosions sounds/troop/grenade.wav .40 0",
		"sound guns1 sounds/scenarios/ambient_guns_machine_gun1.wav .20 0",
		"sound guns1 sounds/scenarios/ambient_guns_machine_gun2.wav .25 0",
		"sound guns1 sounds/scenarios/ambient_guns_machine_gun3.wav .30 0",
		"sound guns1 sounds/airraidsiren.wav .06 0",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun4.wav .25 0",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun5.wav .25 0",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun6.wav .15 0",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun7.wav .4 0",
		"sound wind sounds/ambience/gust1.wav .9 0",
		"sound wind sounds/ambience/gust2.wav .9 0",

	-- POSITIONAL SOUNDS
	-- command name filename volume loop x y z mindist maxdist

		-- "sound sounds/tank_burn.wav 1 1 151 62 3 5 30",

		-- "sound sounds/ambience/stream.wav 1.75 1 123 11 2 10 30",

		-- "sound sounds/bedford/idle.wav 0.5 1 198 148 8 15 40",


	-- A LINE OF BOMBS (as if dropped from a plane)
	-- command name ammo worldx1 worldy1 worldz1 worldx2 worldy2 worldz2

		"bombingrun bombing1 gp250 90.62 211.47 18.81 12.92 91.85 18.81",
		"bombingrun bombing1 gp250 35.65 250.44 21.31 -16.21 206.43 21.31",
		"bombingrun bombing1 gp500 142.60 -153.42 6.93 -4.35 -116.20 21.49",

		

	-- AREA EFFECT BOMBING OR BARRAGE (simulating artillery barrage)
	-- the x,y,z is the center of the barrage
	-- the distance is the radius of a circle around the center to randomly fire off the ammo in
	-- command name ammo x y z distance

		"barrage barrage1 gp40 -136.68 204.49 12.79 50",
		"barrage barrage1 gp40 48.05 317.05 18.90 25",


		
-- TRIGGERS
	
	-- EVENT TRIGGERS	
	-- command name pctgchance-each-second wait-in-seconds

		-- "event planes .40 120000",
		-- "event bombs .10 20000",
		-- "event explosions .10 25000",
		-- "event guns1 .15 10000",
		-- "event guns2 .20 30000",
		-- "event wind .5 5000",
		-- "event bombing1 .20 10000 500 6",
		-- "event bombing2 .10 20000 750 3",
		-- "event barrage1 .25 60000 700 10",

		

	-- AREA TRIGGERS
	-- command name triggertype worldx worldy worldz
	-- directions near axis spawn 1

		-- "area toaxisspawn OnTrigger 205.20 155.44 6.70",		
		
		
		
-- CLONES --

	-- NAMED VERSION
	-- command name typeid x y z roll pitch yaw

		-- "clone bedford1 bedford -20.11 -156.51 8.77 0 0 90",
		
				
	-- ANONYMOUS VERSION
	-- command typeid x y z roll pitch yaw

		
		-- "clone bedford -35.21 -147.32 8.85 6 2 285",


-- ALERTS AND CHATS
-- ADD AN INFORMATION MESSAGE TO THE CHAT WINDOW
		
	-- these are always named
	-- the lockey is a lockey looked up from the scenario content in the web translation tool
	-- command name lockey
	--"chat spawnin spawnin.moveout",
		
-- ADD A HUD ALERT
		
	-- these are always named
	-- the lockey is a lockey looked up from the scenario content in the web translation tool
	-- command name lockey

		-- "alert onspawn onspawn.moveout",


		
-- DEFINE AVAILABLE VEHICLES FOR THE SCENARIO
		
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
	-- * invidiual vehicles can be specified vehicle by its id
		
	-- command,spawngroup,country,category,class,type
	-- a 0 is considered a wildcard

		"vehicle alliedtroops 1 0 9 0",
		"vehicle axistroops 4 0 9 0",
	};

	for i,v in ipairs(content) do 
		scenario.manager:AddContent(v);
	end
end



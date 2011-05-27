

if(true) then
	-- content we're going to add
	local content = 
	{
		-- INCLUDE A LUA FILE --
		-- command path
		"include scenarios/terrain/zell-cochem/map.lua",

-- DEFINE THE PLAY AREA

	-- Playarea Boundary
	
	-- boundary name x y z

		"boundary playarea 344163.09 3004802.81 108",
		"boundary playarea 343982.09 3007292.61 108",
		"boundary playarea 346410.65 3007303.96 108",
		"boundary playarea 346418.34 3004801.49 108",

-- DEFINE WHERE PLAYERS SPAWN		
		
	-- yaw is the vehicle facing on spawn and is given in degrees
	-- spawn points are always named
		
	-- command spawngroup worldx worldy worldz yaw

		-- Allied tank spawns
		
		"spawn alliedtanks 345740.42 3007190.71 108.36 0",
		"spawn alliedtanks 345767.30 3007190.32 108.37 0",
		"spawn alliedtanks 345786.57 3007190.81 108.35 0",
		"spawn alliedtanks 345808.20 3007192.01 108.31 0",
		"spawn alliedtanks 345826.37 3007190.63 108.36 0",
		"spawn alliedtanks 345845.13 3007182.47 108.67 0",
		"spawn alliedtanks 345823.83 3007142.30 110.20 0",
		"spawn alliedtanks 345777.27 3007143.57 110.16 0",

		-- German tank spawns

		"spawn axistanks 345272.87 3004811.18 112.43 180",
		"spawn axistanks 345299.36 3004812.11 112.46 180",
		"spawn axistanks 345353.14 3004810.81 112.41 180",
		"spawn axistanks 345415.72 3004809.26 112.35 180",
		"spawn axistanks 345461.97 3004808.57 112.33 180",
		"spawn axistanks 345495.07 3004811.05 112.42 180",
		"spawn axistanks 345439.85 3004854.87 114.10 180",
		"spawn axistanks 345385.92 3004853.01 114.02 180",

-- DEFINE BLOCKED AREAS OF NO ACCESS BY PLAYERS

	-- blocking volume x
	-- block name x1 y1 z1 x2 y2 z2 thickness height

        	--"block 139.59 -86.67 8.69 104.30 -72.64 8.68 1 10",
			
		
-- FX EMITTERS
		
	-- command,effectname,worldx,worldy,worldz
	-- smoke effects
		
		-- SMOKING BARRELS

		--"emitter hulksmoke -25.16 -97.95 8.75",
		--"emitter hulksmoke -29.35 -105.79 8.75",
		--"emitter hulksmoke -82.57 -95.59 8.5",
				
		-- SMOKING CRATERS

		--"emitter cratersmoke 173.40 -38.89 8",
		--"emitter cratersmoke 129.71 -55.96 8",
		--"emitter cratersmoke -45.56 -78.53 8",
		--"emitter cratersmoke 26.02 -82.75 8",
		--"emitter cratersmoke -49.62 -130.94 8",
		--"emitter cratersmoke 109.09 27.70 4.5",
				
		-- SMOKESCREEN

		"emitter smokescreen 345804.79 3006408.35 108.99",
		"emitter smokescreen 345824.55 3006413.69 108.99",
		"emitter smokescreen 345767.13 3006447.68 108.99",
		"emitter smokescreen 345265.04 3005606.13 113.02",
		"emitter smokescreen 345294.49 3005621.75 112.95",
		"emitter smokescreen 345361.33 3005647.16 112.82",
		"emitter smokescreen 345439.39 3005638.33 112.85",
		"emitter smokescreen 345405.31 3005666.84 111.67",
						
		-- SMOKING VEHICLES
		
		--"emitter hulksmoke 293505.66 2977718.00 275.89",
		--"emitter hulksmoke 293839.62 2977869.99 276.05",
		--"emitter hulksmoke 293198.83 2976555.30 274.40",
		--"emitter hulksmoke 292914.19 2976638.96 274.49",
		
		-- BURNING VEHICLES

		"emitter vehiclefire 345498.39 3006190.72 110.11",
		"emitter vehiclefire 345725.97 3006311.75 109.19",


		-- FIRES

		--"emitter smallfire 95.18 -27.96 8.85",
		--"emitter smallfire 261.35 227.52 4.0",
		
		
-- SOUNDS
		
	-- ABSOLUTE SOUNDS
	-- command name filename minvol, maxvol

		"sound planes sounds/scenarios/ambient_aircraft_squadron1.wav .4 1",
		"sound planes sounds/scenarios/ambient_aircraft_squadron2.wav .4 1",
		"sound bombs sounds/scenarios/ambient_bombs_distantshells1.wav .4 1",
		"sound bombs sounds/scenarios/ambient_bombs_distantshells2.wav .4 1",
		"sound explosions sounds/scenarios/ambient_explosions_fourinarow.wav .60 1",
		--"sound explosions sounds/troop/grenade.wav .40 0",
		"sound guns1 sounds/scenarios/ambient_guns_machine_gun1.wav .20 1",
		"sound guns1 sounds/scenarios/ambient_guns_machine_gun2.wav .15 1",
		"sound guns1 sounds/scenarios/ambient_guns_machine_gun3.wav .25 1",
		--"sound siren1 sounds/airraidsiren.wav .2 1",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun4.wav .10 1",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun5.wav .30 1",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun6.wav .35 1",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun7.wav .4 1",
		--"sound wind sounds/ambience/gust1.wav .9 0",
		--"sound wind sounds/ambience/gust2.wav .9 0",

	-- POSITIONAL SOUNDS
	-- command name filename volume loop x y z mindist maxdist

		"sound sounds/tank_burn.wav 1 1 345498.39 3006190.72 110.11 5 30",
		"sound sounds/tank_burn.wav 1 1 345725.97 3006311.75 109.19 5 30",
				

	-- A LINE OF BOMBS (as if dropped from a plane)
	-- command name ammo worldx1 worldy1 worldz1 worldx2 worldy2 worldz2

		"bombingrun bombing1 gp500 345341.24 3006908.91 110.79 346181.83 3006916.23 111.08",
		"bombingrun bombing2 gp500 346104.64 3006889.33 113.52 345643.43 3006890.27 113.00",
		"bombingrun bombing1 gp500 345780.50 3005088.91 115.25 345021.67 3005085.88 114.49",
		"bombingrun bombing2 gp500 345118.53 3005109.86 117.00 345580.75 3005108.87 117.00",
				

	-- AREA EFFECT BOMBING OR BARRAGE (simulating artillery barrage)
	-- the x,y,z is the center of the barrage
	-- the distance is the radius of a circle around the center to randomly fire off the ammo in
	-- command name ammo x y z distance

		"barrage barrage1 gp40 345600.82 3006201.71 108.99 150",
		-- "barrage barrage1 gp40 293591.65 2977199.76 274.00 150",
		-- "barrage barrage1 gp40 -266.85 -36.03 5.26 50",

		
-- TRIGGERS
	
	-- EVENT TRIGGERS	
	-- command name pctgchance-each-second wait-in-milliseconds milliseconds-between-bomb-drops number-of-bombs

		"event planes .40 80000",
		"event bombs .45 80000",
		"event explosions .20 45000",
		"event guns1 .25 20000",
		"event guns2 .25 40000",
		--"event siren1 .33 50000",
		-- "event wind .5 5000",
		"event bombing1 .90 25000 600 24",
		"event bombing2 .90 25000 650 12",
		"event barrage1 .45 30000 550 18",

		

	-- AREA TRIGGERS
	-- command name triggertype worldx worldy worldz

		-- directions at axis spawn 1

		"area ataxisspawn OnTrigger 345260.32 3004804.76 112.00",		
		"area ataxisspawn OnTrigger 345504.78 3004805.95 112.00",
		"area ataxisspawn OnTrigger 345509.18 3004867.41 112.00",
		"area ataxisspawn OnTrigger 345262.57 3004863.17 112.00",
				

		-- directions at allied spawn 1

		"area atalliedspawn OnTrigger 345712.82 3007130.00 108.00",	
		"area atalliedspawn OnTrigger 345712.57 3007198.25 108.00",	
		"area atalliedspawn OnTrigger 345861.24 3007197.78 108.00",	
		"area atalliedspawn OnTrigger 345860.36 3007129.62 108.00",		

	-- minefield near axis spawn

		--"area axisminefield1 OnMineArea 146.43 21.67 8.48",
		--"area axisminefield1 OnMineArea 293.38 18.17 4.19",
		--"area axisminefield1 OnMineArea 297.08 32.59 4.69",
		--"area axisminefield1 OnMineArea 156.79 60.77 7.16",
		
	-- minefield east side of path

		--"area pathfield1 OnMineArea 100.42 0.63 5.37",
		--"area pathfield1 OnMineArea 95.03 24.23 5.85",
		--"area pathfield1 OnMineArea 98.29 30.91 5.85",
		--"area pathfield1 OnMineArea 110.15 31.92 5.69",
		--"area pathfield1 OnMineArea 128.99 36.36 5.87",
		--"area pathfield1 OnMineArea 123.00 27.80 2.72",
		--"area pathfield1 OnMineArea 121.50 16.70 5.37",
		
	-- minefield west side of path

		--"area pathfield2 OnMineArea 117.64 42.08 6.42",
		--"area pathfield2 OnMineArea 112.25 41.53 5.79",
		--"area pathfield2 OnMineArea 106.57 37.60 5.96",
		--"area pathfield2 OnMineArea 94.90 34.81 5.97",
		--"area pathfield2 OnMineArea 92.26 26.99 5.97",
		--"area pathfield2 OnMineArea 90.99 23.24 5.80",
		--"area pathfield2 OnMineArea 91.77 -4.09 3.30",
		--"area pathfield2 OnMineArea 65.86 -8.48 3.85",
		--"area pathfield2 OnMineArea 51.85 41.89 7.02",
		--"area pathfield2 OnMineArea 94.70 84.00 7.55",

		
	-- bridge capture objective

		--"area bridgecapture OnTrigger 128.28 19.45 7.13",
		--"area bridgecapture OnTrigger 133.82 35.82 7.13",
		--"area bridgecapture OnTrigger 130.04 37.17 7.13",
		--"area bridgecapture OnTrigger 123.71 19.42 7.13",

	-- center of map area between spawns

		--"area mapcenter OnTrigger 293109.64 2977080.80 274.00",
		--"area mapcenter OnTrigger 293110.12 2977312.77 274.00",
		--"area mapcenter OnTrigger 293281.78 2977306.03 274.00",
		--"area mapcenter OnTrigger 293279.28 2977087.93 274.00",
		
			
-- CLONES --

	-- NAMED VERSION
	-- command name typeid x y z roll pitch yaw

		-- "clone bedford1 bedford -20.11 -156.51 8.77 0 0 90",
		
				
	-- ANONYMOUS VERSION
	-- command name typeid x y z roll pitch yaw

		--"clone bedford 199.68 144.04 6.9 5 0 -90",
		--"clone bedford 200.34 148.35 6.9 5 0 -110",
		--"clone bedford 192.31 147.46 7.33 3 -1 -130",
		--"clone pzivd 95.72 156.42 8.3 3 -1 0",
		--"clone pzivd 79.79 108.67 5.58 3 -1 20",
		--"clone oplbltz 121.93 6.84 8.08 -3 0 205",
		--"clone oplbltz 176.32 -20.12 8.55 0 0 180",
		-- "clone bedford -19.75 -153.93 9.05 2 0 0",
		-- "clone bedford -27.34 -150.10 8.9 4 0 285",
		-- "clone bedford -35.21 -147.32 8.85 6 2 285",


-- ALERTS AND CHATS
-- ADD AN INFORMATION MESSAGE TO THE CHAT WINDOW
		
	-- these are always named
	-- the lockey is a lockey looked up from the scenario content in the web translation tool
	-- command name lockey
	--"chat spawnin spawnin.moveout",
		
-- ADD A HUD ALERT
		
	-- ADD A HUD ALERT
		
		-- these are always named
		-- look them up from the scenario content in the web translation tool
		-- command categorynamealert namealert numberofsecondsbetweenrepeatalerts
		-- numberofsecondsbetweenrepeatalerts 0= no limit, 1= onetime per scenario, unit measure is seconds 
		
		-- HUD WAYPOINTERS

		--"waypoint onspawn wp1 345402.03 3005111.85 117.00 enemy",
		--"waypoint onspawn wp2 345794.84 3006856.06 111.33 friendly",
		--"waypoint onspawn wp3 345621.56 3006249.94 108.70 friendly",

		"alert onspawn onspawn.moveout 60",
		--"alert roundstop roundstop",
		--"alert victory1 victory1",
		--"alert victory2 victory2",
		--"alert playarea playarea 10",
		--"alert churchentry churchentry 20000",
		--"alert toaxisspawn toaxisspawn -1",
		--"alert toalliedspawn toalliedspawn -1",

				
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
	-- "vehicle <spawn object filename>",

	};

	for i,v in ipairs(content) do 
		scenario.manager:AddContent(v);
	end
end



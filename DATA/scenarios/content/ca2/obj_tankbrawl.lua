

if(true) then
	-- content we're going to add
	local content = 
	{
		-- INCLUDE A LUA FILE --
		-- command path
		--"include scenarios/terrain/tankbrawl/map.lua",

-- DEFINE THE PLAY AREA

	-- Playarea Boundary
	
	-- boundary name x y z

		"boundary playarea 82856.63 3012328.70 4.55",
		"boundary playarea 82842.33 3011226.80 4.00",
		"boundary playarea 80808.66 3011166.72 0.09",
		"boundary playarea 80879.64 3012334.73 4.68",

-- DEFINE WHERE PLAYERS SPAWN		
		
	-- yaw is the vehicle facing on spawn and is given in degrees
	-- spawn points are always named
		
	-- command spawngroup worldx worldy worldz yaw

		-- Allied tank spawns
		
		"spawn alliedtanks 81631.12 3011360.78 5.13 47",
		"spawn alliedtanks 81626.32 3011366.03 5.13 47",
		"spawn alliedtanks 81621.31 3011371.49 5.13 47",
		

		-- German tank spawns

		"spawn axistanks 82230.30 3012064.76 5.40 180",
		"spawn axistanks 82237.91 3012064.11 5.12 180",
		"spawn axistanks 82245.59 3012063.48 5.13 180",
		

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

		"emitter smokescreen 81642.88 3011600.50 5.66",
		"emitter smokescreen 81585.15 3011629.40 8.20",
		"emitter smokescreen 81485.16 3011664.83 8.92",
		"emitter smokescreen 81750.97 3011593.18 8.54",
		"emitter smokescreen 81825.46 3011902.25 9.22",
		"emitter smokescreen 82081.36 3011937.33 12.50",
		"emitter smokescreen 82137.20 3011924.99 5.62",
		"emitter smokescreen 82035.98 3011888.41 5.36",
						
		-- SMOKING VEHICLES
		
		--"emitter hulksmoke 293505.66 2977718.00 275.89",
		--"emitter hulksmoke 293839.62 2977869.99 276.05",
		--"emitter hulksmoke 293198.83 2976555.30 274.40",
		--"emitter hulksmoke 292914.19 2976638.96 274.49",
		
		-- BURNING VEHICLES

		--"emitter vehiclefire 345498.39 3006190.72 110.11",
		--"emitter vehiclefire 345725.97 3006311.75 109.19",


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
		"sound guns1 sounds/scenarios/ambient_guns_machine_gun1.wav 1 1",
		"sound guns1 sounds/scenarios/ambient_guns_machine_gun2.wav 1 1",
		"sound guns1 sounds/scenarios/ambient_guns_machine_gun3.wav 1 1",
		--"sound siren1 sounds/airraidsiren.wav .2 1",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun4.wav 1 1",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun5.wav 1 1",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun6.wav 1 1",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun7.wav 1 1",
		--"sound wind sounds/ambience/gust1.wav .9 0",
		--"sound wind sounds/ambience/gust2.wav .9 0",

	-- POSITIONAL SOUNDS
	-- command name filename volume loop x y z mindist maxdist

		"sound sounds/tank_burn.wav 1 1 345498.39 3006190.72 110.11 5 30",
		"sound sounds/tank_burn.wav 1 1 345725.97 3006311.75 109.19 5 30",
				

	-- A LINE OF BOMBS (as if dropped from a plane)
	-- command name ammo worldx1 worldy1 worldz1 worldx2 worldy2 worldz2

		--"bombingrun bombing1 gp500 345341.24 3006908.91 110.79 346181.83 3006916.23 111.08",
		--"bombingrun bombing2 gp500 346104.64 3006889.33 113.52 345643.43 3006890.27 113.00",
		--"bombingrun bombing1 gp500 345780.50 3005088.91 115.25 345021.67 3005085.88 114.49",
		--"bombingrun bombing2 gp500 345118.53 3005109.86 117.00 345580.75 3005108.87 117.00",
				

	-- AREA EFFECT BOMBING OR BARRAGE (simulating artillery barrage)
	-- the x,y,z is the center of the barrage
	-- the distance is the radius of a circle around the center to randomly fire off the ammo in
	-- command name ammo x y z distance

		"barrage barrage1 smallbarragebomb 81231.19 3011960.61 3.08 150",
		"barrage barrage1 smallbarragebomb 82358.13 3011558.99 4.00 150",
		-- "barrage barrage1 smallbarragebomb -266.85 -36.03 5.26 50",

		
-- TRIGGERS
	
	-- EVENT TRIGGERS	
	-- command name pctgchance-each-second wait-in-milliseconds milliseconds-between-bomb-drops number-of-bombs

		"event planes .40 80000",
		--"event bombs .45 80000",
		--"event explosions .20 45000",
		"event guns1 .25 20000",
		"event guns2 .25 40000",
		"event siren1 .33 50000",
		"event wind .5 5000",
		--"event bombing1 .90 25000 600 24",
		--"event bombing2 .90 25000 650 12",
		"event barrage1 .45 30000 550 18",

		

	-- AREA TRIGGERS
	-- command name triggertype worldx worldy worldz

		-- directions at axis spawn 1

		--"area ataxisspawn OnTrigger 345260.32 3004804.76 112.00",		
		--"area ataxisspawn OnTrigger 345504.78 3004805.95 112.00",
		--"area ataxisspawn OnTrigger 345509.18 3004867.41 112.00",
		--"area ataxisspawn OnTrigger 345262.57 3004863.17 112.00",
				

		-- directions at allied spawn 1

		--"area atalliedspawn OnTrigger 345712.82 3007130.00 108.00",	
		--"area atalliedspawn OnTrigger 345712.57 3007198.25 108.00",	
		--"area atalliedspawn OnTrigger 345861.24 3007197.78 108.00",	
		--"area atalliedspawn OnTrigger 345860.36 3007129.62 108.00",	

	-- bridge capture objective
		"handler capper OnCapper",
		"handler objective1 OnCapturing",
		
"area bridgecapture OnState 81802.47 3011808.50 11.94 1",
"area bridgecapture OnState 81796.75 3011808.50 11.94",
"area bridgecapture OnState 81796.81 3011786.75 11.86",
"area bridgecapture OnState 81802.57 3011786.25 11.84",



	-- telling players they are in the bridge capture area
		-- telling the allies they are in the bridge capture area
		"area bridgecapture1 OnTrigger 81802.47 3011808.50 14",
		"area bridgecapture1 OnTrigger 81796.75 3011808.50 14",
		"area bridgecapture1 OnTrigger 81796.81 3011786.75 14",
		"area bridgecapture1 OnTrigger 81802.57 3011786.25 14",



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

			
	-- minefield near axis spawn

		--"area axisminefield1 OnMineArea 140.05 21.01 6",
		--"area axisminefield1 OnMineArea 283.44 -15.31 6",
		
		--"area axisminefield1 OnMineArea 294.98 21.29 6",
		--"area axisminefield1 OnMineArea 156.79 60.77 6",
		
	-- minefield east side of path

		-- "area pathfield1 OnMineArea 103.89 63.99 6",
		--"area pathfield1 OnMineArea 134 50 6",
		--"area pathfield1 OnMineArea 80.32 73.44 6",		
		--"area pathfield1 OnMineArea 67.66 66.27 6",	
		--"area pathfield1 OnMineArea 59.56 19.08 6",
		--"area pathfield1 OnMineArea 70.01 7.38 6",	
		--"area pathfield1 OnMineArea 69.91 -0.19 6",
		--"area pathfield1 OnMineArea 102.39 14.90 6",
		--"area pathfield1 OnMineArea 123 28 6",
		
	-- minefield west side of path

		-- "area pathfield2 OnMineArea 101.78 66.28 6",
		-- "area pathfield2 OnMineArea 83.85 73.54 6",
		-- "area pathfield2 OnMineArea 50.53 41.57 6",
		-- "area pathfield2 OnMineArea 70.93 -16.95 6",
		-- "area pathfield2 OnMineArea 91.91 -6.34 6",
		-- "area pathfield2 OnMineArea 91.15 6.56 6",
		-- "area pathfield2 OnMineArea 89.22 24.69 6",
		-- "area pathfield2 OnMineArea 85.92 50.46 6",
		-- "area pathfield2 OnMineArea 88.88 56.80 6",

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

		"waypoint.2.1.1 onspawn wp1 81624.87 3011364.45 8.56", 
		"waypoint.1.1.1 onspawn wp2 82237.67 3012068.52 8.99", 
		"waypoint.0.1.1 onspawn wp3 81799.70 3011794.20 17.52", 
		"waypoint.0.1.1 onspawn wp4 82534.27 3011726.17 24.45", 
		"waypoint.0.1.1 onspawn wp5 81074.97 3011869.38 31.82", 
		
		
		"alert onspawn onspawn.moveout -1",
		--"alert roundstop roundstop",
		"alert victory1 victory1",
		"alert victory2 victory2",
		--"alert playarea playarea 10",
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
		"vehicle axistanks de_buzzard",
		

	-- alternatively you can use a vehicle's string id 
	-- command spawngroup id
	-- "vehicle <spawn object filename>",

	};

	for i,v in ipairs(content) do 
		scenario.manager:AddContent(v);
	end
end



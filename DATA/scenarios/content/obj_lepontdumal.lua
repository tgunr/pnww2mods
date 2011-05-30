

if(true) then
	-- content we're going to add
	local content = 
	{
		-- we're using minefields, so include that functionality
		"include scenarios/content/minefields.lua",
		
		-- include lua file
		-- command,path
		"include scenarios/terrain/lepontdumal/map.lua",
		
		-- landmines
		"ammo axisminefield1 landmine",
		"ammo pathfield1 landmine",
		"ammo pathfield2 landmine",
		
-- DEFINE THE PLAY AREA
	-- boundary name x y z

		"boundary playarea 292.12 21.89 4.24",
		"boundary playarea 272.08 -1.04 4.86",
		"boundary playarea 233.77 -27.03 6.49",
		"boundary playarea 214.87 -51.04 6.16",
		"boundary playarea 194.60 -89.02 5.51",
		"boundary playarea 180.68 -104.04 7.40",
		"boundary playarea 65.32 -65.03 8.72",
		"boundary playarea 71.66 -18.64 7.97",
		"boundary playarea 44.76 -18.14 7.28",
		"boundary playarea 58.89 83.92 6.70",		
		"boundary playarea 253.17 235.51 8.20",
		"boundary playarea 278.89 205.99 2.88",
		"boundary playarea 267.66 196.51 2.71",
		"boundary playarea 255.16 188.76 3.37",
		"boundary playarea 230.83 161.14 3.86",
		"boundary playarea 226.47 143.70 3.36",
		"boundary playarea 219.33 110.95 3.04",
		"boundary playarea 208.76 97.85 2.87",
		"boundary playarea 192.89 90.25 3.19",
		"boundary playarea 173.55 78.37 2.70",
		"boundary playarea 160.32 74.79 2.86",
		"boundary playarea 167.62 59.02 3.68",
		
		

-- DEFINE WHERE PLAYERS SPAWN		
		
	-- spawn points
	-- command spawngroup worldx worldy worldz yaw

		-- Allied Infantry Spawn Points

		"spawn alliedtroops 212.02 172.11 6.18 215",
		"spawn alliedtroops 183.81 165.44 7.02 180",

		-- Axis Infantry spawn Points

		"spawn axistroops 141.06 -86.28 8.05 20",
		"spawn axistroops 113.37 -48.65 8.21 90",

-- DEFINE BLOCKED AREAS OF NO ACCESS TO PLAYERS
	
	-- blockname x1 y1 z1 x2 y2 z2 thickness height

        "block 138.89 -87.04 9 137.01 -86.26 9 1 5",
		"block 112.42 -69.95 9 118.12 -49.43 9 1 10",
		"block 173.70 -85.41 9 161.20 -85.06 9 1 10",
		"block 113.12 -36.77 9 71.74 -19.79 9 1 10",
		"block 108.88 -46.99 9 110.19 -44.63 9 1 10",
		"block 183.17 -87.54 9 194.53 -91.73 9 1 20",
		
		
		
		
		"block 113.77 1.50 8.50 119.53 10.13 8.37 .5 5",
		"block 126.87 11.04 7.70 131.18 20.28 7.53 .5 5",
		
		-- bridge sides
		"block 121.04 13.55 8.5 136.69 57.11 8.5 .5 3",
		"block 130.57 23.25 8.5 142.41 55.07 8.5 .5 3",
		
		
		
		
		
		

		

		
-- FX EMMITERS
		
	-- command,effectname,worldx,worldy,worldz
	-- smoke effects
		
		-- SMOKING BARRELS

		"emitter hulksmoke -25.16 -97.95 8.75",
		"emitter hulksmoke -29.35 -105.79 8.75",
		"emitter hulksmoke -82.57 -95.59 8.5",
				
		-- SMOKING CRATERS

		"emitter cratersmoke 173.40 -38.89 8",
		"emitter cratersmoke 129.71 -55.96 8",
		"emitter cratersmoke -45.56 -78.53 8",
		"emitter cratersmoke 26.02 -82.75 8",
		"emitter cratersmoke -49.62 -130.94 8",
		--"emitter cratersmoke 109.09 27.70 4.5",
				
		-- SMOKESCREEN

		"emitter smokescreen 140.63 209.79 8.70",
		"emitter smokescreen 55.05 174.74 7.84",
		"emitter smokescreen 15.26 118.73 6.35",
		"emitter smokescreen 278.33 248.17 2.96",
				
		-- SMOKING VEHICLES
		
		"emitter hulksmoke 63.47 42.70 6.56",
		"emitter hulksmoke 136.61 47.66 8.20",
		
		
		
		
		
		-- BURNING VEHICLES

		"emitter vehiclefire 159.46 70.28 2.93",
		-- "emitter vehiclefire 105.14 -36.56 9.01",

		-- FIRES

		"emitter smallfire 95.18 -27.96 8.85",
		"emitter smallfire 261.35 227.52 4.0",
		
-- SOUNDS
		
	-- ABSOLUTE SOUNDS
	-- command name filename minvol, maxvol

		"sound planes sounds/scenarios/ambient_aircraft_squadron1.wav .1 0",
		"sound planes sounds/scenarios/ambient_aircraft_squadron2.wav .2 0",
		"sound bombs sounds/scenarios/ambient_bombs_distantshells1.wav .4 0",
		"sound bombs sounds/scenarios/ambient_bombs_distantshells2.wav .4 0",
		"sound explosions sounds/scenarios/ambient_explosions_fourinarow.wav .4 0",
		"sound explosions sounds/troop/grenade.wav .40 0",
		"sound guns1 sounds/scenarios/ambient_guns_machine_gun1.wav .10 0",
		"sound guns1 sounds/scenarios/ambient_guns_machine_gun2.wav .10 0",
		"sound guns1 sounds/scenarios/ambient_guns_machine_gun3.wav .10 0",
		"sound guns1 sounds/airraidsiren.wav .06 0",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun4.wav .10 0",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun5.wav .10 0",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun6.wav .10 0",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun7.wav .1 0",
		"sound wind sounds/ambience/gust1.wav .3 0",
		"sound wind sounds/ambience/gust2.wav .3 0",

	-- POSITIONAL SOUNDS
	-- command name filename volume loop x y z mindist maxdist

		"sound sounds/tank_burn.wav 1 1 159 70 3 5 30",
		-- "sound sounds/tank_burn.wav 1 1 108 -30 9 5 30",
		"sound sounds/tank_burn.wav .5 1 95 -26 8 5 20",
		"sound sounds/tank_burn.wav 1 1 261 227 4 5 30",
		"sound sounds/ambience/stream.wav 1.75 1 123 11 2 10 30",
		"sound sounds/ambience/stream.wav 1.75 1 90 0 3 10 30",
		"sound sounds/ambience/stream.wav 1.75 1 167 76 3 10 30",
		"sound sounds/ambience/stream.wav 1.75 1 220 -46 7 10 30",
		"sound sounds/bedford/idle.wav 0.3 1 198 148 8 15 40",
		-- "sound sounds/tank_burn.wav 1 1 29 -57 9 5 30",

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
		"event explosions .10 25000",
		-- "event guns1 .15 10000",
		-- "event guns2 .20 30000",
		-- "event wind .5 5000",
		"event bombing1 .20 10000 30000 6",
		"event bombing2 .10 20000 30000 3",
		"event barrage1 .25 60000 60000 10",

		

	-- AREA TRIGGERS
	-- command name triggertype worldx worldy worldz
	-- directions near allied spawn 1

		"area toaxisspawn OnTrigger 205.20 155.44 6.70",		
		"area toaxisspawn OnTrigger 196.16 145.35 7.05",
		"area toaxisspawn OnTrigger 213.49 122.02 6.87",
		"area toaxisspawn OnTrigger 210.93 117.77 6.87",
		"area toaxisspawn OnTrigger 161.99 147.53 7.52",
		"area toaxisspawn OnTrigger 190.28 170.11 8.02",		

	-- directions for axis to bridge

		"area toalliedspawn OnTrigger 160.66 -87.12 9.0",	
		"area toalliedspawn OnTrigger 162.66 -83.58 9.0",	
		"area toalliedspawn OnTrigger 139.34 -73.02 9.0",	
		"area toalliedspawn OnTrigger 136.65 -80.40 9.0",

	-- telling allies to turn around and go the other way
		"area allieswrongway OnTrigger 272.23 192.78 4.61",
		"area allieswrongway OnTrigger 235.79 221.19 6.78",
		"area allieswrongway OnTrigger 243.40 228.29 6.78",
		"area allieswrongway OnTrigger 273.78 201.61 6.78",
		
	-- telling the allies they are in the bridge capture area
		"area bridgecapture1 OnTrigger 136.36 40.60 8",
		"area bridgecapture1 OnTrigger 133.56 33.05 8",
		"area bridgecapture1 OnTrigger 129.00 35.14 8",
		"area bridgecapture1 OnTrigger 131.56 42.40 8",		


	
	-- minefield near axis spawn

		"area axisminefield1 OnMineArea 140.05 21.01 6",
		"area axisminefield1 OnMineArea 283.44 -15.31 6",
		
		
		
		
		"area axisminefield1 OnMineArea 294.98 21.29 6",
		"area axisminefield1 OnMineArea 156.79 60.77 6",
		
		
		
	-- minefield east side of path

		-- "area pathfield1 OnMineArea 103.89 63.99 6",
		"area pathfield1 OnMineArea 134 50 6",
		"area pathfield1 OnMineArea 80.32 73.44 6",		
		"area pathfield1 OnMineArea 67.66 66.27 6",	
		"area pathfield1 OnMineArea 59.56 19.08 6",
		"area pathfield1 OnMineArea 70.01 7.38 6",	
		"area pathfield1 OnMineArea 69.91 -0.19 6",
		"area pathfield1 OnMineArea 102.39 14.90 6",
		"area pathfield1 OnMineArea 123 28 6",
		
		
		

		
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

		
		
		
	-- bridge capture objective

		"area bridgecapture OnCapture 136.36 40.60 8",
		"area bridgecapture OnCapture 133.56 33.05 8",
		"area bridgecapture OnCapture 129.00 35.14 8",
		"area bridgecapture OnCapture 131.56 42.40 8",
		
	
		
			
-- CLONES --

	-- NAMED VERSION
	-- command name typeid x y z roll pitch yaw

		-- "clone bedford1 bedford -20.11 -156.51 8.77 0 0 90",
		
				
	-- ANONYMOUS VERSION
	-- command typeid x y z roll pitch yaw

		"clone bedford 195.46 151.93 7.5 5 0 -120",
		"clone bedford 198.09 158.75 7.55 5 0 -145",
		"clone bedford 200.15 150.18 7.15 3 -1 -130",



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
		
--  #### DOC LOOK AT THIS!! ####
		
		-- command categorynamealert namealert numberofsecondsbetweenrepeatalerts
		-- numberofsecondsbetweenrepeatalerts 0= no limit, 1= onetime per scenario, unit measure is seconds 
		-- "chat spawnin spawnin.moveout 0",
		"alert onspawn onspawn.moveout",
		"alert toaxisspawn toaxisspawn 60",
		"alert toalliedspawn toalliedspawn 60",
		"alert bridgecapture1 bridgecapture 5",
		"alert allieswrongway allieswrongway 30" ,
		"alert playarea playarea 10",
		
		"waypoint onspawn minefield 91.04 38.93 5.97 #FF6600",
		"waypoint onspawn minefield 195.11 24.16 7.35 #FF6600",
		"waypoint.1 onspawn bridgewp 132.57 37.60 7.38 enemy",
		"waypoint.2 onspawn bridgewp 132.57 37.60 7.38 friendly",
		
--  #### END DOC LOOK AT THIS ####

		
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
		-- 2 - usa
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

	-- spawn masks
		-- allied spawn list
		"vehicle alliedtroops us-assault",
		"vehicle alliedtroops us-smg",
		"vehicle alliedtroops us-bar",
		-- axis spawn list
		"vehicle axistroops de-assault",
		"vehicle axistroops de-smg",
		"vehicle axistroops de-lmg",
	
	
		-- "vehicle alliedtroops us-assault",
		-- "vehicle alliedtroops us-smg",
		-- "vehicle alliedtroops us-bar",
		-- "vehicle alliedtroops us-sniper ",
		-- "vehicle axistroops de-sniper",
		
--  #### DOC LOOK AT THIS!! ####
		
	-- alert masks
	-- define a mask to block who gets a named alert
	-- masktype maskname country category class
	-- or
	-- definethemask definethemessage vehicleid
	-- note, by defining which team does get the alert, the other team will not get the alert
				
		"vehicle bridgecapture1 2 0 0 0",
		"vehicle toaxisspawn 2 0 0 0",
		"vehicle toalliedspawn 4 0 0 0",
		"vehicle allieswrongway 2 0 0 0",
		
	-- objective masks
	-- the bridgecapture objective applies only to country 2
		"vehicle bridgecapture 2 0 0 0",		
		
--  #### END DOC LOOK AT THIS ####
	
	};

	for i,v in ipairs(content) do 
		scenario.manager:AddContent(v);
	end
end



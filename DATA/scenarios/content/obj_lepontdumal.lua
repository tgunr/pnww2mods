

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

		"boundary playarea 293.95 48.96 4.02",
		"boundary playarea 291.80 20.31 3.54",
		"boundary playarea 272.08 -1.04 4.86",
		"boundary playarea 233.77 -27.03 6.49",
		"boundary playarea 214.87 -51.04 6.16",
		"boundary playarea 194.60 -89.02 5.51",
		"boundary playarea 180.68 -104.04 7.40",
		"boundary playarea 65.32 -65.03 8.72",
		"boundary playarea 71.66 -18.64 7.97",
		"boundary playarea 50.53 41.71 6.76",
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
		"boundary playarea 154.56 71.03 3.68",
		"boundary playarea 148.51 60.52 3.68",
		"boundary playarea 227.37 48.91 7.64",

-- DEFINE WHERE PLAYERS SPAWN		
		
	-- spawn points
	-- command spawngroup worldx worldy worldz yaw

		-- Allied Infantry Spawn Points

		"spawn alliedtroops 213.11 152.80 5.55 -1.35",
		"spawn alliedtroops 203.77 146.97 6.37 -1.8",

		-- Axis Infantry spawn Points

		"spawn axistroops 210.55 -15.95 7.81 -2.20",
		"spawn axistroops 216.89 -17.83 7.80 -2.29",

-- DEFINE BLOCKED AREAS OF NO ACCESS TO PLAYERS
	
	-- blockname x1 y1 z1 x2 y2 z2 thickness height

        "block 139.59 -86.67 8.69 104.30 -72.64 8.68 1 10",
		"block 112.42 -69.95 9.00 119.31 -46.78 8.68 1 10",
		"block 123.98 -34.23 8.53 127.56 -26.02 8.70 1 10",
		"block 193.16 -93.40 7.36 160.99 -84.63 7.88 1 10",
		"block 113.12 -36.77 8.49 71.74 -19.79 7.67 1 10",

		
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
		"emitter cratersmoke 109.09 27.70 4.5",
				
		-- SMOKESCREEN

		"emitter smokescreen 140.63 209.79 8.70",
		"emitter smokescreen 55.05 174.74 7.84",
		"emitter smokescreen 15.26 118.73 6.35",
		"emitter smokescreen 278.33 248.17 2.96",
				
		-- SMOKING VEHICLES
		
		"emitter hulksmoke 96.32 156.61 8.39",
		"emitter hulksmoke 80.36 109.08 6.5",
		
		-- BURNING VEHICLES

		"emitter vehiclefire 152.80 64.43 3.21",
		"emitter vehiclefire 105.14 -36.56 9.01",

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

		"sound sounds/tank_burn.wav 1 1 151 62 3 5 30",
		"sound sounds/tank_burn.wav 1 1 108 -30 9 5 30",
		"sound sounds/tank_burn.wav 1 1 95 -26 8 5 30",
		"sound sounds/tank_burn.wav 1 1 261 227 4 5 30",
		"sound sounds/ambience/stream.wav 1.75 1 123 11 2 10 30",
		"sound sounds/ambience/stream.wav 1.75 1 90 0 3 10 30",
		"sound sounds/ambience/stream.wav 1.75 1 167 76 3 10 30",
		"sound sounds/ambience/stream.wav 1.75 1 220 -46 7 10 30",
		"sound sounds/bedford/idle.wav 0.5 1 198 148 8 15 40",
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

		"event planes .40 120000",
		"event bombs .10 20000",
		"event explosions .10 25000",
		-- "event guns1 .15 10000",
		-- "event guns2 .20 30000",
		"event wind .5 5000",
		"event bombing1 .20 10000 30000 6",
		"event bombing2 .10 20000 30000 3",
		"event barrage1 .25 60000 60000 10",

		

	-- AREA TRIGGERS
	-- command name triggertype worldx worldy worldz
	-- directions near axis spawn 1

		"area toaxisspawn OnTrigger 205.20 155.44 6.70",		
		"area toaxisspawn OnTrigger 196.16 145.35 7.05",
		"area toaxisspawn OnTrigger 213.49 122.02 6.87",
		"area toaxisspawn OnTrigger 210.93 117.77 6.87",
		"area toaxisspawn OnTrigger 161.99 147.53 7.52",
		"area toaxisspawn OnTrigger 190.28 170.11 8.02",		

	-- directions near allied spawn 1

		"area toalliedspawn OnTrigger 206.57 -6.40 8.17",	
		"area toalliedspawn OnTrigger 199.36 -22.17 8.17",	
		"area toalliedspawn OnTrigger 178.45 -19.22 8.17",	
		"area toalliedspawn OnTrigger 176.68 1.85 8.17",

	-- telling allies to turn around and go the other way
		"area allieswrongway OnTrigger 272.23 192.78 4.61",
		"area allieswrongway OnTrigger 235.79 221.19 6.78",
		"area allieswrongway OnTrigger 243.40 228.29 6.78",
		"area allieswrongway OnTrigger 273.78 201.61 6.78",
		
	-- telling the allies they are in the bridge capture area
		"area bridgecapture1 OnTrigger 134.13 35.69 7.82",
		"area bridgecapture1 OnTrigger 128.57 19.24 7.75",	
		"area bridgecapture1 OnTrigger 123.54 19.40 7.83",	
		"area bridgecapture1 OnTrigger 129.65 37.45 7.84",			



	
	-- minefield near axis spawn

		"area axisminefield1 OnMineArea 146.43 21.67 8.48",
		"area axisminefield1 OnMineArea 293.38 18.17 4.19",
		"area axisminefield1 OnMineArea 297.08 32.59 4.69",
		"area axisminefield1 OnMineArea 156.79 60.77 7.16",
		
	-- minefield east side of path

		"area pathfield1 OnMineArea 100.42 0.63 5.37",
		"area pathfield1 OnMineArea 95.03 24.23 5.85",
		"area pathfield1 OnMineArea 98.29 30.91 5.85",
		"area pathfield1 OnMineArea 110.15 31.92 5.69",
		"area pathfield1 OnMineArea 128.99 36.36 5.87",
		"area pathfield1 OnMineArea 123.00 27.80 2.72",
		"area pathfield1 OnMineArea 121.50 16.70 5.37",
		
	-- minefield west side of path

		"area pathfield2 OnMineArea 117.64 42.08 6.42",
		"area pathfield2 OnMineArea 112.25 41.53 5.79",
		"area pathfield2 OnMineArea 106.57 37.60 5.96",
		"area pathfield2 OnMineArea 94.90 34.81 5.97",
		"area pathfield2 OnMineArea 92.26 26.99 5.97",
		"area pathfield2 OnMineArea 90.99 23.24 5.80",
		"area pathfield2 OnMineArea 91.77 -4.09 3.30",
		"area pathfield2 OnMineArea 65.86 -8.48 3.85",
		"area pathfield2 OnMineArea 51.85 41.89 7.02",
		"area pathfield2 OnMineArea 94.70 84.00 7.55",

		
	-- bridge capture objective

		"area bridgecapture OnCapture 134.15 35.70 7.80",
		"area bridgecapture OnCapture 128.55 19.25 7.78",
		"area bridgecapture OnCapture 123.57 19.45 7.80",
		"area bridgecapture OnCapture 129.63 37.40 7.82",
		
	
		
			
-- CLONES --

	-- NAMED VERSION
	-- command name typeid x y z roll pitch yaw

		-- "clone bedford1 bedford -20.11 -156.51 8.77 0 0 90",
		
				
	-- ANONYMOUS VERSION
	-- command typeid x y z roll pitch yaw

		"clone bedford 199.68 144.04 6.9 5 0 -90",
		"clone bedford 200.34 148.35 6.9 5 0 -110",
		"clone bedford 192.31 147.46 7.33 3 -1 -130",
		"clone pzivd 95.72 156.42 8.3 3 -1 0",
		"clone pzivd 79.79 108.67 5.58 3 -1 20",
		"clone oplbltz 121.93 6.84 8.08 -3 0 205",
		"clone oplbltz 176.32 -20.12 8.55 0 0 180",



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

		"alert onspawn onspawn 1",
		"alert toaxisspawn toaxisspawn",
		"alert toalliedspawn toalliedspawn",
		"alert bridgecapture1 bridgecapture 5",
		"alert allieswrongway allieswrongway",

		
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
		-- "vehicle alliedtroops us-assault",
		-- "vehicle alliedtroops us-smg",
		-- "vehicle alliedtroops us-bar",
		-- "vehicle alliedtroops us-sniper ",
		"vehicle alliedtroops 1 0 9 0",
		"vehicle axistroops derifle",
		"vehicle axistroops de-smg",
		"vehicle axistroops de-lmg",
		-- "vehicle axistroops de-sniper",
		
	-- alert masks	DOC THIS IS NEW
	-- define a mask to block who gets a named alert
	-- definethemask definethemessage country category class
	-- or
	-- definethemask definethemessage vehicleid
	-- note, by defining which team does get the alert, the other team will not get the alert
			
		"vehicle bridgecapture 1 0 0 0",
		"vehicle bridgecapture1 1 0 0 0",
		-- above Ive defined all American troops get the bridgecapture alert,
		-- by not defining which axis troops get the alert, axis wont get it
		"vehicle toaxisspawn 1 0 0 0",
		"vehicle toalliedspawn 4 0 0 0",
		"vehicle allieswrongway 1 0 0 0",

	
	};

	for i,v in ipairs(content) do 
		scenario.manager:AddContent(v);
	end
end



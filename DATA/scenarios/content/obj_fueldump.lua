

if(true) then
	-- content we're going to add
	local content = 
	{
		-- we're using minefields, so include that functionality
		"include scenarios/content/minefields.lua",
		
		-- include lua file
		-- command,path
		"include scenarios/terrain/fueldump/map.lua",
		
		-- landmines
		"ammo axisminefield1 landmine",
		"ammo pathfield1 landmine",
		"ammo pathfield2 landmine",
		
-- DEFINE THE PLAY AREA
	-- boundary name x y z

		"boundary playarea 357.03 -354.74 22",
		"boundary playarea 366.63 378.53 22",
		"boundary playarea -384.35 379.40 22",
		"boundary playarea -391.56 -392.58 22",

	

		
		

-- DEFINE WHERE PLAYERS SPAWN		
		
	-- spawn points
	-- command spawngroup worldx worldy worldz yaw

		-- Allied Spawn Points
		"spawn alliedtroops 128.13 72.84 6.54 100",
		"spawn alliedvehicles -362.76 358.49 22.56 90",

		-- Axis Spawn Points
		"spawn axistroops -16.74 -253.28 17.17 340",
		"spawn axisvehicles -218.12 -349.13 21.29 45",


-- DEFINE BLOCKED AREAS OF NO ACCESS TO PLAYERS
	
	-- blockname x1 y1 z1 x2 y2 z2 thickness height

       -- "block -4.51 -92.38 10 8.53 -97.99 10 1 5",
		--"block -19.93 -117.99 10 -11.52 -91.04 10 1 5",
		--"block 16.44 -106.11 10 12.56 -104.76 10 1 5",
		--"block 20.68 -122.95 10 26.05 -124.58 10 1 5",
		--"block 34.72 -128.19 10 47.56 -133.97 10 1 5",
		--"block 50.65 -124.81 10 53.82 -116.67 10 1 5",
		--"block 51.69 -104.22 10 54.79 -104.57 10 1 5",
		--"block 64.90 -91.77 10 69.73 -86.40 10 1 5",
		--"block 73.12 -77.61 10 77.80 -69.36 10 1 5",
		

		
		
		
		
		--"block 113.75 -36.33 8.36 64.86 -17.38 7.99 1 10",
       -- "block 110.22 -43.30 9.13 108.01 -49.00 9.13 1 5",
       -- "block 118.74 -46.93 9.29 118.07 -49.31 9.29 1 5",
		--"block 113.11 -64.25 9.14 111.41 -69.99 9.14 1 5",
		--"block 86.81 -35.48 8.65 87.71 -33.34 8.65 1 5",
		--"block 87.93 -39.84 9.03 86.42 -44.80 9.03 1 5",
		--"block 79.63 -56.51 8.88 78.30 -59.16 8.88 1 5",
		-- problem
		--"block 160.19 -84.15 9.05 192.00 -91.65 8.39 1 20",
		--"block 72.00 -149.67 9.21 63.92 -146.79 9.21 1 5",
		--"block 55.07 -148.98 9.40 56.09 -143.18 9.40 1 5",
		--"block 40.01 -149.97 8.88 36.44 -148.25 8.88 1 5",
		--"block 27.60 -149.99 10.20 25.01 -143.62 10.20 1 5",
		--"block 14.39 -137.70 8.91 10.16 -135.92 8.91 1 5",
	--	"block 10.79 -129.29 9.39 8.11 -128.38 9.39 1 5",
		--"block -4.19 -133.01 9.36 -5.21 -135.98 9.36 1 5",
		--"block -16.24 -111.82 8.78 -13.58 -104.72 8.78 1 10",
		--"block -25.06 -130.99 8.56 -26.12 -134.46 8.56 1 5",
		--"block -42.03 -109.82 9.05 -64.68 -101.46 9.05 1 5",
		--"block -70.64 -100.33 9.24 -87.29 -95.49 9.24 1 5",
		--"block -51.12 -116.98 9.22 -46.69 -118.53 9.05 1 5",
		--"block 59.69 -86.42 28.86 62.89 -93.85 28.86 1 5",
		--"block 128.77 -20.17 8.10 127.36 -24.06 8.10 1 5",
		--"block 128.62 -25.49 8.49 125.71 -28.49 8.49 1 5",
		--"block -19.75 -117.60 8.05 -17.22 -111.44 8.05 1 10",
		--"block -10.47 -142.64 7.52 -18.59 -161.42 7.00 2.0 25",
	
		
		-- north bridge sides
		"block 119.60 10.12 8.5 136.69 57.11 8.5 .5 3",
		"block 129.52 20.93 8.5 142.41 55.07 8.5 .5 3",
		
		
		
		
		
		

		

		
-- FX EMMITERS
		
	-- command,effectname,worldx,worldy,worldz
	-- smoke effects
		
		-- SMOKING BARRELS

		--"emitter hulksmoke -25.16 -97.95 8.75",

				
		-- SMOKING CRATERS

		--"emitter cratersmoke 173.40 -38.89 8",

				
		-- SMOKESCREEN

		--"emitter smokescreen 140.63 209.79 8.70",

				
		-- SMOKING VEHICLES
		

		--"emitter hulksmoke 145.61 71.81 7.30",
		
		
		
		
		
		
		
		-- BURNING VEHICLES


		-- "emitter vehiclefire 105.14 -36.56 9.01",

		-- FIRES

		"emitter smallfire 95.18 -27.96 8.85",

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


		-- "sound sounds/tank_burn.wav 1 1 29 -57 9 5 30",

	-- A LINE OF BOMBS (as if dropped from a plane)
	-- command name ammo worldx1 worldy1 worldz1 worldx2 worldy2 worldz2

		--"bombingrun bombing1 gp250 90.62 211.47 18.81 12.92 91.85 18.81",


	-- AREA EFFECT BOMBING OR BARRAGE (simulating artillery barrage)
	-- the x,y,z is the center of the barrage
	-- the distance is the radius of a circle around the center to randomly fire off the ammo in
	-- command name ammo x y z distance

		--"barrage barrage1 gp40 -136.68 204.49 12.79 50",


		
-- TRIGGERS
	
	-- EVENT TRIGGERS	
	-- command name pctgchance-each-second wait-in-seconds

		-- "event planes .40 120000",
		-- "event bombs .10 20000",
		--"event explosions .10 25000",
		-- "event guns1 .15 10000",
		-- "event guns2 .20 30000",
		--"event wind .5 5000",
		--"event bombing1 .20 10000 30000 6",
		--"event bombing2 .10 20000 30000 3",
		--"event barrage1 .25 60000 60000 10",

		

	-- AREA TRIGGERS
	-- command name triggertype worldx worldy worldz
	-- directions near allied spawn 1



		
	-- telling the axis they are in the bridge capture area
		"area depotcapturem OnTrigger 134.21 355.84 21",
		"area depotcapturem OnTrigger 190.66 354.68 21",
		"area depotcapturem OnTrigger 192.09 369.58 21",
		"area depotcapturem OnTrigger 134.74 370.56 21",
		
		-- telling the allies infantry whats going on
		"area alliedinfantryinfo OnTrigger 133.50 66.02 8.28 1",
		"area alliedinfantryinfo OnTrigger 136.87 77.77 8.28",
		"area alliedinfantryinfo OnTrigger 139.47 77.31 8.28",
		"area alliedinfantryinfo OnTrigger 136.76 63.37 8.28",
		
		
		-- telling the allies vehicles whats going on
		"area alliedvehicleinfo OnTrigger -388.69 315.98 24.01 1",
		"area alliedvehicleinfo OnTrigger -283.81 399.25 24.01",
		"area alliedvehicleinfo OnTrigger -264.94 377.38 24.01",
		"area alliedvehicleinfo OnTrigger -393.05 308.02 24.01",
		
		
		-- telling the axis infantry whats going on
		"area axisinfantryinfo OnTrigger -22.01 -259.40 17.15 1",
		"area axisinfantryinfo OnTrigger -12.66 -234.28 17.15",
		"area axisinfantryinfo OnTrigger -16.85 -231.34 17.15",
		"area axisinfantryinfo OnTrigger -29.31 -256.89 17.15",
		
		
		-- telling the axis vehicles whats going on
		"area axisvehicleinfo OnTrigger -198.96 -344.20 23.75 1",
		"area axisvehicleinfo OnTrigger-163.68 -353.50 23.75",
		"area axisvehicleinfo OnTrigger -160.58 -348.23 23.75",
		"area axisvehicleinfo OnTrigger -195.16 -308.10 23.75",
		
		
		
		
		
		
		
		

	
	-- minefield near axis spawn

		--"area axisminefield1 OnMineArea 140.05 21.01 6",

		
		
		
	-- minefield east side of path

		-- "area pathfield1 OnMineArea 103.89 63.99 6",

		
		
		

		
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

		
		
		
	-- depot capture objective
	
		-- when the capper changes
		"handler capper OnCapper",
		
		-- when the captured amount changes
		"handler objective1 OnCapturing",
		
		-- the area to be in to capture
		"area depotcapture OnState 129.42 378.55 21.43",
		"area depotcapture OnState 134.14 294.86 15.12",
		"area depotcapture OnState 202.01 305.15 12.46",
		"area depotcapture OnState 204.24 378.47 20.69",
		
		-- mask the capture area with tanks only
		"mask depotcapture 4.2.4.0",

		
-- CLONES --

	-- NAMED VERSION
	-- command name typeid x y z roll pitch yaw

		-- "clone bedford1 bedford -20.11 -156.51 8.77 0 0 90",
		
				
	-- ANONYMOUS VERSION
	-- command typeid x y z roll pitch yaw

		--"clone bedford 195.46 151.93 7.5 5 0 -120",

		
		
		


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
		"alert onspawn onspawn.moveout 1",
		--"alert.1 toaxisspawn toaxisspawn 60",
		--"alert.2 toalliedspawn toalliedspawn 60",
		"alert.1 depotcapturem depotcapturem 5",

		"alert playarea playarea 10",
		
		"message.1 axiscapon axiscapon friendly 1",
		"message.1 axiscapoff axiscapoff enemy 1",
		"message.2 axiscapon axiscapon enemy 1",
		"message.2 axiscapoff axiscapoff friendly 1",
		
		"waypoint onspawn southbridge -26.22 -175.19 11.39 #FF6600",
		"waypoint onspawn northbridge 131.01 31.62 10.01 #FF6600",
		"waypoint onspawn petiteferme -225.24 -73.96 10.58 #FF6600",
		"waypoint onspawn objective 162.66 357.82 24.78 axis",
		
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
		"vehicle alliedtroops us-bazooka",
		"vehicle alliedvehicles stuartm3a3",
		"vehicle alliedvehicles m10",
		
		
		-- axis spawn list
		"vehicle axistroops de-assault",
		"vehicle axistroops de-smg",
		"vehicle axistroops de-lmg",
		"vehicle axistroops de-pzschreck",
		"vehicle axisvehicles pzivg",
	
	
		
--  #### DOC LOOK AT THIS!! ####
		
	-- alert masks
	-- define a mask to block who gets a named alert
	-- masktype maskname country category class
	-- or
	-- definethemask definethemessage vehicleid
	-- note, by defining which team does get the alert, the other team will not get the alert
				
		-- "vehicle bridgecapture1 2 0 0 0",
		-- "vehicle toaxisspawn 2 0 0 0",
		-- "vehicle toalliedspawn 4 0 0 0",
		-- "vehicle allieswrongway 2 0 0 0",
		
	-- objective masks
	-- the bridgecapture objective applies only to country 2
	-- "vehicle bridgecapture 2 0 0 0",		
		
--  #### END DOC LOOK AT THIS ####
	
	};

	for i,v in ipairs(content) do 
		scenario.manager:AddContent(v);
	end
end



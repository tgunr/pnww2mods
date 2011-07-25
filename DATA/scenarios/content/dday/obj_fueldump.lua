

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

"boundary playarea 123.96 388.84 20.72",
"boundary playarea 167.07 390.31 18.86",
"boundary playarea 165.37 395.30 26.56",
"boundary playarea 200.72 396.37 29.85",
"boundary playarea 200.69 395.05 29.85",
"boundary playarea 237.80 379.25 11.68",
"boundary playarea 381.28 383.15 18.46",
"boundary playarea 386.23 286.96 2.72",
"boundary playarea 384.38 227.47 5.48",
"boundary playarea 387.61 73.95 12.82",
"boundary playarea 386.85 -57.45 13.90",
"boundary playarea 384.71 -142.19 18.24",
"boundary playarea 335.97 -191.16 20.38",
"boundary playarea 292.76 -284.36 16.61",
"boundary playarea 242.53 -354.96 17.94",
"boundary playarea 215.70 -385.35 20.11",
"boundary playarea 143.43 -384.72 21.90",
"boundary playarea -14.48 -383.97 28.07",
"boundary playarea -90.08 -384.30 23.28",
"boundary playarea -341.85 -386.75 23.15",
"boundary playarea -379.35 -315.09 22.49",
"boundary playarea -386.39 -234.44 28.17",
"boundary playarea -375.17 -59.19 5.07",
"boundary playarea -360.95 -9.87 5.92",
"boundary playarea -379.99 27.13 7.10",
"boundary playarea -385.56 357.10 21.43",
"boundary playarea -362.48 385.63 23.39",
"boundary playarea -128.06 381.61 21.27",

		
		
		

	

		
		

-- DEFINE WHERE PLAYERS SPAWN		
		
	-- spawn points
	-- command spawngroup worldx worldy worldz yaw

		-- Allied Spawn Points
		"spawn alliedtroops 129.92 77.73 5.95 150",
		"spawn alliedtroops 160.71 89.05 6.60 255",
		"spawn alliedtroops 132.46 83.34 6.03 0",
		
		
		"spawn alliedvehicles -342.47 383.86 23.25 105",
		"spawn alliedvehicles -349.00 355.14 24.57 105",
		"spawn alliedvehicles -350.65 348.94 24.09 105",
		
		

		-- Axis Spawn Points
		"spawn axistroops -16.74 -253.28 17.17 340",
		"spawn axistroops -12.06 -258.64 16.51 340",
		"spawn axistroops -15.70 -285.71 16.56 340",
	
		"spawn axisvehicles -112.81 -332.78 21.80 45",
		"spawn axisvehicles -132.40 -360.03 24.12 45",
		"spawn axisvehicles -127.80 -364.65 24.21 45",


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
		
		-- BUILDING FIRES
		"emitter cratersmoke -193.02 -86.47 12",
		"emitter cratersmoke 101.39 -70.24 8.41",
		
		
		
		
		
		-- SMOKING BARRELS

		--"emitter hulksmoke -25.16 -97.95 8.75",

				
		-- SMOKING CRATERS

		"emitter cratersmoke 125.80 300.0 19.25",

				
		-- SMOKESCREEN

		"emitter smokescreen 386.92 278.62 2.50",
		"emitter smokescreen 393.46 270.38 2.50",
		"emitter smokescreen 396.04 255.16 2.50",

				
		-- SMOKING VEHICLES
		

		--"emitter hulksmoke 145.61 71.81 7.30",
		
		
		
		
		
		
		
		-- BURNING VEHICLES


		-- "emitter vehiclefire 105.14 -36.56 9.01",

		-- FIRES

		"emitter smallfire 95.18 -27.96 8.85",
		"emitter smallfire 349.78 264.83 5.94",
		"emitter smallfire 67.26 -144.94 8.35",
		"emitter smallfire -5.52 -111.84 8.5",
		"emitter smallfire 96.85 -75.87 8.49",
		"emitter smallfire 125.80 300.0 19.25",
		
		
		
		
		

-- SOUNDS
		
	-- ABSOLUTE SOUNDS
	-- command name filename minvol, maxvol

		"sound planes sounds/scenarios/ambient_aircraft_squadron1.wav .5 0",
		"sound planes sounds/scenarios/ambient_aircraft_squadron2.wav .5 0",
		"sound bombs sounds/scenarios/ambient_bombs_distantshells1.wav .4 0",
		"sound bombs sounds/scenarios/ambient_bombs_distantshells2.wav .4 0",
		"sound explosions sounds/scenarios/ambient_explosions_fourinarow.wav .4 0",
		"sound explosions sounds/troop/grenade.wav .40 0",
		"sound guns1 sounds/scenarios/ambient_guns_machine_gun1.wav 2 0",
		"sound guns1 sounds/scenarios/ambient_guns_machine_gun2.wav 2 0",
		"sound guns1 sounds/scenarios/ambient_guns_machine_gun3.wav 2 0",
		"sound guns1 sounds/airraidsiren.wav .06 0",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun4.wav 2 0",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun5.wav 2 0",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun6.wav 2 0",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun7.wav 2 0",
		"sound wind sounds/ambience/gust1.wav .3 0",
		"sound wind sounds/ambience/gust2.wav .3 0",

	-- POSITIONAL SOUNDS
	-- command name filename volume loop x y z mindist maxdist


		"sound sounds/tank_burn.wav 1 1 350 265 6 5 30",
		"sound sounds/tank_burn.wav 1 1 95 -28 9 5 30",
		"sound sounds/tank_burn.wav 1 1 66 -148 9 5 30",
		"sound sounds/tank_burn.wav 1 1 -5 -111 8 5 30",
		"sound sounds/tank_burn.wav 1 1 97 -76 10 5 30",
		"sound sounds/tank_burn.wav 1 1 125 300 19 5 30",
		
		
		
		
		
		

		
		"sound sounds/ambience/stream.wav 4 1 123 11 2 10 50",
		"sound sounds/ambience/stream.wav 4 1 127 21 8 10 50",
		"sound sounds/ambience/stream.wav 4 1 -26 -173 10 10 50",
		"sound sounds/ambience/stream.wav 4 1 -245 -55 8 10 50",
		

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

		"event planes .40 120000",
		-- "event bombs .10 20000",
		--"event explosions .10 25000",
		"event guns1 .15 10000",
		"event guns2 .20 30000",
		"event wind .5 5000",
		--"event bombing1 .20 10000 30000 6",
		--"event bombing2 .10 20000 30000 3",
		--"event barrage1 .25 60000 60000 10",

		

	-- AREA TRIGGERS
	-- command name triggertype worldx worldy worldz
	-- directions near allied spawn 1



		
	-- telling the axis they are in the depot capture area
	"area depotcapturem OnTrigger 124.53 355.65 25",
	"area depotcapturem OnTrigger 208.59 358.58 25",
	"area depotcapturem OnTrigger 207.98 343.68 25",
	"area depotcapturem OnTrigger 126.41 335.95 25",


		
		-- telling the allies infantry whats going on
		--"area alliedinfantryinfo OnTrigger 133.50 66.02 8.28 1",
		--"area alliedinfantryinfo OnTrigger 136.87 77.77 8.28",
		--"area alliedinfantryinfo OnTrigger 139.47 77.31 8.28",
		--"area alliedinfantryinfo OnTrigger 136.76 63.37 8.28",
		
		
		-- telling the allies vehicles whats going on
		--"area alliedvehicleinfo OnTrigger -388.69 315.98 24.01 1",
		--"area alliedvehicleinfo OnTrigger -283.81 399.25 24.01",
		--"area alliedvehicleinfo OnTrigger -264.94 377.38 24.01",
		--"area alliedvehicleinfo OnTrigger -393.05 308.02 24.01",
		
		
		-- telling the axis infantry whats going on
		--"area axisinfantryinfo OnTrigger -13.01 -288.90 17.07",
		--"area axisinfantryinfo OnTrigger 7.00 -239.21 15.83",
		--"area axisinfantryinfo OnTrigger -19.08 -226.35 16.03",
		--"area axisinfantryinfo OnTrigger -41.96 -283.03 18.70",
		--"area axisinfantryinfo OnTrigger -37.41 -283.57 18.80",
		--"area axisinfantryinfo OnTrigger -16.78 -232.10 15.95",
		--"area axisinfantryinfo OnTrigger 2.40 -241.11 16.11",
		--"area axisinfantryinfo OnTrigger -12.03 -275.11 17.19",
		--"area axisinfantryinfo OnTrigger -17.00 -274.38 16.82",
		--"area axisinfantryinfo OnTrigger -23.43 -286.96 18.69",

		
		
		-- telling the axis vehicles whats going on
		--"area axisvehicleinfo OnTrigger -112.15 -362.24 24.29 1",
		--"area axisvehicleinfo OnTrigger -133.42 -338.99 24.29",
		--"area axisvehicleinfo OnTrigger -132.13 -335.59 24.29",
		--"area axisvehicleinfo OnTrigger -108.79 -352.01 24.29",
		
		
		-- telling the allies they are in the resupply area
		"area alliesresupplyinfo OnTrigger -187.78 -92.46 7",
		"area alliesresupplyinfo OnTrigger -186.23 -87.06 7",
		"area alliesresupplyinfo OnTrigger -182.06 -89.69 7",
		"area alliesresupplyinfo OnTrigger -185.10 -96.28 7",
		
		-- telling the axis they are in the resupply area
		"area axisresupplyinfo OnTrigger 56.96 -147.99 9.75",
		"area axisresupplyinfo OnTrigger 56.54 -153.59 9.75",
		"area axisresupplyinfo OnTrigger 60.02 -155.79 9.75",
		"area axisresupplyinfo OnTrigger 60.36 -148.91 9.75",
		

		
	
		
		

	
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
		"area depotcapture OnState 124.53 355.65 23",
		"area depotcapture OnState 208.59 358.58 23",
		"area depotcapture OnState 207.98 343.68 23",
		"area depotcapture OnState 126.41 335.95 23",
		
		

		
		-- mask the capture area with tanks only
		"mask depotcapture 4.2.4.0",
		
	
		
		-- the area for us supply
		"area ussupply OnResupply -187.78 -92.46 8.27",
		"area ussupply OnResupply -186.23 -87.06 8.27",
		"area ussupply OnResupply -182.06 -89.69 8.27",
		"area ussupply OnResupply -185.10 -96.28 8.27",
		
		-- the area for de supply
		"area desupply OnResupply 56.96 -147.99 9.75",
		"area desupply OnResupply 56.54 -153.59 9.75",
		"area desupply OnResupply 60.02 -155.79 9.75",
		"area desupply OnResupply 60.36 -148.91 9.75",

		
		




		
-- CLONES --

	-- NAMED VERSION
	-- command name typeid x y z roll pitch yaw

		"clone bedford1 bedford 134.51 81 7.2 0 0 100",
		"clone bedford1 bedford 135.82 84.95 7.1 0 0 100",
		
		"clone oplbltz -44.31 -241.60 17.25 0 4 10",
		
		"clone sdkfz251c -43.22 -235.06 16.90 0 5 8",
		
		
		
		
				
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
		"alert.2 depotcapturem depotcapturem 5",

		"alert playarea playarea 10",
		"message.1 axiscapon axiscapon friendly 1",
		"message.1 axiscapoff axiscapoff enemy 1",
		"message.2 axiscapon axiscapon enemy 1",
		"message.2 axiscapoff axiscapoff friendly 1",
		
		"waypoint onspawn southbridge -26.22 -175.19 11.39 #FF6600",
		"waypoint onspawn northbridge 131.01 31.62 10.01 #FF6600",
		"waypoint onspawn petiteferme -225.24 -73.96 10.58 #FF6600",
		"waypoint.2 onspawn dock 350.82 255.78 5.53 #FF6600",
		"waypoint.2 onspawn deobjective 162.66 357.82 24.78 enemy",
		"waypoint.1 onspawn usobjective 162.66 357.82 24.78 friendly",		
		"waypoint.2 onspawn deresupply 59.26 -151.21 10.38 axis",
		"waypoint.1 onspawn usresupply -185.64 -90.68 10.22 allied",
		
		
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
		"mask alliedtroops us-assault",
		"mask alliedtroops us-smg",
		"mask alliedtroops us-bar",
		"mask alliedtroops us-bazooka 2",
		--"mask alliedvehicles m10 2",
		--"mask alliedvehicles m4a2  2",
		"mask alliedvehicles m4a2_us 2",
		"mask alliedvehicles m10_us 2",
		
		

		-- axis spawn list
		"mask axistroops de-assault",
		"mask axistroops de-smg",
		"mask axistroops de-lmg",
		"mask axistroops de-pzschreck 2",
		"mask axisvehicles pzivg 4",
		"mask axisvehicles stug3b 4",
	
	
		
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





if(true) then
	-- content we're going to add
	local content = 
	{
		-- INCLUDE A LUA FILE --
		-- command path
		"include scenarios/terrain/tankmap/map.lua",

-- DEFINE THE PLAY AREA

	-- Playarea Boundary
	
	-- boundary name x y z

"boundary playarea -254.55 -74.98 6.62",
"boundary playarea -257.55 -82.95 6.85",
"boundary playarea -264.71 -85.57 6.67",
"boundary playarea -290.88 -85.66 4.09",
"boundary playarea -295.25 -88.20 4.20",
"boundary playarea -295.58 -93.69 3.91",
"boundary playarea -294.31 -98.10 4.79",
"boundary playarea -289.55 -106.27 3.90",
"boundary playarea -284.00 -113.82 6.23",
"boundary playarea -277.11 -121.94 5.62",
"boundary playarea -278.45 -136.86 5.36",
"boundary playarea -277.33 -147.45 5.27",
"boundary playarea -273.25 -159.27 5.19",
"boundary playarea -268.49 -172.82 4.21",
"boundary playarea -269.05 -195.49 5.60",
"boundary playarea -261.03 -208.61 6.47",
"boundary playarea -248.46 -227.62 8.94",
"boundary playarea -237.56 -239.53 11.22",
"boundary playarea -219.89 -252.39 17.62",
"boundary playarea -195.00 -256.14 19.83",
"boundary playarea -171.08 -261.18 15.59",
"boundary playarea -157.07 -261.01 13.65",
"boundary playarea -122.10 -262.29 9.42",
"boundary playarea -72.36 -266.68 7.98",
"boundary playarea -35.66 -267.12 3.95",
"boundary playarea -16.08 -268.21 3.84",
"boundary playarea 25.05 -269.16 4.28",
"boundary playarea 70.49 -267.12 4.07",
"boundary playarea 93.12 -264.91 6.34",
"boundary playarea 122.60 -250.34 7.99",
"boundary playarea 143.40 -238.02 5.19",
"boundary playarea 161.82 -229.72 4.80",
"boundary playarea 171.96 -201.10 2.97",
"boundary playarea 175.06 -183.53 5.03",
"boundary playarea 165.58 -174.87 3.87",
"boundary playarea 161.84 -165.30 3.02",
"boundary playarea 165.87 -141.40 4.02",
"boundary playarea 165.18 -129.70 3.14",
"boundary playarea 158.39 -124.49 4.04",
"boundary playarea 153.45 -119.09 3.79",
"boundary playarea 146.90 -100.60 5.00",
"boundary playarea 140.60 -87.30 3.29",
"boundary playarea 144.44 -80.31 2.98",
"boundary playarea 193.79 -33.46 4.28",
"boundary playarea 190.40 -20.15 4.17",
"boundary playarea 195.19 -5.91 4.28",
"boundary playarea 202.48 1.63 3.75",
"boundary playarea 207.77 1.47 3.91",
"boundary playarea 214.04 -5.07 5.46",
"boundary playarea 217.88 -15.17 6.49",
"boundary playarea 218.47 -21.21 6.65",
"boundary playarea 222.46 -24.19 6.50",
"boundary playarea 229.33 -21.98 4.04",
"boundary playarea 238.72 -18.08 5.02",
"boundary playarea 237.34 -8.56 7.68",
"boundary playarea 230.47 0.47 8.54",
"boundary playarea 224.06 5.47 7.12",
"boundary playarea 213.15 10.71 6.16",
"boundary playarea 201.23 17.98 5.13",
"boundary playarea 187.05 32.94 8.03",
"boundary playarea 173.97 49.80 7.50",
"boundary playarea 168.45 68.72 9.55",
"boundary playarea 158.07 81.60 8.85",
"boundary playarea 138.33 91.84 8.13",
"boundary playarea 113.71 104.50 9.92",
"boundary playarea 93.75 116.88 13.36",
"boundary playarea 65.21 123.38 12.54",
"boundary playarea 16.11 133.45 7.51",
"boundary playarea -22.65 132.95 4.31",
"boundary playarea -62.56 123.34 9.84",
"boundary playarea -92.17 119.39 11.17",
"boundary playarea -110.19 119.26 11.41",
"boundary playarea -141.38 120.11 18.43",
"boundary playarea -166.68 107.98 13.11",
"boundary playarea -197.31 106.61 10.07",
"boundary playarea -234.39 107.51 9.08",
"boundary playarea -266.36 79.58 2.88",
"boundary playarea -278.63 59.44 3.90",
"boundary playarea -287.46 23.85 2.72",
"boundary playarea -294.00 9.72 2.50",
"boundary playarea -300.86 1.56 2.68",
"boundary playarea -306.55 -47.48 3.12",
"boundary playarea -273.55 -59.91 3.70",
"boundary playarea -256.91 -65.40 5.61",

-- DEFINE WHERE PLAYERS SPAWN		
		
	-- yaw is the vehicle facing on spawn and is given in degrees
	-- spawn points are always named
		
	-- command spawngroup worldx worldy worldz yaw

		-- Allied tank spawns
		"spawn alliedvehicles 37.63 -230.57 6.19 270",
		"spawn alliedvehicles 51.83 -229.92 6.19 90",



		-- German tank spawns
		"spawn axisvehicles -183.62 67.73 7.33 120",
		"spawn axisvehicles -182.26 67.56 7.71 250",

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

		-- allied spawn smokescreen
		"emitter smokescreen 20.02 -199.85 6.98",
		
		-- axis spawn smokescreen
		"emitter smokescreen -150.29 31.90 8.03",
		
		
						
		-- SMOKING VEHICLES
		
		"emitter hulksmoke -85.71 -14.05 10.5",
		"emitter hulksmoke -71.59 -123.08 9.5",
		--"emitter hulksmoke 293198.83 2976555.30 274.40",
		--"emitter hulksmoke 292914.19 2976638.96 274.49",
		
		-- BURNING VEHICLES

		-- "emitter vehiclefire 82487.52 3011457.65 5.00",
		-- "emitter vehiclefire 81366.19 3011906.12 4.42",


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

		-- "sound sounds/tank_burn.wav 1 1 345498.39 3006190.72 110.11 5 30",
		-- "sound sounds/tank_burn.wav 1 1 345725.97 3006311.75 109.19 5 30",
				

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

		-- "barrage barrage1 smallbarragebomb 81231.19 3011960.61 3.08 150",
		-- "barrage barrage1 smallbarragebomb 82358.13 3011558.99 4.00 150",
		-- "barrage barrage1 smallbarragebomb -266.85 -36.03 5.26 50",

		
-- TRIGGERS
	
	-- EVENT TRIGGERS	
	-- command name pctgchance-each-second wait-in-milliseconds milliseconds-between-bomb-drops number-of-bombs

		-- "event planes .40 80000",
		--"event bombs .45 80000",
		--"event explosions .20 45000",
		-- "event guns1 .25 20000",
		-- "event guns2 .25 40000",
		-- "event siren1 .33 50000",
		-- "event wind .5 5000",
		--"event bombing1 .90 25000 600 24",
		--"event bombing2 .90 25000 650 12",
		-- "event barrage1 .45 30000 550 18",

		

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
		
		-- "area bridgecapture OnState 81802.47 3011808.50 11.94 1",
		-- "area bridgecapture OnState 81796.75 3011808.50 11.94",
		-- "area bridgecapture OnState 81796.81 3011786.75 11.86",
		-- "area bridgecapture OnState 81802.57 3011786.25 11.84",



	-- telling players they are in the bridge capture area
		-- "area bridgecapture1 OnTrigger 81802.47 3011808.50 14",
		-- "area bridgecapture1 OnTrigger 81796.75 3011808.50 14",
		-- "area bridgecapture1 OnTrigger 81796.81 3011786.75 14",
		-- "area bridgecapture1 OnTrigger 81802.57 3011786.25 14",

		
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
	
	
	
	
	
	
	
	-- end section for cagefight

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
		--"clone bedford -19.75 -153.93 9.05 2 0 0",
		--"clone bedford -27.34 -150.10 8.9 4 0 285",
		--"clone bedford -35.21 -147.32 8.85 6 2 285",


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

		-- "waypoint.2.1.1 onspawn wp1 81624.87 3011364.45 8.56", 
		-- "waypoint.1.1.1 onspawn wp2 82237.67 3012068.52 8.99", 
		-- "waypoint.0.1.1 onspawn wp3 81799.70 3011794.20 17.52", 
		-- "waypoint.0.1.1 onspawn wp4 82534.27 3011726.17 24.45", 
		-- "waypoint.0.1.1 onspawn wp5 81074.97 3011869.38 31.82", 
		
		
		-- "alert onspawn onspawn.moveout -1",
		--"alert roundstop roundstop",
		-- "alert victory1 victory1",
		-- "alert victory2 victory2",
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

	-- types:
	-- type ids can be found the in the DATA\th_blitz\weap files
		
	-- a 0 is considered a wildcard (any)
		
	-- command spawngroup country category class type

	-- Allied tank types --		

		"mask alliedvehicles m10_us 3",
		"mask alliedvehicles m4a2_us 3",


	-- German tank types --

		"mask axisvehicles  pzivg 3",
		"mask axisvehicles stug3g 3",	

	-- alternatively you can use a vehicle's string id 
	-- command spawngroup id
	-- "vehicle <spawn object filename>",

	};

	for i,v in ipairs(content) do 
		scenario.manager:AddContent(v);
	end
end



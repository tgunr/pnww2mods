

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
		"ammo pathfield3 landmine",
		"ammo pathfield4 landmine",
		"ammo pathfield5 landmine",
		
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
		
		-- south bridge sides
		"block -22.86 -155.67 8.5 -35.45 -190.08 8.5 .5 3",
		"block -17.35 -157.79 8.5 -29.81 -192.02 8.5 .5 3",
		
		
		
		

		

		
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
		"emitter cratersmoke 8.49 -243.42 15.38",
		"emitter cratersmoke -26.15 -204.03 10.60",
		"emitter cratersmoke 105.98 43.51 4.52",
		"emitter cratersmoke 120.69 -13.37 7.67",
		"emitter cratersmoke 63.86 187.91 6.64",
		-- this is for movies
		"emitter cratersmoke 59.53 -89.31 18.08",
		"emitter cratersmoke -44.52 -79.16 8.37",
		"emitter cratersmoke 36.40 -30.85 8.28",
		"emitter smokescreen -71.60 -117.44 9.12",
		"emitter smokescreen 79.82 -34.95 9.38",
		
		
		
				
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
		
		
		
		
				-- a line of bombs (as from a plane)
		-- command,name,ammo,worldx1,worldy1,worldz1,worldx2,worldy2,worldz2
		"bombingrun bombing1 gp250 -184.65 -279.50 22.84 46.61 -297.32 22.54",
		"bombingrun bombing1 gp250 210.96 -227.13 19.97 274.58 -85.40 19.97",
		"bombingrun bombing1 gp500 268.23 77.65 6.21 152.83 123.03 6.21",
		"bombingrun bombing1 gp250 -69.51 80.01 6.21 -177.68 11.25 6.21",
		"bombingrun bombing2 gp40 33.14 -165.89 7.68 6.27 -182.85 2.72",
		"bombingrun bombing2 gp40 212.53 -134.06 19.33 163.59 -134.66 4.72",
		-- an area effect bombing
		-- the x,y,z is the center of the barrage
		-- the distance is the radius of a circle around the center to randomly fire off the ammo in
		-- command name ammo x y z distance
		"barrage barrage1 gp40 -154.25 -107.17 8.77 25",
		"barrage barrage1 gp40 84.84 306.73 21.79 50",
		"barrage barrage1 gp40 -266.85 -36.03 5.26 50",

		
		-- TRIGGERS
		
		-- commandname,pctg chance each second,wait in seconds
		"event planes .40 120000",
		"event bombs .10 20000",
		"event explosions .20 25000",
		"event guns1 .15 10000",
		"event guns2 .20 30000",
		"event wind .5 5000",
		"event bombing1 .10 15000 500 6",
		"event bombing2 .10 20000 750 3",
		"event barrage1 .20 60000 700 10",
		
		
		
		
		
		
		
		
		
		
		

	-- A LINE OF BOMBS (as if dropped from a plane)
	-- command name ammo worldx1 worldy1 worldz1 worldx2 worldy2 worldz2
-- delet this later
		-- command,name,ammo,worldx1,worldy1,worldz1,worldx2,worldy2,worldz2
		"bombingrun bombing1 gp250 -184.65 -279.50 22.84 46.61 -297.32 22.54",
		"bombingrun bombing1 gp250 210.96 -227.13 19.97 274.58 -85.40 19.97",
		"bombingrun bombing1 gp500 268.23 77.65 6.21 152.83 123.03 6.21",
		"bombingrun bombing1 gp250 -69.51 80.01 6.21 -177.68 11.25 6.21",
		"bombingrun bombing2 gp40 33.14 -165.89 7.68 6.27 -182.85 2.72",
		"bombingrun bombing2 gp40 212.53 -134.06 19.33 163.59 -134.66 4.72",
		-- an area effect bombing
		-- the x,y,z is the center of the barrage
		-- the distance is the radius of a circle around the center to randomly fire off the ammo in
		-- command name ammo x y z distance
		"barrage barrage1 gp40 -154.25 -107.17 8.77 25",
		"barrage barrage1 gp40 84.84 306.73 21.79 50",
		"barrage barrage1 gp40 -266.85 -36.03 5.26 50",


	-- AREA EFFECT BOMBING OR BARRAGE (simulating artillery barrage)
	-- the x,y,z is the center of the barrage
	-- the distance is the radius of a circle around the center to randomly fire off the ammo in
	-- command name ammo x y z distance

	--"barrage barrage1 gp40 -136.68 204.49 12.79 50",
		
		
		


		
-- TRIGGERS
	
	-- EVENT TRIGGERS	
	-- command name pctgchance-each-second wait-in-seconds
	
-- delet this later			
		-- commandname,pctg chance each second,wait in seconds
		"event planes .60 120000",
		"event bombs .10 20000",
		"event explosions .20 25000",
		"event guns1 .15 10000",
		"event guns2 .20 30000",
		"event wind .5 5000",
		"event bombing1 .90 15000 500 6",
		"event bombing2 .90 20000 750 3",
		"event barrage1 .85 60000 700 10",
		
	
	
-- this is the right stuff
		--"event planes .40 120000",
		-- "event bombs .10 20000",
		--"event explosions .10 25000",
		--"event guns1 .15 10000",
		--"event guns2 .20 30000",
		--"event wind .5 5000",
		--"event bombing1 .20 10000 30000 6",
		--"event bombing2 .10 20000 30000 3",
		--"event barrage1 .95 10000 500 10",
		--"event barrage1 .75 10000 500 10",
		--"event barrage2 .95 12000 500 6",
		--"event barrage2 .85 12000 500 6",



	-- AREA TRIGGERS
	-- command name triggertype worldx worldy worldz
	-- directions near allied spawn 1



		
	-- telling the axis they are in the depot capture area
	-- "area depotcapturem OnTrigger 124.53 355.65 25",
	-- "area depotcapturem OnTrigger 208.59 358.58 25",
	-- "area depotcapturem OnTrigger 207.98 343.68 25",
	-- "area depotcapturem OnTrigger 126.41 335.95 25",


		
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
		

		
	
		
		-- landmine area warnings
		
		-- minefield 1
		"area minefield1 OnTrigger 139.41 22.73 7.80",
		"area minefield1 OnTrigger 162.95 61.29 7.25",
		"area minefield1 OnTrigger 270.75 30.65 6.26",
		"area minefield1 OnTrigger 283.02 63.14 5.13",
		"area minefield1 OnTrigger 281.27 81.97 5.10",
		"area minefield1 OnTrigger 281.02 102.23 4.20",
		"area minefield1 OnTrigger 285.92 114.10 4.08",
		"area minefield1 OnTrigger 286.95 126.08 3.73",
		"area minefield1 OnTrigger 283.79 134.26 3.28",
		"area minefield1 OnTrigger 293.59 138.33 2.16",
		"area minefield1 OnTrigger 299.29 129.05 2.31",
		"area minefield1 OnTrigger 299.00 115.22 2.69",
		"area minefield1 OnTrigger 294.50 101.10 3.28",
		"area minefield1 OnTrigger 292.36 92.33 3.68",
		"area minefield1 OnTrigger 296.27 82.41 3.85",
		"area minefield1 OnTrigger 297.31 68.90 3.37",
		"area minefield1 OnTrigger 291.98 47.08 3.59",
		"area minefield1 OnTrigger 286.60 33.80 4.57",
		"area minefield1 OnTrigger 283.96 21.41 4.72",
		"area minefield1 OnTrigger 277.86 11.41 5.06",
		"area minefield1 OnTrigger 269.77 2.45 5.23",
		"area minefield1 OnTrigger 255.90 -8.29 6.41",
		"area minefield1 OnTrigger 246.33 -11.21 6.69",
		"area minefield1 OnTrigger 240.39 -11.44 6.91",
		"area minefield1 OnTrigger 227.58 -8.53 10.50",
		"area minefield1 OnTrigger 205.31 -2.51 10.48",
		"area minefield1 OnTrigger 160.84 10.06 7.90",
		"area minefield1 OnTrigger 142.39 16.93 8.04",
		"area minefield1 OnTrigger 139.94 19.71 8.04",
		
		-- minefield 2
		
		"area minefield2 OnTrigger 134 50 6",
		"area minefield2 OnTrigger 80.32 73.44 6",		
		"area minefield2 OnTrigger 67.66 66.27 6",	
		"area minefield2 OnTrigger 59.56 19.08 6",
		"area minefield2 OnTrigger 70.01 7.38 6",	
		"area minefield2 OnTrigger 69.91 -0.19 6",
		"area minefield2 OnTrigger 102.39 14.90 6",
		"area minefield2 OnTrigger 123 28 6",
		
		-- minefield 3
		
		"area minefield3 OnTrigger 61.23 67.62 6",
		"area minefield3 OnTrigger 53.58 26.84 6",
		"area minefield3 OnTrigger 59.54 14.37 6",
		"area minefield3 OnTrigger 66.02 7.65 6",
		"area minefield3 OnTrigger 68.22 -4.71 6",
		"area minefield3 OnTrigger 54.44 -6.78 6",
		"area minefield3 OnTrigger 58.96 7.49 6",
		"area minefield3 OnTrigger 50.48 24.47 6", 
		"area minefield3 OnTrigger 57.82 66.03 6",
		
		-- minefield 4
		
			"area minefield4 OnTrigger -33.64 -0.46 10",
			"area minefield4 OnTrigger -20.99 0.41 10",
			"area minefield4 OnTrigger -0.01 5.67 10",
			"area minefield4 OnTrigger 5.05 3.29 10",
			"area minefield4 OnTrigger 7.13 -4.01 10",
			"area minefield4 OnTrigger 3.86 -8.68 10",
			"area minefield4 OnTrigger -10.23 -12.71 10",
			"area minefield4 OnTrigger -24.82 -13.98 10",
			"area minefield4 OnTrigger -41.13 -16.33 10",
			"area minefield4 OnTrigger -52.22 -21.66 10",
			"area minefield4 OnTrigger -61.58 -31.57 10",
			"area minefield4 OnTrigger -68.55 -46.05 10",
			"area minefield4 OnTrigger -76.09 -58.64 10",
			"area minefield4 OnTrigger -81.75 -70.49 10",
			"area minefield4 OnTrigger -103.77 -79.55 10",
			"area minefield4 OnTrigger -113.47 -95.87 10",
			"area minefield4 OnTrigger -120.96 -96.61 10",
			"area minefield4 OnTrigger -126.43 -91.57 10",
			"area minefield4 OnTrigger -124.16 -84.43 10",
			"area minefield4 OnTrigger -115.05 -69.13 10",
			"area minefield4 OnTrigger -106.27 -64.58 10",
			"area minefield4 OnTrigger -97.57 -63.59 10",
			"area minefield4 OnTrigger -91.33 -59.24 10",
			"area minefield4 OnTrigger -89.37 -51.44 10",
			"area minefield4 OnTrigger -82.79 -44.64 10",
			"area minefield4 OnTrigger -79.07 -36.70 10",
			"area minefield4 OnTrigger -75.98 -29.15 10",
			"area minefield4 OnTrigger -70.81 -19.22 10",
			"area minefield4 OnTrigger -63.35 -11.99 10",
			"area minefield4 OnTrigger -54.13 -6.67 10",
			"area minefield4 OnTrigger -41.01 -2.00 10",
			"area minefield4 OnTrigger -41.01 -2.00 10",
			"area minefield4 OnTrigger -34.83 -0.76 10",

		
		-- minefield 5
		"area minefield5 OnTrigger -206.53 -126.46 10",
		"area minefield5 OnTrigger -199.55 -127.06 10",
		"area minefield5 OnTrigger -194.12 -130.72 10",
		"area minefield5 OnTrigger -177.20 -137.2010",
		"area minefield5 OnTrigger -168.11 -138.70 10",
		"area minefield5 OnTrigger -159.39 -143.54 10",
		"area minefield5 OnTrigger -142.13 -151.58 10",
		"area minefield5 OnTrigger -112.74 -165.46 10",
		"area minefield5 OnTrigger -87.79 -173.87 10",
		"area minefield5 OnTrigger -74.19 -179.80 10",
		"area minefield5 OnTrigger -62.09 -184.21 10",
		"area minefield5 OnTrigger -53.30 -187.93 10",
		"area minefield5 OnTrigger -45.67 -190.12 10",
		"area minefield5 OnTrigger -41.69 -195.88 10",
		"area minefield5 OnTrigger -53.54 -195.78 10",
		"area minefield5 OnTrigger -49.88 -202.75 10",
		"area minefield5 OnTrigger -56.17 -201.09 10",
		"area minefield5 OnTrigger -72.33 -194.40 10",
		"area minefield5 OnTrigger -119.21 -175.84 10",
		"area minefield5 OnTrigger -158.78 -158.54 10",
		"area minefield5 OnTrigger -173.52 -151.78 10",
		"area minefield5 OnTrigger -189.62 -146.51 10",
		"area minefield5 OnTrigger -201.03 -142.31 10",
		"area minefield5 OnTrigger -207.89 -138.49 10",
		"area minefield5 OnTrigger -210.82 -133.80 10",
		"area minefield5 OnTrigger -209.40 -129.28 10",
		
		-- minefield 6
		"area minefield6 OnTrigger 252.52 192.95 10",
		"area minefield6 OnTrigger 257.72 192.03 10",
		"area minefield6 OnTrigger 268.12 196.69 10",
		"area minefield6 OnTrigger 276.07 202.74 10",
		"area minefield6 OnTrigger 281.15 207.34 10",
		"area minefield6 OnTrigger 288.07 212.34 10",
		"area minefield6 OnTrigger 292.83 217.43 10",
		"area minefield6 OnTrigger 298.51 223.83 10",
		"area minefield6 OnTrigger 302.78 230.83 10",
		"area minefield6 OnTrigger 303.50 237.08 10",
		"area minefield6 OnTrigger 300.02 240.97 10",
		"area minefield6 OnTrigger 295.18 241.39 10",
		"area minefield6 OnTrigger 291.78 239.63 10",
		"area minefield6 OnTrigger 289.30 235.83 10",
		"area minefield6 OnTrigger 286.23 230.67 10",
		"area minefield6 OnTrigger 282.26 227.17 10",
		"area minefield6 OnTrigger 278.38 223.60 10",
		"area minefield6 OnTrigger 276.07 220.51 10",
		"area minefield6 OnTrigger 268.89 215.94 10",
		"area minefield6 OnTrigger 261.70 209.39 10",
		"area minefield6 OnTrigger 255.76 207.24 10",
		"area minefield6 OnTrigger 251.03 205.06 10",
		"area minefield6 OnTrigger 248.58 201.13 10",
		"area minefield6 OnTrigger 249.47 197.03 10",
		
		
		
		
		
 --	LANDMINE AREAS

	-- minefield east of north bridge AKA minefield1

		"area axisminefield1 OnMineArea 139.41 22.73 7.80",
		"area axisminefield1 OnMineArea 162.95 61.29 7.25",
		"area axisminefield1 OnMineArea 270.75 30.65 6.26",
		"area axisminefield1 OnMineArea 283.02 63.14 5.13",
		"area axisminefield1 OnMineArea 281.27 81.97 5.10",
		"area axisminefield1 OnMineArea 281.02 102.23 4.20",
		"area axisminefield1 OnMineArea 285.92 114.10 4.08",
		"area axisminefield1 OnMineArea 286.95 126.08 3.73",
		"area axisminefield1 OnMineArea 283.79 134.26 3.28",
		"area axisminefield1 OnMineArea 293.59 138.33 2.16",
		"area axisminefield1 OnMineArea 299.29 129.05 2.31",
		"area axisminefield1 OnMineArea 299.00 115.22 2.69",
		"area axisminefield1 OnMineArea 294.50 101.10 3.28",
		"area axisminefield1 OnMineArea 292.36 92.33 3.68",
		"area axisminefield1 OnMineArea 296.27 82.41 3.85",
		"area axisminefield1 OnMineArea 297.31 68.90 3.37",
		"area axisminefield1 OnMineArea 291.98 47.08 3.59",
		"area axisminefield1 OnMineArea 286.60 33.80 4.57",
		"area axisminefield1 OnMineArea 283.96 21.41 4.72",
		"area axisminefield1 OnMineArea 277.86 11.41 5.06",
		"area axisminefield1 OnMineArea 269.77 2.45 5.23",
		"area axisminefield1 OnMineArea 255.90 -8.29 6.41",
		"area axisminefield1 OnMineArea 246.33 -11.21 6.69",
		"area axisminefield1 OnMineArea 240.39 -11.44 6.91",
		"area axisminefield1 OnMineArea 227.58 -8.53 10.50",
		"area axisminefield1 OnMineArea 205.31 -2.51 10.48",
		"area axisminefield1 OnMineArea 160.84 10.06 7.90",
		"area axisminefield1 OnMineArea 142.39 16.93 8.04",
		"area axisminefield1 OnMineArea 139.94 19.71 8.04",


	-- minefield east side of path AKA minefield 2

		-- "area pathfield1 OnMineArea 103.89 63.99 6",
		"area pathfield1 OnMineArea 134 50 6",
		"area pathfield1 OnMineArea 80.32 73.44 6",		
		"area pathfield1 OnMineArea 67.66 66.27 6",	
		"area pathfield1 OnMineArea 59.56 19.08 6",
		"area pathfield1 OnMineArea 70.01 7.38 6",	
		"area pathfield1 OnMineArea 69.91 -0.19 6",
		"area pathfield1 OnMineArea 102.39 14.90 6",
		"area pathfield1 OnMineArea 123 28 6",
		
		
	-- minefield west side of path AKA minefield 3

		"area pathfield2 OnMineArea 61.23 67.62 6",
		"area pathfield2 OnMineArea 53.58 26.84 6",
		"area pathfield2 OnMineArea 59.54 14.37 6",
		"area pathfield2 OnMineArea 66.02 7.65 6",
		"area pathfield2 OnMineArea 68.22 -4.71 6",
		"area pathfield2 OnMineArea 54.44 -6.78 6",
		"area pathfield2 OnMineArea 58.96 7.49 6",
		"area pathfield2 OnMineArea 50.48 24.47 6", 
		"area pathfield2 OnMineArea 57.82 66.03 6",

		
	-- minefield northwest AKA minefield 4
	
	"area pathfield3 OnMineArea -33.64 -0.46 10",
	"area pathfield3 OnMineArea -20.99 0.41 10",
	"area pathfield3 OnMineArea -0.01 5.67 10",
	"area pathfield3 OnMineArea 5.05 3.29 10",
	"area pathfield3 OnMineArea 7.13 -4.01 10",
	"area pathfield3 OnMineArea 3.86 -8.68 10",
	"area pathfield3 OnMineArea -10.23 -12.71 10",
	"area pathfield3 OnMineArea -24.82 -13.98 10",
	"area pathfield3 OnMineArea -41.13 -16.33 10",
	"area pathfield3 OnMineArea -52.22 -21.66 10",
	"area pathfield3 OnMineArea -61.58 -31.57 10",
	"area pathfield3 OnMineArea -68.55 -46.05 10",
	"area pathfield3 OnMineArea -76.09 -58.64 10",
	"area pathfield3 OnMineArea -81.75 -70.49 10",
	"area pathfield3 OnMineArea -103.77 -79.55 10",
	"area pathfield3 OnMineArea -113.47 -95.87 10",
	"area pathfield3 OnMineArea -120.96 -96.61 10",
	"area pathfield3 OnMineArea -126.43 -91.57 10",
	"area pathfield3 OnMineArea -124.16 -84.43 10",
	"area pathfield3 OnMineArea -115.05 -69.13 10",
	"area pathfield3 OnMineArea -106.27 -64.58 10",
	"area pathfield3 OnMineArea -97.57 -63.59 10",
	"area pathfield3 OnMineArea -91.33 -59.24 10",
	"area pathfield3 OnMineArea -89.37 -51.44 10",
	"area pathfield3 OnMineArea -82.79 -44.64 10",
	"area pathfield3 OnMineArea -79.07 -36.70 10",
	"area pathfield3 OnMineArea -75.98 -29.15 10",
	"area pathfield3 OnMineArea -70.81 -19.22 10",
	"area pathfield3 OnMineArea -63.35 -11.99 10",
	"area pathfield3 OnMineArea -54.13 -6.67 10",
	"area pathfield3 OnMineArea -41.01 -2.00 10",
	"area pathfield3 OnMineArea -41.01 -2.00 10",
	"area pathfield3 OnMineArea -34.83 -0.76 10",


	-- minefield south AKA minefield 5
	"area pathfield4 OnMineArea -206.53 -126.46 10",
	"area pathfield4 OnMineArea -199.55 -127.06 10",
	"area pathfield4 OnMineArea -194.12 -130.72 10",
	"area pathfield4 OnMineArea -177.20 -137.2010",
	"area pathfield4 OnMineArea -168.11 -138.70 10",
	"area pathfield4 OnMineArea -159.39 -143.54 10",
	"area pathfield4 OnMineArea -142.13 -151.58 10",
	"area pathfield4 OnMineArea -112.74 -165.46 10",
	"area pathfield4 OnMineArea -87.79 -173.87 10",
	"area pathfield4 OnMineArea -74.19 -179.80 10",
	"area pathfield4 OnMineArea -62.09 -184.21 10",
	"area pathfield4 OnMineArea -53.30 -187.93 10",
	"area pathfield4 OnMineArea -45.67 -190.12 10",
	"area pathfield4 OnMineArea -41.69 -195.88 10",
	"area pathfield4 OnMineArea -53.54 -195.78 10",
	"area pathfield4 OnMineArea -49.88 -202.75 10",
	"area pathfield4 OnMineArea -56.17 -201.09 10",
	"area pathfield4 OnMineArea -72.33 -194.40 10",
	"area pathfield4 OnMineArea -119.21 -175.84 10",
	"area pathfield4 OnMineArea -158.78 -158.54 10",
	"area pathfield4 OnMineArea -173.52 -151.78 10",
	"area pathfield4 OnMineArea -189.62 -146.51 10",
	"area pathfield4 OnMineArea -201.03 -142.31 10",
	"area pathfield4 OnMineArea -207.89 -138.49 10",
	"area pathfield4 OnMineArea -210.82 -133.80 10",
	"area pathfield4 OnMineArea -209.40 -129.28 10",
	
	-- minefield north along river AKA minefield 6
	"area pathfield5 OnMineArea 252.52 192.95 10",
	"area pathfield5 OnMineArea 257.72 192.03 10",
	"area pathfield5 OnMineArea 268.12 196.69 10",
	"area pathfield5 OnMineArea 276.07 202.74 10",
	"area pathfield5 OnMineArea 281.15 207.34 10",
	"area pathfield5 OnMineArea 288.07 212.34 10",
	"area pathfield5 OnMineArea 292.83 217.43 10",
	"area pathfield5 OnMineArea 298.51 223.83 10",
	"area pathfield5 OnMineArea 302.78 230.83 10",
	"area pathfield5 OnMineArea 303.50 237.08 10",
	"area pathfield5 OnMineArea 300.02 240.97 10",
	"area pathfield5 OnMineArea 295.18 241.39 10",
	"area pathfield5 OnMineArea 291.78 239.63 10",
	"area pathfield5 OnMineArea 289.30 235.83 10",
	"area pathfield5 OnMineArea 286.23 230.67 10",
	"area pathfield5 OnMineArea 282.26 227.17 10",
	"area pathfield5 OnMineArea 278.38 223.60 10",
	"area pathfield5 OnMineArea 276.07 220.51 10",
	"area pathfield5 OnMineArea 268.89 215.94 10",
	"area pathfield5 OnMineArea 261.70 209.39 10",
	"area pathfield5 OnMineArea 255.76 207.24 10",
	"area pathfield5 OnMineArea 251.03 205.06 10",
	"area pathfield5 OnMineArea 248.58 201.13 10",
	"area pathfield5 OnMineArea 249.47 197.03 10",

		
		
		
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
		"mask depotcapture 4 2 4 0",
		
	
		
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
		"clone bedford1 bedford 148.79 76.60 7.9 5 0 -150",
		
		
		
		
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
		"alert depotcapture depotcapturem 5",

		"alert playarea playarea 10",
		"message.1 axiscapon axiscapon friendly 1",
		"message.1 axiscapoff axiscapoff enemy 1",
		"message.2 axiscapon axiscapon enemy 1",
		"message.2 axiscapoff axiscapoff friendly 1",
		"alert minefield1 minefieldalert 5",
		"alert minefield2 minefieldalert 5",
		"alert minefield3 minefieldalert 5",
		"alert minefield4 minefieldalert 5",
		"alert minefield5 minefieldalert 5",
		"alert minefield6 minefieldalert 5",
		
		"waypoint onspawn southbridge -26.22 -175.19 11.39 #FF6600",
		"waypoint onspawn northbridge 131.01 31.62 10.01 #FF6600",
		"waypoint onspawn petiteferme -225.24 -73.96 10.58 #FF6600",
		"waypoint.2 onspawn dock 350.82 255.78 5.53 #FF6600",
		"waypoint.2 onspawn deobjective 162.66 357.82 24.78 enemy",
		"waypoint.1 onspawn usobjective 162.66 357.82 24.78 friendly",		
		"waypoint.2 onspawn deresupply 59.26 -151.21 10.38 axis",
		"waypoint.1 onspawn usresupply -185.64 -90.68 10.22 allied",
		
		


		
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
		"mask alliedtroops us-rifle",
		"mask alliedtroops us-assault",
		"mask alliedtroops us-bar 7",
		"mask alliedtroops us-sniper 1",
		"mask alliedtroops us-bazooka 3",
		
		"mask alliedvehicles m10_us 4",
		"mask alliedvehicles m4a2_us 2",
	
		-- axis spawn list
		"mask axistroops derifle",
		"mask axistroops de-assault",
		"mask axistroops de-smg 4",
		"mask axistroops de-lmg 3",
		"mask axistroops de-sniper 1",
		"mask axistroops de-pzschreck 3",
		
		"mask axisvehicles stug3g 4",
		"mask axisvehicles pzivg 2",
		

	
	};

	for i,v in ipairs(content) do 
		scenario.manager:AddContent(v);
	end
end



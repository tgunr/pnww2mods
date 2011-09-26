

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
		"ammo pathfield3 landmine",
		"ammo pathfield4 landmine",
		"ammo pathfield5 landmine",
		
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
		
		
		
		
		"block 120.43 11.71 8.50 113.24 3.51 8.5 .5 5",
		"block 126.87 11.04 8.5 131.18 20.28 8.5 .5 5",
		"block 131.37 24.79 8.5 141.70 29.11 8.5 .5 5",
		"block 113.22 3.95 8.5 105.09 -1.72 8.5 .5 5",
		
		
		
		
		
		
		-- bridge sides
		"block 119.60 10.12 8.5 136.69 57.11 8.5 .5 3",
		"block 129.52 20.93 8.5 142.41 55.07 8.5 .5 3",
		
		
		
		
		
		

		

		
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
		"emitter cratersmoke 126.01 -3.17 8.41",
				
		-- SMOKESCREEN

		"emitter smokescreen 140.63 209.79 8.70",
		"emitter smokescreen 55.05 174.74 7.84",
		"emitter smokescreen 15.26 118.73 6.35",
		"emitter smokescreen 278.33 248.17 2.96",
		"emitter smokescreen 261.35 227.52 4.0",
				
		-- SMOKING VEHICLES
		
		"emitter hulksmoke 63.47 42.70 6.56",
		"emitter hulksmoke 136.61 47.66 8.20",
		--"emitter hulksmoke 145.61 71.81 7.30",
		
		
		
		
		
		
		
		-- BURNING VEHICLES

		"emitter cratersmoke 159.46 70.28 2.93",
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
		"sound guns1 sounds/scenarios/ambient_guns_machine_gun1.wav .5 0",
		"sound guns1 sounds/scenarios/ambient_guns_machine_gun2.wav .5 0",
		"sound guns1 sounds/scenarios/ambient_guns_machine_gun3.wav .5 0",
		"sound guns1 sounds/airraidsiren.wav .06 0",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun4.wav .5 0",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun5.wav .5 0",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun6.wav .5 0",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun7.wav .1 0",
		"sound wind sounds/ambience/gust1.wav .3 0",
		"sound wind sounds/ambience/gust2.wav .3 0",

	-- POSITIONAL SOUNDS
	-- command name filename volume loop x y z mindist maxdist

		--"sound sounds/tank_burn.wav 1 1 159 70 3 5 30",
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
		"event guns1 .15 10000",
		"event guns2 .20 30000",
		"event wind .5 5000",
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

		
		
		
	-- bridge capture objective
		"handler capper OnCapper",
		"handler objective1 OnCapturing",
		
		"area bridgecapture OnState 136.36 40.60 6.25 1",
		"area bridgecapture OnState 133.56 33.05 6.25",
		"area bridgecapture OnState 129.00 35.14 6.25",
		"area bridgecapture OnState 131.56 42.40 6.25",
		
-- CLONES --

	-- NAMED VERSION
	-- command name typeid x y z roll pitch yaw

		-- "clone bedford1 bedford -20.11 -156.51 8.77 0 0 90",
		
				
	-- ANONYMOUS VERSION
	-- command typeid x y z roll pitch yaw

		"clone bedford 195.46 151.93 7.5 5 0 -120",
		"clone bedford 198.09 158.75 7.55 5 0 -145",
		"clone bedford 177.19 134.72 7.35 3 -1 -145",
		"clone bedford 145.76 72.52 7.9 -80 10 180",
		"clone bedford 161.05 110.17 7.8 3 -1 -155",
		
		
		


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
		

		
		-- command categorynamealert namealert numberofsecondsbetweenrepeatalerts
		-- numberofsecondsbetweenrepeatalerts 0= no limit, 1= onetime per scenario, unit measure is seconds 
		-- "chat spawnin spawnin.moveout 0",
		"alert onspawn onspawn.moveout 1",
		"alert.1 toaxisspawn toaxisspawn 60",
		"alert.2 toalliedspawn toalliedspawn 60",
		"alert.1 bridgecapture1 bridgecapture 5",
		"alert.1 allieswrongway allieswrongway 30" ,
		"alert playarea playarea 10",
		"alert minefield1 minefieldalert 5",
		"alert minefield2 minefieldalert 5",
		"alert minefield3 minefieldalert 5",
		"alert minefield4 minefieldalert 5",
		"alert minefield5 minefieldalert 5",
		"alert minefield6 minefieldalert 5",
		
		"message.1 alliedcapon alliedcapon friendly 1",
		"message.1 alliedcapoff alliedcapoff enemy 1",
		"message.2 alliedcapon alliedcapon enemy 1",
		"message.2 alliedcapoff alliedcapoff friendly 1",
		
		"waypoint onspawn minefield 91.04 38.93 5.97 #FF6600",
		"waypoint onspawn minefield 195.11 24.16 7.35 #FF6600",
		"waypoint onspawn objective1 132.57 37.60 7.38 axis",
		


		
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
		"mask alliedtroops us-rifle",
		"mask alliedtroops us-assault",
		"mask alliedtroops us-bar 3",
		"mask alliedtroops us-sniper 1",

	
		-- axis spawn list
		"mask axistroops derifle",
		"mask axistroops de-assault",
		"mask axistroops de-smg 3",
		"mask alliedtroops de-sniper 1",


	
	

	
	};

	for i,v in ipairs(content) do 
		scenario.manager:AddContent(v);
	end
end



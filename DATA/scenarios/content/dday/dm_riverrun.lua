

if(true) then
	-- content we're going to add
	local content = 
	{
		
		
		-- we're using minefields, so include that functionality
		"include scenarios/content/minefields.lua",
		
		
		-- landmines 
		"ammo axisminefield1 landmine",
		"ammo pathfield1 landmine",
		"ammo pathfield2 landmine",
		"ammo pathfield3 landmine",
		"ammo pathfield4 landmine",
		"ammo pathfield5 landmine",
		
		
		-- include lua file
		-- command,path
		"include scenarios/terrain/riverrun/map.lua",
		
		-- FX EMMITERS
		
		-- command,effectname,worldx,worldy,worldz
		-- SMOKE
		-- barrels
		"emitter hulksmoke -29.35 -105.79 8.75",
		"emitter hulksmoke -82.57 -95.59 8.5",
		
		-- craters
		"emitter cratersmoke 173.40 -38.89 8",
		"emitter cratersmoke 129.71 -55.96 8",
		"emitter cratersmoke -45.56 -78.53 8",
		"emitter cratersmoke 26.02 -82.75 8",
		"emitter cratersmoke -49.62 -130.94 8",
		-- smokescreen
		"emitter smokescreen -46.03 -224.78 15.92",
		"emitter smokescreen -1.73 -226.20 16.42",
		"emitter smokescreen 160.11 86.18 9.15",
		"emitter smokescreen 106.73 130.54 5.40",
		-- vehicles
		"emitter buildingdamagesmoke -28.16 -171.19 3.25",
		"emitter buildingdamagesmoke 158.6 -16.7 11.25",
		"emitter buildingdamagesmoke 158.46 -16.93 11",
		-- FIRES
		"emitter vehiclefire 104.93 -36.76 9.16",
		"emitter smallfire 157.34 -16.48 8.0",
		"emitter smallfire 31.39 -57.25 9.73",
		"emitter smallfire 95.18 -27.96 8.85",
		
	

		-- SOUNDS
		
		-- ABSOLUTE SOUNDS
		-- command,name,filename,0,0,0,minvol, maxvol
		"sound planes sounds/scenarios/ambient_aircraft_squadron1.wav .2 0",
		"sound planes sounds/scenarios/ambient_aircraft_squadron2.wav .3 0",
		"sound bombs sounds/scenarios/ambient_bombs_distantshells1.wav .4 0",
		"sound bombs sounds/scenarios/ambient_bombs_distantshells2.wav .4 0",
		"sound explosions sounds/scenarios/ambient_explosions_fourinarow.wav .60 0",
		"sound explosions sounds/troop/grenade.wav .40 0",
		"sound guns1 sounds/scenarios/ambient_guns_machine_gun1.wav .5 0",
		"sound guns1 sounds/scenarios/ambient_guns_machine_gun2.wav .5 0",
		"sound guns1 sounds/scenarios/ambient_guns_machine_gun3.wav .5 0",
		"sound guns1 sounds/airraidsiren.wav .06 0",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun4.wav .5 0",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun5.wav .5 0",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun6.wav .5 0",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun7.wav .5 0",
		"sound wind sounds/ambience/gust1.wav .9 0",
		"sound wind sounds/ambience/gust2.wav .9 0",

		-- POSITIONAL SOUNDS
		-- command name filename volume loop x y z mindist maxdist
		"sound sounds/tank_burn.wav 1 1 155 -16 9 5 30",
		"sound sounds/tank_burn.wav 1 1 104 -36 7 5 30",
		"sound sounds/bedford/idle.wav 0.5 1 -29 -149 10 5 30",
		"sound sounds/tank_burn.wav 1 1 29 -57 9 5 30",
		"sound sounds/tank_burn.wav 1 1 95 -285 95 5 30",
		"sound sounds/ambience/stream.wav 1.75 1 123 11 2 10 30",
		"sound sounds/ambience/stream.wav 1.75 1 90 0 3 10 30",
		"sound sounds/ambience/stream.wav 1.75 1 167 76 3 10 30",
		"sound sounds/ambience/stream.wav 1.75 1 220 -46 7 10 30",
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

		
-- play area boundary
-- boundary name x y z
        "boundary playarea -18.52 -163.28 7.49",
		"boundary playarea 77.25 -168.82 6.80",
		"boundary playarea 172.56 -112.25 6.64",
		"boundary playarea 199.10 -84.36 5.14",
		"boundary playarea 215.36 -50.64 5.80",
		"boundary playarea 247.29 -14.12 7.45",
		"boundary playarea 131.47 17.21 9.06",
		"boundary playarea 114.97 2.62 9.06",
		"boundary playarea 72.36 -15.00 7.81",
		"boundary playarea 71.65 -19.75 7.81",
		"boundary playarea -7.73 -22.81 7.25",
		"boundary playarea -44.07 -32.18 7.91",
		"boundary playarea -65.81 -64.97 8.43",
		"boundary playarea -95.09 -112.12 8.43",
		"boundary playarea -89.99 -148.66 6.78",
		"boundary playarea -51.07 -162.15 7.11",


-- blocking volume x
-- block name x1 y1 z1 x2 y2 z2 thickness height

        "block 113.75 -36.33 8.36 64.86 -17.38 7.99 1 10",
        "block 110.22 -43.30 9.13 108.01 -49.00 9.13 1 5",
        "block 118.74 -46.93 9.29 118.07 -49.31 9.29 1 5",
		"block 113.11 -64.25 9.14 111.41 -69.99 9.14 1 5",
		"block 86.81 -35.48 8.65 87.71 -33.34 8.65 1 5",
		"block 87.93 -39.84 9.03 86.42 -44.80 9.03 1 5",
		"block 79.63 -56.51 8.88 78.30 -59.16 8.88 1 5",
		-- problem
		"block 160.19 -84.15 9.05 192.00 -91.65 8.39 1 20",
		"block 72.00 -149.67 9.21 63.92 -146.79 9.21 1 5",
		"block 55.07 -148.98 9.40 56.09 -143.18 9.40 1 5",
		"block 40.01 -149.97 8.88 36.44 -148.25 8.88 1 5",
		"block 27.60 -149.99 10.20 25.01 -143.62 10.20 1 5",
		"block 14.39 -137.70 8.91 10.16 -135.92 8.91 1 5",
		"block 10.79 -129.29 9.39 8.11 -128.38 9.39 1 5",
		"block -4.19 -133.01 9.36 -5.21 -135.98 9.36 1 5",
		"block -16.24 -111.82 8.78 -13.58 -104.72 8.78 1 10",
		"block -25.06 -130.99 8.56 -26.12 -134.46 8.56 1 5",
		"block -42.03 -109.82 9.05 -64.68 -101.46 9.05 1 5",
		"block -70.64 -100.33 9.24 -87.29 -95.49 9.24 1 5",
		"block -51.12 -116.98 9.22 -46.69 -118.53 9.05 1 5",
		-- church tower block
		"block 59.69 -86.42 28.86 62.89 -93.85 28.86 1 3",
		"block 128.77 -20.17 8.10 127.36 -24.06 8.10 1 5",
		"block 128.62 -25.49 8.49 125.71 -28.49 8.49 1 5",
		"block -19.75 -117.60 8.05 -17.22 -111.44 8.05 1 10",
		"block -10.47 -142.64 7.52 -18.59 -161.42 7.00 2.0 25",
		
		
 -- Trigger Areas
		-- church entry
		"area churchentry OnTrigger 69.31 -94.28 8.56",
		"area churchentry OnTrigger 65.96 -109.12 8.91",
		"area churchentry OnTrigger 53.12 -102.63 8.56",
		"area churchentry OnTrigger 57.99 -88.71 8.56",
		-- directions to axis spawn 1
		"area toaxisspawn OnTrigger -3.47 -92.71 9.64",		
		"area toaxisspawn OnTrigger -1.69 -92.32 9.64",
		"area toaxisspawn OnTrigger 3.11 -125.35 9.64",
		"area toaxisspawn OnTrigger 0.38 -124.98 9.64",	

		-- directions to allied spawn 1
		"area toalliedspawn OnTrigger 137.66 -74.92 9.80",	
		"area toalliedspawn OnTrigger 136.96 -76.61 9.80",	
		"area toalliedspawn OnTrigger 114.20 -73.10 9.80",	
		"area toalliedspawn OnTrigger 114.30 -70.45 9.80",
		
		"area intel OnState 55.79 -92.97 26.40 1",
		"area intel OnState 58.13 -86.76 26.40",
		"area intel OnState 64.50 -89.14 26.40",
		"area intel OnState 62.15 -95.43 26.40",
		
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

	
	
	

		
		
		
		
		
		
-- SPAWNS		
		
		-- spawn points
		-- command,spawngroup,worldx,worldy,worldz,yaw
		"spawn alliedtroops -35.72 -152.77 7.82 75",
		"spawn alliedtroops -22.44 -161.92 7.82 65",
		"spawn axistroops 210.55 -15.95 7.81 200",
		"spawn axistroops 216.89 -17.83 7.80 250",

-- CLONES --

		-- named version
		-- command name typeid x y z roll pitch yaw
		-- "clone bedford1 bedford -20.11 -156.51 8.77 0 0 90",
		
		-- anonymous version
		-- command name typeid x y z roll pitch yaw
		"clone bedford -28.25 -172.75 2.5 15 -10 20",
		"clone bedford -19.75 -153.93 9.05 2 0 0",
		"clone bedford -27.34 -150.10 8.9 4 0 285",
		"clone bedford -35.21 -147.32 8.85 6 2 285",
		"clone oplbltz 185.26 -52.26 8.5 0 0 290",
		"clone oplbltz 176.32 -20.12 8.55 0 0 180",
		
		"clone sdkfz251c 136.15 -57.69 9.22 0 0 25",
		--"clone sdkfz251c 139.67 -59.58 9.22 0 0 30",
		"clone sdkfz251c 143.12 -61.43 9.22 0 0 30",
		
		"clone pzivg 131.93 -42.38 9 0 0 105",
		
		"waypoint onspawn wp2 210.55 -15.95 8.11 enemy",
		"waypoint onspawn wp1 -36.00 -153.15 7.88 friendly",
		"waypoint onspawn wp3 60.61 -91.40 27.17 friendly",

		-- ALERTS AND CHATS
		-- ADD A CHAT TO THE CHAT WINDOW
		
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
		"alert onspawn onspawn.moveout 60",
		"alert churchentry churchentry 120",
		"alert toaxisspawn toaxisspawn 60",
		"alert toalliedspawn toalliedspawn 60",
		"alert roundstop roundstop",
		"alert victory1 victory1",
		"alert victory2 victory2",
		"alert playarea playarea 10",
		"alert minefield1 minefieldalert 5",
		"alert minefield2 minefieldalert 5",
		"alert minefield3 minefieldalert 5",
		"alert minefield4 minefieldalert 5",
		"alert minefield5 minefieldalert 5",
		"alert minefield6 minefieldalert 5",
		
		"message intelenemyon intelenemyon #00FF00 0",
		"message intelenemyoff intelenemyoff #FF0000 0",
		"message intelfriendlyon intelfriendlyon #FF0000 0",
		"message intelfriendlyoff intelfriendlyoff #00FF00 0",
		

		
		-- vehicle masks
		
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
		
	-- allied spawn list
		"mask alliedtroops us-rifle",
		"mask alliedtroops us-assault",
		"mask alliedtroops us-bar 5",
		"mask alliedtroops us-sniper 1",

	-- axis spawn list
	
		"mask axistroops derifle",
		"mask axistroops de-assault",
		"mask axistroops de-smg 5",
		"mask axistroops de-sniper 1",



	};

	for i,v in ipairs(content) do 
		scenario.manager:AddContent(v);
	end
end



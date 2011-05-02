

if(true) then
	-- content we're going to add
	local content = 
	{
		-- include lua file
		-- command,path
		"include scenarios/terrain/lepontdumal/map.lua",
		"ammo landmine landmine",
		
		-- FX EMMITERS
		
		-- command,effectname,worldx,worldy,worldz
		-- SMOKE
		-- barrels
		-- "emitter hulksmoke -25.16 -97.95 8.75",
		-- "emitter hulksmoke -29.35 -105.79 8.75",
		-- "emitter hulksmoke -82.57 -95.59 8.5",
		
		
		-- craters
		-- "emitter cratersmoke 173.40 -38.89 8",
		-- "emitter cratersmoke 129.71 -55.96 8",
		-- "emitter cratersmoke -45.56 -78.53 8",
		-- "emitter cratersmoke 26.02 -82.75 8",
		-- "emitter cratersmoke -49.62 -130.94 8",
		-- smokescreen
		"emitter smokescreen 263.71 229.63 5.5",
		"emitter smokescreen 115.21 115.45 6.69",
		"emitter smokescreen 157.29 164.70 9.15",
		
		

		
		
		
		
		-- VEHICLES
		-- SMOKE
		"emitter hulksmoke 96.32 156.61 8.39",
		"emitter hulksmoke 80.36 109.08 6.5",
		
		
		
		-- "emitter buildingdamagesmoke 158.6 -16.7 11.25",
		-- "emitter buildingdamagesmoke 158.46 -16.93 11",
		-- FIRES
		"emitter vehiclefire 152.80 64.43 3.21",
		-- "emitter vehiclefire 157.34 -16.48 8.08",
		-- "emitter vehiclefire 31.39 -57.25 9.73",

		-- SOUNDS
		
		-- ABSOLUTE SOUNDS
		-- command,name,filename,0,0,0,minvol, maxvol
		"sound planes sounds/scenarios/ambient_aircraft_squadron1.wav .2 0",
		"sound planes sounds/scenarios/ambient_aircraft_squadron2.wav .3 0",
		"sound bombs sounds/scenarios/ambient_bombs_distantshells1.wav .4 0",
		"sound bombs sounds/scenarios/ambient_bombs_distantshells2.wav .4 0",
		"sound explosions sounds/scenarios/ambient_explosions_fourinarow.wav .60 0",
		"sound explosions sounds/troop/grenade.wav .40 0",
		"sound guns1 sounds/scenarios/ambient_guns_machine_gun1.wav .20 0",
		"sound guns1 sounds/scenarios/ambient_guns_machine_gun2.wav .25 0",
		"sound guns1 sounds/scenarios/ambient_guns_machine_gun3.wav .30 0",
		"sound guns1 sounds/airraidsiren.wav .06 0",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun4.wav .25 0",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun5.wav .25 0",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun6.wav .15 0",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun7.wav .4 0",
		"sound wind sounds/ambience/gust1.wav .9 0",
		"sound wind sounds/ambience/gust2.wav .9 0",

		-- POSITIONAL SOUNDS
		-- command name filename volume loop x y z mindist maxdist
		"sound sounds/tank_burn.wav 1.5 1 151 62 3 5 30",
		"sound sounds/bedford/idle.wav 0.5 1 198 148 8 15 40",
		-- "sound sounds/tank_burn.wav 1 1 29 -57 9 5 30",
		-- a line of bombs (as from a plane)
		-- command,name,ammo,worldx1,worldy1,worldz1,worldx2,worldy2,worldz2
		"bombingrun bombing1 gp250 90.62 211.47 18.81 12.92 91.85 18.81",
		"bombingrun bombing1 gp250 35.65 250.44 21.31 -16.21 206.43 21.31",
		"bombingrun bombing1 gp500 142.60 -153.42 6.93 -4.35 -116.20 21.49",
		-- "bombingrun bombing1 gp250 -69.51 80.01 6.21 -177.68 11.25 6.21",
		-- "bombingrun bombing2 gp40 142.60 -153.42 6.93 6.27 -182.85 2.72",
		-- "bombingrun bombing2 gp40 212.53 -134.06 19.33 163.59 -134.66 4.72",
		-- an area effect bombing
		-- the x,y,z is the center of the barrage
		-- the distance is the radius of a circle around the center to randomly fire off the ammo in
		-- command name ammo x y z distance
		"barrage barrage1 gp40 -136.68 204.49 12.79 50",
		"barrage barrage1 gp40 48.05 317.05 18.90 25",
		-- "barrage barrage1 gp40 -266.85 -36.03 5.26 50",

		
		-- TRIGGERS
		
		-- commandname,pctg chance each second,wait in seconds
		"event planes .40 120000",
		"event bombs .10 20000",
		-- "event explosions .20 25000",
		-- "event guns1 .15 10000",
		"event guns2 .20 30000",
		"event wind .5 5000",
		-- "event bombing1 .10 100000 500 6",
		-- "event bombing2 .10 20000 750 3",
		-- "event barrage1 .25 60000 700 10",

		
-- play area boundary
-- boundary name x y z
		"boundary  playarea 293.95 48.96 4.02",
		"boundary  playarea 291.80 20.31 3.54",
		"boundary  playarea 272.08 -1.04 4.86",
		"boundary  playarea 233.77 -27.03 6.49",
		"boundary  playarea 214.87 -51.04 6.16",
		"boundary  playarea 194.60 -89.02 5.51",
		"boundary  playarea 180.68 -104.04 7.40",
		"boundary  playarea 65.32 -65.03 8.72",
		"boundary  playarea 71.66 -18.64 7.97",
		"boundary  playarea 50.53 41.71 6.76",
		"boundary  playarea 253.17 235.51 8.20",
		"boundary  playarea 278.89 205.99 2.88",
		"boundary  playarea 267.66 196.51 2.71",
		"boundary  playarea 255.16 188.76 3.37",
		"boundary  playarea 230.83 161.14 3.86",
		"boundary  playarea 226.47 143.70 3.36",
		"boundary  playarea 219.33 110.95 3.04",
		"boundary  playarea 208.76 97.85 2.87",
		"boundary  playarea 192.89 90.25 3.19",
		"boundary  playarea 173.55 78.37 2.70",
		"boundary  playarea 160.32 74.79 2.86",
		"boundary  playarea 154.56 71.03 3.68",
		"boundary  playarea 148.51 60.52 3.68",
		"boundary  playarea 227.37 48.91 7.64",
		
		
		
		
	
		


		
		
		


-- blocking volume x
-- block name x1 y1 z1 x2 y2 z2 thickness height

        "block 115.87 -26.77 9.13 104.61 -22.48 9.13 1 5",
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
		"block -16.14 -109.44 9.72 -15.41 -106.91 9.72 1 5",
		"block -25.06 -130.99 8.56 -26.12 -134.46 8.56 1 5",
		"block -42.03 -109.82 9.05 -64.68 -101.46 9.05 1 5",
		"block -70.64 -100.33 9.24 -87.29 -95.49 9.24 1 5",
		"block -51.12 -116.98 9.22 -46.69 -118.53 9.05 1 5",
		"block 59.69 -86.42 28.86 62.89 -93.85 28.86 1 5",
		"block 128.77 -20.17 8.10 127.36 -24.06 8.10 1 5",
		"block 128.62 -25.49 8.49 125.71 -28.49 8.49 1 5",
		
		
		
		
		
		



 -- Trigger Areas
		-- church entry
		"area churchentry OnTrigger 69.31 -94.28 8.56",
		"area churchentry OnTrigger 65.96 -109.12 8.91",
		"area churchentry OnTrigger 53.12 -102.63 8.56",
		"area churchentry OnTrigger 57.99 -88.71 8.56",
		-- directions to axis spawn 1
		"area toaxisspawn OnTrigger -21.23 -148.85 9.48",		
		"area toaxisspawn OnTrigger -17.12 -137.68 9.48",
		"area toaxisspawn OnTrigger -8.90 -140.18 9.48",
		"area toaxisspawn OnTrigger -13.67 -150.27 9.48",	

		-- directions to allied spawn 1
		"area toalliedspawn OnTrigger 206.57 -6.40 8.17",	
		"area toalliedspawn OnTrigger 199.36 -22.17 8.17",	
		"area toalliedspawn OnTrigger 178.45 -19.22 8.17",	
		"area toalliedspawn OnTrigger 176.68 1.85 8.17",		

		-- minefield near axis spawn
		"area axisminefield1 OnMineArea 146.43 21.67 8.48",
		"area axisminefield1 OnMineArea 293.38 18.17 4.19",
		"area axisminefield1 OnMineArea 297.08 32.59 4.69",
		"area axisminefield1 OnMineArea 156.79 60.77 7.16",
		
		-- minefield east side of path
		"area pathfield1 OnMineArea 97.08 5.36 2.36",
		"area pathfield1 OnMineArea 95.03 24.23 5.85",
		"area pathfield1 OnMineArea 98.29 30.91 5.85",
		"area pathfield1 OnMineArea 110.15 31.92 5.69",
		"area pathfield1 OnMineArea 128.99 36.36 5.87",
		"area pathfield1 OnMineArea 123.00 27.80 2.72",
		"area pathfield1 OnMineArea 104.61 11.56 2.74",
		
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
		-- "area pathfield1 OnMineArea 185.42 16.89 8.77",
		-- "area pathfield1 OnMineArea 185.42 16.89 8.77",
		-- "area pathfield1 OnMineArea 185.42 16.89 8.77",
		-- "area pathfield1 OnMineArea 185.42 16.89 8.77",
		
		
		
		
		
		
		

		
		
		
			
		
		
		
		



		
		
-- SPAWNS		
		
		-- spawn points
		-- command,spawngroup,worldx,worldy,worldz,yaw
		"spawn alliedtroops 213.11 152.80 5.55 -1.35",
		"spawn alliedtroops 203.77 146.97 6.37 -1.8",
		"spawn axistroops 210.55 -15.95 7.81 -2.20",
		"spawn axistroops 216.89 -17.83 7.80 -2.29",

-- CLONES --

		-- named version
		-- command name typeid x y z roll pitch yaw
		-- "clone bedford1 bedford -20.11 -156.51 8.77 0 0 90",
		
		
		
		
		-- anonymous version
		-- command name typeid x y z roll pitch yaw
		"clone bedford 199.68 144.04 6.9 5 0 -90",
		"clone bedford 200.34 148.35 6.9 5 0 -110",
		"clone bedford 192.31 147.46 7.33 3 -1 -130",
		"clone pzivd 95.72 156.42 8.3 3 -1 0",
		"clone pzivd 79.79 108.67 5.58 3 -1 20",
		
		
		
		
		
		
	
		
		
		
		-- "clone bedford -19.75 -153.93 9.05 2 0 0",
		-- "clone bedford -27.34 -150.10 8.9 4 0 285",
		-- "clone bedford -35.21 -147.32 8.85 6 2 285",
		-- "clone oplbltz 192.79 -31.45 8.5 5 -4.25 205",
		-- "clone oplbltz 176.32 -20.12 8.55 0 0 180",

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
		"alert onspawn onspawn.moveout",
		"alert churchentry churchentry",
		"alert toaxisspawn toaxisspawn",
		"alert toalliedspawn toalliedspawn",

		
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
		"vehicle alliedtroops 1 0 9 0",
		"vehicle axistroops 4 0 9 0",
	};

	for i,v in ipairs(content) do 
		scenario.manager:AddContent(v);
	end
end



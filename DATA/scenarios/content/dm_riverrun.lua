

if(true) then
	-- content we're going to add
	local content = 
	{
		-- include lua file
		-- command,path
		"include scenarios/terrain/riverrun/map.lua",
		
		-- FX EMMITERS
		
		-- command,effectname,worldx,worldy,worldz
		-- SMOKE
		-- barrels
		"emitter hulksmoke -25.16 -97.95 8.75",
		"emitter hulksmoke -29.35 -105.79 8.75",
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
		"emitter vehiclefire 107.62 -29.90 9.36",
		"emitter vehiclefire 157.34 -16.48 8.08",
		"emitter vehiclefire 31.39 -57.25 9.73",

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
		"sound sounds/tank_burn.wav 1 1 155 -16 9 5 30",
		"sound sounds/tank_burn.wav 1 1 109 -29 9 5 30",
		"sound sounds/bedford/idle.wav 0.5 1 -29 -149 10 5 30",
		"sound sounds/tank_burn.wav 1 1 29 -57 9 5 30",
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
		-- "event planes .40 120000",
		-- "event bombs .10 20000",
		-- "event explosions .20 25000",
		-- "event guns1 .15 10000",
		-- "event guns2 .20 30000",
		-- "event wind .5 5000",
		-- "event bombing1 .10 15000 500 6",
		-- "event bombing2 .10 20000 750 3",
		-- "event barrage1 .20 60000 700 10",

		
-- play area boundary
-- boundary name x y z
        "boundary  playarea 123.50 16.88 8.81",
		"boundary  playarea 119.96 7.25 8.81",
		"boundary  playarea 117.94 6.58 8.81",
		"boundary  playarea 103.32 -30.96 8.81",
		"boundary  playarea 72.26 -18.62 8.13",
		"boundary  playarea 44.86 -17.87 8.62",
		"boundary  playarea 14.04 -22.06 7.96",
		"boundary  playarea -40.83 -33.68 9.94",
		"boundary  playarea -61.39 -60.51 9.28",
		"boundary  playarea -84.86 -96.73 9.28",
		"boundary  playarea -93.22 -116.15 8.78",
		"boundary  playarea -86.72 -148.06 8.12",
		"boundary  playarea -47.49 -160.09 8.12",
		"boundary  playarea -24.34 -160.30 8.94",
		"boundary  playarea -25.94 -167.04 8.94",
		"boundary  playarea -21.34 -167.12 8.94",
		"boundary  playarea -16.20 -156.55 8.29",
		"boundary  playarea -12.32 -149.09 10.60",
		"boundary  playarea 58.91 -171.27 8.45",
		"boundary  playarea 95.91 -157.52 8.11",
		"boundary  playarea 162.80 -117.61 7.44",
		"boundary  playarea 188.78 -94.16 7.10",
		"boundary  playarea 213.74 -51.82 6.77",
		"boundary  playarea 236.67 -12.60 7.58",
		"boundary  playarea 211.11 -6.05 8.25",
		"boundary  playarea 132.75 14.76 9.53",
		
		
		


-- blocking volume x
-- block name x1 y1 z1 x2 y2 z2 thickness height

        "block 115.87 -26.77 9.13 104.61 -22.48 9.13 .5 5",
        "block 110.22 -43.30 9.13 108.01 -49.00 9.13 .5 5",
        "block 118.74 -46.93 9.29 118.07 -49.31 9.29 .5 5",
		"block 113.11 -64.25 9.14 111.41 -69.99 9.14 .5 5",
		"block 86.81 -35.48 8.65 87.71 -33.34 8.65 .5 5",
		"block 87.93 -39.84 9.03 86.42 -44.80 9.03 .5 5",
		"block 79.63 -56.51 8.88 78.30 -59.16 8.88 .5 5",
		-- problem
		"block 160.19 -84.15 9.05 192.00 -91.65 8.39 .5 20",
		"block 72.00 -149.67 9.21 63.92 -146.79 9.21 .5 5",
		"block 55.07 -148.98 9.40 56.09 -143.18 9.40 .5 5",
		"block 40.01 -149.97 8.88 36.44 -148.25 8.88 .5 5",
		"block 27.60 -149.99 10.20 25.01 -143.62 10.20 1 5",
		"block 14.39 -137.70 8.91 10.16 -135.92 8.91 .5 5",
		"block 10.79 -129.29 9.39 8.11 -128.38 9.39 .5 5",
		"block -4.19 -133.01 9.36 -5.21 -135.98 9.36 .5 5",
		"block -16.14 -109.44 9.72 -15.41 -106.91 9.72 .5 5",
		"block -25.06 -130.99 8.56 -26.12 -134.46 8.56 .5 5",
		"block -42.03 -109.82 9.05 -64.68 -101.46 9.05 .5 5",
		"block -70.64 -100.33 9.24 -87.29 -95.49 9.24 .5 5",
		"block -51.12 -116.98 9.22 -46.69 -118.53 9.05 .5 5",
		"block 59.69 -86.42 28.86 62.89 -93.85 28.86 .5 5",
		"block 128.77 -20.17 8.10 127.36 -24.06 8.10 .5 5",
		"block 128.62 -25.49 8.49 125.71 -28.49 8.49 .5 5",
		
		
		
		
		
		



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
		
-- SPAWNS		
		
		-- spawn points
		-- command,spawngroup,worldx,worldy,worldz,yaw
		"spawn alliedtroops -35.72 -152.77 7.82 0.44",
		"spawn alliedtroops -22.44 -161.92 7.82 0.41",
		"spawn axistroops 210.55 -15.95 7.81 -2.20",
		"spawn axistroops 216.89 -17.83 7.80 -2.29",

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
		"clone oplbltz 192.79 -31.45 8.5 5 -4.25 205",
		"clone oplbltz 176.32 -20.12 8.55 0 0 180",

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
		"alert onspawn spawnin.moveout",
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



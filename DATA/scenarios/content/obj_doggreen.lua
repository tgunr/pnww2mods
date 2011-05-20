

if(true) then
	-- content we're going to add
	local content = 
	{
		-- include lua file
		-- command,path
		"include scenarios/terrain/doggreen/map.lua",
		
		-- we're using minefields, so include that functionality
		"include scenarios/content/minefields.lua",
-- landmines
		"ammo landmine1 landmine",
		"ammo landmine2 landmine",
		"ammo landmine3 landmine",
		"ammo landmine4 landmine",

		
		
		-- minefield near sea wall

		"area landmine1 OnMineArea -52.73 22.46 11.19",
		"area landmine1 OnMineArea -19.20 8.37 10.11",
		"area landmine1 OnMineArea -25.96 -9.07 11.06",
		"area landmine1 OnMineArea -58.75 7.83 12.72",
		
		-- minefield in pass

		"area landmine2 OnMineArea -238.57 -157.20 29.71",
		"area landmine2 OnMineArea -274.13 -150.23 33.62",
		"area landmine2 OnMineArea -266.99 -132.37 32.60",
		"area landmine2 OnMineArea -234.92 -140.04 30.30",
		
		-- minefield near trenches

		"area landmine3 OnMineArea -150.06 -111.74 41.79",
		"area landmine3 OnMineArea -146.66 -120.37 43.32",
		"area landmine3 OnMineArea -136.47 -140.56 44.30",
		"area landmine3 OnMineArea -122.84 -156.74 44.62",
		"area landmine3 OnMineArea -110.82 -159.85 44.98",
		"area landmine3 OnMineArea -65.32 -177.60 45.94",
		"area landmine3 OnMineArea -29.01 -182.40 46.18",
		"area landmine3 OnMineArea -22.36 -201.45 46.13",
		"area landmine3 OnMineArea -72.23 -197.98 45.70",
		"area landmine3 OnMineArea -144.88 -172.45 44.71",
		"area landmine3 OnMineArea -163.07 -121.14 40.25",
		
		-- minefield on top near pass

		"area landmine4 OnMineArea -205.26 -226.24 41.18",
		"area landmine4 OnMineArea -113.98 -198.53 46.55",
		"area landmine4 OnMineArea -90.56 -191.55 45.90",
		
		
		"area landmine4 OnMineArea -57.97 -199.01 46.01",
		"area landmine4 OnMineArea -213.05 -246.95 40.96",

		

		
		
		
		
		
		
		
		
-- DEFINE THE PLAY AREA

	-- boundary name x y z

        "boundary  playarea -142.63 321.31 9.23",
		"boundary  playarea -214.73 138.02 9.23",
		"boundary  playarea -309.78 98.42 39.80",
		"boundary  playarea -279.94 77.27 38.73",
		"boundary  playarea -270.80 64.76 39.02",
		"boundary  playarea -275.90 54.57 40.72",
		"boundary  playarea -227.46 11.40 30.52",
		"boundary  playarea -222.79 5.68 28.20",
		"boundary  playarea -230.07 -14.92 28.85",
		"boundary  playarea -233.67 -22.43 29.86",
		"boundary  playarea -235.72 -29.72 30.10",
		"boundary  playarea -234.75 -43.40 27.56",
		"boundary  playarea -248.04 -76.79 30.46",
		"boundary  playarea -277.86 -163.38 32.83",
		-- next is the turn left
		"boundary  playarea -312.69 -296.01 36.83",
		"boundary  playarea -237.51 -305.47 36.48",
		"boundary  playarea -213.12 -246.49 41.56",
		"boundary  playarea -112.50 -213.10 45.58",
		"boundary  playarea -20.67 -200.95 45.61",
		"boundary  playarea -27.97 -181.20 46.10",
		"boundary  playarea 10.24 -185.30 45.73",
		"boundary  playarea 42.59 -174.86 44.43",
		"boundary  playarea 81.10 -160.29 38.69",
		"boundary  playarea 63.36 -143.17 39.46",
		"boundary  playarea 387.36 20.70 7.75",
		
		
		-- blocking volume x
		-- block name x1 y1 z1 x2 y2 z2 thickness height

        "block -138.05 -28.20 35.57 -132.87 -24.58 36.25 .5 5",
		"block -132.87 -24.58 36.25 -126.31 -23.86 35.69 .5 5",
		"block -126.31 -23.86 35.69 -111.48 -31.42 37.17 .5 5",
		"block -103.98 -33.89 38.41 -92.23 -32.63 36.87 .5 5",
		"block -92.23 -32.63 36.87 -84.42 -34.53 36.28 .5 5",
		"block -84.42 -34.53 36.28 -75.88 -43.07 38.09 .5 5",
		"block -75.88 -43.07 38.09 -70.95 -49.17 38.05 .5 5",
		"block -70.95 -49.17 38.05 -66.98 -65.28 41.11 .5 5",
		"block -66.98 -65.28 41.11 -63.05 -70.97 41.34 .5 5",
		"block -63.05 -70.97 41.34 -56.44 -74.28 41.15 .5 5",
		"block -45.57 -80.27 41.25 -35.24 -83.76 41.56 .5 5",
		"block -35.24 -83.76 41.56 -19.86 -83.40 39.85 .5 5",
		"block -19.86 -83.40 39.85 -4.74 -88.94 39.09 .5 5",
		"block -4.74 -88.94 39.09 10.68 -97.96 38.12 .5 5",
		"block 19.78 -99.91 37.61 29.41 -112.02 38.49 .5 5",
		"block 29.41 -112.02 38.49 49.41 -131.41 39.42 .5 5",
		

		"block -177.15 -94.10 32.84 -169.36 -95.42 38.71 .5 5",
		"block -169.36 -95.42 38.71 -160.03 -101.24 40.03 .5 5",
		"block -160.03 -101.24 40.03 -154.04 -106.05 41.39 .5 5",
		"block -154.04 -106.05 41.39 -143.90 -122.60 43.89 .5 5",
		"block -139.45 -132.42 44.13 -135.78 -140.09 44.80 .5 5",
		"block -135.78 -140.09 44.80 -133.70 -146.67 45.03 .5 5",
		"block -133.70 -146.67 45.03 -129.05 -152.25 44.84 .5 5",
		"block -129.05 -152.25 44.84 -122.60 -156.35 45.44 .5 5",
		"block -122.60 -156.35 45.44 -111.60 -158.92 45.33 .5 5",
		"block -111.60 -158.92 45.33 -65.01 -176.65 46.13 .5 5",
		"block -65.01 -176.65 46.13 -36.02 -179.75 46.18 .5 5",
		--"block -155.19 -67.47 39.18 -149.68 -57.18 38.71 .5 5",
		--"block -155.19 -67.47 39.18 -149.68 -57.18 38.71 .5 5",
		--"block -155.19 -67.47 39.18 -149.68 -57.18 38.71 .5 5",
		--"block -155.19 -67.47 39.18 -149.68 -57.18 38.71 .5 5",
		--"block -155.19 -67.47 39.18 -149.68 -57.18 38.71 .5 5",
		
		
		
		"block -205.93 -227.67 42.02 -194.26 -192.35 41.94 .5 5",
		"block -192.81 -183.28 41.75 -185.93 -147.34 39.54 .5 5",
		"block -182.07 -138.30 38.74 -174.57 -123.09 38.44 .5 5",
		
		"block -170.18 -113.46 38.64 -161.65 -95.47 39.16 .5 5",
		"block -161.65 -95.47 41 -155.19 -67.47 41 .5 2.5",
		"block -155.19 -67.47 39.18 -149.68 -57.18 38.71 .5 5",
		"block -149.68 -57.18 38.71 -141.49 -34.65 36.83 .5 5",
		--"block -155.19 -67.47 39.18 -149.68 -57.18 38.71 .5 5",
		--"block -155.19 -67.47 39.18 -149.68 -57.18 38.71 .5 5",
		--"block -155.19 -67.47 39.18 -149.68 -57.18 38.71 .5 5",
		--"block -155.19 -67.47 39.18 -149.68 -57.18 38.71 .5 5",
		--"block -155.19 -67.47 39.18 -149.68 -57.18 38.71 .5 5",
		--"block -155.19 -67.47 39.18 -149.68 -57.18 38.71 .5 5",
		
		
		
		
		
		
		
		
		
		
		
		
		
		

		
		
	-- american capture objective

		"area germanhq OnTrigger -21.98 -157.93 46.33",
		"area germanhq OnTrigger -22.45 -143.22 46.33",
		"area germanhq OnTrigger -16.07 -142.60 46.33",
		"area germanhq OnTrigger -15.39 -156.44 46.33",	
		
		
		
		
		
		
		
		
	-- FX EMITTERS

	-- command,effectname,worldx,worldy,worldz
	-- smoke effects

		-- SMOKING BARRELS

		-- "emitter hulksmoke 273119.68 3016921.62 482.00",
		-- "emitter hulksmoke -29.35 -105.79 9.06",

		-- SMOKING CRATERS

		-- "emitter hulksmoke 173.40 -38.89 6.9",
		-- "emitter hulksmoke 129.71 -55.96 7.0",

		-- SMOKESCREEN

		"emitter smokescreen -97.32 -2.10 21",
		"emitter smokescreen -121.65 6.49 23",
		"emitter smokescreen -30.43 -51.98 23.78",		
		"emitter smokescreen -64.53 80.62 8",	
		"emitter smokescreen 27.01 -92.92 30.51",
		"emitter smokescreen -37.89 -59.64 31.44",
		"emitter smokescreen -79.64 -24.46 30.00",
		"emitter smokescreen -129.96 99.52 9.5",
		
		-- VEHICLES
		
		-- hulk smoke
		"emitter hulksmoke -39.93 247.32 3.35",
		
		-- fire
		"emitter smallfire -49.57 163.99 5.5",
		
		
		
		
		-- POSITIONAL SOUNDS
	-- command name filename volume loop x y z mindist maxdist	
	"sound sounds/ambience/ocean.wav 10 1 -63 212 3 100 1000",	
		
		
-- CLONES --

	-- NAMED VERSION
	-- command name typeid x y z roll pitch yaw

		-- "clone bedford1 bedford -20.11 -156.51 8.77 0 0 90",
		
				
	-- ANONYMOUS VERSION
	-- command typeid x y z roll pitch yaw

		"clone uk_z34 509.16 922.13 3.3 0 0 90",
		"clone pak40 -350.63 199.13 22.5 0 0 90 ",
		"clone pak40 -172.00 93.24 12.2 0 0 90 ",
		"clone pak40 -124.42 46.24 12.6 0 -10 90 ",
		
-- an area effect bombing
		-- the x,y,z is the center of the barrage
		-- the distance is the radius of a circle around the center to randomly fire off the ammo in
		-- command name ammo x y z distance
		"barrage barrage1 gp40 5.53 38.02 7.26 25",
		"barrage barrage1 gp40 22.29 93.76 7.14 25",
		"barrage barrage2 gp40 56.59 26.72 9.28 25",
		"barrage barrage2 gp40 -88.00 138.96 6.50 25",

		

		-- TRIGGERS
		
		-- commandname,pctg chance each second,wait in seconds, ms between bombs, number of bombs
		-- "event barrage1 1 5000 700 10",
		-- "event barrage2 1 5000 700 10",
		
	

	
	
		
		
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

		"alert onspawn onspawn.moveout",
		"alert toaxisspawn toaxisspawn",
		"alert toalliedspawn toalliedspawn",
		"alert germanhq germanhq",
		
		
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
		"vehicle alliedtroops us-assault",
		"vehicle alliedtroops us-smg",
		"vehicle alliedtroops us-bar",
		"vehicle alliedtroops us-sniper",

		-- axis spawn list
		"vehicle axistroops de_assaul",
		"vehicle axistroops de-smg",
		"vehicle axistroops de-lmg",
		"vehicle axistroops de-sniper",
		
		
-- DEFINE WHERE PLAYERS SPAWN

	-- command spawngroup worldx worldy,worldz yaw

		"spawn alliedtroops -9.45 169.72 4.21",
		"spawn axistroops -135.49 -116.56 42.35",
		"spawn axistroops -131.18 -94.50 42.86",

		
				
		
		
		

	};

	for i,v in ipairs(content) do 
		scenario.manager:AddContent(v);
	end
end



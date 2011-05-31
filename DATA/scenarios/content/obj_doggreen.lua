

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

        "block -143.36 -23.85 34.41 -132.87 -24.58 36.25 .5 5",
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
		"block -35.24 -83.76 41.56 -19.86 -83.40 41.5 .5 1",
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
		
		
		"block -147.66 -29.12 35.79 -147.01 -32.24 36.02 .5 2",
		"block -146.29 -33.66 36.95 -143.25 -34.98 36.95 .5 2",
		
		
		
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

		"emitter cratersmoke -100.77 167.75 3.72",
		"emitter cratersmoke -94.12 107.80 5.35",
		"emitter cratersmoke -13.15 63.35 5.15",
		"emitter cratersmoke 134.57 -4.02 5.16",
		"emitter cratersmoke 59.42 25.24 6.21",
		
		
		
		
		
		-- "emitter hulksmoke 129.71 -55.96 7.0",

		-- SMOKESCREEN

		-- cliffs
		"emitter smokescreen -97.32 -2.10 21",
		"emitter smokescreen -121.65 6.49 23",
		"emitter smokescreen -30.43 -51.98 23.78",		
		"emitter smokescreen 27.01 -92.92 30.51",
		"emitter smokescreen -37.89 -59.64 31.44",
		"emitter smokescreen -79.64 -24.46 30.00",
		-- beach
		"emitter smokescreen 13.54 29.78 6.03",
		"emitter smokescreen -45.14 73.00 6.06",
	
		
		
		-- VEHICLES
		
		-- hulk smoke
		"emitter hulksmoke -39.93 247.32 3.35",
		"emitter cratersmoke -28.21 140.03 4.5",
		"emitter cratersmoke -95.29 199.18 4.25",
		
		
		
		
		-- fire
		"emitter smallfire -49.57 163.99 5.5",
		
		
		
		
		-- POSITIONAL SOUNDS
	-- command name filename volume loop x y z mindist maxdist	
	--"sound sounds/ambience/ocean.wav 10 1 -63 212 3 100 1000",	
	
	"sound sounds/fairmileb/idle.wav 2.0 1 45 151 4 5 25",
	"sound sounds/fairmileb/idle.wav 2.0 1 -10 182 6 5 25",
	"sound sounds/fairmileb/idle.wav 2.0 1 -82 203 3 5 25",

	
		
		
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
		--water barrage
		"barrage barrage1 gp40 116.65 116.02 3.71 10",
		"barrage barrage1 gp40 31.96 209.20 3.65 10",
		"barrage barrage1 gp40 -31.68 216.85 3.43 10",
		"barrage barrage1 gp40 -132.15 260.19 3.76 10",
		"barrage barrage1 gp40 -21.96 257.21 3.29 10",
		"barrage barrage1 gp40 116.84 221.86 3.50 10",
		"barrage barrage1 gp40 95.87 239.86 3.40 10",
		--beach barrage
		"barrage barrage2 smallbarragebomb 56.59 26.72 9.28 25",
		"barrage barrage2 smallbarragebomb -186.00 218.52 5.85 25",
		"barrage barrage2 smallbarragebomb -112.80 90.21 7.10 25",
		"barrage barrage2 smallbarragebomb -24.70 36.06 7.82 25",
		"barrage barrage3 smallbarragebomb -152.16 92.97 9.03 15",
		"barrage barrage3 smallbarragebomb -40.36 84.07 6.04 30",
		"barrage barrage3 smallbarragebomb -42.67 103.15 6.71 15",
		-- cliff barrage
		"barrage barrage4 gp40 -25.76 -59.66 30.32 25",
		"barrage barrage4 gp40 30.72 -102.28 33.67 25",
		"barrage barrage4 gp40 -81.77 -22.06 31.72 25",
		"barrage barrage4 gp40 -106.13 50.48 14.47 25",

		

		-- TRIGGERS
		
		-- commandname,pctg chance each second,wait in seconds, ms between bombs, number of bombs
		--"event barrage1 .50 10000 700 1",
		--"event barrage2 1 15000 2000 3",
		--"event barrage3 .9 30000 1000 3",
		--"event barrage4 .9 15000 1000 1",

		
		
		-- bunker capture objective
		"handler bunkercapture OnCapper",

		"area bunkercapture OnCapture -27.87 -80.51 39 -1",
		"area bunkercapture OnCapture -31.62 -79.72 39",
		"area bunkercapture OnCapture -30.69 -76.96 39",
		"area bunkercapture OnCapture -27.70 -77.38 39",
		

		
	

	
	
		
		
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
		"alert playarea playarea 10",		
		"alert usspawn1 usspawn1 60",
		"alert usspawn2 usspawn2 60",
		"alert usspawn3 usspawn3 60",
		
		"location usspawn1 OnTrigger 42.78 144.53 5.16",	
		"location usspawn2 OnTrigger -17.97 174.13 4.32 5",	
		"location usspawn3 OnTrigger -82.85 195.88 4.08 5",	
		
		
		"message.1 youcapon youcapon friendly 0",
		"message.1 alliedcapon alliedcapon friendly 0",
		"message.1 alliedcapoff alliedcapoff enemy 0",
		"message.2 alliedcapon alliedcapon enemy 0",
		"message.2 alliedcapoff alliedcapoff friendly 0",

		

		
		
-- WAYPOINTS ON SCREEN		
		
		"waypoint.2 onspawn mgnest1 -85.64 -45.67 40.0 #FF6600",
		"waypoint.2 onspawn mgnest2 -144.90 -25.28 40.0 #FF6600",
		"waypoint.2 onspawn mgnest3 20.26 -110.94 40.0 #FF6600",
		"waypoint.2 onspawn tobruk1 52.41 -156.96 40.00 #FF6600",
		"waypoint.2 onspawn tobruk2 -122.74 -148.97 40.0 #FF6600",
		"waypoint.2 onspawn bunker1 -155.14 -80.44 40.0 #FF6600",
		"waypoint.2 onspawn bunker2 -30.91 -86.66 40.0 #FF6600",
		"waypoint.2 onspawn gunemplacement1 -124.31 46.28 14.46 #FF6600",
		"waypoint.2 onspawn gunemplacement2 -172.91 92.68 13.15 #FF6600",
		
		
		"waypoint.1 onspawn germanbunker -29.52 -78.26 39.57 enemy",
		"waypoint.1 onspawn seawall -37.38 22.87 9.42 #FF6600",
		"waypoint.1 onspawn shale -96.17 61.07 6.54 #FF6600",
		"waypoint.1 onspawn shale -161.42 108.76 8.78 #FF6600",
		"waypoint.1 onspawn vierville_draw -171.81 6.42 20.34 #FF6600",
		
		
		
	
		
		
		
		
		
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
		"vehicle axistroops de_assault",
		"vehicle axistroops de-smg",
		"vehicle axistroops de-lmg",
		"vehicle axistroops de-sniper",
		
		
-- DEFINE WHERE PLAYERS SPAWN

	-- command spawngroup worldx worldy,worldz yaw

		"spawn alliedtroops -13.71 179.28 3.39 225",
		"spawn alliedtroops 44.93 151.35 3.68 215",
		"spawn alliedtroops -77.71 206.52 3.59 230",
		
		
		"spawn axistroops -31.85 -142.49 44.61 355",
		"spawn axistroops -130.83 -120.49 42.42 345",

		
				
		
		
		

	};

	for i,v in ipairs(content) do 
		scenario.manager:AddContent(v);
	end
end



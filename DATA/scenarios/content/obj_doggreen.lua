

if(true) then
	-- content we're going to add
	local content = 
	{
		-- include lua file
		-- command,path
		"include scenarios/terrain/doggreen/map.lua",
		
		-- we're using minefields, so include that functionality
		"include scenarios/content/minefields.lua",
		

		
	----------------------------- VEHICLE MASKS ----------------------------- 
		
	-- MAKE A VEHICLE AVAILABLE FOR SPAWNING
		
		
	-- allied spawn list
		"vehicle alliedtroops us-assault",
		"vehicle alliedtroops us-smg",
		"vehicle alliedtroops us-bar",
		"vehicle alliedtroops us-sniper",

	-- axis spawn list
	-- stage 1	
		"vehicle axistroops1 de-assault",
		"vehicle axistroops1 de-smg",
		"vehicle axistroops1 de-sniper",
		"vehicle axistroops1 de-ltmortar",
		"vehicle axislmg de-lmg",
		
	-- stage 2
		"vehicle axistroops2 de-assault",
		"vehicle axistroops2 de-smg",
		"vehicle axistroops2 de-sniper",
		"vehicle axistroops2 de-ltmortar",
		"vehicle axistroops2 de-lmg",

	
	-----------------------------  DEFINE THE PLAY AREA ----------------------------- 

	-- BOUNDING BOX
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
		
	-- BLOCKING VOLUMES
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
		"block -45.07 -80.49 41.11 -63.68 -70.55 41.1 .5 5",
		"block -45.57 -80.27 41.25 -35.24 -83.76 41.56 .5 5",
		"block -35.24 -83.76 41.56 -19.86 -83.40 41.5 .5 1",
		"block -19.86 -83.40 39.85 -4.74 -88.94 39.09 .5 5",
		"block -4.74 -88.94 39.09 20.11 -100.23 38.5 .5 5",
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
	
		"block -205.93 -227.67 42.02 -194.26 -192.35 41.94 .5 5",
		"block -192.81 -183.28 41.75 -185.93 -147.34 39.54 .5 5",
		"block -182.07 -138.30 38.74 -174.57 -123.09 38.44 .5 5",
		
		"block -170.18 -113.46 38.64 -161.65 -95.47 39.16 .5 5",
		"block -161.65 -95.47 41 -155.19 -67.47 41 .5 2.5",
		"block -155.19 -67.47 39.18 -149.68 -57.18 38.71 .5 5",
		"block -149.68 -57.18 38.71 -141.49 -34.65 36.83 .5 5",
		
		"block -147.66 -29.12 35.79 -147.01 -32.24 36.02 .5 2",
		"block -146.29 -33.66 36.95 -143.25 -34.98 36.95 .5 2",
		
		
	-- LANDMINES
	
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
		

		
	----------------------------- AMBIENT EFFECTS AND SOUNDS ----------------------------- 
	
	-- EMITTERS
	-- command,effectname,worldx,worldy,worldz
	
	-- smoke effects
	-- craters
		"emitter cratersmoke -100.77 167.75 3.72",
		"emitter cratersmoke -94.12 107.80 5.35",
		"emitter cratersmoke -13.15 63.35 5.15",
		"emitter cratersmoke 134.57 -4.02 5.16",
		"emitter cratersmoke 59.42 25.24 6.21",

	-- smokescreen
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
	-- beach left 
		"emitter smokescreen 298.41 -143.95 4.43",
		"emitter smokescreen 237.97 -31.84 4.72",
	-- beach right 
		"emitter smokescreen -157.76 165.90 6.49",
		"emitter smokescreen -198.72 211.02 5.30",
		"emitter smokescreen -354.37 278.58 4.35",
	-- hulk smoke
		"emitter hulksmoke -39.93 247.32 3.35",
		"emitter cratersmoke -28.21 140.03 4.5",
		"emitter cratersmoke -95.29 199.18 4.25",
	-- fire
		"emitter smallfire -47.66 167.20 5.70",
		

	-- SOUNDS
		
	-- positional sounds
	-- command name filename volume loop x y z mindist maxdist	
		"sound sounds/ambience/ocean.wav 10 1 -63 212 3 100 1000",	
		"sound sounds/fairmileb/idle.wav 2.0 1 -117 237 5 5 25",
		"sound sounds/fairmileb/idle.wav 2.0 1 -10 182 6 5 25",
		"sound sounds/fairmileb/idle.wav 2.0 1 -82 203 3 5 25",

	-- ambient combat sounds
		"sound guns1 sounds/scenarios/ambient_guns_machine_gun1.wav .4 0",
		"sound guns1 sounds/scenarios/ambient_guns_machine_gun2.wav .4 0",
		"sound guns1 sounds/scenarios/ambient_guns_machine_gun3.wav .4 0",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun4.wav .4 0",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun5.wav .4 0",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun6.wav .4 0",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun7.wav .4 0",
		"sound bombs sounds/scenarios/ambient_bombs_distantshells1.wav .5 0",
		"sound bombs sounds/scenarios/ambient_bombs_distantshells2.wav .5 0",
		
	-- only played during stage 1
		"event guns1 .5 1000",
		"event.0.1.1 guns2 .5 1000",
		"event.0.1.1 bombs .5 1000",
		"event wind .5 5000",

	----------------------------- TRIGGERS ----------------------------- 
		

	-- hilltop bomb ambience 
		"barrage barragefun sc250he -403.10 -52.91 47.33 100",
		"barrage barragefun sc250he -202.95 -508.57 50.28 100",
		"barrage barragefun sc250he 156.79 -446.26 57.87 100",
		"event barragefun .50 3000 700 2",
		"event barragefun .5 5000 1000 3",
		
	-- combat fx
		-- typeofeffect eventname 0=bullethitsandsound/1=soundonly(bulletflyby)
		"fpsfx combatfx 0",
		"fpsfx combatsounds 1",
		-- event variables affecting above events (combat fx)
		"event.0.1.1 combatfx .5 300 300 5",
		"event.0.1.1 combatfx .5 300 300 3",
		"event combatfx .5 300 300 3",
		"event combatfx .8 200 100 1",
		"event combatsounds .6 300",
		
	-- german shore defense guns
	-- far right bunker pak40
		"clone shorebattery pak40 -350.63 199.13 22.5 0 0 90 ",
		
	-- these are the 2 bunker shore batteries near the draw
	-- they despawn after the Americans establish a beachhead
		"clone.0.1.1 shorebattery pak40 -172.00 93.24 12.2 0 0 90 ",
		"clone.0.1.1 shorebattery pak40 -124.42 46.24 12.6 0 -10 90 ",
		
	-- sea fx pak40 on the hill to the right
		"clone shorebattery2 pak40 -417.93 121.83 41 0 0 50 ",
		
	-- firepoint hooks
		"firepoint shoredefense shorebattery 1 0 -.15 0 .05 .15",
		"firepoint shoredefense2 shorebattery2 1 0 -.32 0 .1 .5",

	-- bunker pak40s fire durring stage 1
		"event.0.1.1 shoredefense .75 1000 100 1",
		
	-- sea fx event fires off pak40
		"event shoredefense2 .5 500 100 1",
		
	-- german air defense
	-- rear fx guns
		"clone antiair flak36 -238.05 -321.26 35.07 0 0 0 ",
		"clone antiair flak36 -144.85 -392.35 47.57 0 0 0 ",
		"clone antiair flak36 33.95 -388.84 48.35 0 0 0 ",
		
	-- firepoint hooks
		"firepoint airdefense antiair 1 0 -.15 0 .03 .1",
		
	-- fire off air defense from rear areas
		"event airdefense .8 600 100 1",
		
	-- american destroyers
		"clone destroyer1 uk_z34 509.16 922.13 3.3 0 0 120",
		"clone destroyer2 uk_z34 823.10 733.41 3.3 0 0 120",
		"clone destroyer3 uk_z34 112.23 1143.07 3.3 0 0 120",
		
	-- primary naval bambardment fx		
	-- main guns stage 1- fire near draw on hill tops
		"firepoint.0.1.1 shorebarrage1 destroyer1 2 0 -.45 .665 .015 .02 1",
		"firepoint.0.1.1 shorebarrage1 destroyer1 2 1 -.45 .665 .015 .02 1",
		"firepoint.0.1.1 shorebarrage1 destroyer1 2 2 -.45 .665 .015 .02 1",
		"firepoint.0.1.1 shorebarrage2 destroyer1 6 9 -.45 -.58 .017 .02 1",
		"firepoint.0.1.1 shorebarrage2 destroyer1 6 10 -.45 -.58 .017 .02 1",
		
	-- main guns stage 2
	-- these fire off farther away from play area
		"firepoint.0.1.2 shorebarrage1 destroyer1 2 0 -.45 .58 .04 .04 1",
		"firepoint.0.1.2 shorebarrage1 destroyer1 2 1 -.45 .58 .04 .04 1",
		"firepoint.0.1.2 shorebarrage1 destroyer1 2 2 -.45 .5 .04 .04 1",
		"firepoint.0.1.2 shorebarrage2 destroyer1 6 9 -.45 -.5 .04 .04 1",
		"firepoint.0.1.2 shorebarrage2 destroyer1 6 10 -.45 -.5 .04 .04 1",
		
	-- secondary naval bambardment fx
	--firepoint eventname clonename turretno mountno gunelev guntrav elevdisp travdisp ?
		"firepoint shorebarrage3 destroyer2 2 0 -.45 .665 .02 .04 1",
		"firepoint shorebarrage3 destroyer2 2 1 -.45 .665 .02 .04 1",
		"firepoint shorebarrage3 destroyer2 2 2 -.45 .665 .02 .04 1",
		"firepoint shorebarrage4 destroyer2 6 9 -.45 -.6 .02 .04 1",
		"firepoint shorebarrage4 destroyer2 6 10 -.45 -.6 .02 .04 1",

		"firepoint shorebarrage5 destroyer3 2 0 -.45 .665 .02 .04 1",
		"firepoint shorebarrage5 destroyer3 2 1 -.45 .665 .02 .04 1",
		"firepoint shorebarrage5 destroyer3 2 2 -.45 .665 .02 .04 1",
		"firepoint shorebarrage6 destroyer3 6 9 -.45 -.6 .02 .04 1",
		"firepoint shorebarrage6 destroyer3 6 10 -.45 -.6 .02 .04 1",
		
	-- middle destroyer shore barrage
		"event shorebarrage1 .7 2000 100 1",
		"event shorebarrage2 .7 2000 100 1",
		
	-- left and right destroyer shore barrages down the beach
		"event shorebarrage3 .5 2000 100 1",
	-- this one is close to the play area so discontinue it during stage 2 hill assault
		"event0.1.1 shorebarrage4 .5 2000 100 1",
		"event shorebarrage5 .5 2000 100 1",
		"event shorebarrage6 .5 2000 100 1",
		
		
	----------------------------- ALERTS & WAYPOINTS ----------------------------- 
		
	-- HUD ALERTS
	
	-- get their attention
		"sound onstageend sounds/Drum1.wav 1 0",
	
		"alert onspawn onspawn 0",
		"alert playarea playarea 10",	
		
	-- STAGE 1	
		"alert.0.1.1 onstageend beachsecure",
		"alert.0.1.1 onstageend navalguns",
		
		"message alliedcapon alliedcapon allied 10",
		"message alliedcapoff alliedcapoff axis 0",
		
	-- STAGE 2
		
		"message objective2 alliedcapon allied 10",
		"message linebreachon linebreach allied 20",
		
		"waypoint.0.1.2 onspawn germanbunker -29.52 -78.26 39.57 axis",
		"waypoint.0.1.2 onspawn beachhead -152.10 61.01 12.89 allied",
		
	
		
	-- STAGE 1 FUNCTIONS 

	
	-- bunker capture objective, RAMP WHAT IS THIS>?
		"handler objective1 OnReinforcements",
		
	-- area americans have to reach to start helping secure the beachhead
		"area beachcrossing OnState  -47.36 34.17 7.07",
		"area beachcrossing OnState -69.99 51.00 5.56",
		"area beachcrossing OnState -101.67 67.22 6.32",
		"area beachcrossing OnState -122.91 84.31 6.16",
		"area beachcrossing OnState -138.86 101.56 6.01",
		"area beachcrossing OnState -162.76 118.32 6.02",
		"area beachcrossing OnState -181.66 128.69 5.99",
		"area beachcrossing OnState -194.94 136.48 6.08",
		"area beachcrossing OnState -198.82 137.34 6.09",
		"area beachcrossing OnState -216.76 141.15 6.03",
		"area beachcrossing OnState -226.31 132.93 10.34",
		"area beachcrossing OnState -204.16 123.88 9.02",
		"area beachcrossing OnState -169.96 103.98 10.71",
		"area beachcrossing OnState -155.64 93.85 10.03",
		"area beachcrossing OnState -150.74 79.98 9.90",
		"area beachcrossing OnState -115.90 59.33 10.33",
		"area beachcrossing OnState -82.73 37.70 10.06",
		"area beachcrossing OnState  -53.90 21.96 10.46",
	
	-- messagae when americans are securing the beachhead	
		"message objective1 beachfalling #FF6600 10",
	
	-- waypoints
		"waypoint.1.1.0 onspawn vierville_draw -171.81 6.42 20.34 #FF6600",
		"waypoint.0.1.1 onspawn beachhead -116.04 65.05 7.68 friendly",
		"waypoint.0.1.1 onspawn beachhead -170.40 111.86 7.29 friendly",
		"waypoint.0.1.1 onspawn beachhead -68.97 45.77 5.78 friendly",
		
		
	-- STAGE 2 FUNCTIONS 

		
	-- bunker capture objective
		"handler capper OnCapper",
		"handler objective2 OnCapturing",
		"handler linebreach OnReceiveBroadcast",
		
		"area bunkercapture OnState -27.87 -80.51 39 -1",
		"area bunkercapture OnState -31.62 -79.72 39",
		"area bunkercapture OnState -30.69 -76.96 39",
		"area bunkercapture OnState -27.70 -77.38 39",
		
	-- beachhead objective area -- only allies trigger this area 
		"area linebreach OnSendBroadcast 66.10 -148.83 39.26",
		"area linebreach OnSendBroadcast 19.76 -99.93 37.87",
		"area linebreach OnSendBroadcast 9.67 -97.08 40.10",
		"area linebreach OnSendBroadcast -19.61 -83.22 42.16",
		"area linebreach OnSendBroadcast -45.21 -80.13 43.73",
		"area linebreach OnSendBroadcast -56.97 -74.91 40.50",
		"area linebreach OnSendBroadcast -66.83 -64.84 42.43",
		"area linebreach OnSendBroadcast -70.62 -49.48 40.24",
		"area linebreach OnSendBroadcast -84.10 -34.50 38.53",
		"area linebreach OnSendBroadcast -93.37 -32.16 36.18",
		"area linebreach OnSendBroadcast -103.63 -34.10 39.51",
		"area linebreach OnSendBroadcast -111.42 -31.46 37.88",
		"area linebreach OnSendBroadcast -125.18 -24.15 38.68",
		"area linebreach OnSendBroadcast -140.15 -24.18 39.41",
		"area linebreach OnSendBroadcast -150.29 -28.63 33.73",
		"area linebreach OnSendBroadcast -145.16 -33.88 38.69",
		"area linebreach OnSendBroadcast -141.33 -34.95 38.65",
		"area linebreach OnSendBroadcast -141.69 -35.94 37.72",
		"area linebreach OnSendBroadcast -154.74 -67.16 40.12",
		"area linebreach OnSendBroadcast -163.04 -98.99 40.37",
		"area linebreach OnSendBroadcast -149.75 -112.57 43.36",
		"area linebreach OnSendBroadcast -133.41 -146.63 45.74",
		"area linebreach OnSendBroadcast -122.09 -156.21 46.51",
		"area linebreach OnSendBroadcast -65.77 -176.09 47.90",
		"area linebreach OnSendBroadcast -27.36 -181.01 47.89",
		"area linebreach OnSendBroadcast 9.98 -185.02 46.81",
		"area linebreach OnSendBroadcast 73.22 -152.40 48.69",
		
	-- only americans trigger this area
		"vehicle linebreach 2 0 0 0",
		

		


		
	----------------------------- SPAWNS ----------------------------- 
	
	-- stage 1 allied spawns
		"spawn.1.1.1 alliedtroops -13.71 179.28 3.39 225",
		"spawn.1.1.1 alliedtroops -77.71 206.52 3.59 230",
		"spawn.1.1.1 alliedtroops -118.78 235.53 3.59 200",
		
	-- stage 1 axis spawns
	-- bunker spawns
		"spawn.2.1.1 axistroops1 -128.39 44.85 12.18 180",
		"spawn.2.1.1 axistroops1 -176.36 90.51 11.65 100",
	-- ruins
		"spawn.2.1.1 axistroops1 -176.06 36.48 16.88 90",
	-- mg nest
	--"spawn.2.1.1 axistroops -137.83 -79.05 40.19 0",
		"spawn.2.1.1 axislmg -137.46 -37.48 36.12 325",
		"spawn.2.1.1 axislmg -88.12 -56.20 39.50 0",
		"spawn.2.1.1 axislmg 11.15 -121.45 41.05 60",
		
	-- stage 2 allied spawns
		"spawn.1.1.2 alliedtroops -129.58 71.83 7.74 170",
		"spawn.1.1.2 alliedtroops -173.37 110.01 7.79 160",
	-- stage 2 axis spawns
		"spawn.2.1.2 axistroops2 -31.85 -142.49 44.61 355",
		"spawn.2.1.2 axistroops2 -130.83 -120.49 42.42 345",
		

		
	
		
	};

	for i,v in ipairs(content) do 
		scenario.manager:AddContent(v);
	end
end



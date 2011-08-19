

if(true) then
	-- content we're going to add
	local content = 
	{
		-- include lua file
		-- command,path
		"include scenarios/terrain/draw/map.lua",
		
		-- we're using minefields, so include that functionality
		"include scenarios/content/minefields.lua",
		

		
	----------------------------- VEHICLE MASKS ----------------------------- 
		
	-- MAKE A VEHICLE AVAILABLE FOR SPAWNING
		
	-- allied spawn list
		"mask.1.1.0 alliedtroops us-rifle",
		"mask.1.1.0 alliedtroops us-assault",
		"mask.1.1.0 alliedtroops us-bar 8",
		"mask.1.1.0 alliedtroops us-sniper 1",
		"mask.1.1.0 alliedvehicles m10_us 6",
		"mask.1.1.0 alliedvehicles m4a2_us 4",
		

	-- axis spawn list
		"mask.2.1.1 axistroops derifle",
		"mask.2.1.1 axistroops de-assault",
		"mask.2.1.1 axistroops de-smg 5",
		"mask.2.1.1 axistroops de-sniper 1",
		"mask.2.1.1 axistroops de-lmg 3",
		"mask.1.1.0 axisvehicles stug3g 4",
		"mask.1.1.0 axisvehicles pzivg 2",

	
	-----------------------------  DEFINE THE PLAY AREA ----------------------------- 

	-- BOUNDING BOX
	-- boundary name x y z

		--"boundary  playarea 376.58 -407.17 51.77",
		"boundary  playarea -331.67 82.60 48.90",
		"boundary  playarea -535.53 -608.05 49.76",
		"boundary  playarea -581.91 -832.08 51.63",
		"boundary  playarea 386.87 -980.35 50.84",
		"boundary  playarea 218.38 -336.19 50.68",
		
		

		
	-- BLOCKING VOLUMES
	-- block name x1 y1 z1 x2 y2 z2 thickness height


		
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
		--"emitter cratersmoke -100.77 167.75 3.72",
		--"emitter cratersmoke -94.12 107.80 5.35",
		--"emitter cratersmoke -13.15 63.35 5.15",
		--"emitter cratersmoke 134.57 -4.02 5.16",
		--"emitter cratersmoke 59.42 25.24 6.21",

	-- smokescreen
	-- cliffs
		--"emitter smokescreen -97.32 -2.10 21",
		--"emitter smokescreen -121.65 6.49 23",
		--"emitter smokescreen -30.43 -51.98 23.78",		
		--"emitter smokescreen 27.01 -92.92 30.51",
		--"emitter smokescreen -37.89 -59.64 31.44",
		--"emitter smokescreen -79.64 -24.46 30.00",
	-- beach
		--"emitter smokescreen 13.54 29.78 6.03",
		--"emitter smokescreen -45.14 73.00 6.06",
	-- beach left 
		--"emitter smokescreen 298.41 -143.95 4.43",
		--"emitter smokescreen 237.97 -31.84 4.72",
	-- beach right 
		--"emitter smokescreen -157.76 165.90 6.49",
		--"emitter smokescreen -198.72 211.02 5.30",
		--"emitter smokescreen -354.37 278.58 4.35",
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
		"sound guns1 sounds/scenarios/ambient_guns_machine_gun1.wav .5 0",
		"sound guns1 sounds/scenarios/ambient_guns_machine_gun2.wav .5 0",
		"sound guns1 sounds/scenarios/ambient_guns_machine_gun3.wav .5 0",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun4.wav .5 0",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun5.wav .5 0",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun6.wav .5 0",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun7.wav .3 0",
		"sound bombs sounds/scenarios/ambient_bombs_distantshells1.wav .5 0",
		"sound bombs sounds/scenarios/ambient_bombs_distantshells2.wav .5 0",
		
	-- only played during stage 1
		"event guns1 .5 1000",
		"event.0.1.1 guns2 .5 1000",
		"event.0.1.1 bombs .5 1000",
		"event wind .5 5000",

	----------------------------- TRIGGERS ----------------------------- 
		

	-- hilltop bomb ambience 
		--"barrage barragefun sc250he -403.10 -52.91 47.33 100",
		--"barrage barragefun sc250he -202.95 -508.57 50.28 100",
		--"barrage barragefun sc250he 156.79 -446.26 57.87 100",
		--"event barragefun .50 3000 700 2",
		--"event barragefun .5 5000 1000 3",
		
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
		--"event.0.1.1 shoredefense .75 1000 100 1",
		
	-- sea fx event fires off pak40
		--"event shoredefense2 .5 500 100 1",
		
	-- german air defense
	-- rear fx guns
		--"clone antiair flak36 -165.19  0 0 0 ",
		--"clone antiair flak36 -144.85 -392.35 47.57 0 0 0 ",
		--"clone antiair flak36 33.95 -388.84 48.35 0 0 0 ",
		
	-- firepoint hooks
		--"firepoint airdefense antiair 1 0 -.15 0 .03 .1",
		
	-- fire off air defense from rear areas
		--"event airdefense .8 600 100 1",
		
	-- american destroyers
		"clone destroyer1 uk_z34 509.16 922.13 3.3 0 0 120",
		"clone destroyer2 uk_z34 823.10 733.41 3.3 0 0 120",
		"clone destroyer3 uk_z34 112.23 1143.07 3.3 0 0 120",
		
	-- primary naval bambardment fx		
	-- main guns stage 1- fire near draw on hill tops
		--"firepoint.0.1.1 shorebarrage1 destroyer1 2 0 -.45 .665 .015 .02 1",
		--"firepoint.0.1.1 shorebarrage1 destroyer1 2 1 -.45 .665 .015 .02 1",
		--"firepoint.0.1.1 shorebarrage1 destroyer1 2 2 -.45 .665 .015 .02 1",
		--"firepoint.0.1.1 shorebarrage2 destroyer1 6 9 -.45 -.58 .017 .02 1",
		--"firepoint.0.1.1 shorebarrage2 destroyer1 6 10 -.45 -.58 .017 .02 1",
		
	-- main guns stage 2
	-- these fire off farther away from play area
		--"firepoint.0.1.2 shorebarrage1 destroyer1 2 0 -.45 .58 .04 .04 1",
		--"firepoint.0.1.2 shorebarrage1 destroyer1 2 1 -.45 .58 .04 .04 1",
		--"firepoint.0.1.2 shorebarrage1 destroyer1 2 2 -.45 .5 .04 .04 1",
		--"firepoint.0.1.2 shorebarrage2 destroyer1 6 9 -.45 -.5 .04 .04 1",
		--"firepoint.0.1.2 shorebarrage2 destroyer1 6 10 -.45 -.5 .04 .04 1",
		
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
		--"event shorebarrage1 .7 2000 100 1",
		--"event shorebarrage2 .7 2000 100 1",
		
	-- left and right destroyer shore barrages down the beach
		--"event shorebarrage3 .5 2000 100 1",
	-- this one is close to the play area so discontinue it during stage 2 hill assault
		--"event0.1.1 shorebarrage4 .5 2000 100 1",
		--"event shorebarrage5 .5 2000 100 1",
		--"event shorebarrage6 .5 2000 100 1",
		
		
		
-- >>>>>>>>>>>> 	RAMP WE WANT THESE 88S TO FIRE ON THE DRAW WITH LIVE ROUNDS		
	-- 88s firing on US position 
		"clone flak36 -164.2 -623.33 50.5 0 -5 -30",


		
		
	----------------------------- ALERTS & WAYPOINTS ----------------------------- 
		
	-- HUD ALERTS
	
	-- get their attention
		--"sound onstageend sounds/Drum1.wav 1 0",
	
		"alert onspawn onspawn 0",
		"alert playarea playarea 10",	
		
	-- STAGE 1	
		--"alert.0.1.1 onstageend beachsecure",
		--"alert.0.1.1 onstageend navalguns",
		
		"message alliedcapon alliedcapon allied 10",
		"message alliedcapoff alliedcapoff axis 0",
		
	-- STAGE 2
		
		--"message objective2 alliedcapon allied 10",
		--"message linebreachon linebreach allied 20",
		
		--"waypoint.0.1.2 onspawn germanbunker -29.52 -78.26 39.57 axis",
		--"waypoint.0.1.2 onspawn beachhead -152.10 61.01 12.89 allied",
		
	
		
	-- STAGE 1 FUNCTIONS 

	
	-- bunker capture objective, RAMP WHAT IS THIS>?
		"handler objective1 OnReinforcements",
		
	-- area americans have to reach to start helping secure the beachhead
	
	--"area beachcrossing OnState -47.50 33.81 7.28",
	--"area beachcrossing OnState -70.93 51.11 5.57",
	--"area beachcrossing OnStater -102.07 66.71 6.33",
	--"area beachcrossing OnState -123.55 83.80 6.25",
	--"area beachcrossing OnState -138.81 100.76 6.06",
	--"area beachcrossing OnState -161.52 114.16 6.09",
	--"area beachcrossing OnState -195.65 134.99 6.17",
	--"area beachcrossing OnState -217.26 141.72 6.02",
	--"area beachcrossing OnState -220.74 125.76 10.38",
	--"area beachcrossing OnState -192.53 96.20 12.69",
	--"area beachcrossing OnState -186.43 87.62 11.99",
	--"area beachcrossing OnState -180.84 83.04 11.15",
	--"area beachcrossing OnState -136.58 45.82 13.79",
	--"area beachcrossing OnState -94.19 8.58 17.30",
	--"area beachcrossing OnState -88.46 8.78 15.69",
	--"area beachcrossing OnState -54.36 21.75 10.53",

	-- messagae when americans are securing the beachhead	
	--"message objective1 beachfalling #FF6600 10",
	--"message.1.1.1 beachcrossingon beachcrossingon #00FF00 0",
	--"message.1.1.1 beachcrossingoff beachcrossingoff #FF0000 0",
	
	-- waypoints
		--"waypoint.1.1.0 onspawn vierville_draw -171.81 6.42 20.34 #FF6600",
		--"waypoint.0.1.1 onspawn beachhead -116.04 65.05 7.68 friendly",
		--"waypoint.0.1.1 onspawn beachhead -170.40 111.86 7.29 friendly",
		--"waypoint.0.1.1 onspawn beachhead -68.97 45.77 5.78 friendly",
		
		
	-- STAGE 2 FUNCTIONS 

		
	-- bunker capture objective
		"handler capper OnCapper",
		"handler objective2 OnCapturing",
		--"handler linebreach OnReceiveBroadcast",
		
		--"area bunkercapture OnState -27.87 -80.51 39 -1",
		--"area bunkercapture OnState -31.62 -79.72 39",
		--"area bunkercapture OnState -30.69 -76.96 39",
		--"area bunkercapture OnState -27.70 -77.38 39",
		
	-- beachhead objective area -- only allies trigger this area 
		--"area linebreach OnSendBroadcast 66.10 -148.83 39.26",
		--"area linebreach OnSendBroadcast 19.76 -99.93 37.87",
		--"area linebreach OnSendBroadcast 9.67 -97.08 40.10",
		--"area linebreach OnSendBroadcast -19.61 -83.22 42.16",
		--"area linebreach OnSendBroadcast -45.21 -80.13 43.73",
		--"area linebreach OnSendBroadcast -56.97 -74.91 40.50",
		--"area linebreach OnSendBroadcast -66.83 -64.84 42.43",
		--"area linebreach OnSendBroadcast -70.62 -49.48 40.24",
		--"area linebreach OnSendBroadcast -84.10 -34.50 38.53",
		--"area linebreach OnSendBroadcast -93.37 -32.16 36.18",
		--"area linebreach OnSendBroadcast -103.63 -34.10 39.51",
		--"area linebreach OnSendBroadcast -111.42 -31.46 37.88",
		--"area linebreach OnSendBroadcast -125.18 -24.15 38.68",
		--"area linebreach OnSendBroadcast -140.15 -24.18 39.41",
		--"area linebreach OnSendBroadcast -150.29 -28.63 33.73",
		--"area linebreach OnSendBroadcast -145.16 -33.88 38.69",
		--"area linebreach OnSendBroadcast -141.33 -34.95 38.65",
		--"area linebreach OnSendBroadcast -141.69 -35.94 37.72",
		--"area linebreach OnSendBroadcast -154.74 -67.16 40.12",
		--"area linebreach OnSendBroadcast -163.04 -98.99 40.37",
		--"area linebreach OnSendBroadcast -149.75 -112.57 43.36",
		--"area linebreach OnSendBroadcast -133.41 -146.63 45.74",
		--"area linebreach OnSendBroadcast -122.09 -156.21 46.51",
		--"area linebreach OnSendBroadcast -65.77 -176.09 47.90",
		--"area linebreach OnSendBroadcast -27.36 -181.01 47.89",
		--"area linebreach OnSendBroadcast 9.98 -185.02 46.81",
		--"area linebreach OnSendBroadcast 73.22 -152.40 48.69",
		
	-- only americans trigger this area
		--"vehicle linebreach 2 0 0 0",
		

		


		
	----------------------------- SPAWNS ----------------------------- 
	
	-- stage 1 allied spawns
		"spawn.1.1.1 alliedtroops -13.71 179.28 3.39 225",
		"spawn.1.1.1 alliedvehicles -13.71 179.28 3.39 225",

		
	-- stage 1 axis spawns
		"spawn.2.1.1 axistroops -118.78 235.53 3.59 200",
		"spawn.2.1.1 axisvehicles -118.78 235.53 3.59 200",
		
		
		
		
		
		-- CLONES --

	-- NAMED VERSION
	-- command name typeid x y z roll pitch yaw

		-- "clone bedford1 bedford -20.11 -156.51 8.77 0 0 90",
		
				
	-- ANONYMOUS VERSION
	-- command typeid x y z roll pitch yaw
		"clone oplbltz -17 -177.5 46.25 0 0 180",
		"clone sdkfz251c -21.88 -177.24 46.5 0 0 180",
		
	
		
	};

	for i,v in ipairs(content) do 
		scenario.manager:AddContent(v);
	end
end



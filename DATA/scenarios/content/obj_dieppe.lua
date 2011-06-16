

if(true) then
	-- content we're going to add
	local content = 
	{
		-- include lua file
		-- command,path
		--"include scenarios/terrain/dieppe/map.lua",
		
		-- we're using minefields, so include that functionality
		--"include scenarios/content/minefields.lua",
		

		
	----------------------------- VEHICLE MASKS ----------------------------- 
		
	-- MAKE A VEHICLE AVAILABLE FOR SPAWNING
		
		
	-- allied spawn list
	-- stage 1 infantry
		"vehicle alliedtroops uk-rifle",
		"vehicle alliedtroops uk-smg",
		"vehicle alliedtroops uk-lmg",
		"vehicle alliedtroops uk-sniper",
		"vehicle alliedplanes spit5",
		"vehicle alliedplanes spit9",

	-- allied spawn list
	-- stage 2 infantry and tanks
		"vehicle alliedtroops uk-rifle",
		"vehicle alliedtroops uk-smg",
		"vehicle alliedtroops uk-lmg",
		"vehicle alliedtroops uk-sniper",
		"vehicle alliedtanks chur3",
		"vehicle alliedplanes spit5",
		"vehicle alliedplanes spit9",

	-- allied spawn list
	-- stage 3 infantry
		"vehicle alliedtroops uk-rifle",
		"vehicle alliedtroops uk-smg",
		"vehicle alliedtroops uk-lmg",
		"vehicle alliedtroops uk-sniper",
		"vehicle alliedplanes spit5",
		"vehicle alliedplanes spit9",

	-- axis spawn list
	-- stage 1	
		"vehicle axistroops1 de-rifle",
		"vehicle axistroops1 de-smg",
		"vehicle axistroops1 de-sniper",
		"vehicle axistroops1 de-ltmortar",
		"vehicle axislmg de-lmg",
		"vehicle axisplanes bf109f4",
		"vehicle axisplanes fw190",
		
	-- stage 2
		"vehicle axistroops2 de-rifle",
		"vehicle axistroops2 de-smg",
		"vehicle axistroops2 de-sniper",
		"vehicle axistroops2 de-ltmortar",
		"vehicle axistroops2 de-lmg",
		"vehicle axisplanes bf109f4",
		"vehicle axisplanes fw190",

	-- stage 3
		"vehicle axistroops2 de-rifle",
		"vehicle axistroops2 de-smg",
		"vehicle axistroops2 de-sniper",
		"vehicle axistroops2 de-ltmortar",
		"vehicle axistroops2 de-lmg",
		"vehicle axisplanes bf109f4",
		"vehicle axisplanes fw190",

	
	-----------------------------  DEFINE THE PLAY AREA ----------------------------- 

	-- BOUNDING BOX
	-- boundary name x y z

        	"boundary  playarea 52830.96 2997298.55 0.00",
		"boundary  playarea 52841.43 2996400.41 0.00",
		"boundary  playarea 52400.33 2996400.78 0.00",
		"boundary  playarea 52400.48 2996213.09 0.00",
		"boundary  playarea 51970.91 2996217.16 0.00",
		"boundary  playarea 51890.88 2997293.10 0.00",
		
	-- BLOCKING VOLUMES
	-- block name x1 y1 z1 x2 y2 z2 thickness height

        	--"block -143.36 -23.85 34.41 -132.87 -24.58 36.25 .5 5",
		--"block -132.87 -24.58 36.25 -126.31 -23.86 35.69 .5 5",
		--"block -126.31 -23.86 35.69 -111.48 -31.42 37.17 .5 5",
		--"block -103.98 -33.89 38.41 -92.23 -32.63 36.87 .5 5",
		--"block -92.23 -32.63 36.87 -84.42 -34.53 36.28 .5 5",
		--"block -84.42 -34.53 36.28 -75.88 -43.07 38.09 .5 5",
		--"block -75.88 -43.07 38.09 -70.95 -49.17 38.05 .5 5",
		--"block -70.95 -49.17 38.05 -66.98 -65.28 41.11 .5 5",
		--"block -66.98 -65.28 41.11 -63.05 -70.97 41.34 .5 5",
		--"block -45.07 -80.49 41.11 -63.68 -70.55 41.1 .5 5",
		--"block -45.57 -80.27 41.25 -35.24 -83.76 41.56 .5 5",
		--"block -35.24 -83.76 41.56 -19.86 -83.40 41.5 .5 1",
		--"block -19.86 -83.40 39.85 -4.74 -88.94 39.09 .5 5",
		--"block -4.74 -88.94 39.09 20.11 -100.23 38.5 .5 5",
		--"block 19.78 -99.91 37.61 29.41 -112.02 38.49 .5 5",
		--"block 29.41 -112.02 38.49 49.41 -131.41 39.42 .5 5",
		--"block -177.15 -94.10 32.84 -169.36 -95.42 38.71 .5 5",
		--"block -169.36 -95.42 38.71 -160.03 -101.24 40.03 .5 5",
		--"block -160.03 -101.24 40.03 -154.04 -106.05 41.39 .5 5",
		--"block -154.04 -106.05 41.39 -143.90 -122.60 43.89 .5 5",
		--"block -139.45 -132.42 44.13 -135.78 -140.09 44.80 .5 5",
		--"block -135.78 -140.09 44.80 -133.70 -146.67 45.03 .5 5",
		--"block -133.70 -146.67 45.03 -129.05 -152.25 44.84 .5 5",
		--"block -129.05 -152.25 44.84 -122.60 -156.35 45.44 .5 5",
		--"block -122.60 -156.35 45.44 -111.60 -158.92 45.33 .5 5",
		--"block -111.60 -158.92 45.33 -65.01 -176.65 46.13 .5 5",
		--"block -65.01 -176.65 46.13 -36.02 -179.75 46.18 .5 5",
	
				
	-- LANDMINES
	
		--"ammo landmine1 landmine",
		--"ammo landmine2 landmine",
		--"ammo landmine3 landmine",
		--"ammo landmine4 landmine",

	-- west side minefield
		"area landmine1 OnMineArea 51999.91 2996961.96 15.94",
		"area landmine1 OnMineArea 52015.30 2996627.13 0.47",
		"area landmine1 OnMineArea 51742.57 2996635.34 21.54",
		"area landmine1 OnMineArea 51763.71 2996643.74 21.43",
		"area landmine1 OnMineArea 51824.73 2996731.69 15.38",
		"area landmine1 OnMineArea 51838.43 2996799.17 15.87",
		"area landmine1 OnMineArea 51890.90 2996907.68 19.21",
		
	-- west side town minefield
		"area landmine2 OnMineArea 51996.03 2996619.53 0.40",
		"area landmine2 OnMineArea 51994.52 2996598.24 0.55",
		"area landmine2 OnMineArea 51999.86 2996597.76 0.02",
		"area landmine2 OnMineArea 51999.84 2996255.40 0.73",
		"area landmine2 OnMineArea 51837.50 2996254.43 6.54",
		"area landmine2 OnMineArea 51887.08 2996614.63 11.34",
		
	-- east side minefield
		"area landmine3 OnMineArea 52773.13 2996606.87 0.00",
		"area landmine3 OnMineArea 52746.84 2996607.11 0.00",
		"area landmine3 OnMineArea 52743.08 2996699.70 0.00",
		"area landmine3 OnMineArea 52690.11 2996796.95 0.00",
		"area landmine3 OnMineArea 52678.17 2996809.88 0.23",
		"area landmine3 OnMineArea 52673.01 2997024.69 9.70",
		"area landmine3 OnMineArea 52798.57 2996962.72 15.94",
		

	-- back side minefield
		"area landmine4 OnMineArea 52011.22 2996390.68 0.00",
		"area landmine4 OnMineArea 52388.04 2996388.77 0.00",
		"area landmine4 OnMineArea 52388.04 2996325.18 0.37",
		"area landmine4 OnMineArea 52010.77 2996317.72 0.42",
				

		
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
		--"emitter hulksmoke -39.93 247.32 3.35",
		--"emitter cratersmoke -28.21 140.03 4.5",
		--"emitter cratersmoke -95.29 199.18 4.25",
	-- fire
		--"emitter smallfire -47.66 167.20 5.70",
		

	-- SOUNDS
		
	-- positional sounds
	-- command name filename volume loop x y z mindist maxdist	
		"sound sounds/ambience/ocean.wav 10 1 -63 212 3 100 1000",	
		--"sound sounds/fairmileb/idle.wav 2.0 1 -117 237 5 5 25",
		--"sound sounds/fairmileb/idle.wav 2.0 1 -10 182 6 5 25",
		--"sound sounds/fairmileb/idle.wav 2.0 1 -82 203 3 5 25",

	-- ambient combat sounds
		--"sound guns1 sounds/scenarios/ambient_guns_machine_gun1.wav .4 0",
		--"sound guns1 sounds/scenarios/ambient_guns_machine_gun2.wav .4 0",
		--"sound guns1 sounds/scenarios/ambient_guns_machine_gun3.wav .4 0",
		--"sound guns2 sounds/scenarios/ambient_guns_machine_gun4.wav .4 0",
		--"sound guns2 sounds/scenarios/ambient_guns_machine_gun5.wav .4 0",
		--"sound guns2 sounds/scenarios/ambient_guns_machine_gun6.wav .4 0",
		--"sound guns2 sounds/scenarios/ambient_guns_machine_gun7.wav .4 0",
		--"sound bombs sounds/scenarios/ambient_bombs_distantshells1.wav .5 0",
		--"sound bombs sounds/scenarios/ambient_bombs_distantshells2.wav .5 0",
		
	-- only played during stage 1
		--"event guns1 .5 1000",
		--"event.0.1.1 guns2 .5 1000",
		--"event.0.1.1 bombs .5 1000",
		--"event wind .5 5000",

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
		--"clone shorebattery pak40 -350.63 199.13 22.5 0 0 90 ",
		
	-- these are the 2 bunker shore batteries near the draw
	-- they despawn after the Americans establish a beachhead
		--"clone.0.1.1 shorebattery pak40 -172.00 93.24 12.2 0 0 90 ",
		--"clone.0.1.1 shorebattery pak40 -124.42 46.24 12.6 0 -10 90 ",
		
	-- sea fx pak40 on the hill to the right
		--"clone shorebattery2 pak40 -417.93 121.83 41 0 0 50 ",
		
	-- firepoint hooks
		--"firepoint shoredefense shorebattery 1 0 -.15 0 .05 .15",
		--"firepoint shoredefense2 shorebattery2 1 0 -.32 0 .1 .5",

	-- bunker pak40s fire durring stage 1
		--"event.0.1.1 shoredefense .75 1000 100 1",
		
	-- sea fx event fires off pak40
		--"event shoredefense2 .5 500 100 1",
		
	-- german air defense

	-- rear fx guns
		--"clone antiair flak36 -238.05 -321.26 35.07 0 0 0 ",
		--"clone antiair flak36 -144.85 -392.35 47.57 0 0 0 ",
		--"clone antiair flak36 33.95 -388.84 48.35 0 0 0 ",
		
	-- firepoint hooks
		--"firepoint airdefense antiair 1 0 -.15 0 .03 .1",
		
	-- fire off air defense from rear areas
		--"event airdefense .8 600 100 1",
		
	-- american destroyers
		--"clone destroyer1 uk_z34 509.16 922.13 3.3 0 0 120",
		--"clone destroyer2 uk_z34 823.10 733.41 3.3 0 0 120",
		--"clone destroyer3 uk_z34 112.23 1143.07 3.3 0 0 120",
		
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
	--firepoint eventname clonename turretno mountno gunelev guntrav elevdisp travdisp smoothorsnap?
		--"firepoint shorebarrage3 destroyer2 2 0 -.45 .665 .02 .04 1",
		--"firepoint shorebarrage3 destroyer2 2 1 -.45 .665 .02 .04 1",
		--"firepoint shorebarrage3 destroyer2 2 2 -.45 .665 .02 .04 1",
		--"firepoint shorebarrage4 destroyer2 6 9 -.45 -.6 .02 .04 1",
		--"firepoint shorebarrage4 destroyer2 6 10 -.45 -.6 .02 .04 1",

		--"firepoint shorebarrage5 destroyer3 2 0 -.45 .665 .02 .04 1",
		--"firepoint shorebarrage5 destroyer3 2 1 -.45 .665 .02 .04 1",
		--"firepoint shorebarrage5 destroyer3 2 2 -.45 .665 .02 .04 1",
		--"firepoint shorebarrage6 destroyer3 6 9 -.45 -.6 .02 .04 1",
		--"firepoint shorebarrage6 destroyer3 6 10 -.45 -.6 .02 .04 1",
		
	-- middle destroyer shore barrage
		-- event eventname perchance(0->1) delaybetweenevents(ms) durationofevent 1 
		--"event shorebarrage1 .7 2000 100 1",
		--"event shorebarrage2 .7 2000 100 1",
		
	-- left and right destroyer shore barrages down the beach
		-- event eventname perchance(0->1) delaybetweenevents(ms) durationofevent 1 
		--"event shorebarrage3 .5 2000 100 1",

	-- this one is close to the play area so discontinue it during stage 2 hill assault
		-- event eventname perchance(0->1) delaybetweenevents(ms) durationofevent 1 
		--"event0.1.1 shorebarrage4 .5 2000 100 1",
		--"event shorebarrage5 .5 2000 100 1",
		--"event shorebarrage6 .5 2000 100 1",
		
		
	----------------------------- ALERTS & WAYPOINTS ----------------------------- 
		
	-- HUD ALERTS
	
	-- get their attention
		"sound onstageend sounds/Drum1.wav 1 0",
	
		--"alert onspawn onspawn 0",
		--"alert playarea playarea 10",	
		
	-- STAGE 1	
		--"alert.0.1.1 onstageend beachsecure",
		--"alert.0.1.1 onstageend navalguns",
		
		--"message alliedcapon alliedcapon allied 10",
		--"message alliedcapoff alliedcapoff axis 0",
		
	-- STAGE 2
		
		--"message objective2 alliedcapon allied 10",
		--"message holdtownon holdtown allied 20",
		
		--"waypoint.0.1.2 onspawn germanbunker -29.52 -78.26 39.57 axis",
		--"waypoint.0.1.2 onspawn beachhead -152.10 61.01 12.89 allied",

	-- STAGE 3
		
		--"message objective3 alliedcapon allied 10",
		--"message holdtownon holdtown allied 20",
		
		--"waypoint.0.1.2 onspawn germanbunker -29.52 -78.26 39.57 axis",
		--"waypoint.0.1.2 onspawn beachhead -152.10 61.01 12.89 allied",
		
	
		
	-- STAGE 1 FUNCTIONS 

	
	-- bunker capture objective,
		--"handler objective1 OnReinforcements",
		
	-- stage 1a area allies have to reach to open stage 2 inf spawns and open tank spawning
	-- Only allies trigger this area (obj1a)
		"area beachcrossing1a OnState 52240.68 2996794.04 0.00",
		"area beachcrossing1a OnState 52240.65 2996793.21 0.00",
		"area beachcrossing1a OnState 52228.63 2996792.59 0.00",
		"area beachcrossing1a OnState 52230.48 2996770.02 0.00",
		"area beachcrossing1a OnState 52096.92 2996763.96 0.00",
		"area beachcrossing1a OnState 52134.06 2996789.83 0.00",
		"area beachcrossing1a OnState 52149.55 2996788.31 0.00",
		"area beachcrossing1a OnState 52151.87 2996777.95 0.00",
		"area beachcrossing1a OnState 52171.82 2996779.90 0.00",
		"area beachcrossing1a OnState 52174.61 2996788.53 0.00",
		"area beachcrossing1a OnState 52192.82 2996786.72 0.00",
		"area beachcrossing1a OnState 52192.18 2996778.08 0.00",
		"area beachcrossing1a OnState 52208.77 2996776.42 0.00",
		"area beachcrossing1a OnState 52215.26 2996791.75 0.00",
		"area beachcrossing1a OnState 52226.19 2996792.07 0.00",
		"area beachcrossing1a OnState 52226.51 2996797.74 0.00",
		"area beachcrossing1a OnState 52240.03 2996798.48 0.00",

	-- stage 1b area allies have to reach to open stage 2 inf spawn and open tank spawning
	-- Only allies trigger this area (obj1b)
		"area beachcrossing1b OnState 52402.11 2996800.07 0.00",
		"area beachcrossing1b OnState 52577.98 2996816.07 0.00",
		"area beachcrossing1b OnState 52576.34 2996790.21 0.00",
		"area beachcrossing1b OnState 52444.17 2996789.49 0.00",
		"area beachcrossing1b OnState 52430.50 2996778.88 0.00",
		"area beachcrossing1b OnState 52420.00 2996787.01 0.00",
		"area beachcrossing1b OnState 52424.61 2996797.22 0.00",
		"area beachcrossing1b OnState 52408.64 2996796.85 0.00",
		"area beachcrossing1b OnState 52408.47 2996790.73 0.00",
		"area beachcrossing1b OnState 52401.38 2996791.21 0.00",
		
		
	
	-- message when allies are securing the beachhead	
		--"message objective1 beachfalling #FF6600 10",
	
	-- waypoints
		--"waypoint.1.1.0 onspawn vierville_draw -171.81 6.42 20.34 #FF6600",
		--"waypoint.0.1.1 onspawn beachhead -116.04 65.05 7.68 friendly",
		--"waypoint.0.1.1 onspawn beachhead -170.40 111.86 7.29 friendly",
		--"waypoint.0.1.1 onspawn beachhead -68.97 45.77 5.78 friendly",
		
		
	-- STAGE 2 FUNCTIONS 

		
	-- Division HQ capture objective (obj2)
		--"handler capper OnCapper",
		--"handler objective2 OnCapturing",
		--"handler holdtown OnReceiveBroadcast",
		
	-- Only allies trigger this area (obj2)
		"area HQcapture OnState 52318.79 2996659.07 0.08",
		"area HQcapture OnState 52318.57 2996639.84 0.08",
		"area HQcapture OnState 52299.21 2996639.88 0.08",
		"area HQcapture OnState 52299.37 2996659.15 0.08",
		
	-- STAGE 3 FUNCTIONS 

	-- Town Capture objective (obj3)
		--"handler capper OnCapper",
		--"handler objective3 OnCapturing",
		--"handler holdtown OnReceiveBroadcast",

	-- Only allies trigger this area (obj3)
		"area holdtown OnSendBroadcast 52205.44 2996525.77 5.01",
		"area holdtown OnSendBroadcast 52211.38 2996525.78 5.01",
		"area holdtown OnSendBroadcast 52211.37 2996532.07 5.01",
		"area holdtown OnSendBroadcast 52205.44 2996532.08 5.01",
		
				
	----------------------------- SPAWNS ----------------------------- 
	
-- stage 1 ALLIED spawns 

	-- Spawn 1a (switch off when Allies achieve stage 1a objective)
		"spawn alliedtroops 52177.57 2997000.60 10.09 0 0 180",
		"spawn alliedtroops 52165.19 2996997.84 10.28 0 0 180",
		"spawn alliedtroops 52156.31 2996993.36 10.73 0 0 180",

	-- Spawn 1b (switch off when Allies achieve stage 1b objective)
		"spawn alliedtroops 52534.76 2997100.17 1.01 0 0 180",
		"spawn alliedtroops 52547.56 2997092.00 1.52 0 0 180",
		"spawn alliedtroops 52568.62 2997082.65 2.00 0 0 180",
		
	

-- stage 1 AXIS spawns 

	-- forwardinf-A spawns(switch off when allies capture objective 1a)
		"spawn axistroops1 52144.18 2996655.55 3.19 0 0 0",
		"spawn axistroops1 52133.84 2996660.96 6.16 0 0 0",
		"spawn axistroops1 52071.04 2996667.38 0.00 0 0 45",

	-- forwardinf-B spawns (switch off when allies capture objective 1b)
		"spawn axistroops1 52432.13 2996663.19 6.16 0 0 270",
		"spawn axistroops1 52448.75 2996661.75 6.16 0 0 0",
		"spawn axistroops1 52655.90 2996672.85 -0.00 0 0 315",
	
	-- dockfront spawns (switch off when allies capture either objective 1a or 1b)
		"spawn axistroops1 52299.90 2996662.55 9.14 0 0 270",
		"spawn axistroops1 52323.94 2996660.01 9.14 0 0 0",
		"spawn axistroops1 52285.38 2996704.51 -1.72 0 0 90",


	-- mg nest1a (this closes when allies achieve stage 1a objective)
		"spawn axistroops -137.83 -79.05 40.19 0",

	-- mg nest1b (this closes when allies achieve stage 1b objective)
		"spawn axislmg 52486.68 2996747.17 9.92",
		
	-- ATG1a spawns (these close when allies achieve stage 1a objective)
		"spawn pak40 52141.67 2996772.26 0.00 0 0 0",
		"spawn pak40 52182.91 2996771.44 0.00 0 0 0",

	-- ATG1b spawn (these close when allies achieve stage 1b objective)
		"spawn pak40 52401.17 2996706.47 0.00 0 0 315",
		"spawn pak40 52431.24 2996787.91 0.00 0 0 315",
		
-- stage 2 ALLIED spawns
	-- Spawn 2a (switch off when Allies achieve stage 2 objective)
		"spawn alliedtroops 52241.57 2997072.03 1.81 0 0 180",
		"spawn alliedtroops 52221.14 2997056.36 3.53 0 0 180",
		"spawn alliedtroops 52200.75 2997054.05 3.55 0 0 180",

	-- Spawn 2b (switch off when Allies achieve stage 2 objective)
		"spawn alliedtroops 52534.76 2997100.17 1.01 0 0 180",
		"spawn alliedtroops 52547.56 2997092.00 1.52 0 0 180",
		"spawn alliedtroops 52568.62 2997082.65 2.00 0 0 180",

	-- Tank Spawns
		"spawn church3 52252.95 2997081.07 0.80 0 10 180",
		"spawn church3 52237.16 2997067.30 2.35 0 15 180",
		"spawn church3 52217.93 2997046.87 4.71 0 15 180",
	
-- stage 2 AXIS spawns
	-- west spawns (these close when allies achieve stage 2 objective)
		"spawn axistroops1 52035.59 2996637.50 5.01 0 0 45",
		"spawn axistroops1 52050.94 2996611.82 5.17 315",

	-- east spawns (these close when allies achieve stage 2 objective)
		"spawn axistroops1 52538.34 2996638.15 3.18 0 0 180",
		"spawn axistroops1 52553.08 2996634.37 6.16 270",

	-- center spawns (these close when allies achieve stage 2 objective)
		--"spawn axistroops1 -176.06 36.48 16.88 90",
	
	-- ATG2 spawns (these close when allies achieve stage 2 objective)
		"spawn pak40 52029.23 2996633.96 0.00 0 0 0",
		"spawn pak40 52242.49 2996662.70 0.00 0 0 270",

		
-- stage 3 ALLIED spawns
	-- Spawn 3
		"spawn alliedtroops 52294.92 2996639.88 9.14 0 0 180",
		"spawn alliedtroops 52318.17 2996636.06 9.14 0 0 90",
		"spawn alliedtroops 52276.58 2996653.44 6.16 0 0 270",
		"spawn alliedtroops 52249.38 2996649.40 3.18 0 0 0",
		"spawn alliedtroops 52206.80 2996650.26 6.16 0 0 0",
		"spawn alliedtroops 52231.70 2996650.37 3.18 0 0 0",
	
-- stage 3 AXIS spawns
	-- factory spawns
		"spawn axistroops1 52352.29 2996516.77 5.01 0 0 90",
		"spawn axistroops1 52369.10 2996490.77 5.17 0 0 0",
		"spawn axistroops1 52364.48 2996474.00 3.55 0 0 0",

	-- farm building spawns
		"spawn axistroops1 52115.82 2996456.52 0.36 0 0 0",
		"spawn axistroops1 52150.05 2996441.91 0.36 0 0 270",
		"spawn axistroops1 52135.53 2996463.53 3.18 0 0 90",
		
	-- last base spawns
		"spawn axistroops1 52110.66 2996519.36 3.18 0 0 180",
	
	-- mg nest3
		"spawn de-lmg 52104.49 2996524.21 5.63 0 0 0",

	};

	for i,v in ipairs(content) do 
		scenario.manager:AddContent(v);
	end
end
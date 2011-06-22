

if(true) then
	-- content we're going to add
	local content = 
	{
		-- include lua file
		-- command,path
		"include scenarios/terrain/dieppe/map.lua",
		"include scenarios/content/dieppephase1.lua",
		"include scenarios/content/dieppephase2.lua",
		"include scenarios/content/dieppephase3.lua",
		
		-- we're using minefields, so include that functionality
		"include scenarios/content/minefields.lua",
		

----------------------------- VEHICLE MASKS ----------------------------------------- 
		
	-- MAKE A VEHICLE AVAILABLE FOR SPAWNING
		
		
	-- allied spawn list (all phases of battle)
		"vehicle alliedtroops uk-rifle",
		"vehicle alliedtroops uk-smg",
		"vehicle alliedtroops uk-lmg",
		"vehicle alliedtroops uk-sniper",
		"vehicle alliedplanes spit5",
		"vehicle alliedplanes spit9",

	
	-- axis spawn list (all phases of the battle)
		"vehicle axistroops1 de-rifle",
		"vehicle axistroops1 de-smg",
		"vehicle axistroops1 de-sniper",
		"vehicle axistroops1 de-ltmortar",
		"vehicle axislmg de-lmg",
		"vehicle axisplanes bf109f4",
		"vehicle axisplanes fw190",
		
	
	
-----------------------------  DEFINE THE PLAY AREA ---------------------------------- 

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

	
				
	-- LANDMINES
	
		"ammo landmine1 landmine",
		"ammo landmine2 landmine",
		"ammo landmine3 landmine",
		"ammo landmine4 landmine",

	-- west side minefield
		"area landmine1 OnMineArea 51999.91 2996961.96 0.94",
		"area landmine1 OnMineArea 52015.30 2996627.13 0.47",
		"area landmine1 OnMineArea 51742.57 2996635.34 0.54",
		"area landmine1 OnMineArea 51763.71 2996643.74 0.43",
		"area landmine1 OnMineArea 51824.73 2996731.69 0.38",
		"area landmine1 OnMineArea 51838.43 2996799.17 0.87",
		"area landmine1 OnMineArea 51890.90 2996907.68 0.21",
		
	-- west side town minefield
		"area landmine2 OnMineArea 51996.03 2996619.53 0.40",
		"area landmine2 OnMineArea 51994.52 2996598.24 0.55",
		"area landmine2 OnMineArea 51999.86 2996597.76 0.02",
		"area landmine2 OnMineArea 51999.84 2996255.40 0.73",
		"area landmine2 OnMineArea 51837.50 2996254.43 0.54",
		"area landmine2 OnMineArea 51887.08 2996614.63 0.34",
		
	-- east side minefield
		"area landmine3 OnMineArea 52773.13 2996606.87 0.00",
		"area landmine3 OnMineArea 52746.84 2996607.11 0.00",
		"area landmine3 OnMineArea 52743.08 2996699.70 0.00",
		"area landmine3 OnMineArea 52690.11 2996796.95 0.00",
		"area landmine3 OnMineArea 52678.17 2996809.88 0.23",
		"area landmine3 OnMineArea 52673.01 2997024.69 0.70",
		"area landmine3 OnMineArea 52798.57 2996962.72 0.94",
		

	-- back side minefield
		"area landmine4 OnMineArea 52011.22 2996390.68 0.00",
		"area landmine4 OnMineArea 52388.04 2996388.77 0.00",
		"area landmine4 OnMineArea 52388.04 2996325.18 0.37",
		"area landmine4 OnMineArea 52010.77 2996317.72 0.42",
				

		
----------------------------- AMBIENT EFFECTS AND SOUNDS -----------------------------
	
		-- SOUNDS
		
	-- positional sounds
	-- command name filename volume loop x y z mindist maxdist	
		"sound sounds/ambience/ocean.wav 10 1 -63 212 3 100 1000",	
		"sound sounds/fairmileb/idle.wav 2.0 1 52277.74 2997094.15 0.22 5 25",
		"sound sounds/fairmileb/idle.wav 2.0 1 52511.59 2997116.92 0.14 5 25",
		
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
		
	

----------------------------- TRIGGERS ----------------------------------------------------
	-- NOTE: THESE WERE CUTnPASTED FROM DOG_GREEN AND MAY NOT BE REQUIRED FOR DIEPPE --
		
	-- british destroyers
		--"clone destroyer1 uk_z34 509.16 922.13 3.3 0 0 120",
		--"clone destroyer2 uk_z34 823.10 733.41 3.3 0 0 120",
		--"clone destroyer3 uk_z34 112.23 1143.07 3.3 0 0 120",
		
	-- primary naval bambardment fx		
	-- main guns PHASE 1- fire near draw on hill tops
		--"firepoint.0.1.1 shorebarrage1 destroyer1 2 0 -.45 .665 .015 .02 1",
		--"firepoint.0.1.1 shorebarrage1 destroyer1 2 1 -.45 .665 .015 .02 1",
		--"firepoint.0.1.1 shorebarrage1 destroyer1 2 2 -.45 .665 .015 .02 1",
		--"firepoint.0.1.1 shorebarrage2 destroyer1 6 9 -.45 -.58 .017 .02 1",
		--"firepoint.0.1.1 shorebarrage2 destroyer1 6 10 -.45 -.58 .017 .02 1",
		
	-- main guns PHASE 2
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

	-- this one is close to the play area so discontinue it during PHASE 2 hill assault
		-- event eventname perchance(0->1) delaybetweenevents(ms) durationofevent 1 
		--"event0.1.1 shorebarrage4 .5 2000 100 1",
		--"event shorebarrage5 .5 2000 100 1",
		--"event shorebarrage6 .5 2000 100 1",
		
		
----------------------------- ALERTS & WAYPOINTS ------------------------------------------- 
		
	-- HUD ALERTS
	
	-- get their attention
		"sound onPHASEend sounds/Drum1.wav 1 0",
	
		--"alert onspawn onspawn 0",
		--"alert playarea playarea 10",	
		
	-- PHASE 1	
		--"alert.0.1.1 onPHASEend bunkercap1a",
		--"alert.0.1.1 onPHASEend bunkercap1b",
		
		--"message alliedcapon alliedcapon allied 10",
		--"message alliedcapoff alliedcapoff axis 0",
		
	-- PHASE 2
		
		--"message objective2 alliedcapon allied 10",
		--"message HQcaptureon HQcapture allied 20",
		
		--"waypoint.0.1.2 onspawn HQcapture -29.52 -78.26 39.57 axis",
		--"waypoint.0.1.2 onspawn beachhead -152.10 61.01 12.89 allied",

	-- PHASE 3
		
		--"message objective3 alliedcapon allied 10",
		--"message taketownon taketown allied 20",
		
		--"waypoint.0.1.2 onspawn CHQ -29.52 -78.26 39.57 axis",
		--"waypoint.0.1.2 onspawn CHQ -152.10 61.01 12.89 allied",
		
	-- phase 1 FUNCTIONS and OBJECTIVES (Allied capture objectives phase 1)

	-- Outer Bunkers capture objective (obj1-a and obj1-b)
		--"handler capper OnCapper",
		--"handler objective1 OnCapturing",
		--"handler capturebunkers OnReceiveBroadcast",

		-- objective 1a
		"area bunkercap1a OnState 52111.28 2996780.50 0.00",
		"area bunkercap1a OnState 52131.18 2996778.44 0.00",
		"area bunkercap1a OnState 52130.75 2996787.76 0.00",
		"area bunkercap1a OnState 52152.00 2996789.35 0.00",
		"area bunkercap1a OnState 52151.44 2996779.31 0.00",
		"area bunkercap1a OnState 52173.27 2996778.93 0.00",
		"area bunkercap1a OnState 52173.52 2996789.61 0.00",
		"area bunkercap1a OnState 52192.88 2996789.49 0.00",
		"area bunkercap1a OnState 52192.14 2996777.61 0.00",
		"area bunkercap1a OnState 52210.68 2996776.99 0.00",
		"area bunkercap1a OnState 52210.58 2996784.43 0.00",
		"area bunkercap1a OnState 52220.03 2996793.29 0.00",
		"area bunkercap1a OnState 52226.58 2996793.32 0.00",
		"area bunkercap1a OnState 52232.14 2996785.59 0.00",
		"area bunkercap1a OnState 52212.87 2996767.70 0.00",
		"area bunkercap1a OnState 52108.73 2996767.97 0.00",
		
		-- objective 1b
		"area bunkercap1b OnState 52423.94 2996799.50 0.00",
		"area bunkercap1b OnState 52465.20 2996799.15 0.00",
		"area bunkercap1b OnState 52466.05 2996806.46 0.15",
		"area bunkercap1b OnState 52486.13 2996806.71 0.16",
		"area bunkercap1b OnState 52486.01 2996802.22 0.05",
		"area bunkercap1b OnState 52505.18 2996801.15 0.03",
		"area bunkercap1b OnState 52506.16 2996808.73 0.21",
		"area bunkercap1b OnState 52524.51 2996808.92 0.21",
		"area bunkercap1b OnState 52525.23 2996799.93 0.00",
		"area bunkercap1b OnState 52548.39 2996798.77 0.00",
		"area bunkercap1b OnState 52550.11 2996807.47 0.18",
		"area bunkercap1b OnState 52569.43 2996807.94 0.19",
		"area bunkercap1b OnState 52569.22 2996793.88 0.00",
		"area bunkercap1b OnState 52441.42 2996788.81 0.00",
		"area bunkercap1b OnState 52429.43 2996777.60 0.00",
		"area bunkercap1b OnState 52419.94 2996785.66 0.00",	
		
		
	
		
				
----------------------------- SPAWNS ------------------------------------

	-- Allied all phases spawning (aircraft)
		"spawn spitvb 62309.93 2988137.17 101.78 0 0 315",
		"spawn spitvb 62252.14 2988069.20 101.79 0 0 315",
		"spawn spit9 62252.14 2988069.20 101.79 0 0 315",
		"spawn spit9 62277.54 2988086.51 101.78 0 0 315",


	-- Axis all phases spawning (aircraft)
		"spawn bf109f4 38419.42 2993784.50 0.71 0 0 90",
		"spawn bf109f4 38433.23 2994153.83 0.71 0 0 90",
		"spawn fw190 38443.34 2993936.35 0.71 0 0 90",
		"spawn fw190 38407.79 2993995.24 0.71 0 0 90",
	
-- (awaiting further editing of phases 1, 2 and 3 by Troy) --

		
	};

	for i,v in ipairs(content) do 
		scenario.manager:AddContent(v);
	end
end
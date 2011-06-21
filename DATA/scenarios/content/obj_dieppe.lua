

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
	
	-- EMITTERS
	-- command,effectname,worldx,worldy,worldz
	
	-- smoke effects
	-- craters
		--"emitter cratersmoke -100.77 167.75 3.72",
		--"emitter cratersmoke -94.12 107.80 5.35",
		--"emitter cratersmoke -13.15 63.35 5.15",
		--"emitter cratersmoke 134.57 -4.02 5.16",
		--"emitter cratersmoke 59.42 25.24 6.21",

-- smokescreens
	-- west side beach approach
		"emitter smokescreen 52296.78 2997013.90 -0.44",
		"emitter smokescreen 52254.52 2997000.68 3.10",
		"emitter smokescreen 52220.33 2996978.60 7.27",		
		"emitter smokescreen 52180.52 2996971.28 12.44",
		"emitter smokescreen 52142.03 2996971.47 13.21",
		"emitter smokescreen 52191.74 2996876.57 5.56",
		"emitter smokescreen 52248.22 2996952.46 2.94",
		"emitter smokescreen 52225.93 2996926.26 5.41",
		"emitter smokescreen 52251.88 2996888.40 1.10",
		"emitter smokescreen 52248.04 2996837.97 0.57",
		"emitter smokescreen 52198.49 2996843.89 3.19",
		"emitter smokescreen 52130.96 2996840.91 2.97",
		"emitter smokescreen 52143.03 2996920.46 8.75",
		"emitter smokescreen 52197.48 2996897.22 7.06",
		"emitter smokescreen 52111.32 2996883.63 8.44",

	-- east side beach approach
		"emitter smokescreen 52513.52 2997046.32 2.27",
		"emitter smokescreen 52523.90 2996997.58 3.15",
		"emitter smokescreen52534.27 2996932.37 4.01",
		"emitter smokescreen 52467.03 2996858.39 1.38",
		"emitter smokescreen 52530.86 2996869.71 1.65",
		"emitter smokescreen 52600.27 2996905.33 3.59",
		"emitter smokescreen 52610.41 2996938.81 7.23",
		"emitter smokescreen 52586.42 2996961.73 6.29",
		"emitter smokescreen 52605.20 2997022.78 6.64",
		"emitter smokescreen 52547.23 2996934.52 4.66",
		"emitter smokescreen 52498.03 2996901.25 2.39",
		"emitter smokescreen 52498.03 2996901.25 2.39",
		"emitter smokescreen 52594.03 2996819.94 0.47",
		"emitter smokescreen 52622.57 2996864.04 1.86",

		

	-- landing craft hulk smoke
		"emitter hulksmoke 52284.27 2997092.69 1.05",
		"emitter hulksmoke 52272.47 2997094.34 0.00",
		"emitter hulksmoke 52540.25 2997112.35 0.85",
		"emitter hulksmoke 52533.03 2997119.60 0.95",

	-- landing craft hulk fire
		"emitter smallfire 52284.27 2997092.69 1.05",
		"emitter smallfire 52533.03 2997119.60 0.90",
		

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
		
	-- only played during PHASE 1
		--"event guns1 .5 1000",
		--"event.0.1.1 guns2 .5 1000",
		--"event.0.1.1 bombs .5 1000",
		--"event wind .5 5000",

----------------------------- TRIGGERS -------------------------------------------------- 
		

			
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

	-- bunker pak40s fire durring PHASE 1
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
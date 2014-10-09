

if(true) then
	-- content we're going to add
	local content =
	{
		-- include lua file
		-- command,path
		"include scenarios/terrain/factory1/map.lua",

-- DEFINE THE PLAY AREA

	-- boundary name x y z

		--"boundary playarea 190993.49 3016047.94 142.00",
		--"boundary playarea 190993.44 3015929.07 142.00",
		--"boundary playarea 190983.18 3015917.96 142.00",
		--"boundary playarea 190890.88 3015923.63 142.00",
		--"boundary playarea 190890.70 3016048.18 142.00",

		

-- DEFINE WHERE PLAYERS SPAWN

	-- Allied Infantry Spawns
	-- command spawngroup worldx worldy,worldz yaw
	
		"spawn alliedtroops 119226.14 2843803.03 293.10 0",
		"spawn alliedtroops 119260.37 2843814.77 293.10 270",
		
		

	-- Axis Infantry Spawns
	-- command spawngroup worldx worldy,worldz yaw

		"spawn axistroops 119252.01 2843879.61 293.23 160",
		"spawn axistroops 119265.89 2843879.28 293.28 180",
		
		


-- DEFINE BLOCKED AREAS OF NO ACCESS BY PLAYERS

		-- blocking volume gate1
		-- block gate1 x1 y1 z1 x2 y2 z2 thickness height

	   "block 119268.38 2843883.93 294.89 119263.56 2843883.23 294.89 2 10",

		-- blocking volume gate2
		-- block gate2 x1 y1 z1 x2 y2 z2 thickness height

	       	--"block gate2 190890.93 3015979.93 142.00 190891.51 3015970.24 142.00 2 3",
		
		
				
-- FX EMITTERS

	-- command,effectname,worldx,worldy,worldz
	-- smoke effects

	-- SMOKING BARRELS

		--"emitter hulksmoke 273119.68 3016921.62 482.00",
		--"emitter hulksmoke -29.35 -105.79 9.06",

	-- SMOKING CRATERS

		--"emitter hulksmoke 173.40 -38.89 6.9",
		--"emitter hulksmoke 129.71 -55.96 7.0",

	-- SMOKESCREEN

		--"emitter smokescreen -46.03 -224.78 15.92",
		--"emitter smokescreen -1.73 -226.20 16.42",
		
	-- SMOKING VEHICLES

		--"emitter hulksmoke 272998.02 3016996.20 481.5",
		--"emitter hulksmoke 272922.72 3016995.51 481.5",

	-- BURNING VEHICLES

		--"emitter vehiclefire 190999.27 3016031.74 143.50",

		
-- SOUNDS
		
	-- ABSOLUTE SOUNDS
	-- command name filename minvol, maxvol
		
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


	-- A LINE OF BOMBS (as if dropped from a plane)
	-- command name ammo worldx1 worldy1 worldz1 worldx2 worldy2 worldz2

		--"bombingrun bombing1 gp500 272970.33 3016753.34 487.99 273011.34 3016751.15 487.99",
		--"bombingrun bombing1 gp250 273079.40 3016700.38 493.43 273103.98 3016699.07 494.59",
		--"bombingrun bombing1 gp250 272745.39 3017000.12 482.21 272780.73 3016999.68 482.21",
		--"bombingrun bombing1 gp250 274041.21 3016923.54 539.90 274040.94 3016998.48 539.56",
		--"bombingrun bombing2 smallbarragebomb 33.14 -165.89 7.68 6.27 -182.85 2.72",
		--"bombingrun bombing2 smallbarragebomb 212.53 -134.06 19.33 163.59 -134.66 4.72",

		
	-- AREA EFFECT BOMBING OR BARRAGE (simulating artillery barrage)
	-- the x,y,z is the center of the barrage
	-- the distance is the radius of a circle around the center to randomly fire off the ammo in
	-- command name ammo x y z distance

		--"barrage barrage1 smallbarragebomb 191032.58 3016111.40 142.00 40",
		--"barrage barrage1 smallbarragebomb 190924.72 3015856.39 142.00 20",
		--"barrage barrage1 smallbarragebomb 190872.91 3016115.73 142.00 30",


		
-- TRIGGERS
	
	-- EVENT TRIGGERS	
	-- command name pctgchance-each-second wait-in-milliseconds

		"event planes .40 120000",
		"event bombs .10 20000",
		"event explosions .20 25000",
		"event guns1 .15 10000",
		"event guns2 .20 30000",
		"event wind .5 5000",
		-- "event bombing1 .15 30000 500 6",
		-- "event bombing2 .18 20000 750 3",
		--"event barrage1 .10 30000 650 12",
		--"event barrage1 .10 30000 550 12",
		--"event barrage1 .10 30000 750 12",
		

	-- AREA TRIGGERS
	-- command name triggertype worldx worldy worldz
	

		--directions at allied spawn 1

		--"area toalliedspawn OnTrigger 190899.98 3016041.67 145.55",		
		--"area toalliedspawn OnTrigger 190899.95 3016023.24 145.55",
		--"area toalliedspawn OnTrigger 190908.31 3016023.25 145.55",
		--"area toalliedspawn OnTrigger 190908.37 3016041.56 145.55",
				

		-- directions at axis spawn 1

		--"area toaxisspawn OnTrigger 190985.52 3015941.83 145.55",	
		--"area toaxisspawn OnTrigger 190979.80 3015947.75 145.55",	
		--"area toaxisspawn OnTrigger 190966.76 3015934.84 145.55",	
		--"area toaxisspawn OnTrigger 190972.59 3015928.88 145.55",	
				

-- CLONES --

	-- NAMED VERSION
	-- command name typeid x y z roll pitch yaw

		--"clone pzivg 119107.70 2843927.50 294.99 0 0 90",
		--"clone pzivg 119113.95 2843927.50 294.99 0 0 90",
		--"clone pzivg 119120.30 2843927.50 294.99 0 0 90",
		
		
		--"clone pzivg 119098.30 2843968.78 294.99 0 0 180",
		--"clone pzivg 119098.30 2843962.50 294.99 0 0 180",
		--"clone pzivg 119098.30 2843956.30 294.99 0 0 180",
		--"clone pzivg 119101.2 2843956.30 294.99 0 0 180",
		--"clone pzivg 119104.0 2843956.30 294.99 0 0 180",
		
		--"clone pzivg 119095.30 2843968.78 294.99 0 0 180",
		--"clone pzivg 119095.30 2843962.50 294.99 0 0 180",
		--"clone pzivg 119095.30 2843956.30 294.99 0 0 180",
		
		--"clone stug3g 119130.5 2843946.78 294.9 0 0 0",
		--"clone stug3g 119130.5 2843952.78 294.9 0 0 0",
		--"clone stug3g 119130.5 2843958.78 294.9 0 0 0",
		--"clone stug3g 119130.5 2843964.78 294.9 0 0 0",
		
		
		
				
	-- ANONYMOUS VERSION
	-- command name typeid x y z roll pitch yaw

		-- "clone bedford -19.75 -153.93 9.05 2 0 0",
		-- "clone bedford -27.34 -150.10 8.9 4 0 285",
		-- "clone bedford -35.21 -147.32 8.85 6 2 285",

-- ADD A HUD ALERT

		-- these are always named
		-- look them up from the scenario content in the web translation tool
		-- command categorynamealert namealert numberofsecondsbetweenrepeatalerts
		-- numberofsecondsbetweenrepeatalerts 0= no limit, 1= onetime per scenario, unit measure is seconds 
		
		-- HUD WAYPOINTERS

		"waypoint.2 onspawn ukspawn 119239.85 2843810.96 297.03 enemy",
		"waypoint.1 onspawn gerspawn 119257.97 2843871.23 297.68 enemy",


		"alert onspawn onspawn.moveout 30",
	
		--"alert roundstop roundstop",
		--"alert victory1 victory1",
		--"alert victory2 victory2",
		--"alert playarea playarea 10",
		--"alert churchentry churchentry 20000",
		--"alert toaxisspawn toaxisspawn -1",
		--"alert toalliedspawn toalliedspawn -1",

		--"alert playarea playarea 10",
		"alert victory1 victory1",
		"alert victory2 victory2",
		"alert roundstop roundstop",
		
		
		
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

		-- ALLIED SPAWN list

		"mask alliedtroops uk_buzzard",
		"mask alliedtroops uk-rifle",
		"mask alliedtroops uk-smg",
		"mask alliedtroops uk-lmg 1",

				
		-- AXIS SPAWN list

		"mask axistroops derifle",
		"mask axistroops de-smg",
		"mask axistroops de-lmg 1",
	};

	for i,v in ipairs(content) do 
		scenario.manager:AddContent(v);
	end
end



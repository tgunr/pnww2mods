

if(true) then
	-- content we're going to add
	local content =
	{
		-- include lua file
		-- command,path
		"include scenarios/terrain/cagefight/map.lua",

-- DEFINE THE PLAY AREA

	-- boundary name x y z

		"boundary playarea 190890.87 3015923.68 143.00",
		"boundary playarea 190890.87 3015968.95 143.00",
		"boundary playarea 190895.84 3015971.24 143.00",
		"boundary playarea 190896.15 3015979.12 143.00",
		"boundary playarea 190891.06 3015981.02 143.00",
		"boundary playarea 190890.62 3016048.07 143.00",
		"boundary playarea 190993.13 3016048.06 143.00",
		"boundary playarea 190993.20 3016037.21 143.00",
		"boundary playarea 190987.79 3016034.99 143.00",
		"boundary playarea 190987.44 3016027.67 143.00",
		"boundary playarea 190993.32 3016025.47 143.00",
		"boundary playarea 190993.22 3015928.65 143.00",
		"boundary playarea 190983.47 3015918.12 143.00",

		

-- DEFINE WHERE PLAYERS SPAWN

	-- Allied Infantry Spawns
	-- command spawngroup worldx worldy,worldz yaw
	
		"spawn alliedtroops 190900.52 3016040.81 145.55 180",
		"spawn alliedtroops 190907.37 3016040.87 145.55 180",
		"spawn alliedtroops 190904.22 3016023.94 145.55 0",

	-- Axis Infantry Spawns
	-- command spawngroup worldx worldy,worldz yaw

		"spawn axistroops 190979.58 3015947.05 145.55 204",
		"spawn axistroops 190984.56 3015941.84 145.55 245",
		"spawn axistroops 190970.10 3015932.28 145.55 44",

-- DEFINE BLOCKED AREAS OF NO ACCESS BY PLAYERS

		-- blocking volume gate1
		-- block gate1 x1 y1 z1 x2 y2 z2 thickness height

	       	-- "block gate1 190992.16 3016037.96 143.00 190992.03 3016024.58 143.00 3 5",

		-- blocking volume gate2
		-- block gate2 x1 y1 z1 x2 y2 z2 thickness height

	       	-- "block gate2 190892.33 3015983.32 143.00 190892.08 3015967.47 143.00 3 5",
		
		
				
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

		"emitter vehiclefire 190999.27 3016031.74 143.50",

		
-- SOUNDS
		
	-- ABSOLUTE SOUNDS
	-- command name filename minvol, maxvol
		
		"sound planes sounds/scenarios/ambient_aircraft_squadron1.wav .3 0",
		"sound planes sounds/scenarios/ambient_aircraft_squadron2.wav .4 0",
		"sound bombs sounds/scenarios/ambient_bombs_distantshells1.wav .5 0",
		"sound bombs sounds/scenarios/ambient_bombs_distantshells2.wav .5 0",
		"sound explosions sounds/scenarios/ambient_explosions_fourinarow.wav .4 0",
		"sound explosions sounds/troop/grenade.wav .5 0",
		"sound guns1 sounds/scenarios/ambient_guns_machine_gun1.wav .2 0",
		"sound guns1 sounds/scenarios/ambient_guns_machine_gun2.wav .2 0",
		"sound guns1 sounds/scenarios/ambient_guns_machine_gun3.wav .2 0",
		"sound guns1 sounds/airraidsiren.wav .06 0",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun4.wav .2 0",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun5.wav .2 0",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun6.wav .2 0",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun7.wav .2 0",
		"sound wind sounds/ambience/gust1.wav .5 0",
		"sound wind sounds/ambience/gust2.wav .5 0",


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

		"barrage barrage1 smallbarragebomb 191032.58 3016111.40 142.00 40",
		"barrage barrage1 smallbarragebomb 190924.72 3015856.39 142.00 20",
		"barrage barrage1 smallbarragebomb 190872.91 3016115.73 142.00 30",


		
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
		"event barrage1 .10 30000 650 12",
		"event barrage1 .10 30000 550 12",
		"event barrage1 .10 30000 750 12",
		

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

		-- "clone bedford1 bedford -20.11 -156.51 8.77 0 0 90",
		
				
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

		"waypoint.2 onspawn ukspawn 190904.07 3016031.83 149.67 enemy",
		"waypoint.1 onspawn gerspawn 190977.45 3015940.51 149.39 enemy",


		"alert onspawn onspawn.moveout 60",
		--"alert roundstop roundstop",
		--"alert victory1 victory1",
		--"alert victory2 victory2",
		--"alert playarea playarea 10",
		--"alert churchentry churchentry 20000",
		--"alert toaxisspawn toaxisspawn -1",
		--"alert toalliedspawn toalliedspawn -1",

		"alert playarea playarea 10",
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



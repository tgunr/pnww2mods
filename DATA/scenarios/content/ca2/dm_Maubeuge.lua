

if(true) then
	-- content we're going to add
	local content =
	{
		-- include lua file
		-- command,path
		"include scenarios/terrain/maubeuge/map.lua",

-- DEFINE THE PLAY AREA

	-- boundary name x y z

		"boundary playarea 191009.92 3016066.52 142.00",
		"boundary playarea 190880.21 3016067.90 142.00",
		"boundary playarea 190864.57 3015945.77 142.00",
		"boundary playarea 190864.21 3015892.75 142.00",
		"boundary playarea 190876.02 3015893.23 142.00",
		"boundary playarea 190878.56 3015880.21 142.00",
		"boundary playarea 190941.37 3015879.42 142.00",
		"boundary playarea 190949.33 3015889.49 142.00",
		"boundary playarea 190984.68 3015889.69 142.00",
		"boundary playarea 190984.67 3015881.80 142.00",
		"boundary playarea 191015.98 3015880.04 142.00",
		"boundary playarea 191015.48 3015896.91 142.00",
		"boundary playarea 191009.76 3015897.11 142.00",
				

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

	-- blocking volume x
	-- block name x1 y1 z1 x2 y2 z2 thickness height

        	--"block 139.59 -86.67 8.69 104.30 -72.64 8.68 1 10",
		
				
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

		"emitter vehiclefire 190999.77 3016031.74 142.00",

		
-- SOUNDS
		
	-- ABSOLUTE SOUNDS
	-- command name filename minvol, maxvol
		
		"sound planes sounds/scenarios/ambient_aircraft_squadron1.wav .3 0",
		"sound planes sounds/scenarios/ambient_aircraft_squadron2.wav .4 0",
		"sound bombs sounds/scenarios/ambient_bombs_distantshells1.wav .5 0",
		"sound bombs sounds/scenarios/ambient_bombs_distantshells2.wav .5 0",
		"sound explosions sounds/scenarios/ambient_explosions_fourinarow.wav .7 0",
		"sound explosions sounds/troop/grenade.wav .5 0",
		"sound guns1 sounds/scenarios/ambient_guns_machine_gun1.wav .30 0",
		"sound guns1 sounds/scenarios/ambient_guns_machine_gun2.wav .35 0",
		"sound guns1 sounds/scenarios/ambient_guns_machine_gun3.wav .40 0",
		"sound guns1 sounds/airraidsiren.wav .06 0",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun4.wav .35 0",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun5.wav .35 0",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun6.wav .25 0",
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

		"barrage barrage1 smallbarragebomb 190956.63 3015992.07 142.00 40",
		"barrage barrage1 smallbarragebomb 190956.63 3015992.07 142.00 20",
		"barrage barrage1 smallbarragebomb 190956.63 3015992.07 142.00 30",


		
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
	-- directions near axis spawn 1
				
	-- directions near allied spawn 1

		--"area toalliedspawn OnTrigger 273072.68 3017105.01 481.04",
		--"area toalliedspawn OnTrigger 273083.87 3017104.83 481.04",
		--"area toalliedspawn OnTrigger 273084.30 3017091.38 481.04",
		--"area toalliedspawn OnTrigger 273064.71 3017091.61 481.04",
		--"area toalliedspawn OnTrigger 273065.58 3017086.03 481.00",
		--"area toalliedspawn OnTrigger 273091.97 3017086.82 481.00",
		--"area toalliedspawn OnTrigger 273101.01 3017097.40 481.00",
		--"area toalliedspawn OnTrigger 273089.52 3017110.12 481.004",
		--"area toalliedspawn OnTrigger 273073.21 3017110.48 481.00",
		
	-- directions near axis spawn 1

		--"area toaxisspawn OnTrigger 272896.87 3016931.75 481.02",
		--"area toaxisspawn OnTrigger 272892.58 3016929.13 481.00",
		--"area toaxisspawn OnTrigger 272872.11 3016943.18 481.00",
		--"area toaxisspawn OnTrigger 272890.21 3016961.04 481.00",
		--"area toaxisspawn OnTrigger 272907.17 3016945.80 481.00",
		--"area toaxisspawn OnTrigger 272903.36 3016940.54 481.00",
		--"area toaxisspawn OnTrigger 272890.03 3016954.54 481.04",		
		--"area toaxisspawn OnTrigger 272881.98 3016946.62 481.19",

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
		-- the lockey is a lockey looked up from the scenario content in the web translation tool
		-- command name lockey

		--"alert onspawn onspawn.moveout 60",
		--"alert roundstop roundstop",
		--"alert victory1 victory1",
		--"alert victory2 victory2",
		--"alert playarea playarea 10",
		--"alert churchentry churchentry 20000",
		--"alert toaxisspawn toaxisspawn -1",
		--"alert toalliedspawn toalliedspawn -1",

		
		
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

		-- ALIIED SPAWN list

		"vehicle alliedtroops fr-lmg",
		"vehicle alliedtroops fr-smg",
		"vehicle alliedtroops fr-rifle",
		"vehicle alliedtroops uk-lmg",
		"vehicle alliedtroops uk-smg",
		"vehicle alliedtroops uk-rifle",

		-- AXIS SPAWN list

		"vehicle axistroops de-smg",
		"vehicle axistroops de-lmg",
		"vehicle axistroops de-sniper",
	};

	for i,v in ipairs(content) do 
		scenario.manager:AddContent(v);
	end
end





if(true) then
	-- content we're going to add
	local content = 
	{
		-- include lua file
		-- command,path
		"include scenarios/terrain/manhay/map.lua",

-- DEFINE THE PLAY AREA

	-- boundary name x y z

        	"boundary playarea 273196.45 3017005.53 482.00",
		"boundary playarea 273199.11 3017002.78 481.00",
		"boundary playarea 273196.95 3016991.21 481.00",
		"boundary playarea 273231.24 3016991.54 481.00",
		"boundary playarea 273231.36 3016981.53 481.00",
		"boundary playarea 273220.40 3016981.39 481.00",
		"boundary playarea 273220.28 3016964.45 481.00",
		"boundary playarea 273194.90 3016929.32 481.00",
		"boundary playarea 273167.62 3016929.86 481.00",
		"boundary playarea 273167.56 3016907.62 481.00",
		"boundary playarea 273157.16 3016907.56 481.00",
		"boundary playarea 273157.71 3016901.88 481.00",
		"boundary playarea 273112.83 3016901.61 481.00",
		"boundary playarea 272925.07 3016903.91 481.00",
		"boundary playarea 272876.11 3016952.98 481.00",
		"boundary playarea 272875.90 3016981.47 481.00",
		"boundary playarea 272865.92 3016981.53 481.00",
		"boundary playarea 272866.64 3016991.02 481.00",
		"boundary playarea 272877.18 3016990.95 481.00",
		"boundary playarea 272878.09 3017035.84 481.00",
		"boundary playarea 272955.64 3017036.00 481.00",
		"boundary playarea 272955.37 3017114.28 481.00",
		"boundary playarea 273087.76 3017111.52 481.00",
		--"boundary playarea 272878.09 3017035.84 481.00",


-- DEFINE WHERE PLAYERS SPAWN

	-- command spawngroup worldx worldy,worldz yaw

		"spawn alliedtroops 272890.99 3016947.85 487.16",
		"spawn alliedtroops 272889.54 3016950.37 481.20",
		"spawn alliedtroops 272896.46 3016945.17 481.20",
		"spawn axistroops 273082.02 3017098.82 487.16",
		"spawn axistroops 273082.50 3017095.11 481.20",
		"spawn axistroops 273055.25 3017095.18 481.20",

-- DEFINE BLOCKED AREAS OF NO ACCESS BY PLAYERS

	-- blocking volume x
	-- block name x1 y1 z1 x2 y2 z2 thickness height

        	--"block 139.59 -86.67 8.69 104.30 -72.64 8.68 1 10",
		
				
-- FX EMITTERS

	-- command,effectname,worldx,worldy,worldz
	-- smoke effects

		-- SMOKING BARRELS

		--"emitter hulksmoke 273119.68 3016921.62 482.00",
		-- "emitter hulksmoke -29.35 -105.79 9.06",

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

		-- "emitter vehiclefire 107.62 -29.90 9.36",

		
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

		"bombingrun bombing1 gp500 272970.33 3016753.34 487.99 273011.34 3016751.15 487.99",
		"bombingrun bombing1 gp250 273079.40 3016700.38 493.43 273103.98 3016699.07 494.59",
		"bombingrun bombing1 gp250 272745.39 3017000.12 482.21 272780.73 3016999.68 482.21",
		"bombingrun bombing1 gp250 274041.21 3016923.54 539.90 274040.94 3016998.48 539.56",
		"bombingrun bombing2 smallbarragebomb 33.14 -165.89 7.68 6.27 -182.85 2.72",
		"bombingrun bombing2 smallbarragebomb 212.53 -134.06 19.33 163.59 -134.66 4.72",

		
	-- AREA EFFECT BOMBING OR BARRAGE (simulating artillery barrage)
	-- the x,y,z is the center of the barrage
	-- the distance is the radius of a circle around the center to randomly fire off the ammo in
	-- command name ammo x y z distance

		"barrage barrage1 smallbarragebomb 272858.40 3017087.65 482.95 20",
		"barrage barrage1 smallbarragebomb 273084.18 3016862.53 483.58 25",
		"barrage barrage1 smallbarragebomb 273213.38 3016970.93 483.21 25",


		
-- TRIGGERS
	
	-- EVENT TRIGGERS	
	-- command name pctgchance-each-second wait-in-milliseconds

		"event planes .20 240000",
		"event bombs .05 50000",
		"event explosions .10 75000",
		"event guns1 .15 100000",
		"event guns2 .25 300000",
		"event wind .5 50000",
		"event bombing1 .15 300000 500 9",
		"event bombing2 .18 20000 750 6",
		"event barrage1 .10 30000 650 12",
		

	-- AREA TRIGGERS
	-- command name triggertype worldx worldy worldz
	-- directions near axis spawn 1
				
		-- directions near allied spawn 1

		"area toalliedspawn OnTrigger 273072.68 3017105.01 481.04",
		"area toalliedspawn OnTrigger 273083.87 3017104.83 481.04",
		"area toalliedspawn OnTrigger 273084.30 3017091.38 481.04",
		"area toalliedspawn OnTrigger 273064.71 3017091.61 481.04",
		"area toalliedspawn OnTrigger 273065.58 3017086.03 481.00",
		"area toalliedspawn OnTrigger 273091.97 3017086.82 481.00",
		"area toalliedspawn OnTrigger 273101.01 3017097.40 481.00",
		"area toalliedspawn OnTrigger 273089.52 3017110.12 481.004",
		"area toalliedspawn OnTrigger 273073.21 3017110.48 481.00",
		
		-- directions near axis spawn 1

		"area toaxisspawn OnTrigger 272896.87 3016931.75 481.02",
		"area toaxisspawn OnTrigger 272892.58 3016929.13 481.00",
		"area toaxisspawn OnTrigger 272872.11 3016943.18 481.00",
		"area toaxisspawn OnTrigger 272890.21 3016961.04 481.00",
		"area toaxisspawn OnTrigger 272907.17 3016945.80 481.00",
		"area toaxisspawn OnTrigger 272903.36 3016940.54 481.00",
		"area toaxisspawn OnTrigger 272890.03 3016954.54 481.04",		
		"area toaxisspawn OnTrigger 272881.98 3016946.62 481.19",

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

		"alert onspawn spawnin.moveout",
		"alert churchentry churchentry 20000",
		"alert toaxisspawn toaxisspawn -1",
		"alert toalliedspawn toalliedspawn -1",

		
		
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

		"vehicle alliedtroops 1 0 9 0",
		"vehicle axistroops 4 0 9 0",

	};

	for i,v in ipairs(content) do 
		scenario.manager:AddContent(v);
	end
end



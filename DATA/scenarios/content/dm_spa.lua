

if(true) then
	-- content we're going to add
	local content = 
	{
		-- include lua file
		-- command,path
		"include scenarios/terrain/spa/map.lua",
		
-- DEFINE THE PLAY AREA

	-- boundary name x y z

        	"boundary  playarea 281312.72 3029588.86 307.00",
		"boundary  playarea 281287.30 3029589.05 307.00",
		"boundary  playarea 281292.42 3029691.96 307.00",
		"boundary  playarea 281376.00 3029689.88 307.00",
		"boundary  playarea 281561.97 3029649.53 307.00",
		"boundary  playarea 281580.90 3029569.52 307.00",
		"boundary  playarea 281580.16 3029262.34 307.00",
		"boundary  playarea 281138.19 3029271.66 307.00",
		"boundary  playarea 281141.88 3029531.67 307.00",
		"boundary  playarea 281208.41 3029531.89 307.00",
		"boundary  playarea 281208.44 3029463.50 307.00",
		"boundary  playarea 281313.16 3029463.51 307.30",


-- DEFINE WHERE PLAYERS SPAWN

	-- command spawngroup worldx worldy,worldz yaw

		"spawn alliedtroops 281260.07 3029284.52 307.00",
		"spawn alliedtroops 281249.07 3029314.84 307.00",
		"spawn alliedtroops 281228.61 3029290.84 307.00",

		"spawn axistroops 281561.99 3029563.54 313.16",
		"spawn axistroops 281549.47 3029535.99 307.20",
		"spawn axistroops 281568.20 3029553.17 313.16",

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

		"emitter vehiclefire 281465.85 3029470.51 308.56",

		
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

		"bombingrun bombing1 gp500 281363.42 3029612.92 307.00 281535.60 3029477.09 307.00",
		"bombingrun bombing1 gp250 281362.45 3029568.16 307.00 281494.93 3029425.95 307.00",
		"bombingrun bombing1 gp250 281305.52 3029453.95 307.00 281490.66 3029362.69 307.00",
		"bombingrun bombing3 sc250he 281567.98 3029604.33 307.00 281309.66 3029337.06 307.00",
		"bombingrun bombing2 gp40 281161.42 3029399.97 307.00 281304.14 3029275.07 307.00",
		"bombingrun bombing2 gp40 281497.00 3029659.46 307.00 281578.71 3029560.44 307.00",

		
	-- AREA EFFECT BOMBING OR BARRAGE (simulating artillery barrage)
	-- the x,y,z is the center of the barrage
	-- the distance is the radius of a circle around the center to randomly fire off the ammo in
	-- command name ammo x y z distance

		"barrage barrage1 gp40 281490.73 3029457.21 307.00 20",
		"barrage barrage1 gp40 281481.18 3029383.30 307.00 25",
		"barrage barrage1 gp40 281504.72 3029539.67 307.00 30",


		
-- TRIGGERS
	
	-- EVENT TRIGGERS	
	-- command name pctgchance-each-second wait-in-milliseconds

		"event planes .40 120000",
		"event bombs .10 20000",
		"event explosions .20 25000",
		"event guns1 .15 10000",
		"event guns2 .20 30000",
		"event wind .5 5000",
		"event bombing1 .15 30000 500 6",
		"event bombing2 .18 20000 750 5",
		"event barrage1 .10 30000 650 12",
		"event bombing3 .20 30000 500 9",
		
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

		-- AT NORTHEASTERN BOUNDARY CORNER

		"area NECORNERWARN OnTrigger 281207.51 3029532.10 307.00",
		"area NECORNERWARN OnTrigger 281192.77 3029531.76 307.00",
		"area NECORNERWARN OnTrigger 281196.42 3029528.09 307.00",
		"area NECORNERWARN OnTrigger 281207.84 3029527.26 307.00",

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

		--"alert onspawn spawnin.moveout",
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

		"vehicle alliedtroops 1 0 9 0",
		"vehicle axistroops 4 0 9 0",

	};

	for i,v in ipairs(content) do 
		scenario.manager:AddContent(v);
	end
end



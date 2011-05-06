

if(true) then
	-- content we're going to add
	local content = 
	{
		-- include lua file
		-- command,path
		"include scenarios/terrain/manhay/map.lua",

-- DEFINE THE PLAY AREA
	-- boundary name x y z

        	"boundary  playarea 272955.44,3017114.22,481.00",
		"boundary  playarea 273091.53,3017111.58,481.00",
		"boundary  playarea 273196.44,3017005.89,481.00",
		"boundary  playarea 273194.88,3016924.10,481.00",
		"boundary  playarea 273008.03,3016923.33,481.00",
		"boundary  playarea 273007.94,3016909.77,481.00",
		"boundary  playarea 272917.06,3016911.96,481.00",
		"boundary  playarea 272876.21,3016953.86,481.00",
		"boundary  playarea 272877.96,3017035.83,481.00",
		"boundary  playarea 272955.46,3017035.81,481.00",
		
				
		-- fx emitters
		-- command,effectname,worldx,worldy,worldz
		-- barrels
		"emitter hulksmoke 273119.68 3016921.62 482.00",
		-- "emitter hulksmoke -29.35 -105.79 9.06",
		-- craters
		"emitter hulksmoke 173.40 -38.89 6.9",
		"emitter hulksmoke 129.71 -55.96 7.0",
		-- smokescreen
		"emitter smokescreen -46.03 -224.78 15.92",
		"emitter smokescreen -1.73 -226.20 16.42",
		-- vehicles
		"emitter hulksmoke 272998.02 3016996.20 481.5",

		"emitter hulksmoke 272922.72 3016995.51 481.5",

		-- fires
		-- "emitter vehiclefire 107.62 -29.90 9.36",


		
		-- absolute sounds
		-- command,name,filename,0,0,0,minvol, maxvol
		
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


		-- positional sounds
		-- command name filename volume loop x y z mindist attenuation




		
		-- a line of bombs (as from a plane)
		-- command,name,ammo,worldx1,worldy1,worldz1,worldx2,worldy2,worldz2
		"bombingrun bombing1 gp500 272970.33 3016753.34 487.99 273011.34 3016751.15 487.99",
		"bombingrun bombing1 gp250 273079.40 3016700.38 493.43 273103.98 3016699.07 494.59",
		"bombingrun bombing1 gp250 272745.39 3017000.12 482.21 272780.73 3016999.68 482.21",
		"bombingrun bombing1 gp250 274041.21 3016923.54 539.90 274040.94 3016998.48 539.56",
		"bombingrun bombing2 gp40 33.14 -165.89 7.68 6.27 -182.85 2.72",
		"bombingrun bombing2 gp40 212.53 -134.06 19.33 163.59 -134.66 4.72",







		
		-- a area effect bombing
		-- the x,y,z is the center of the barrage
		-- the distance is the radius of a circle around the center to randomly fire off the ammo in
		-- command name ammo x y z distance
		"barrage barrage1 gp40 272858.40 3017087.65 482.95 20",
		"barrage barrage1 gp40 273084.18 3016862.53 483.58 25",
		"barrage barrage1 gp40 273213.38 3016970.93 483.21 25",





		
		-- triggers
		-- commandname,pctg chance each second,wait in seconds
		"event planes .40 120000",
		"event bombs .10 20000",
		"event explosions .20 25000",
		"event guns1 .15 10000",
		"event guns2 .20 30000",
		"event wind .5 5000",
		"event bombing1 .15 30000 500 6",
		-- "event bombing2 .18 20000 750 3",
		"event barrage1 .10 30000 650 7",
		


		
		-- areas
		-- command,scripthandler,worldx,worldy,worldz
		-- "area boundingbox OnBoundary 272955.44 3017114.22 481.00",
		-- "area boundingbox OnBoundary 272989.81 3017119.77 481.00",
		-- "area boundingbox OnBoundary 273076.59 3017139.48 480.53",



		
		-- directions to allied spawn
		"area toalliedspawn OnTrigger 273072.68 3017105.01 481.04",
		"area toalliedspawn OnTrigger 273083.87 3017104.83 481.04",
		"area toalliedspawn OnTrigger 273084.30 3017091.38 481.04",
		"area toalliedspawn OnTrigger 273064.71 3017091.61 481.04",
		"area toalliedspawn OnTrigger 273065.58 3017086.03 481.00",
		"area toalliedspawn OnTrigger 273091.97 3017086.82 481.00",
		"area toalliedspawn OnTrigger 273101.01 3017097.40 481.00",
		"area toalliedspawn OnTrigger 273089.52 3017110.12 481.004",
		"area toalliedspawn OnTrigger 273073.21 3017110.48 481.00",
		
		-- directions to axis spawn
		"area toaxisspawn OnTrigger 272896.87 3016931.75 481.02",
		"area toaxisspawn OnTrigger 272892.58 3016929.13 481.00",
		"area toaxisspawn OnTrigger 272872.11 3016943.18 481.00",
		"area toaxisspawn OnTrigger 272890.21 3016961.04 481.00",
		"area toaxisspawn OnTrigger 272907.17 3016945.80 481.00",
		"area toaxisspawn OnTrigger 272903.36 3016940.54 481.00",
		"area toaxisspawn OnTrigger 272890.03 3016954.54 481.04",		
		"area toaxisspawn OnTrigger 272881.98 3016946.62 481.19",

																


		
		
		
		
		
		
		
		
		
		
		
		
		
		

		
		-- "area barrage1 na -0.96 -38.87 8.25",
		-- "area barrage1 na 69.38 -143.93 8.13",


		-- ALERTS AND CHATS
		-- ADD A CHAT TO THE CHAT WINDOW
		
		-- these are always named
		-- the lockey is a lockey looked up from the scenario content in the web translation tool
		-- command name lockey
		--"chat spawnin spawnin.moveout",
		
		-- ADD A HUD ALERT
		
		-- these are always named
		-- the lockey is a lockey looked up from the scenario content in the web translation tool
		-- command name lockey
		"alert onspawn spawnin.moveout",
		"alert churchentry churchentry",
		"alert toaxisspawn toaxisspawn",
		"alert toalliedspawn toalliedspawn",




		
		-- spawn points
		-- command,spawngroup,worldx,worldy,worldz,yaw
		"spawn alliedtroops 272890.99 3016947.85 487.16",
		"spawn alliedtroops 272889.54 3016950.37 481.20",
		"spawn alliedtroops 272896.46 3016945.17 481.20",
		"spawn axistroops 273082.02 3017098.82 487.16",
		"spawn axistroops 273082.50 3017095.11 481.20",
		"spawn axistroops 273055.25 3017095.18 481.20",
		
		-- vehicle masks
		
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
		"vehicle axistroops 1 0 9 0",
	};

	for i,v in ipairs(content) do 
		scenario.manager:AddContent(v);
	end
end



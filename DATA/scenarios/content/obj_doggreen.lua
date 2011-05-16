

if(true) then
	-- content we're going to add
	local content = 
	{
		-- include lua file
		-- command,path
		"include scenarios/terrain/doggreen/map.lua",
		
		-- we're using minefields, so include that functionality
		"include scenarios/content/minefields.lua",
		
		-- landmines
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

		"area landmine3 OnMineArea -150.62 -112.22 41.67",
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

		"area landmine4 OnMineArea -205.41 -227.16 41.47",
		"area landmine4 OnMineArea -113.98 -198.53 46.55",
		"area landmine4 OnMineArea -112.83 -213.57 47.27",
		"area landmine4 OnMineArea -213.05 -246.95 40.96",

		

		
		
		
		
		
		
		
		
-- DEFINE THE PLAY AREA

	-- boundary name x y z

        "boundary  playarea 178.01 83.76 3.89",
		"boundary  playarea -85.32 281.74 3.89",
		"boundary  playarea -346.98 -240.08 46.47",
		"boundary  playarea 180.74 -292.20 45.74",
		
		
	-- american capture objective

		"area germanhq OnTrigger -21.98 -157.93 46.33",
		"area germanhq OnTrigger -22.45 -143.22 46.33",
		"area germanhq OnTrigger -16.07 -142.60 46.33",
		"area germanhq OnTrigger -15.39 -156.44 46.33",	
		
		
		
		
		
		
		
		
	-- FX EMITTERS

	-- command,effectname,worldx,worldy,worldz
	-- smoke effects

		-- SMOKING BARRELS

		-- "emitter hulksmoke 273119.68 3016921.62 482.00",
		-- "emitter hulksmoke -29.35 -105.79 9.06",

		-- SMOKING CRATERS

		-- "emitter hulksmoke 173.40 -38.89 6.9",
		-- "emitter hulksmoke 129.71 -55.96 7.0",

		-- SMOKESCREEN

		"emitter smokescreen -97.32 -2.10 21",
		"emitter smokescreen -121.65 6.49 23",
		"emitter smokescreen -30.43 -51.98 23.78",		
		"emitter smokescreen -64.53 80.62 8",	
		"emitter smokescreen 27.01 -92.92 30.51",
		"emitter smokescreen -37.89 -59.64 31.44",
		"emitter smokescreen -79.64 -24.46 30.00",
		"emitter smokescreen -129.96 99.52 9.5",
		
		
		-- POSITIONAL SOUNDS
	-- command name filename volume loop x y z mindist maxdist	
	"sound sounds/ambience/ocean.wav 10 1 -63 212 3 100 1000",	
		
		
-- CLONES --

	-- NAMED VERSION
	-- command name typeid x y z roll pitch yaw

		-- "clone bedford1 bedford -20.11 -156.51 8.77 0 0 90",
		
				
	-- ANONYMOUS VERSION
	-- command typeid x y z roll pitch yaw

		"clone uk_z34 509.16 922.13 -5 0 0 90",
		"clone pak40 -350.63 199.13 22.5 0 0 90 ",
		"clone pak40 -172.00 93.24 12.2 0 0 90 ",
		"clone pak40 -124.42 46.24 12.6 0 -10 90 ",
		
		
	

	
	
		
		
-- ALERTS AND CHATS
-- ADD AN INFORMATION MESSAGE TO THE CHAT WINDOW
		
	-- these are always named
	-- the lockey is a lockey looked up from the scenario content in the web translation tool
	-- command name lockey
	--"chat spawnin spawnin.moveout",
		
-- ADD A HUD ALERT
		
	-- these are always named
	-- the lockey is a lockey looked up from the scenario content in the web translation tool
	-- command name lockey

		"alert onspawn onspawn.moveout",
		"alert toaxisspawn toaxisspawn",
		"alert toalliedspawn toalliedspawn",
		"alert germanhq germanhq",
		
		
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

		-- "vehicle alliedtroops 2 0 9 0",
		-- "vehicle axistroops 4 0 9 0",
		
		
-- DEFINE WHERE PLAYERS SPAWN

	-- command spawngroup worldx worldy,worldz yaw

		"spawn alliedtroops -9.45 169.72 4.21",
		"spawn axistroops -135.49 -116.56 42.35",
		"spawn axistroops -131.18 -94.50 42.86",

		
		
		
		

	};

	for i,v in ipairs(content) do 
		scenario.manager:AddContent(v);
	end
end



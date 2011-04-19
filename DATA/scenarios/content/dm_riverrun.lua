

if(true) then
	-- content we're going to add
	local content = 
	{
		-- include lua file
		-- command,path
		"include scenarios/terrain/riverrun/map.lua",
		
		-- fx emitters
		-- command,effectname,worldx,worldy,worldz
		-- "emitter hulksmoke 273239.41 3016934.89 481",
		
		-- absolute sounds
		-- command,name,filename,0,0,0,minvol, maxvol
		
		-- positional sounds
		-- command,name,filename,volume,loop
		-- command,name,filename,worldx,worldy,worldz,mindist,attenuation,loop
		
		"sound planes sounds/scenarios/ambient_aircraft_squadron1.wav .4 0",
		"sound planes sounds/scenarios/ambient_aircraft_squadron2.wav .4 0",
		"sound bombs sounds/scenarios/ambient_bombs_distantshells1.wav .6 0",
		"sound bombs sounds/scenarios/ambient_bombs_distantshells2.wav .6 0",
		"sound explosions sounds/scenarios/ambient_explosions_fourinarow.wav .6 0",
		"sound guns1 sounds/scenarios/ambient_guns_machine_gun1.wav .3 0",
		"sound guns1 sounds/scenarios/ambient_guns_machine_gun2.wav .3 0",
		"sound guns1 sounds/scenarios/ambient_guns_machine_gun3.wav .3 0",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun4.wav .3 0",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun5.wav .3 0",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun6.wav .3 0",
		"sound guns sounds/scenarios/ambient_guns_machine_gun7.wav .3 0",
		"sound wind sounds/ambience/gust1.wav .6 0",
		"sound wind sounds/ambience/gust2.wav .6 0",
		
		-- a line of bombs (as from a plane)
		-- command,name,ammo,worldx1,worldy1,worldz1,worldx2,worldy2,worldz2
		"bombingrun bombing1 gp250 -184.65 -279.50 22.84 46.61 -297.32 22.54",
		"bombingrun bombing1 gp250 210.96 -227.13 19.97 274.58 -85.40 19.97",
		"bombingrun bombing1 gp250 268.23 77.65 6.21 152.83 123.03 6.21",
		"bombingrun bombing1 gp250 -69.51 80.01 6.21 -177.68 11.25 6.21",
		
		-- a area effect bombing
		"barrage barrage1 gp40",
		
		-- triggers
		-- commandname,pctg chance each second,wait in seconds
		"event planes .25 60000",
		"event bombs .2 20000",
		"event explosions .3 25000",
		"event guns1 .3 30000",
		"event guns2 .3 30000",
		"event wind .5 5000",
		"event bombing1 .3 10000 500 6",
		"event barrage1 .3 10000 2000 10",
		
		-- areas
		-- command,scripthandler,worldx,worldy,worldz
		-- "area OnBoundary 272792.27 3016974.34 481",
		-- "area OnBoundary 272879.85 3017243.51 481",
		-- "area OnBoundary 273290.72 3017060.01 481.01",
		-- "area OnBoundary 273241.15 3016784.37 482.88",
		-- "area OnBoundary 272810.72 3016884.47 481",
		-- "area OnBoundary 272765.70 3017002.75 481.00",
		
		"area barrage1 na -0.96 -38.87 8.25",
		"area barrage1 na 69.38 -143.93 8.13",
		
		-- spawn points
		-- command,spawngroup,worldx,worldy,worldz,yaw
		"spawn alliedtroops 183.78 -15.14 7.50 1",
		"spawn alliedtroops 190.62 -22.67 7.11 1",
		"spawn axistroops -32.62 -126.14 7.97 -2.7",
		"spawn axistroops -37.69 -117.76 7.95 -2.7",
		
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
		"vehicle axistroops 4 0 9 0",
	};

	for i,v in ipairs(content) do 
		scenario.manager:AddContent(v);
	end
end





if(true) then
	-- content we're going to add
	local content = 
	{
		-- include lua file
		-- command,path
		"include scenarios/terrain/riverrun/map.lua",
		
		-- fx emitters
		-- command,effectname,worldx,worldy,worldz
		-- barrels
		"emitter hulksmoke -25.16 -97.95 9.39",
		"emitter hulksmoke -29.35 -105.79 9.06",
		-- craters
		"emitter hulksmoke 173.40 -38.89 6.9",
		"emitter hulksmoke 129.71 -55.96 7.0",
		-- smokescreen
		"emitter smokescreen -46.03 -224.78 15.92",
		"emitter smokescreen -1.73 -226.20 16.42",


		-- fires
		"emitter vehiclefire 107.62 -29.90 9.36",

		
		-- absolute sounds
		-- command,name,filename,0,0,0,minvol, maxvol
		
		"sound planes sounds/scenarios/ambient_aircraft_squadron1.wav .2 0",
		"sound planes sounds/scenarios/ambient_aircraft_squadron2.wav .3 0",
		"sound bombs sounds/scenarios/ambient_bombs_distantshells1.wav .4 0",
		"sound bombs sounds/scenarios/ambient_bombs_distantshells2.wav .4 0",
		"sound explosions sounds/scenarios/ambient_explosions_fourinarow.wav .60 0",
		"sound explosions sounds/troop/grenade.wav .40 0",
		"sound guns1 sounds/scenarios/ambient_guns_machine_gun1.wav .20 0",
		"sound guns1 sounds/scenarios/ambient_guns_machine_gun2.wav .25 0",
		"sound guns1 sounds/scenarios/ambient_guns_machine_gun3.wav .30 0",
		"sound guns1 sounds/airraidsiren.wav .06 0",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun4.wav .25 0",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun5.wav .25 0",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun6.wav .15 0",
		"sound guns2 sounds/scenarios/ambient_guns_machine_gun7.wav .4 0",
		"sound wind sounds/ambience/gust1.wav .9 0",
		"sound wind sounds/ambience/gust2.wav .9 0",


		-- positional sounds
		-- command name filename volume loop x y z mindist maxdist
		"sound sounds/tank_burn.wav 1 1 108 -29 8 5 20",
		"sound sounds/bedford/idle.wav 0.5 1 -22 -151 10 5 10",

		
		-- a line of bombs (as from a plane)
		-- command,name,ammo,worldx1,worldy1,worldz1,worldx2,worldy2,worldz2
		"bombingrun bombing1 gp250 -184.65 -279.50 22.84 46.61 -297.32 22.54",
		"bombingrun bombing1 gp250 210.96 -227.13 19.97 274.58 -85.40 19.97",
		"bombingrun bombing1 gp500 268.23 77.65 6.21 152.83 123.03 6.21",
		"bombingrun bombing1 gp250 -69.51 80.01 6.21 -177.68 11.25 6.21",
		"bombingrun bombing2 gp40 33.14 -165.89 7.68 6.27 -182.85 2.72",
		"bombingrun bombing2 gp40 212.53 -134.06 19.33 163.59 -134.66 4.72",

		
		-- a area effect bombing
		-- the x,y,z is the center of the barrage
		-- the distance is the radius of a circle around the center to randomly fire off the ammo in
		-- command name ammo x y z distance
		"barrage barrage1 gp40 -154.25 -107.17 8.77 25",
		"barrage barrage1 gp40 84.84 306.73 21.79 50",
		"barrage barrage1 gp40 -266.85 -36.03 5.26 50",






		
		-- triggers
		-- commandname,pctg chance each second,wait in seconds
		"event planes .40 120000",
		"event bombs .10 20000",
		"event explosions .20 25000",
		"event guns1 .15 10000",
		"event guns2 .20 30000",
		"event wind .5 5000",
		"event bombing1 .10 15000 500 6",
		"event bombing2 .10 20000 750 3",
		"event barrage1 .20 60000 700 10",


		
		-- areas
		-- command,scripthandler,worldx,worldy,worldz
		"area OnBoundary 127.32 15.89 8.39",
		"area OnBoundary 119.71 8.58 8.72",
		"area OnBoundary 89.20 -11.75 8.72",
		"area OnBoundary 72.14 -19.26 8.72",
		"area OnBoundary 70.13 -25.14 8.72",
		"area OnBoundary 52.20 -23.69 8.06",
		"area OnBoundary 44.19 -18.79 8.07",
		"area OnBoundary -6.22 -27.59 8.07",
		"area OnBoundary -8.91 -25.96 8.07",
		"area OnBoundary -34.50 -32.33 8.08",
		"area OnBoundary -40.21 -34.92 8.09",
		"area OnBoundary -50.11 -45.41 8.09",
		"area OnBoundary -85.21 -95.83 8.99",
		"area OnBoundary -90.96 -112.08 8.97",
		"area OnBoundary -89.51 -125.04 8.01",
		"area OnBoundary -88.01 -134.17 7.51",
		"area OnBoundary -87.32 -148.08 8.18",
		"area OnBoundary -47.24 -159.94 7.19",
		"area OnBoundary -24.50 -160.02 8.18",
		"area OnBoundary -26.84 -167.96 8.84",
		"area OnBoundary -20.96 -167.33 8.84",
		"area OnBoundary -12.62 -149.44 10.08",
		"area OnBoundary 58.00 -172.00 8.10",
		"area OnBoundary 94.96 -158.02 8.10",
		"area OnBoundary 163.22 -117.42 7.30",
		"area OnBoundary 188.94 -93.27 6.46",
		"area OnBoundary 213.55 -51.72 6.64",
		"area OnBoundary 226.64 -33.89 6.81",
		"area OnBoundary 236.02 -13.51 7.30",
		"area OnBoundary 130.67 14.12 8.45",
		
		-- spawn points
		-- command,spawngroup,worldx,worldy,worldz,yaw
		"spawn alliedtroops -35.72 -152.77 7.82 0.44",
		"spawn alliedtroops -25.47 -167.30 7.82 0.41",
		"spawn axistroops 210.55 -15.95 7.81 -2.20",
		"spawn axistroops 216.89 -17.83 7.80 -2.29",
		
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



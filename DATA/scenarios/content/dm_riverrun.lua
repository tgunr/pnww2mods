

if(true) then
	-- content we're going to add
	local content = 
	{
		-- include lua file
		-- command,path
		"include scenarios/terrain/riverrun/map.lua",
		
		-- fx emitters
		-- command,effectname,worldx,worldy,worldz
		-- SMOKE
		-- barrels
		"emitter hulksmoke -25.16 -97.95 9.39",
		"emitter hulksmoke -29.35 -105.79 9.06",
		-- craters
		"emitter hulksmoke 173.40 -38.89 6.9",
		"emitter hulksmoke 129.71 -55.96 7.0",
		-- smokescreen
		-- "emitter smokescreen -46.03 -224.78 15.92",
		-- "emitter smokescreen -1.73 -226.20 16.42",
		-- vehicles
		"emitter hulksmoke -28.16 -171.19 3.25",
		"emitter hulksmoke 158.46 -16.93 9.0",







		-- FIRES
		"emitter vehiclefire 107.62 -29.90 9.36",
		"emitter vehiclefire 157.34 -16.48 8.08",




		
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
		-- "sound sounds/tank_burn.wav 1 1 108 157 -16 8 5 20",
		-- "sound sounds/tank_burn.wav 1 1 158 -15 10 5 20",
		-- "sound sounds/bedford/idle.wav 0.5 1 -22 -151 10 5 10",





		
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
		-- "event planes .40 120000",
		-- "event bombs .10 20000",
		-- "event explosions .20 25000",
		-- "event guns1 .15 10000",
		-- "event guns2 .20 30000",
		-- "event wind .5 5000",
		-- "event bombing1 .10 15000 500 6",
		-- "event bombing2 .10 20000 750 3",
		-- "event barrage1 .20 60000 700 10",


		
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

		-- ADD CLONE VEHICLE TO THE WORLD --
		
		-- named version
		-- command name typeid x y z roll pitch yaw
		-- "clone bedford1 bedford -20.11 -156.51 8.77 0 0 90",
		
		-- anonymous version
		-- command name typeid x y z roll pitch yaw
		"clone bedford -28.25 -172.75 2.5 15 -10 20",
		"clone bedford -19.75 -153.93 9.05 2 0 0",
		"clone bedford -27.34 -150.10 8.9 4 0 285",
		"clone bedford -35.21 -147.32 8.85 6 2 285",

		"clone oplbltz 192.79 -31.45 8.5 5 -4.25 205",
		"clone oplbltz 176.32 -20.12 8.55 0 0 180",














	
		-- ADD A BLOCKING VOLUME TO THE WORLD --
		
		-- the scale parameters are from 0 to some real number
		-- 1 means no scale, 2 means twice the size and .5 means
		-- half the size, etc...
		
		-- named version
		-- command name filename x y z roll pitch yaw scalex scaley scalez
		-- "block block1 blockvolume 273239.41 3016934.89 481 0 0 90",
		
		-- anonymous version
		-- command name filename x y z roll pitch yaw scalex scaley scalez
		"block blockvol_vis -25.89 -133.5 8.2 0 0 22 .3 1.7 1",
		"block blockvol_vis -19.00 -115.75 7.5 0 0 20 .3 3.3 2.5",
		"block blockvol_vis -4.2 -135.8 8.2 0 0 20 .3 1.2 2",
		"block blockvol_vis -72 -98.5 8.1 0 0 110 .3 21 2",
		"block blockvol_vis -48.91 -117.6 8.1 0 0 110 .3 1.5 2",
		"block blockvol_vis 11.5 -136.02 8 0 0 110 .3 1.9 2",
		"block blockvol_vis 8.75 -128.75 8.25 0 0 110 .3 1 1",
		"block blockvol_vis 37.5 -149 8.2 0 0 110 .3 1.6 2",
		"block blockvol_vis 63.57 -147.67 8.0 0 0 20 8.5 1.6 2.5",




		-- church
		"block blockvol_vis 61 -90.00 27 0 0 -20 .3 2 1",

		-- truck in building
		"block blockvol_vis 24.92 -146.93 8.5 0 0 -20 .3 2.9 1.8",























		
		-- ADD A CHAT TO THE CHAT WINDOW
		
		-- these are always named
		-- the lockey is a lockey looked up from the scenario content in the web translation tool
		-- command name lockey
		"chat spawnin spawnin.moveout",
		
		-- ADD A HUD ALERT
		
		-- these are always named
		-- the lockey is a lockey looked up from the scenario content in the web translation tool
		-- command name lockey
		"hudalert spawnin spawnin.moveout",

		
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




-- game content
state.content = 
{
	-- placed objects
	-- command,filename,worldx,worldy,worldz,roll,pitch,yaw,scalex,scaley,scalez,damage
	"place bel4 -75.0592 -117.812 8.2 0 0 16 0 0 0 1",
	"place bel6 -18.3792 -147.545 7.45 0 0 200 0 0 0 1",
	"place bel6 -10.867 -118.518 7.6 0 0 112 0 0 0 1",
	
	-- fx emitters
	-- command,effectname,worldx,worldy,worldz
	-- "emitter hulksmoke 273239.41 3016934.89 481",
	
	-- fx sounds
	-- command,filename,worldx,worldy,worldz, minvol, maxvol, chance, loop
	-- "sound sounds/airraidsiren.wav 273239.41 3016934.89 481 10 40 1 1",
	-- "sound airraidsiren 273155.37 3017155.68 -481.00 10 40 .1 0",
	
	-- areas
	-- command,scripthandler,worldx,worldy,worldz
	-- "area OnBoundary 272792.27 3016974.34 481",
	-- "area OnBoundary 272879.85 3017243.51 481",
	-- "area OnBoundary 273290.72 3017060.01 481.01",
	-- "area OnBoundary 273241.15 3016784.37 482.88",
	-- "area OnBoundary 272810.72 3016884.47 481",
	-- "area OnBoundary 272765.70 3017002.75 481.00",
	
	-- spawn points
	-- command,spawngroup,worldx,worldy,worldz,yaw
	"spawn alliedtroops 0 0 0",
	"spawn axistroops 0 0 0",
	
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


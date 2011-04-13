
-- game content
state.content = 
{
	-- placed objects
	-- command,filename,worldx,worldy,worldz,roll,pitch,yaw,scalex,scaley,scalez,damage
	"place bel4 272868.26 3016897.34 481 0 0 90 0 0 0 1",
	
	-- fx emitters
	-- command,effectname,worldx,worldy,worldz
	"emitter hulksmoke 272911.21 3016949.12 481.00",

	-- fx sounds
	-- command,filename,worldx,worldy,worldz, minvol, maxvol, chance, loop
	"sound sounds/airraidsiren.wav 273239.41 3016934.89 481 10 40 1 1",
	-- "sound airraidsiren 273155.37 3017155.68 -481.00 10 40 .1 0",
	
	-- areas
	-- command,scripthandler,worldx,worldy,worldz
	"area OnBoundary 272955.44 3017114.22 481.00",
	"area OnBoundary 273091.53 3017111.58 481.00",
	"area OnBoundary 273196.44 3017005.89 481.00",
	"area OnBoundary 273194.88 3016924.10 481.00",
	"area OnBoundary 273008.03 3016923.33 481.00",
	"area OnBoundary 273007.94 3016909.77 481.54",
	"area OnBoundary 272917.06 3016911.96 481.00",
	"area OnBoundary 272876.21 3016953.86 481.00",
	"area OnBoundary 272877.96 3017035.83 481.24",
	"area OnBoundary 272955.46 3017035.81 481.00",
	
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


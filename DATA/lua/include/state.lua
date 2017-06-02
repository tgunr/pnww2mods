
Include("vehicle");
Include("wwii");
Include("fp");

state = 
{
	name					= "basic.state",									-- should be unique
	key						= 0,												-- tutorial's host key for tracking completion progress
	ui						= nil, 												-- nil = default;
	despawnui				= nil,
	spawn 					= 
	{																			-- nil means don't auto spawn
		spec 				= nil,												-- default vehicle to spawn; vehicle.vehSpecByID("derifle")
		position			= 
		{    
			x			= -314061.11,
			y			= 3603759.94,
			z			= 101.30,
			yaw			= 1.51,
			tolerance	= 200													-- how far for in game starts before a reposition (meters) 
		},
		requires			= 
		{																		-- spawn requirement
			wCountry 	= vehicle.VEH_ANY,										-- country
			wCategory 	= vehicle.VEH_CATEGORY_INFANTRY,						-- category
			wClass 		= vehicle.VEH_CLASS_TROOP,								-- class
			wType 		= vehicle.VEH_ANY,										-- type
			wDefault	= 1														-- rifleman
		},
		block				= nil,
		vspawn				= 
		{
			    
			{1, 2, 6, 1, -314113.54, 3603732.95, 100.01, -1.98, false, 1},
			{1, 2, 4, 7, -314001.58, 3603767.72, 100.01, 1.15, false, 1},
			{1, 2, 6, 1, -314000.98, 3603738.97, 100.01, 1.63, false, 1},
			{1, 2, 4, 10, -314015.75, 3603782.17, 100.20,  -2.9, false, 1},
			{3, 2, 6, 2, -314113.54, 3603732.95, 100.01, -1.98, false, 3},
			{3, 2, 4, 4, -314001.58, 3603767.72, 100.01, 1.15, false, 3},
			{3, 2, 6, 3, -314000.98, 3603738.97, 100.01, 1.63, false, 3},
			{3, 2, 4, 7, -314015.75, 3603782.17, 100.20,  -2.9, false, 3},
			{4, 2, 6, 1, -314113.54, 3603732.95, 100.01, -1.98, false, 4},
			{4, 2, 4, 8, -314001.58, 3603767.72, 100.01, 1.15, false, 4},
			{4, 2, 6, 2, -314000.98, 3603738.97, 100.01, 1.63, false, 4},
			{4, 2, 4, 10, -314015.75, 3603782.17, 100.20,  -2.9, false, 4}
		}
	},
	onupdate				= nil,								-- nil = dont start updating
	ingameupdate			= false
};


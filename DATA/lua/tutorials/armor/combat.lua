
-- ui and tutorial libs already loaded by tutorial manager
-- imported additional game libs as needed
Include("combat");

-- set tutorial state here
state.name 		= "armor.combat";
state.enablemap	= true;
state.locations = 
{
	{
		origin 		= {212510, 3015094, 232},
		target 		= {217357, 3011048, 232}
	},
	{
		origin 		= {217357, 3011048, 232},
		target 		= {212510, 3015094, 232}
	}
};

-- set our initial tutorial state
tutorial.SetState(state);


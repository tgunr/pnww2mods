
-- ui and tutorial libs already loaded by tutorial manager
-- imported additional game libs as needed
Include("combat");

-- set tutorial state here
state.name 		= "fighter.combat";
state.enablemap	= true;
state.locations = 
{
	{
		origin 		= {348903, 2996887, 484},
		target 		= {349786, 3022325, 179}
	},
	{
		origin 		= {349786, 3022325, 179},
		target 		= {348903, 2996887, 484}
	}
};

-- set our initial tutorial state
tutorial.SetState(state);


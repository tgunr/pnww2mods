
-- ui and tutorial libs already loaded by tutorial manager
-- imported additional game libs as needed
Include("combat");

-- set tutorial state here
state.name 		= "infantry.combat";
state.enablemap	= true;
state.locations = 
{
	{
		origin 		= {212970, 3101368, 0},
		target 		= {213599, 3101225, 0}
	},
	{
		origin 		= {214216, 3101223, 0},
		target 		= {213599, 3101225, 0}
	}
};

-- set our initial tutorial state
tutorial.SetState(state);


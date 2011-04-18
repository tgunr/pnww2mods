
-- ui and tutorial libs already loaded by tutorial manager
-- imported additional game libs as needed
Include("scenario");

-- set tutorial state here
state.name 		= "scenario.deathmatch";
state.enablemap	= true;

-- set our initial tutorial state
tutorial.SetState(state);


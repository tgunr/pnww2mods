
-- ui and tutorial libs already loaded by tutorial manager
-- imported additional game libs as needed
Include("scen");

-- set tutorial state here
state.name 		= "scenario.ctf";
state.enablemap	= true;

-- set our initial tutorial state
tutorial.SetState(state);


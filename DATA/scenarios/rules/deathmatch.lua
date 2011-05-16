
-- ui and tutorial libs already loaded by tutorial manager
-- imported additional game libs as needed
Include("wwii");
Include("scenario");

-- set tutorial state here
state.name 					= "scenario.deathmatch";
state.enablemap			= true;

-- set our initial tutorial state
tutorial.SetState(state);

-- give a point to the enemy each time I die
function OnDie(handler)
	ui.ChatPrint("On die called!");
	scenario.AddEnemyScore(1);	
	-- scenario.manager:RunEvent("ondie");
	return 1;
end



-- ui and tutorial libs already loaded by tutorial manager
-- imported additional game libs as needed
Include("input");
Include("terrain");
Include("player");
Include("state"); -- includes default state
Include("strat");

-- set tutorial state here
state.ui 				= "tutcombat";
state.onupdate			= "OnGoalCombat";
state.ingameupdate		= true;
state.onmission			= false;
state.spawn.position	= nil;

function OnGoalCombat(step)
	-- ui.ChatPrint("Doing tutorial step: "..step);
	if(step == 1) then
		SetNextStep(1);
	elseif(step == 2) then
		tutorial.AddHandler(tutorial.TUT_EVENT_DAMAGE, "OnDamage");
		tutorial.AddTimer("OnMission", nil, 1);
		state.onmission = true;
		state.tom 		= 0;
		state.captures	= 0;
		state.damages 	= {};
	end
end

function OnDamage(handler, energy, obj)
	tutorial.AddUIMessage("damaged");
	return 1;
end

function OnMission(handler)
	
	if(not state.onmission) then
		return 1;
	end

	local tom 		= state.tom;
	local captures	= state.captures;
	local damages 	= 0;
	
	if(state.spawned > 0) then
		tom = tom + game.Frametime() - state.spawned;
	end
	
	for k,v in pairs(state.damages) do
		damages = damages + 1;
	end
	
	-- convert to seconds
	tom = math.floor(tom/1000);
	
	-- let the UI know
	if(game.Ingame()) then
		tutorial.CallJS("setCombatStatus", tom, captures, damages);
	else
		local combat = ui.FindView("combat");
		if(combat ~= nil) then
			combat:CallJS("setCombatStatus", tom, captures, damages);
		end
	end
	
	return 1;
end

function OnDie(handler)
	tutorial.ShowOK("dead", "OnDead");
	return 1;
end

function OnDead()
	if(game.Ingame()) then
		ui.LoadView("exitvehicle");
	end
end

function OnStart(handler)
	-- make sure strat doesn't run while in combat 
	tutorial.AllowStrat(false);
	
	-- inits
	state.damages	= {};
	state.tom 		= 0; -- how much time on mission we have
	state.captures	= 0; -- how many enemy table captures have we done
	state.spawned 	= 0; -- start of mission time
	state.spawns	= 0;
	
	-- setup our ownerships
	SetUpMap();
end

function OnSpawn(handler)
	-- do default on spawn
	tutorial.OnSpawn(handler);
	
	-- reset some default tutorial behaviors
	map.uiMapLock(false);
	
	-- lock the hud on
	player.persHUDLock(false);
	
	-- record mission start time
	state.spawned 	= game.Frametime();
	state.spawns	= state.spawns + 1;
	
	-- make the map is right
	SetUpMap();
	
	AddWP("origin", 8, 0);
	AddWP("target", 9, 0);
	
	-- keep handler going
	return 1;
end

function OnDespawn(handler)
	
	-- record how much time on mission we did
	state.tom = state.tom + game.Frametime() - state.spawned;
	state.spawned = 0;
	
	tutorial.RemoveWaypoint("origin");
	tutorial.RemoveWaypoint("target");
	
	-- let the ui know our status
	OnMission(nil);
	
	-- kill the ui that was hanging around
	tutorial.HideUI(true);
	
	-- keep handler going
	return 1;
end

function SetUpMap()
	if(tutorial.state.name == "infantry.combat") then
		strat.PwnStrat(wwii.WWII_FRANCE, "Willemstad");
		strat.PwnStrat(wwii.WWII_GERMANY, "Willemstad", "Willemstad Docks");
		strat.PwnStrat(wwii.WWII_GERMANY, "Willemstad", "Willemstad-Moerdijk Depot");
		strat.PwnStrat(wwii.WWII_GERMANY, "Willemstad", "Willemstad-Cromstrijen Depot");
	elseif(tutorial.state.name == "armor.combat") then
		strat.PwnStrat(wwii.WWII_FRANCE, "Walcourt");
		strat.PwnStrat(wwii.WWII_GERMANY, "Philipville");
	elseif(tutorial.state.name == "fighter.combat") then
		strat.PwnStrat(wwii.WWII_FRANCE, "Hahn");
		strat.PwnStrat(wwii.WWII_GERMANY, "Mendig");
	end
end

function GetLocation(name, side)
	local index = player.playerGetVehicle():GetSide();
	if(side ~= nil) then index = side end
	return state.locations[index][name];
end

function AddWP(name, t, s, add)
	local pos = GetLocation(name);
	if(pos ~= nil) then
		tutorial.AddWaypoint(name, t, s, pos[1], pos[2], pos[3], add);
	end
end

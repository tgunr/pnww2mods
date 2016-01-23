
-- ui and tutorial libs already loaded by tutorial manager
-- imported additional game libs as needed
Include("input");
Include("ob");
Include("terrain");
Include("player");
Include("map");
Include("strat");
Include("state"); -- includes default state

-- set tutorial state here
state.name 			= "basic.combat";
state.ui			= "tutcombat";
state.onupdate		= "OnGoalLearnCombat";
state.ingameupdate	= true;
state.onmission		= false;
state.spawns		= 0;
state.capend		= 60000; -- ms time it takes to capture

state.locations = 
{
	{
		origin 		= {347414, 3034477, 69},
		target 		= {347928, 3034821, 69},
		bunker 		= {347508, 3034524, 69},
		contact 	= {347869, 3034888, 69}
	},
	{
		origin 		= {347886, 3034927, 69},
		target 		= {347508, 3034524, 69},
		bunker 		= {347928, 3034821, 69},
		contact 	= {347462, 3034447, 69}
	}
};

-- set our initial tutorial state
tutorial.SetState(state);

-- main combat loop
function OnGoalLearnCombat(step)
	if(step == 1) then
		-- tutorial.RemoveHandler("OnDie"); -- kill it
		-- tutorial.AddHandler(tutorial.TUT_EVENT_DIED, "OnDie"); -- re-add it
		tutorial.AddHandler(tutorial.TUT_EVENT_MAP, "OnMapEvent");
		SetNextStep(1);
		--SetUpMap();
	elseif(step == 2) then
		SetInput(2, input.IMAP_MOM_SHOW_IN_GAME_MAP);
	elseif(step == 3) then
		tutorial.AddHandler(tutorial.TUT_EVENT_MAP, "OnWaypointActivate");
	elseif(step == 4) then
		AddWP("contact", 3, 4);
		tutorial.AddHandler(tutorial.TUT_EVENT_MAP, "OnAddReport");
	elseif(step == 5) then
		SetInput(1, input.IMAP_MOM_SHOW_IN_GAME_MAP);
	elseif(step == 6) then
		tutorial.AddHandler(tutorial.TUT_EVENT_KEY, "OnKey");
	elseif(step == 7) then
		fp.fpFPSControlBlockClear(fp.CB_MOVE);
		tutorial.AddHandler(tutorial.TUT_EVENT_ENTER, "OnFriendlyBunker");
		local wp = GetLocation("bunker");
		tutorial.CallJS("TutRemoveWaypoint", "bunker");
		tutorial.CallJS("TutAddWaypoint", "bunker", wp[1], wp[2], wp[3]);
	elseif(step == 8) then
		-- tutorial.AddHandler(tutorial.TUT_EVENT_COLLISION, "OnTableCollide");
		SetNextStep(1);
	elseif(step == 9) then
		SetNextStep(1);
	elseif(step == 10) then
		tutorial.AddHandler(tutorial.TUT_EVENT_ENTER, "OnEnemyBunker", "OnEnterEnemyBunker");
		tutorial.AddHandler(tutorial.TUT_EVENT_LEAVE, "OnEnemyBunker", "OnLeaveEnemyBunker");
		tutorial.AddHandler(tutorial.TUT_EVENT_UPDATE, "OnCapture");
		tutorial.AddHandler(tutorial.TUT_EVENT_DAMAGE, "OnDamage");
		tutorial.AddTimer("OnMission", nil, 1);
		state.onmission = true;
		state.tom 		= 0;
		state.captures	= 0;
		state.damages 	= {};
		state.damaged	= 0;
		state.capturing = false;
		state.captime	= 0;
		state.capcheck	= 0;
	end
end

function OnKey(handler, iac, param, count)
	if(param ~= 0 and iac == input.IAC_F1) then
		tutorial.CompleteStep(1);
		return 0;
	end
	return 1; -- keep handler running
end

function OnTableCollide(handler, obj)
	--ui.ChatPrint("Collided with " .. obj:ObjName());
	if(obj:ObjName() == "haphead1c") then
		tutorial.CompleteStep(1);
		return 0;
	end
	return 1;
end

function IsBunker(building)
	if(building:Filename() == "officebunker1c" or building:Filename() == "officebunker2c") then
		return building:Side();
	end
	return 0;
end

function OnFriendlyBunker(handler, building)
	if(IsBunker(building) == player.playerGetVehicle():GetSide()) then
		-- ui.ChatPrint("Entered " .. building:Filename());
		tutorial.CallJS("TutRemoveWaypoint", "bunker");
		tutorial.CompleteStep(1);
		return 0;
	end
	return 1;
end

function OnEnemyBunker(handler, building)
	local side = IsBunker(building);
	local v = player.playerGetVehicle();
	
	if(side > 0 and side ~= v:GetSide())then
		if(handler.eventType == tutorial.TUT_EVENT_ENTER) then
			state.capturing = true;
		elseif(handler.eventType == tutorial.TUT_EVENT_LEAVE) then
			state.capturing = false;
		end
	end
	return 1;
end

function OnAddReport(handler, etype)
	if(etype == tutorial.TUT_MAP_REPORT) then
		tutorial.CompleteStep(1);
	end
	return 1; -- keep handler running
end

function OnWaypointActivate(handler, etype)
	if(etype == tutorial.TUT_MAP_ACTIVATE) then
		tutorial.CompleteStep(1);
	end
	return 1; -- keep handler running
end

function OnZoomIn(handler, etype)
	if(etype == tutorial.TUT_MAP_ZOOMIN) then
		local map = map.FindMap("mapview");
		if(map ~= nil and map:Scale() < 1) then
			tutorial.CompleteStep(1);
			return 0;
		end
	end
	return 1; -- keep handler running
end

----------------- default handler overrides ---------------

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
	-- make sure strat doesn't update while we do our combat
	tutorial.AllowStrat(false);
	
	-- inits
	state.damages	= {};
	state.tom 		= 0; -- how much time on mission we have
	state.captures	= 0; -- how many enemy table captures have we done
	state.spawned 	= 0; -- start of mission time
	state.damaged	= 0;
	state.capturing = false;
	state.captime	= 0;
	state.capcheck	= 0;
	
	-- send an invalid capture state to reset the client
	tutorial.CallJS("setCaptureState", 0);
	
	-- set map ownerships
	SetUpMap();
end

function OnMission(handler)
	
	if(not state.onmission) then
		return 1;
	end

	local tom 		= state.tom;
	local captures	= state.captures;
	local damages 	= state.damaged;
	
	if(state.spawned > 0) then
		tom = tom + game.Frametime() - state.spawned;
	end
	
	-- for k,v in pairs(state.damages) do
	-- 	damages = damages + 1;
	-- end
	
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

function OnSpawn(handler)
	-- do default on spawn
	tutorial.OnSpawn(handler);
	
	-- reset some default tutorial behaviors
	map.uiMapLock(false);
	
	-- lock the hud on
	player.persHUDLock(false);
	
	-- setup waypoints here
	AddWP("origin", 8, 0);
	AddWP("bunker", 2, 0);
	AddWP("target", 9, 0);
	
	-- record mission start time
	state.spawned 	= game.Frametime();
	state.spawns	= state.spawns + 1;
	
	if(tutorial.nextStep < 7) then
		if(tutorial.nextStep >= 3 and tutorial.nextStep <= 5) then
			map.uiMapToggleIngameMap(1, input.IMAP_MOM_SHOW_IN_GAME_MAP, 0);
		end
		fp.fpFPSControlBlockSet(fp.CB_MOVE);
	elseif(tutorial.nextStep == 7) then
		local wp = GetLocation("bunker");
		tutorial.CallJS("TutRemoveWaypoint", "bunker");
		tutorial.CallJS("TutAddWaypoint", "bunker", wp[1], wp[2], wp[3]);
	end
	
	-- make on game buildings get their flags set
	SetUpMap();
	
	-- tutorial.SetUpdate("OnGoalLearnCombat");
	
	-- make sure we're up to date
	-- OnGoalLearnCombat(tutorial.currentStep);
	
	--if(state.spawns > 1) then
	--	OnGoalLearnCombat(tutorial.currentStep)
	--end
	if(step == 10) then
		-- let the ui know our status
		OnMission(nil);
	end
	
	-- keep handler going
	return 1;
end

function OnDespawn(handler)
	-- kill any waypoints?
	tutorial.RemoveWaypoint("origin");
	tutorial.RemoveWaypoint("bunker");
	tutorial.RemoveWaypoint("target");
	
	-- record how much time on mission we did
	state.tom = state.tom + game.Frametime() - state.spawned;
	state.spawned = 0;
	
	-- let the ui know our status
	OnMission(nil);
	
	-- kill the ui that was hanging around
	tutorial.HideUI(true);
	
	-- reset the update handler
	-- tutorial.SetUpdate(nil);
	
	-- keep handler going
	return 1;
end

function OnDamage(handler, energy, obj)
	if(energy > 0 and obj ~= nil and not obj:IsMe()) then
		-- if(state.damages[obj:GetChatHandle()] == nil or (state.damages[obj:GetChatHandle()] - game.Frametime()) > 5000) then
			state.damaged = state.damaged + 1;
			state.damages[obj:GetChatHandle()] = game.Frametime();
			tutorial.AddUIMessage("damaged");
		-- end
	end
	return 1;
end

function OnCapture(handler)
	local ft = game.Frametime();
	
	if(state.capcheck > 0 and state.capturing) then
		-- accumulate our cap time
		state.captime = state.captime + (ft - state.capcheck);
		
		if(state.captime > state.capend) then
			state.captime = state.capend;
		end
		
		-- if we fake capped it, note it
		if(state.captime >= state.capend and state.captures == 0) then
			state.captures = state.captures + 1;
		end
		
		-- now we need to send a fake capture state to the game client
		local pctg = state.captime / state.capend;
		tutorial.CallJS("setCaptureStatus", pctg);
		
		-- debug
		--ui.ChatPrint("Capture Percentage is now " .. (state.captime / state.capend));
	end
	
	-- save this check time
	state.capcheck = ft;
	
	-- keep going
	return 1;
end

function GetLocation(name, side)
	local index = player.playerGetVehicle():GetSide();
	if(side ~= nil) then index = side end
	
	ui.ChatPrint("Getting Combat Location: " .. name .. "," .. index .. "\n");
	
	return state.locations[index][name];
end

function AddWP(name, t, s, add)
	local loc = GetLocation(name);
	tutorial.AddWaypoint(name, t, s, loc[1], loc[2], loc[3], add);
end

function OnMapEvent(handler, etype)
	if(etype == tutorial.TUT_MAP_TOGGLE) then
		if(map.uiMapIngameMapUp()) then
			tutorial.CallJS("OnShowMap");
		else
			tutorial.CallJS("OnHideMap");
		end
	end
	return 1; -- keep handler running
end

function SetUpMap()
	local alliedCP = "Remagen";
	local axisCP = "Unkel";
	
	strat.PwnStrat(wwii.WWII_FRANCE, alliedCP);
	strat.PwnStrat(wwii.WWII_GERMANY, axisCP);
end

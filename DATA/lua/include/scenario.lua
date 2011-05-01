
-- ui and tutorial libs already loaded by tutorial manager
-- imported additional game libs as needed
Include("fp");
Include("input");
Include("terrain");
Include("player");
Include("state"); -- includes default state
Include("strat");
-- Include("zmq");
game.LoadLib("scenario");

-- set tutorial state here
scenario.manager		=  scenario.ScenarioManager:GetInstance();
state.name					= "scenario.generic";
state.ui 						= "scenhud";
state.spawn					= nil;
state.config					= {};
state.inbounds				= true;
state.lastinbounds		= true;
state.minefield				= nil;
state.minearea			= nil;
--state.ingameupdate	= true;

function OnStart(handler)
	-- make sure strat doesn't run while in combat 
	tutorial.AllowStrat(false);
	
	-- inits
	state.damages		= {};
	state.tom 			= 0; -- how much time on mission we have
	state.captures		= 0; -- how many enemy table captures have we done
	state.spawned 	= 0; -- start of mission time
	state.spawns		= 0;
	state.freePos		= {0,0,0};
	
	-- setup some general event handlers
	-- some game types might override these
	tutorial.AddHandler(tutorial.TUT_EVENT_SET, "OnSet");
	tutorial.AddHandler(tutorial.TUT_EVENT_DAMAGE, "OnDamage");
	tutorial.AddHandler(tutorial.TUT_EVENT_UPDATE, "OnMission");
	
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
	state.spawns		= state.spawns + 1;
	
	-- make the map is right
	SetUpMap();
	
	-- AddWP("origin", 8, 0);
	-- AddWP("target", 9, 0);
	
	veh = player.playerGetVehicle();
	
	state.freePos[1] = veh:GetPos(1);
	state.freePos[2] = veh:GetPos(2);
	state.freePos[3] = veh:GetPos(3);
	
	-- try to run any scenario events associated with despawning
	scenario.manager:RunEvent("onspawn");
	
	-- keep handler going
	return 1;
end

function OnDespawn(handler)
	
	-- record how much time on mission we did
	state.tom 			= state.tom + game.Frametime() - state.spawned;
	state.spawned 	= 0;
	
	-- tutorial.RemoveWaypoint("origin");
	-- tutorial.RemoveWaypoint("target");
	
	-- let the ui know our status
	OnMission(nil);
	
	-- kill the ui that was hanging around
	tutorial.HideUI(true);
	
	-- try to run any scenario events associated with despawning
	scenario.manager:RunEvent("ondespawn");
	
	-- keep handler going
	return 1;
end

-- handler for script variable changes
function OnSet(handler, name, value)
	-- spit out to chat the new var name and value
	ui.ChatPrint("Setting config var "..name.." to "..value);
	
	-- save our config value by name
	state.config[name] = value;
	
	-- for known config vars, do something
	if(name == "load" and value == "content") then
		LoadContent();
	end
	
	return 1;  -- this handle will continue to handle events
end

function LoadContent()
	-- unload any previously loaded data
	scenario.manager:UnloadContent();
	
	-- now let's reload our content
	if(state.config.content ~= nil) then
		game.RunScript("scenarios/content/" .. state.config.content .. ".lua");
	elseif(state.config.name ~= nil) then
		game.RunScript("scenarios/content/" .. state.config.name .. ".lua");
	end
	
	-- load any area handlers defined by our content
	-- scenario.manager:LoadObjects();
end

function OnDamage(handler, energy, obj)
	tutorial.AddUIMessage("damaged");
	return 1;
end

function OnMission(handler)
	
	if(not game.Ingame()) then
		return 1;
	end

	if(not game.SuperFloat() and not game.SuperTroop()) then 	
		veh = player.playerGetVehicle();
	
		if(veh ~= nil) then
			if(state.inbounds) then
				state.freePos[1] = veh:GetPos(1);
				state.freePos[2] = veh:GetPos(2);
				state.freePos[3] = veh:GetPos(3);
			else
				veh:SetPosition(state.freePos[1], state.freePos[2], state.freePos[3]);
			end
		end
	end
		
	-- local tom 		= state.tom;
	-- local captures	= state.captures;
	-- local damages 	= 0;
	
	-- if(state.spawned > 0) then
	-- 	tom = tom + game.Frametime() - state.spawned;
	-- end
	
	-- for k,v in pairs(state.damages) do
	-- 	damages = damages + 1;
	-- end
	
	-- convert to seconds
	-- tom = math.floor(tom/1000);
	
	-- let the UI know
	-- if(game.Ingame()) then
	-- 	tutorial.CallJS("setCombatStatus", tom, captures, damages);
	-- else
	-- 	local combat = ui.FindView("combat");
	-- 	if(combat ~= nil) then
	-- 		combat:CallJS("setCombatStatus", tom, captures, damages);
	-- 	end
	-- end
	
	return 1;
end

function OnDie(handler)
	scenario.manager:RunEvent("ondie");
	tutorial.ShowOK("dead", "OnDead");
	return 1;
end

function OnDead()
	if(game.Ingame()) then
		ui.LoadView("exitvehicle");
	end
end

function OnBoundary(handler)
	if(handler.state == tutorial.THS_EVENT_OUT and state.inbounds) then
		-- try to run any scenario events associated with despawning
		scenario.manager:RunEvent("onboundary");
		-- save our state
		state.inbounds = false;
		ui.ChatPrint("You have left the playable area!");
	elseif(handler.state == tutorial.THS_EVENT_IN and not state.inbounds) then
		state.inbounds = true;
		ui.ChatPrint("You have re-entered the playable area!");
	end
	
	return 1;
end

function OnTrigger(handler)
	if(handler.state == tutorial.THS_EVENT_IN) then
		-- try to run any events associated with this area
		scenario.manager:RunObject(handler.name, 1);
	else
		scenario.manager:RunObject(handler.name, 0);
	end
	
	return 1;
end

function OnMineArea(handler)
	if(handler.state == tutorial.THS_EVENT_IN) then
		-- get our player
		local v = player.playerGetVehicle();
		-- add a landmine handler
		tutorial.manager:AddLocationHandler("OnLandmine", nil, v:GetPos(1), v:GetPos(2), v:GetPos(3), 1);
	else
		tutorial.manager:RemoveHandler("OnLandmine");
		state.minearea = nil;
	end
	
	return 1;
end

function OnLandmine(handler)
	if(handler.state == tutorial.THS_EVENT_OUT) then
		-- check to see if we have stepped on a mine
		if(math.random() < .1) then
			scenario.manager:RunObject("landmine", 1);
			fp.fpFPSKillTrooper();
		else
			local v = player.playerGetVehicle();
			-- update our landmine position
			tutorial.manager:AddLocationHandler("OnLandmine", nil, v:GetPos(1), v:GetPos(2), v:GetPos(3), 1);
		end
	end
	return 1;
end

function SetUpMap()
	
	if(state.mapstate == nil) then
		return;
	end
	
	for i,ms in ipairs(state.mapstate) do
		-- owner, cp, fac (fac is optional)
		strat.PwnStrat(ms[1], ms[2], ms[3]);
	end
end

function GetLocation(name, side)
	if(not game.Ingame()) then
		return nil;
	end
	
	local index = player.playerGetVehicle():GetSide();
	
	if(side ~= nil) then
		index = side
	end
	
	return state.locations[index][name];
end

function AddWP(name, t, s, add)
	local pos = GetLocation(name);
	
	if(pos ~= nil) then
		tutorial.AddWaypoint(name, t, s, pos[1], pos[2], pos[3], add);
	end
end


-- ui and tutorial libs already loaded by tutorial manager
-- imported additional game libs as needed
Include("fp");
Include("input");
Include("terrain");
Include("player");
Include("state"); -- includes default state
Include("strat");

if(game.OS() ~= 1) then
	Include("zmq");
end

game.LoadLib("scenario");

-- set tutorial state here
scenario.manager		=  scenario.ScenarioManager:GetInstance();
state.name					= "scenario.generic";
state.ui 						= nil;
state.rounds				= {};
state.round					= 1;
state.spawn					= nil;
state.config					= {};
state.updates				= {}
state.inbounds				= true;
state.lastinbounds		= true;
state.network				= false;
state.victory					= 0;
state.lastroundtimer	= 0;
state.lastupdate			= game.Frametime();
state.starttime				= game.Frametime();

-- default server
state.config['server'] 	= '66.28.224.157';

-- states we'll monitor
if(game.OS() ~= 1) then 
	state.hoststates			= 
	{
		{"roundtimer", "OnRoundTimer"},
		{"round", "OnRound"},
		{"stage", "OnStage"},
		{"victory", "OnVictory"},
		{"victory1", "CheckVictory"},
		{"victory2", "CheckVictory"}
	};
end

scenario.AddFriendlyScore = function(points)
	if(not game.Ingame()) then
		return;
	end
	local team = 0;
	local v = player.playerGetVehicle();
	if(v ~= nil) then
		team = v:GetSide();
	end
	scenario.AddScore(team, points);
end

scenario.AddEnemyScore = function(points)
	if(not game.Ingame()) then
		return;
	end
	local team = 0;
	local v = player.playerGetVehicle();
	if(v ~= nil) then
		team = wwii.wwiiOtherSide(v:GetSide());
	end
	scenario.AddScore(team, points);
end

scenario.AddScore = function(team, points)
	if(not state.network or not game.Ingame() or game.OS() == 1) then
		return;
	end
	team = tonumber(team);
	if(team >= 1 and team <= 2 and state.victory == 0) then
		--ui.ChatPrint("Adding " .. points .. " points to team " .. team);
		Instancing:SendAddState("victory" .. team, points);
	end
end

scenario.RegisterUpdate = function(callback)
	-- ui.ChatPrint("Adding update " .. callback);
	table.insert(state.updates, callback);
end

scenario.RegisterState = function(stateName, handler)
	if(game.OS() == 1) then return end
	table.insert(state.hoststates, {stateName, handler});
	Instancing.RegisterHandler(stateName, handler);
end

function RegisterState(stateName, handler)
	scenario.RegisterState(stateName, handler);
end

scenario.UnregisterState = function(stateName)
	if(game.OS() == 1) then return end
	state.hoststates[stateName] = nil;
	Instancing.RemoveHandler(stateName);
end

function UnregisterState(stateName)
	scenario.UnregisterState(stateName);
end

function OnStart(handler)
	-- make sure strat doesn't run while in combat 
	tutorial.AllowStrat(false);
	
	-- inits
	state.damages		= {};
	state.tom 			= 0; -- how much time on mission we have
	state.captures		= 0; -- how many enemy table captures have we done
	state.spawned 	= 0; -- start of mission time
	state.spawns		= 0;
	state.network		= false;
	
	-- setup some general event handlers
	-- some game types might override these
	tutorial.AddHandler(tutorial.TUT_EVENT_SET, "OnSet");
	tutorial.AddHandler(tutorial.TUT_EVENT_DAMAGE, "OnDamage");
	tutorial.AddHandler(tutorial.TUT_EVENT_UPDATE, "OnScenario");
	tutorial.AddHandler(tutorial.TUT_EVENT_COLLISION, "OnCollide", nil);
	
	-- setup some default handlers
	-- scenario.manager:AddContent("alert victory1 victory1");
	-- scenario.manager:AddContent("alert victory2 victory2");
	-- scenario.manager:AddContent("alert roundstop roundstop");
	
	-- setup our ownerships
	-- SetUpMap();

	-- setup any host state monitoring
	if(state.hoststates ~= nil) then
		for i,hs in ipairs(state.hoststates) do
			ui.ChatPrint("Adding state handler "..hs[1].."/"..hs[2]);
			-- register our state handler
			if(game.OS() ~= 1) then
				Instancing.RegisterHandler(hs[1], hs[2]);
			end
		end
	end
end

function StartNetwork()
	if(game.OS() ~= 1 and Instancing.InstanceId ~= nil) then
		-- start the instancing framework
		Instancing:Start("Client", state.config.server)
		
		ui.ChatPrint("Initing scenario network state!");
		
		-- if we're the creator, send our initial state up
		if(state.config.init == "true") then
			-- do some state init stuff
			local duration = state.config.duration1;
			if(duration == nil) then
				duration = state.config.duration;
			end
			local seconds = tonumber(duration or 10) * 60;
			Instancing:TimedEvent("roundtimer", seconds);
			Instancing:SendStateValue("victory", 0);
			Instancing:SendStateValue("round", scenario.manager:GetRound());
			Instancing:SendStateValue("stage", scenario.manager:GetStage());
		end
		
		-- get our initial state
		Instancing:GetInstanceState();
		
		-- we have a proper network
		state.network = true;
	else
		ui.ChatPrint("Unable to init scenario network state: no instance set");
	end
end

scenario.OnSpawn = function(handler)
	-- do default on spawn
	-- tutorial.OnSpawn(handler);
	
	-- reset some default tutorial behaviors
	map.uiMapLock(false);
	
	-- lock the hud on
	player.persHUDLock(false);
	
	-- record mission start time
	state.spawned 	= game.Frametime();
	state.spawns		= state.spawns + 1;
	
	-- make the map is right
	-- SetUpMap();
	
	-- AddWP("origin", 8, 0);
	-- AddWP("target", 9, 0);
	
	-- try to run any scenario events associated with despawning
	scenario.manager:RunObject("onspawn", 1);
	
	-- testing
	-- local v = player.playerGetVehicle();
	-- local deathstate = "deaths" .. v:GetSide();
	
	-- local temp = Instancing:GetStateString(deathstate);
	-- ui.ChatPrint("You have deaths is " .. temp);
	-- ui.ChatPrint(string.format("You have died %d times!", Instancing:GetStateNumber(deathstate)));
	
	if(game.OS() ~= 1) then
		if(state.lastroundtimer > 0) then
			local secondsLeft = Instancing:GetStateNumber("roundtimer");
			scenario.SetUITimer(secondsLeft - ((game.Frametime() - state.lastroundtimer) / 1000));
		else
			scenario.SetUITimer(Instancing:GetStateNumber("roundtimer"));
		end
	end
	
	-- keep handler going
	return 1;
end

function OnSpawn(handler)
	return scenario.OnSpawn(handler);
end

function OnDespawn(handler)
	
	-- record how much time on mission we did
	state.tom 			= state.tom + game.Frametime() - state.spawned;
	state.spawned 	= 0;
	
	-- tutorial.RemoveWaypoint("origin");
	-- tutorial.RemoveWaypoint("target");
	
	-- let the ui know our status
	OnScenario();
	
	-- kill the ui that was hanging around
	tutorial.HideUI(true);
	
	-- try to run any scenario events associated with despawning
	scenario.manager:RunEvent("ondespawn");
	
	if(state.victory > 0) then
		-- move them back to the lobby
	end
	
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
	elseif(name == "instance" and game.OS() ~= 1) then
		local result = Instancing:SetInstance(tonumber(state.config.instance));
		if(result[1] ~= Instancing.SuccessCode) then
			ui.ChatPrint(result[2]);
		end
	elseif(name == "network" and value == "start") then
		StartNetwork();
	end
	
	return 1;  -- this handle will continue to handle events
end

function LoadContent()
	-- unload any previously loaded data
	-- scenario.manager:UnloadContent();
	
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

-- main update functio for any scenario
-- might be overriden by a rules handler 
-- that includes this file
scenario.OnScenario = function(handler)

	-- get any new network events
	if(state.network) then
		Instancing:PollEvents();
	end
	
	if(state.lastupdate > 0) then
		local msDelta = game.Frametime() - state.lastupdate; 
		
		-- call any update callbacks
		for i,callback in ipairs(state.updates) do
			-- ui.ChatPrint("Trying update call back " .. callback);
			if(callback ~= nil and type(_G[callback]) == "function") then
				_G[callback](msDelta);
			end
		end
	end
	
	state.lastupdate = game.Frametime(); 
	
	return 1;
end

function OnScenario(handler)
	return scenario.OnScenario(handler);
end

function OnDie(handler)
 	return 1;
end

function OnDead()
	--if(game.Ingame()) then
	--	ui.LoadView("exitvehicle");
	--end
	return 1;
end

scenario.AddMessage = function(message, color, arg1, arg2)
	local hud = ui.FindView("hud");
	if(hud ~= nil) then
		if(color == nil) then color = "#00FF00"; end
		if(arg1 == nil) then arg1 = ""; end
		if(arg2 == nil) then arg2 = ""; end
		hud:CallJS("OnMessage", message, color, arg1, arg2);
	end
end

function OnBoundary(handler)
	state.inbounds = scenario.InArea(handler);
	
	if(state.inbounds) then
		ui.ChatPrint("You have entered the playable area!");
	else
		ui.ChatPrint("You have left the playable area!");
	end
	
	return 1;
end

function OnSendBroadcast(handler)
	-- bail if this trigger doesn't pertain to us
	if(not scenario.manager:PlayerRelevant(handler.name) or game.OS() == 1) then
		return 1;
	end
	
	-- try to run any events associated with this area
	if(scenario.InArea(handler)) then
		Instancing:BroadcastEvent(handler.name, 1);
	else
		Instancing:BroadcastEvent(handler.name, 0);
	end
	return 1;
end

function OnReceiveBroadcast(name, value)
	if(tonumber(value) > 0) then
		scenario.manager:RunObject(name .. "on", 1);
	else
		scenario.manager:RunObject(name .. "off", 1);
	end
end

function OnTrigger(handler)
	-- bail if this trigger doesn't pertain to us
	if(not scenario.manager:PlayerRelevant(handler.name)) then
		return 1;
	end
	
	-- try to run any events associated with this area
	scenario.RunObject(handler.name, scenario.InArea(handler));
	
	return 1;
end

function OnState(handler)
	-- bail if this trigger doesn't pertain to us
	if(not scenario.manager:PlayerRelevant(handler.name)) then
		return 1;
	end
	
	-- save this state
	state[handler.name] = scenario.InArea(handler);
	
	-- ui.ChatPrint("Setting state " .. handler.name .. " to " .. tostring(state[handler.name]));  
	
	-- try to run any events associated with this area
	scenario.RunObject(handler.name, state[handler.name]);
	
	return 1;
end

function OnResupply(handler)
	
	-- bail if this trigger doesn't pertain to us
	if(not scenario.manager:PlayerRelevant(handler.name)) then
		return 1;
	end
	
	local resupplying = scenario.InArea(handler);
	
	scenario.RunObject(handler.name, resupplying);
	scenario.manager:SetFlag(scenario.manager.RESUPPLY_ME, resupplying);
	
	return 1;
end

scenario.RunObject = function(name, on)
	if(on) then
		scenario.manager:RunObject(name, 1);
		scenario.manager:RunObject(name .. "on", 1);
	else
		scenario.manager:RunObject(name, 0);
		scenario.manager:RunObject(name .. "off", 1);
	end
	return on;
end

scenario.CheckVictory = function(name, value)
	if(game.OS() == 1) then return end
	local score 	=  Instancing:GetStateNumber(name);
	local victory 	= tonumber(state.config.victory);

	-- ui.ChatPrint("Checking " .. score .. " against " .. victory .. " for " .. name);	
	
	if(score >= victory) then
		if(name == "victory1") then
			Instancing:SendStateValue("victory", 1);
		elseif(name == "victory2") then
			Instancing:SendStateValue("victory", 2);
		end
	end
	
	return 1;
end

function CheckVictory(name, value)
	return scenario.CheckVictory(name, value);
end

function OnVictory(name, value)
	-- save our victor
	local victory = tonumber(value);
	
	if(victory ~= 0 and state.victory == 0) then
		state.victory = tonumber(value);
		
		-- load our victory ui
		scenario.SetResult();
		
		-- scenario.manager:RunObject("victory"..value, 1);
	end
	return 1;
end

scenario.InArea = function(handler)
	return (handler ~= nil and handler.state == tutorial.THS_EVENT_IN)
end

scenario.SetUITimer = function(seconds)
		local hud = ui.FindView("hud");
		if(hud ~= nil) then
			hud:CallJS("SetTimer", seconds);
		end
		
		local minutes = seconds / 60;
		
		if((minutes % 5) == 0 or minutes == 3 or minutes == 1) then
			local message = string.format("%d minutes left in this round!", minutes);
			
			ui.ChatPrint(message);
			
			if(minutes == 1) then
				scenario.AddMessage(message, "#FF0000");
			else
				scenario.AddMessage(message, "#00FF00");
			end
		end
end

function SetUITimer(seconds)
	scenario.SetUITimer(seconds);
end

scenario.SetUIProgress = function(progress, label)
		local hud = ui.FindView("hud");
		if(hud ~= nil) then
		 	hud:CallJS("SetProgress", progress, label);
		end
end

function SetUIProgress(progress, label)
	scenario.SetUIProgress(progress, label);
end

scenario.AddObjective = function(typeid, name, loc, icon)
		local hud = ui.FindView("hud");
		if(hud ~= nil) then
			hud:CallJS("AddObjective", typeid, name, loc, icon);
		end
end

function AddObjective(typeid, name, loc, icon)
	scenario.AddObjective(typeid, name, loc, icon);
end

scenario.SetObjective = function(objective, progress, target)
		local hud = ui.FindView("hud");
		if(hud ~= nil) then
			hud:CallJS("UpdateObjective", objective, progress, target);
		end
end

function SetObjective(objective, progress, target)
	scenario.SetObjective(objective, progress, target);
end

scenario.SetResult = function()
	if(game.OS() == 1) then return end
	local result = ui.LoadView("scenarios/result");
	if(result ~= nil) then
		local v1 =  Instancing:GetStateNumber("victory1");
		local v2 =  Instancing:GetStateNumber("victory2");
		result:CallJS("SetResult", state.victory, v1, v2);
	end
end

function SetResult()
	scenario.SetResult();
end

scenario.OnRoundTimer = function(name, value)
	if(game.OS() == 1) then return end
	
	-- remember the last time we got a round timer
	state.lastroundtimer = game.Frametime();
	
	local secondsLeft = tonumber(value);
	
	if(secondsLeft > 0) then
		scenario.SetUITimer(secondsLeft);
	elseif(secondsLeft == 0) then
		if(state.victory == 0) then
			local v1 =  Instancing:GetStateNumber("victory1");
			local v2 =  Instancing:GetStateNumber("victory2");
			
			if(v1 > v2) then
				Instancing:SendStateValue("victory", 1);
			elseif(v2 > v1) then
				Instancing:SendStateValue("victory", 2);
			else
				Instancing:SendStateValue("victory", -1);
			end
		end
	end
	return 1;
end

function OnRoundTimer(name, value)
	return scenario.OnRoundTimer(name, value);
end

scenario.OnRound = function(name, value)
	local newRound = tonumber(value);
	if(scenario.manager:GetRound() ~= newRound) then
		scenario.manager:SetRound(newRound);
	end
	return 1;
end

function OnRound(name, value)
	return scenario.OnRound(name, value);
end

scenario.OnStage = function(name, value)
	local newStage = tonumber(value);
	if(scenario.manager:GetStage() ~= newStage) then
		scenario.manager:OnStage(newStage);
	end
	return 1;
end

function OnStage(name, value)
	return scenario.OnStage(name, value);
end

function SetUpMap()
	
	--if(state.mapstate == nil) then
	--	return;
	--end
	
	--for i,ms in ipairs(state.mapstate) do
		-- owner, cp, fac (fac is optional)
	--	strat.PwnStrat(ms[1], ms[2], ms[3]);
	--end
end

function OnCollide(handler, ob)
	if(ob ~= nil) then
		local name = ob:ObjName();
		local damage = false;
		if(name == "dg_wire_barbed_apron") then
			damage = true;
		elseif(name == "dg_wire_barbed_box") then
			damage = true;
		end
		if(damage) then
			player.persApplyDamage(.5, 0, 1, 1);
		end
	end
	return 1;
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

function GetStringData(delimiter, value)
		local sd = {};
		
		-- collect our data parts
		for d in string.gmatch(value, delimiter) do
			table.insert(sd, d);
		end
		
		return sd;
end

function GetTeam()
	local v = player.playerGetVehicle();
	if(v ~= nil) then
		return v:GetSide();
	end
	return 0;
end

function IsPlaying()
	if(game.Ingame() == true and fp.fpFPSIsDead() == 0) then
		return true;
	else
		return false;
	end
end

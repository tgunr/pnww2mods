
-- ui and tutorial libs already loaded by tutorial manager
-- imported additional game libs as needed
Include("fp");
Include("input");
Include("terrain");
Include("player");
Include("state"); -- includes default state
Include("strat");
Include("ClientInstance");

if(not IsOnline()) then
	Include("InstanceServer");
end

game.LoadLib("scenario");

-- set tutorial state here
scenario.manager		=  scenario.ScenarioManager:GetInstance();
scenario.instance			= nil;
state.name					= "scenario.generic";
state.ui 						= nil;
state.rounds				= {};
state.round					= 1;
state.spawn					= nil;
state.config					= {};
state.updates				= {};
state.handle				= nil;
state.inbounds				= true;
state.lastinbounds		= true;
state.victory					= 0;
state.lastroundtimer	= 0;
state.lastupdate			= FrameTime();
state.starttime				= FrameTime();

-- player updates
state.playeradds			= {}; -- updates that are incremental changes
state.player					= {}; -- player state
state.lastplayer			= {}; -- last player state

if(not IsOnline()) then
	-- message queues
	scenario.toserver = {};
	scenario.fromserver = {};
end

-- circular reference; games that override the public interface will override this member as well
-- must be careful not to get into an infinite loop
scenario.game	= scenario;

Instancing.LoggingCallback = ui.ChatPrint;

-- states we'll monitor
state.hoststates			= 
{
	{"roundtimer", "OnRoundTimer"},
	{"round", "OnRound"},
	{"stage", "OnStage"},
	{"victory", "OnVictory"},
	{"victory1", "CheckVictory"},
	{"victory2", "CheckVictory"},
	{"OnPlayer", "OnPlayer"}
};

-- ok
scenario.InitState = function(s)
	tutorial.SetState(s);
end

-- ok
scenario.AddFriendlyScore = function(points)
	if(not game.Ingame()) then
		return;
	end
	local team = 0;
	local v = player.playerGetVehicle();
	if(v ~= nil) then
		team = v:GetSide();
	end
	scenario.game.AddScore(team, points);
end

-- ok
scenario.AddEnemyScore = function(points)
	if(not game.Ingame()) then
		return;
	end
	local team = 0;
	local v = player.playerGetVehicle();
	if(v ~= nil) then
		team = wwii.wwiiOtherSide(v:GetSide());
	end
	scenario.game.AddScore(team, points);
end

-- ok
scenario.AddScore = function(team, points)
	if(scenario.instance == nil or not game.Ingame()) then
		return;
	end
	team = tonumber(team);
	if(team >= 1 and team <= 2 and state.victory == 0) then
		--ui.ChatPrint("Adding " .. points .. " points to team " .. team);
		scenario.instance:AddState("victory" .. team, points);
	end
end

-- ok
scenario.AddPlayerScore = function(points)
	scenario.AddPlayerState("score", points);
end

-- ok
scenario.SetTimer = function(name, seconds)
	if(scenario.instance ~= nil) then
		scenario.instance:SetTimer(name, seconds);
	end
end

-- ok
scenario.BroadcastEvent = function(name, value)
	if(scenario.instance ~= nil) then
		scenario.instance:BroadcastEvent(name, value);
	end
end

-- ok
scenario.KeepAlive = function(name, value)
	if(scenario.instance ~= nil) then
		scenario.instance:KeepAlive(name, value);
	end
end

-- ok
scenario.SetState = function(name, value)
	if(scenario.instance ~= nil) then
		scenario.instance:SetState(name, value);
	end
end

-- ok
scenario.GetState = function(name)
	if(scenario.instance ~= nil) then
		return scenario.instance:GetStateValue(name);
	end
	return nil;
end

-- ok
scenario.GetStateBool = function(name, defValue)
	if(scenario.instance ~= nil) then
		return scenario.instance:GetStateBool(name, defValue);
	end
	return defValue or false;
end

-- ok
scenario.GetStateNumber = function(name, defValue)
	if(scenario.instance ~= nil) then
		return scenario.instance:GetStateNumber(name, defValue);
	end
	return defValue or 0;
end

-- ok
scenario.GetStateString = function(name, defValue)
	if(scenario.instance ~= nil) then
		return scenario.instance:GetStateString(name, defValue);
	end
	return defValue or "";
end

-- ok
scenario.RegisterUpdate = function(callback)
	-- ui.ChatPrint("Adding update " .. callback);
	table.insert(state.updates, callback);
end

-- ok
scenario.RegisterState = function(stateName, handler)
	if(scenario.instance ~= nil) then
		ui.ChatPrint("Adding state handler "..stateName.."/"..handler);
		scenario.instance:RegisterHandler(stateName, handler);
	else
		table.insert(state.hoststates, {stateName, handler});
	end
end

-- ok
scenario.UnregisterState = function(stateName)
	state.hoststates[stateName] = nil;
	if(scenario.instance ~= nil) then
		scenario.instance:UnregisterHandler(stateName);
	end
end

-- ok
scenario.OnStart = function(handler)
	-- make sure strat doesn't run while in combat 
	tutorial.AllowStrat(false);
	
	-- inits
	state.damages		= {};
	state.tom 			= 0; -- how much time on mission we have
	state.captures		= 0; -- how many enemy table captures have we done
	state.spawned 	= 0; -- start of mission time
	state.spawns		= 0;
	
	-- setup some general event handlers
	-- some game types might override these
	tutorial.AddHandler(tutorial.TUT_EVENT_SET, "OnSet");
	tutorial.AddHandler(tutorial.TUT_EVENT_DAMAGE, "OnDamage");
	tutorial.AddHandler(tutorial.TUT_EVENT_COLLISION, "OnCollide", nil);
	
	-- setup some default handlers
	-- scenario.manager:AddContent("alert victory1 victory1");
	-- scenario.manager:AddContent("alert victory2 victory2");
	-- scenario.manager:AddContent("alert roundstop roundstop");
	
	-- setup our ownerships
	-- SetUpMap();
end

-- ok
scenario.StartNetwork = function()
	if(scenario.instance ~= nil) then
		-- start the instancing framework
		ui.ChatPrint("Initing scenario instance!");
		
		-- if we're the creator, send our initial state up
		if(state.config.init == "true") then
			-- do some state init stuff
			local duration = state.config.duration1;
			if(duration == nil) then
				duration = state.config.duration;
			end
			local seconds = tonumber(duration or 10) * 1000 * 60;
			scenario.game.SetTimer("roundtimer", seconds);
			scenario.game.SetState("victory", 0);
			scenario.game.SetState("round", scenario.game.GetRound());
			scenario.game.SetState("stage", scenario.game.GetStage());
		end
		
		-- get our initial state
		scenario.instance:RegisterClient(state.config.callsign);
		
		-- set us to not ready
		scenario.game.SetPlayerState("ready", "false")
	else
		ui.ChatPrint("Unable to init scenario network state: no instance set");
	end
end

-- ok
scenario.OnSpawn = function(handler)
	-- do default on spawn
	-- tutorial.OnSpawn(handler);
	
	-- reset some default tutorial behaviors
	map.uiMapLock(false);
	
	-- lock the hud on
	player.persHUDLock(false);
	
	-- record mission start time
	state.spawned 	= scenario.game.FrameTime();
	state.spawns		= state.spawns + 1;
	
	-- make the map is right
	-- SetUpMap();
	
	-- AddWP("origin", 8, 0);
	-- AddWP("target", 9, 0);
	
	-- try to run any scenario events associated with despawning
	scenario.game.RunObject("onspawn", 1);
	
	-- testing
	-- local v = player.playerGetVehicle();
	-- local deathstate = "deaths" .. v:GetSide();
	
	-- local temp = Instancing:GetStateString(deathstate);
	-- ui.ChatPrint("You have deaths is " .. temp);
	-- ui.ChatPrint(string.format("You have died %d times!", Instancing:GetStateNumber(deathstate)));
	
	if(scenario.instance ~= nil) then
		if(state.lastroundtimer > 0) then
			local secondsLeft = scenario.game.GetStateNumber("roundtimer");
			scenario.game.SetUITimer(secondsLeft - ((scenario.game.FrameTime() - state.lastroundtimer) / 1000));
		else
			scenario.game.SetUITimer(scenario.game.GetStateNumber("roundtimer"));
		end
	end
	
	-- keep handler going
	return 1;
end

-- ok
scenario.OnDespawn = function(handler)
	
	-- record how much time on mission we did
	state.tom 			= state.tom + scenario.game.FrameTime() - state.spawned;
	state.spawned 	= 0;
	
	-- tutorial.RemoveWaypoint("origin");
	-- tutorial.RemoveWaypoint("target");
	
	-- let the ui know our status
	scenario.game.OnUpdate();
	
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

-- ok
-- handler for script variable changes
scenario.OnSet = function(handler, name, value)
	-- spit out to chat the new var name and value
	ui.ChatPrint("Setting config var "..name.." to "..value);
	
	-- save our config value by name
	state.config[name] = value;
	
	-- for known config vars, do something
	if(name == "load" and value == "content") then
		scenario.game.LoadContent();
	elseif(name == "instance") then
		-- handle local instance server
		if(not scenario.game.IsOnline()) then
			-- create our local instance on the local server
			createInstance(state.config.instance);
			
			-- set its status
			setInstanceStatus(state.config.instance, "Staging");
			
			-- report it
			--Instancing.report('N', 'OnSet', "Server running: " .. crawl(server));
		end
		-- setup client instance
		if(scenario.instance == nil) then
			scenario.instance = ClientInstance:new(state.config.instance, sendClientData);
			
			-- debug it
			Instancing.report('N', 'OnSet', "New instance created with id: " .. scenario.instance.id);
			-- Instancing.report('N', 'Scenario:ClientInstance', crawl(scenario.instance));
			
			-- setup any host state monitoring
			for i,hs in ipairs(state.hoststates) do
				ui.ChatPrint("Adding state handler "..hs[1].."/"..hs[2]);
				-- register our state handler
				scenario.game.RegisterState(hs[1], hs[2]);
			end
		end
	elseif(name == "network" and value == "start") then
		scenario.game.StartNetwork();
	end
	
	return 1;  -- this handle will continue to handle events
end

-- ok
scenario.LoadContent = function()
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

-- ok
scenario.OnDamage = function(handler, energy, obj)
	scenario.game.AddUIMessage("damaged");
	return 1;
end

-- ok
scenario.OnDie = function(handler)
	return 1;
end

-- ok
-- main update function for any scenario
-- might be overriden by a rules handler 
-- that includes this file
scenario.OnUpdate = function(handler)
	
	local online = scenario.game.IsOnline();
	
	local ft = scenario.game.FrameTime();
	local reportFT = false;
	
	--Instancing.report('F', ' =========== scenario.OnUpdate', "Updating at " .. tostring(ft))
	
	-- simulate network traffic
	if(not online) then
		-- handle in incoming data from the server for the last frame
		for k,v in pairs(scenario.fromserver) do
			if(scenario.instance ~= nil and scenario.instance.id == v[1]) then
				-- Instancing.report('D', "scenario.OnUpdate", "Receiving data: " v[2]);
				ui.ChatPrint("to client <-----------------");
				scenario.instance:RecvCommand(v[2]);
				reportFT = true;
			end
		end
		scenario.fromserver = {}
	end

	-- get any new network events
	if(scenario.instance ~= nil) then
		-- handle any specific player state changes
		for k,v in pairs(state.player) do
			if(v ~= state.lastplayer[k]) then
				-- remember the change
				state.lastplayer[k] = v;
				-- send up our updated player state value
				scenario.instance:SetPlayerState(state.config.callsign, k, v);
				reportFT = true;
			end
		end
		
		-- handle any incremental number updates
		for k,v in pairs(state.playeradds) do
			-- send up our incremental player state value
			scenario.instance:AddPlayerState(state.config.callsign, k, v);
			reportFT = true;
		end
	end
	
	-- clear this table each run
	state.playeradds = {};
	
	if(state.lastupdate > 0) then
		local msDelta = ft - state.lastupdate; 
		
		-- call any update callbacks
		for i,callback in ipairs(state.updates) do
			-- ui.ChatPrint("Trying update call back " .. callback);
			if(callback ~= nil and type(_G[callback]) == "function") then
				_G[callback](msDelta);
			end
		end
	end
	
	-- simulate network traffic
	if(not online) then
		-- handle any outgoing data from us for the last frame
		for k,v in pairs(scenario.toserver) do
			ui.ChatPrint("to server ----------------->");
			recvServerData(v[1], v[2]);
			reportFT = true;
		end
		scenario.toserver = {}
		
		updateServer(ft);
	end
	
	--if(reportFT) then
	--	ui.ChatPrint("============= frame " .. tostring(ft) .. " =============");
	--end
	
	state.lastupdate = ft; 
	
	return 1;
end

-- ok
scenario.AddMessage = function(message, color, arg1, arg2)
	local hud = ui.FindView("hud");
	if(hud ~= nil) then
		if(color == nil) then color = "#00FF00"; end
		if(arg1 == nil) then arg1 = ""; end
		if(arg2 == nil) then arg2 = ""; end
		hud:CallJS("OnMessage", message, color, arg1, arg2);
	end
end

-- ok
scenario.OnBoundary = function(handler)
	state.inbounds = scenario.InArea(handler);
	
	if(state.inbounds) then
		ui.ChatPrint("You have entered the playable area!");
	else
		ui.ChatPrint("You have left the playable area!");
	end
	
	return 1;
end

-- ok
scenario.OnSendBroadcast = function(handler)
	-- bail if this trigger doesn't pertain to us
	if(scenario.instance == nil or not scenario.game.PlayerRelevant(handler.name)) then
		return 1;
	end
	
	-- try to run any events associated with this area
	if(scenario.InArea(handler)) then
		scenario.game.BroadcastEvent(handler.name, 1);
	else
		scenario.game.BroadcastEvent(handler.name, 0);
	end
	return 1;
end

-- ok
scenario.OnReceiveBroadcast = function(name, value)
	if(tonumber(value) > 0) then
		scenario.game.RunObject(name .. "on", 1);
	else
		scenario.game.RunObject(name .. "off", 1);
	end
end

-- ok
scenario.OnTrigger = function(handler)
	-- bail if this trigger doesn't pertain to us
	if(not scenario.game.PlayerRelevant(handler.name)) then
		return 1;
	end
	
	-- try to run any events associated with this area
	scenario.game.RunObject(handler.name, scenario.InArea(handler));
	
	return 1;
end

-- ok
scenario.OnState = function(handler)
	-- bail if this trigger doesn't pertain to us
	if(not scenario.game.PlayerRelevant(handler.name)) then
		return 1;
	end
	
	-- save this state
	state[handler.name] = scenario.InArea(handler);
	
	-- ui.ChatPrint("Setting state " .. handler.name .. " to " .. tostring(state[handler.name]));  
	
	-- try to run any events associated with this area
	scenario.game.RunObject(handler.name, state[handler.name]);
	
	return 1;
end

-- ok
scenario.OnResupply = function(handler)
	-- bail if this trigger doesn't pertain to us
	if(not scenario.game.PlayerRelevant(handler.name)) then
		return 1;
	end
	
	local resupplying = scenario.InArea(handler);
	
	scenario.game.RunObject(handler.name, resupplying);
	scenario.game.SetFlag(scenario.manager.RESUPPLY_ME, resupplying);
	
	return 1;
end

-- ok
scenario.SetFlag = function(flag, value)
	scenario.manager:SetFlag(flag, value);
end

-- ok
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

-- ok
scenario.PlayerRelevant = function(name)
	return scenario.manager:PlayerRelevant(name);
end

-- ok
scenario.Log = function(level, source, message)
	Instancing.report(level, source, message);
end

-- ok
scenario.CheckVictory = function(name, value)
	local score 		=  scenario.game.GetStateNumber(name);
	local victory 	= tonumber(state.config.victory);

	 ui.ChatPrint("Checking " .. score .. " against " .. victory .. " for " .. name);	
	
	if(score >= victory) then
		if(name == "victory1") then
			scenario.game.SetState("victory", 1);
		elseif(name == "victory2") then
			scenario.game.SetState("victory", 2);
		end
	end
	
	return 1;
end

-- ok
scenario.OnVictory = function(name, value)
	-- save our victor
	local victory = tonumber(value);
	
	if(victory ~= 0 and state.victory == 0) then
		state.victory = tonumber(value);
		
		-- load our victory ui
		scenario.game.SetResult();
		
		-- RunObject("victory"..value, 1);
	end
	return 1;
end

-- ok
scenario.OnPlayer = function(callsign, name, value)
	scenario.manager:UpdatePlayer(callsign, name, value);
	return 1;
end

-- ok
scenario.SetPlayerState = function(name, value)
	state.player[name] = value;
end

-- ok
scenario.AddPlayerState = function(name, value)
	if(state.playeradds[name] ~= nil) then
		state.playeradds[name] = state.playeradds[name] + tonumber(value);
	else
		state.playeradds[name] = tonumber(value);
	end
end

-- ok
scenario.InArea = function(handler)
	return (handler ~= nil and handler.state == tutorial.THS_EVENT_IN)
end

-- ok
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
				scenario.game.AddMessage(message, "#FF0000");
			else
				scenario.game.AddMessage(message, "#00FF00");
			end
		end
end

-- ok
scenario.SetUIProgress = function(progress, label)
		local hud = ui.FindView("hud");
		if(hud ~= nil) then
		 	hud:CallJS("SetProgress", progress, label);
		end
end

-- ok
scenario.AddObjective = function(typeid, name, loc, icon)
		local hud = ui.FindView("hud");
		if(hud ~= nil) then
			hud:CallJS("AddObjective", typeid, name, loc, icon);
		end
end

-- ok
scenario.SetObjective = function(objective, progress, target)
		local hud = ui.FindView("hud");
		if(hud ~= nil) then
			hud:CallJS("UpdateObjective", objective, progress, target);
		end
end

-- ok
scenario.SetResult = function()
	if(scenario.instance == nil) then return end
	local result = ui.LoadView("scenarios/result");
	if(result ~= nil) then
		local v1 =  scenario.game.GetStateNumber("victory1");
		local v2 =  scenario.game.GetStateNumber("victory2");
		result:CallJS("SetResult", state.victory, v1, v2);
	end
end

-- ok
scenario.OnRoundTimer = function(name, value)
	if(scenario.instance == nil) then return end
	
	-- remember the last time we got a round timer
	state.lastroundtimer = scenario.game.FrameTime();
	
	local secondsLeft = tonumber(value);
	
	if(secondsLeft > 0) then
		scenario.game.SetUITimer(secondsLeft);
	elseif(secondsLeft == 0) then
		if(state.victory == 0) then
			local v1 = scenario.game.GetStateNumber("victory1");
			local v2 = scenario.game.GetStateNumber("victory2");
			
			if(v1 > v2) then
				scenario.game.SetState("victory", 1);
			elseif(v2 > v1) then
				scenario.game.SetState("victory", 2);
			else
				scenario.game.SetState("victory", -1);
			end
		end
	end
	return 1;
end

-- ok
scenario.OnRound = function(name, value)
	local newRound = tonumber(value);
	if(scenario.game.GetRound() ~= newRound) then
		scenario.game.SetRound(newRound);
	end
	return 1;
end

-- ok
scenario.GetRound = function()
	return scenario.manager:GetRound();
end

-- ok
scenario.SetRound = function(nextRound)
	scenario.manager:SetRound(nextRound);
end

-- ok
scenario.GetStage = function()
	return scenario.manager:GetStage();
end

-- ok
scenario.SetStage = function(nextStage)
	scenario.manager:SetStage(nextStage);
end

-- ok
scenario.OnStage = function(name, value)
	local newStage = tonumber(value);
	if(scenario.game.GetStage() ~= newStage) then
		scenario.game.SetStage(newStage);
	end
	return 1;
end

-- ok
scenario.OnCollide = function(handler, ob)
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

-- ok
scenario.GetLocation = function(name, side)
	if(not game.Ingame()) then
		return nil;
	end
	
	local index = player.playerGetVehicle():GetSide();
	
	if(side ~= nil) then
		index = side
	end
	
	return state.locations[index][name];
end

-- ok
scenario.AddWP = function(name, t, s, add)
	local pos = scenario.game.GetLocation(name);
	
	if(pos ~= nil) then
		tutorial.AddWaypoint(name, t, s, pos[1], pos[2], pos[3], add);
	end
end

-- ok
scenario.GetTeam = function()
	local v = player.playerGetVehicle();
	if(v ~= nil) then
		return v:GetSide();
	end
	return 0;
end

-- ok
scenario.IsPlaying = function()
	if(game.Ingame() == true and fp.fpFPSIsDead() == 0) then
		return true;
	else
		return false;
	end
end

-- ok
scenario.GetStringData = function(delimiter, value)
		local sd = {};
		
		-- collect our data parts
		for d in string.gmatch(value, delimiter) do
			table.insert(sd, d);
		end
		
		return sd;
end

-- add these globals functions for consistency
scenario.FrameTime = FrameTime;
scenario.IsOnline = IsOnline;

---------------- global handler functions -------------------

function OnStart(handler)
	return scenario.game.OnStart(handler);
end

function OnSpawn(handler)
	return scenario.game.OnSpawn(handler);
end

function OnSet(handler, name, value)
	return scenario.game.OnSet(handler, name, value);
end

function OnDespawn(handler)
	return scenario.game.OnDespawn(handler);
end

function OnDamage(handler, energy, ob)
	return scenario.game.OnDamage(handler, energy, ob);
end

function OnDie(handler)
	return scenario.game.OnDie(handler);
end

function OnDead(handler)
	return scenario.game.OnDie(handler);
end

function OnUpdate(handler)
	return scenario.game.OnUpdate(handler);
end

function OnBoundary(handler)
	return scenario.game.OnBoundary(handler);
end

function OnTrigger(handler)
	return scenario.game.OnTrigger(handler);
end

function OnState(handler)
	return scenario.game.OnState(handler);
end

function OnResupply(handler)
	return scenario.game.OnResupply(handler);
end

function OnRoundTimer(name, value)
	return scenario.game.OnRoundTimer(name, value);
end

function OnRound(name, value)
	return scenario.game.OnRound(name, value);
end

function OnStage(name, value)
	return scenario.game.OnStage(name, value);
end

function OnVictory(name, value)
	return scenario.game.OnVictory(name, value);
end

function CheckVictory(name, value)
	return scenario.game.CheckVictory(name, value);
end

function OnPlayer(callsign, name, value)
	return scenario.game.OnPlayer(callsign, name, value);
end

----------------- low level data comms -------------

function sendClientData(id, data)
	if(scenario.game.IsOnline()) then
		scenario.manager:SendData(data, 0);
	else
		table.insert(scenario.toserver, {scenario.instance:Id(), data});
	end
end

function recvClientData(id, data)
	-- Instancing.report('I','','');
	if(scenario.instance ~= nil and scenario.instance.id == id) then
		table.insert(scenario.fromserver, {id, data});
	end
end

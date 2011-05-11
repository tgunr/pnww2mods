
-- ui and tutorial libs already loaded by tutorial manager
-- imported additional game libs as needed
Include("fp");
Include("input");
Include("terrain");
Include("player");
Include("state"); -- includes default state
Include("strat");
Include("zmq");
game.LoadLib("scenario");

-- set tutorial state here
scenario.manager		=  scenario.ScenarioManager:GetInstance();
state.name					= "scenario.generic";
state.ui 						= "scenhud";
state.rounds				= {};
state.round					= 1;
state.spawn					= nil;
state.config					= {};
state.inbounds				= true;
state.lastinbounds		= true;

function RegisterState(state, handler)
	Instancing:RegisterHandler(state, handler);
end

function OnVictory()
	-- nothing done by default
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
	
	-- setup our ownerships
	-- SetUpMap();

	-- setup any host state monitoring
	if(state.hoststates ~= nil) then
		for i,hs in ipairs(state.hoststates) do
			-- register our state handler
			RegisterState(hs[1], hs[2]);
		end
	end
end

function StartNetwork()
	-- setup our network state
	local result = Instancing:SetInstance(tonumber(state.config.instance));
	
	if(result[1] == Instancing.SuccessCode) then
		ui.ChatPrint("Initing scenario network state!");
		
		-- if we're the creator, send our initial state up
		if(state.config.creator == "true") then
			-- do some state init stuff
			local ms = tonumber(state.config.duration) * 60;
			Instancing:TimedEvent(ms, "roundstop", true);
		end
		
		-- get our initial state
		Instancing:GetInstanceState();
		
		-- we have networking
		state.network = true;
	else
		ui.ChatPrint("Unable to init scenario network state: " .. result[2]);
	end
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
	-- SetUpMap();
	
	-- AddWP("origin", 8, 0);
	-- AddWP("target", 9, 0);
	
	-- try to run any scenario events associated with despawning
	scenario.manager:RunObject("onspawn", 1);
	
	-- testing
	local v = player.playerGetVehicle();
	local deathstate = "deaths" .. v:GetSide();
	
	ui.ChatPrint(string.format("You have died %d times!", Instancing:GetStateNumber(deathstate)));
	
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
	OnScenario();
	
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
	elseif(name == "network" and value == "start") then
		StartNetwork();
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

-- main update functio for any scenario
-- might be overriden by a rules handler 
-- that includes this file
function OnScenario(handler)

	-- get any new network events
	if(state.network) then
		Instancing:PollEvents();
	end
	
	-- check round timers
	
	return 1;
end

function OnDie(handler)
	if(state.network) then
		local v = player.playerGetVehicle();
		Instancing:AddState("deaths" .. v:GetSide(), 1);
	end
	scenario.manager:RunEvent("ondie");
	return 1;
end

function OnDead()
	--if(game.Ingame()) then
	--	ui.LoadView("exitvehicle");
	--end
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
	-- bail if this trigger doesn't pertain to us
	if(not scenario.manager:PlayerRelevant(handler.name)) then
		return 1;
	end
	
	if(handler.state == tutorial.THS_EVENT_IN) then
		-- try to run any events associated with this area
		scenario.manager:RunObject(handler.name, 1);
	else
		scenario.manager:RunObject(handler.name, 0);
	end
	return 1;
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

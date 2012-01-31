
-- ui and tutorial libs already loaded by tutorial manager
-- imported additional game libs as needed
Include("wwii");
Include("ra");

-- set tutorial state here
state.name 					= "scenario.deathmatch";
state.enablemap			= true;
state.dointel				= true;
state.intel					= false;

state.config['duration'] 	= 10;
state.config['kills'] 			= 30;

state.nextintelcheck			= 0;
state.intelteam				= 0;

-- set our initial tutorial state
ra.InitState(state);

-- register our rule's update function
-- ra.RegisterUpdate("OnRuleUpdate");
ra.RegisterState("intelteam", "OnIntel");

-- override CheckVictory
ra.CheckVictory = function(name, value)
	ra.SetObjective(name, value, state.config.victory);
	
	-- now call the default functionality
	return scenario.CheckVictory(name, value);
end

-- override OnSpawn
function ra.OnSpawn(handler)
	
	-- run default behavior
	scenario.OnSpawn(handler);
	
	local victory 		= tonumber(state.config.victory);
	local kills1 			= ra.GetStateNumber("victory1");
	local kills2 			= ra.GetStateNumber("victory2");
	local intelTeam 	= ra.GetStateNumber("intelteam");
	
	-- update the hud to the current objective amounts
	-- scenario.AddObjective("alliedcount", "kills3", "objective1", "skull");
	ra.AddObjective("alliedcount", "victory1", "objective1", "skull");
	
	if(state.dointel) then
		ra.AddObjective("owner", "intel", "intel", "flag");
	end
	
	ra.AddObjective("axiscount", "victory2", "objective2", "skull");
	-- ra.AddObjective("alliedcount", "kills4", "objective1", "skull");
	
	-- 
	ra.SetObjective("victory1", kills1, victory);
	
	if(state.dointel) then
		ra.SetObjective("intel", intelTeam, 0);
	end
	
	ra.SetObjective("victory2", kills2, victory);
	
	return 1;
end

-- give a point to the enemy each time I die
function ra.OnDie(handler)
	ra.AddEnemyScore(1);	
	ra.AddPlayerState("deaths", 1);
	state.intel = false;
	return scenario.OnDie(handler);
end

function ra.OnDespawn(handler)
	state.intel = false;
	return scenario.OnDespawn(handler);
end

-- override update functionality and hook in
function ra.OnUpdate(handler)
	-- current frametime
	local ft 				= ra.FrameTime();
	local team			= ra.GetTeam();
	local intelTeam 	= ra.GetStateNumber("intelteam");
	
	-- send a keepalive if needed
	if(ra.IsPlaying() and state.intel and ft >= state.nextintelcheck and (intelTeam == team or intelTeam == 0)) then 
		ra.KeepAlive("intelteam", ra.GetTeam());
		state.nextintelcheck = ft + 1000;
		ra.AddPlayerScore(.5);
	end	
	
	-- run default behavior
	return scenario.OnUpdate(handler);
end

-- local handler
function OnIntel(name, value)

	if(not state.dointel) then
		return 1;
	end
	 
	local team 			= ra.GetTeam();
	local intelTeam 	= tonumber(value);
	
	if(state[name] ~= intelTeam) then
		local lastTeam = state[name]; 
		state[name] = intelTeam;
		
		if(lastTeam == 0) then
			-- we're turning intel on
			if(intelTeam == team) then
				ra.RunObject("intelenemyon", 1);
			else
				ra.RunObject("intelfriendlyon", 1);
			end
		elseif(intelTeam == 0) then
			-- we're turning intel off
			if(lastTeam == team) then
				ra.RunObject("intelenemyoff", 1);
			else
				ra.RunObject("intelfriendlyoff", 1);
			end
		else
			-- intel switched sides
			if(intelTeam == team) then
				ra.RunObject("intelfriendlyoff", 1);
				ra.RunObject("intelenemyon", 1);
			else
				ra.RunObject("intelenemyoff", 1);
				ra.RunObject("intelfriendlyon", 1);
			end
		end
		
		-- update our manager flags
		if(intelTeam == team) then
			ra.SetFlag(scenario.manager.ENEMY_ICONS, true);
		else
			ra.SetFlag(scenario.manager.ENEMY_ICONS, false);
		end
		
		ra.Log('F', ' =========== DeathMatch:OnIntel', "Intel is - " .. tostring(intelTeam));
		
		-- update our UI
		ra.SetObjective("intel", intelTeam, 0);
	end
	return 1;
end

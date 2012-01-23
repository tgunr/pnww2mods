
-- ui and tutorial libs already loaded by tutorial manager
-- imported additional game libs as needed
Include("wwii");
Include("scenario");

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
tutorial.SetState(state);

-- register our rule's update function
scenario.RegisterUpdate("OnRuleUpdate");
scenario.RegisterState("intelteam", "OnIntel");

function CheckVictory(name, value)
	scenario.SetObjective(name, value, state.config.victory);
	return scenario.CheckVictory(name, value);
end

-- some overrides
function OnSpawn(handler)
	
	-- run default behavior
	scenario.OnSpawn(handler);
	
	local victory 		= tonumber(state.config.victory);
	local kills1 			= scenario.instance:GetStateNumber("victory1");
	local kills2 			= scenario.instance:GetStateNumber("victory2");
	local intelTeam 	= scenario.instance:GetStateNumber("intelteam");
	
	-- update the hud to the current objective amounts
	-- scenario.AddObjective("alliedcount", "kills3", "objective1", "skull");
	scenario.AddObjective("alliedcount", "kills1", "objective1", "skull");
	
	if(state.dointel) then
		scenario.AddObjective("owner", "intel", "intel", "flag");
	end
	
	scenario.AddObjective("axiscount", "kills2", "objective2", "skull");
	-- scenario.AddObjective("alliedcount", "kills4", "objective1", "skull");
	
	scenario.SetObjective("kills1", kills1, victory);
	
	if(state.dointel) then
		scenario.SetObjective("intel", intelTeam, 0);
	end
	
	scenario.SetObjective("kills2", kills2, victory);
	
	return 1 
end

-- give a point to the enemy each time I die
function OnDie(handler)
	scenario.AddEnemyScore(1);	
	scenario.instance:AddPlayerState(state.config.callsign, "deaths", 1);
	state.intel = false;
	return 1;
end

function OnDespawn(handler)
	state.intel = false;
	return 1;
end

function OnRuleUpdate(deltaTime)
	-- current frametime
	local ft 				= game.Frametime();
	local team			= GetTeam();
	local intelTeam 	= 0; --scenario.instance:GetStateNumber("intelteam");
		
	-- send a keepalive if needed
	if(IsPlaying() and state.intel and ft >= state.nextintelcheck and (intelTeam == team or intelTeam == 0)) then 
		scenario.instance:KeepAlive("intelteam", GetTeam());
		state.nextintelcheck = ft + 1000;
		scenario.AddPlayerScore(.5);
	end	
	
	return 1;
end

function OnIntel(name, value)

	if(not state.dointel) then
		return 1;
	end
	 
	local team 			= GetTeam();
	local intelTeam 	= tonumber(value);
	
	if(state[name] ~= intelTeam) then
		local lastTeam = state[name]; 
		state[name] = intelTeam;
		
		if(lastTeam == 0) then
			-- we're turning intel on
			if(intelTeam == team) then
				scenario.manager:RunObject("intelenemyon", 1);
			else
				scenario.manager:RunObject("intelfriendlyon", 1);
			end
		elseif(intelTeam == 0) then
			-- we're turning intel off
			if(lastTeam == team) then
				scenario.manager:RunObject("intelenemyoff", 1);
			else
				scenario.manager:RunObject("intelfriendlyoff", 1);
			end
		else
			-- intel switched sides
			if(intelTeam == team) then
				scenario.manager:RunObject("intelfriendlyoff", 1);
				scenario.manager:RunObject("intelenemyon", 1);
			else
				scenario.manager:RunObject("intelenemyoff", 1);
				scenario.manager:RunObject("intelfriendlyon", 1);
			end
		end
		
		-- update our manager flags
		if(intelTeam == team) then
			scenario.manager:SetFlag(scenario.manager.ENEMY_ICONS, true);
		else
			scenario.manager:SetFlag(scenario.manager.ENEMY_ICONS, false);
		end
		
		-- update our UI
		scenario.SetObjective("intel", intelTeam, 0);
	end
	return 1;
end


-- ui and tutorial libs already loaded by tutorial manager
-- imported additional game libs as needed
Include("wwii");
Include("scenario");

-- set tutorial state here
state.name 					= "scenario.deathmatch";
state.enablemap			= true;
state.intel					= false;

state.config['duration'] 	= 10;
state.config['kills'] 			= 30;

state.nextintelcheck			= 0;
state.intel1						= 0;
state.intel2						= 0;

-- set our initial tutorial state
tutorial.SetState(state);

-- register our rule's update function
scenario.RegisterUpdate("OnRuleUpdate");
scenario.RegisterState("intel1", "OnIntel");
scenario.RegisterState("intel2", "OnIntel");

function CheckVictory(name, value)
	local team 		= GetTeam();
	local friendly 	=  0;
	local enemy 	=  0;
	
	local color = "#00FF00";
	
	if(team == 1) then
		friendly 	=  Instancing:GetStateNumber("victory1");
		enemy 		=  Instancing:GetStateNumber("victory2");
		if(name == "victory2") then
			color = "#FF0000";
		end
	else
		friendly 	=  Instancing:GetStateNumber("victory2");
		enemy 		=  Instancing:GetStateNumber("victory1");
		if(name == "victory1") then
			color = "#FF0000";
		end
	end
	
	local v = Instancing:GetStateNumber(name);
	
	if(name == "victory1") then
		scenario.AddMessage(string.format("Allied Gains: %d of %d points", v, state.config.victory), color);
	else
		scenario.AddMessage(string.format("Axis Gains: %d of %d points", v, state.config.victory), color);
	end
	
	return scenario.CheckVictory(name, value);
end

-- give a point to the enemy each time I die
function OnDie(handler)
	scenario.AddEnemyScore(1);	
	state.intel = false;
	return 1;
end

function OnDespawn(handler)
	state.intel = false;
	return 1;
end

function OnRuleUpdate(deltaTime)
	-- current frametime
	local ft = game.Frametime();
		
	-- send a keepalive if needed
	if(IsPlaying() and state.intel and ft >= state.nextintelcheck) then 
		Instancing:KeepAlive("intel" .. GetTeam(), 1);
		state.nextintelcheck = ft + 1000;
	end	
	
	return 1;
end

function OnIntel(name, value)
	--ui.ChatPrint("HI! " .. name .. "/" .. value); 
	local team 			= GetTeam();
	local teamIntel 	= "intel" .. team;
	local intelValue 	= tonumber(value);
	
	if(state[name] ~= intelValue) then
		state[name] = intelValue;
		
		 if(teamIntel == name) then
			-- friendly intel
			if(intelValue > 0) then
				scenario.manager:SetFlag(scenario.manager.ENEMY_ICONS, true);
				scenario.manager:RunObject("intelenemyon", 1);
			else
				scenario.manager:SetFlag(scenario.manager.ENEMY_ICONS, false);
				scenario.manager:RunObject("intelenemyoff", 1);
			end
		else
			if(intelValue > 0) then
				scenario.manager:RunObject("intelfriendlyon", 1);
			else
				scenario.manager:RunObject("intelfriendlyoff", 1);
			end
		end
	end
	return 1;
end

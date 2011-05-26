
-- ui and tutorial libs already loaded by tutorial manager
-- imported additional game libs as needed
Include("wwii");
Include("scenario");

-- set tutorial state here
state.name 					= "scenario.deathmatch";
state.enablemap			= true;

state.config['duration'] 	= 10;
state.config['kills'] 			= 30;

-- set our initial tutorial state
tutorial.SetState(state);

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
	local hud = ui.FindView("hud");
	
	if(hud ~= nil) then
		if(name == "victory1") then
			hud:CallJS("OnMessage", string.format("Allied Gains: %d of %d points", v, state.config.victory), color);
		else
			hud:CallJS("OnMessage", string.format("Axis Gains: %d of %d points", v, state.config.victory), color);
		end
	end
	
	ui.ChatPrint("Your team needs " .. (state.config.victory - friendly) .. " more kills to win!");
	ui.ChatPrint("The other team needs " .. (state.config.victory - enemy) .. " more kills to win!");
	
	return scenario.CheckVictory(name, value);
end

-- give a point to the enemy each time I die
function OnDie(handler)
	--ui.ChatPrint("On die called!");
	scenario.AddEnemyScore(1);	
	-- scenario.manager:RunEvent("ondie");
	return 1;
end

-- override the default round timer
function OnRoundTimer(name, value)
	local timeLeft = tonumber(value);
	
	if(timeLeft > 0) then
		local minutes = timeLeft / 60;
		local message = string.format("%d minutes left in this round!", minutes); 
		ui.ChatPrint(message);
		
		local hud = ui.FindView("hud");
		if(hud ~= nil) then
			hud:CallJS("OnMessage", message, "#FFFF00");
		end
	elseif(timeLeft == 0) then
		
		-- whoever has the most points wins! 
		local v1 =  Instancing:GetStateNumber("victory1");
		local v2 =  Instancing:GetStateNumber("victory2");
		
		if(v1 > v2) then
			state.victory = 1;
		elseif(v2 > v1) then
			state.victory = 2;
		else
			state.victory = -1;
		end
		
		ui:CallJS("SetResult", state.victory, v1, v2);
	else
		-- this timer was just inited
	end
	return 1;
end

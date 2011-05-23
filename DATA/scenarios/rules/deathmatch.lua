
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
	
	if(team == 1) then
		friendly 	=  Instancing:GetStateNumber("victory1");
		enemy 		=  Instancing:GetStateNumber("victory2");
	else
		friendly 	=  Instancing:GetStateNumber("victory2");
		enemy 		=  Instancing:GetStateNumber("victory1");
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


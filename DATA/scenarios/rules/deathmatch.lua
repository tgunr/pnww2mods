
-- ui and tutorial libs already loaded by tutorial manager
-- imported additional game libs as needed
Include("scenario");

-- set tutorial state here
state.name 					= "scenario.deathmatch";
state.enablemap			= true;
state.OnScenarioBase = OnScenario;

-- states we'll monitor
state.hoststates			= 
{
	{"roundstart", "OnRoundStart"},
	{"roundstop", "OnRoundStop"},
	{"victory", "OnVictory"},
	{"deaths1", "CheckVictory"},
	{"deaths2", "CheckVictory"},
};

function CheckVictory(name, value)

	local deaths 	=  Instancing:GetStateNumber(name);
	local victory 	= tonumber(state.config.kills);

	ui.ChatPrint("Checking " .. deaths .. " against " .. victory);	
	
	if(deaths >= victory) then
		if(name == "deaths1") then
			Instancing:SetState("victory", 2);
		elseif(name == "deaths2") then
			Instancing:SetState("victory", 1);
		end
	end
end

function OnVictory(name, value)
	scenario.manager:RunObject("victory"..value, 1);
end

function OnRoundStop(name, value)
	local timeLeft = string.match(value, "left ([%d%.]+)");
	
	if(timeLeft ~= nil) then
		local minutes = timeLeft / 60;
		ui.ChatPrint(string.format("There are %d minutes left in this round!", minutes));
	elseif(value == "true") then
		scenario.manager:RunObject("roundstop", 1);
	end
end

scenario.manager:AddContent("alert victory1 victory1");
scenario.manager:AddContent("alert victory2 victory2");
scenario.manager:AddContent("alert roundstop roundstop");

-- set our initial tutorial state
tutorial.SetState(state);




-- ui and tutorial libs already loaded by tutorial manager
-- imported additional game libs as needed
Include("wwii");
Include("scenario");

-- set tutorial state here
state.name 					= "scenario.dday";
state.enablemap			= true;
state.capturing			= false;

-- set our initial tutorial state
tutorial.SetState(state);

-- add our capture timer
tutorial.manager:AddTimedHandler("DoCapture", nil, 1);
tutorial.manager:AddTimedHandler("CaptureReport", nil, 5);

function OnDespawn(handler)
	state.capturing = false;
	return 1;
end

function OnCapture(handler)
	if(game.Ingame()) then
		if(GetTeam() == 1) then
			if(handler.state == tutorial.THS_EVENT_IN) then
				ui.ChatPrint("You are in the capture area!");
				state.capturing = true;
			else
				ui.ChatPrint("You have left the capture area!");
				state.capturing = false;
			end
		end
	end
	return 1;
end

function DoCapture(handler)
	if(state.capturing and state.victory == 0) then
		if(GetTeam() == 1) then
			scenario.AddFriendlyScore(state.config.capturerate or 1);
		end
	end
	return 1;
end

function CaptureReport(handler)
	if(state.capturing and state.victory == 0) then
		if(GetTeam() == 1) then
				local victory1 =  Instancing:GetStateNumber("victory1");
				ui.ChatPrint(string.format("Capture progress completed: %d%%", (victory1 / tonumber(state.config.victory) * 100)));
		end
	end
	return 1;
end

-- override the default round timer
function OnRoundTimer(name, value)
	local timeLeft = tonumber(value);
	
	if(timeLeft > 0) then
		local minutes = timeLeft / 60;
		ui.ChatPrint(string.format("There are %d minutes left in this round!", minutes));
	elseif(timeLeft == 0) then
		-- team 2 axis wins if its the round ends
		Instancing:SetState("victory2", state.config.victory);
	else
		-- this timer was just inited
	end
end

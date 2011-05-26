
-- ui and tutorial libs already loaded by tutorial manager
-- imported additional game libs as needed
Include("wwii");
Include("scenario");

-- set tutorial state here
state.name 					= "scenario.dday";
state.enablemap			= true;
state.capturing			= false;
state.lastcapture			= 0;

-- set our initial tutorial state
tutorial.SetState(state);

-- add our capture timer
tutorial.manager:AddTimedHandler("DoCapture", nil, 1);
tutorial.manager:AddTimedHandler("CaptureReport", nil, 5);

function OnDie(handler)
	state.capturing = false;
 	return 1;
end

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
	local victory1 =  Instancing:GetStateNumber("victory1");
	local percent =  (victory1 / tonumber(state.config.victory) * 100);
	
	if(state.lastcapture ~= victory1 and state.victory == 0) then
			local message = string.format("Capture progress: %d%%", percent);
			ui.ChatPrint(message);
			local hud = ui.FindView("hud");
			if(hud ~= nil) then
				if(GetTeam() == 1) then
					hud:CallJS("OnMessage", string.format("Allies are capturing the bridge! (%d%%)", percent), "#00FF00");
				else
					hud:CallJS("OnMessage", string.format("Allies are capturing the bridge! (%d%%)", percent), "#FF0000");
				end
			end
			state.lastcapture = victory1;
	end
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
			if(GetTeam() == 1) then
				hud:CallJS("OnMessage", message, "#FF0000");
			else
				hud:CallJS("OnMessage", message, "#00FF00");
			end
		end
	elseif(timeLeft == 0) then
		-- team 2 axis wins if its the round ends
		Instancing:SendStateValue("victory2", state.config.victory);
	else
		-- this timer was just inited
	end
end

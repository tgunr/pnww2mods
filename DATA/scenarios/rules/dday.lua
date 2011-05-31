
-- ui and tutorial libs already loaded by tutorial manager
-- imported additional game libs as needed
Include("wwii");
Include("scenario");

-- set tutorial state here
state.name 					= "scenario.dday";
state.enablemap			= true;
state.capturing			= false; -- are we capturing
state.capturearea		= nil; -- name of capture area we are capturing
state.capture				= -1; -- current capture amount
state.lastcapture			= -1;
state.nextcapcheck		= 0;
state.capper				= 0;

-- set our initial tutorial state
tutorial.SetState(state);

-- add our capture timer
scenario.RegisterUpdate("OnCaptureUpdate");
scenario.RegisterState("bridgecapture", "OnCapper");
scenario.RegisterState("bunkercapture", "OnCapper");

function OnDie(handler)
	state.capturing = false;
 	return 1;
end

function OnDespawn(handler)
	state.capturing = false;
	return 1;
end

function OnCapture(handler)
	state.capturing = scenario.InArea(handler);
	if(state.capturing) then
		state.capturearea = handler.name;
	else
		state.capturearea = nil;
	end
	return 1;
end

function OnCaptureUpdate(msDelta)

	if(state.victory ~= 0 or GetTeam() ~= 1) then
		return 1;
	end
	
	local capper 	= 0;
	local me 			= player.playerGetVehicle();
	local ft				= game.Frametime();
	local victory		= tonumber(state.config.victory);
	local secDelta	= msDelta / 1000;
	local meIndex = me.VehicleHostIndex;
	
	if(game.Online() == false) then
		meIndex = 1;
	end
	
	if(state.capturing and state.capturearea ~= nil) then
		capper = Instancing:GetStateNumber(state.capturearea);
	end
	
	if(state.capturing and capper == 0) then
		-- noone capping
		Instancing:KeepAlive(state.capturearea, meIndex);
		state.nextcapcheck = ft;
	elseif(state.capturing and capper == meIndex) then
		-- me
		if(ft >= state.nextcapcheck) then
			Instancing:KeepAlive(state.capturearea, meIndex);
			state.nextcapcheck = ft + 1000;
		end
		local amount = secDelta * (state.config.capturerate or 1);
		state.capture = state.capture + amount;
	else
		state.capture = -1;
	end
	
	if(state.lastcapture ~= state.capture) then
		state.lastcapture = state.capture;
		
		if(state.capture >= victory) then
			SetUIProgress(1, "capturing");
			Instancing:SendStateValue("victory", 1);
		elseif(state.capture >= 0) then
			SetUIProgress(state.capture / victory, "capturing");
		else
			SetUIProgress(-1, "capturing");
		end
	end
	
	return 1;
end

function OnCapper(name, value)
	if(state.victory ~= 0) then
		return 1;
	end
	
	-- ui.ChatPrint("OnCapper: " ..  name .. " / " .. value);
	
	local capper		= Instancing:GetStateNumber(name);
	local capveh 	= vehicle.vehFindVehicle(capper);
	
	if(capper > 0) then
		if(game.Online() == false or capveh:IsMe() == false) then
			scenario.manager:RunObject("alliedcapon", 1);
		end
	else
		scenario.manager:RunObject("alliedcapoff", 1);
	end
	
	return 1;
end

-- override the default round timer
function OnRoundTimer(name, value)
	local secondsLeft = tonumber(value);
	if(secondsLeft > 0) then
		scenario.OnRoundTimer(name, value);
	elseif(secondsLeft == 0) then
		-- team 2 axis wins if its the round ends
		Instancing:SendStateValue("victory", 2);
	end
end

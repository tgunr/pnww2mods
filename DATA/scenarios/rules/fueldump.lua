
-- ui and tutorial libs already loaded by tutorial manager
-- imported additional game libs as needed
Include("wwii");
Include("ra");

-- set tutorial state here
state.name 					= "scenario.fueldump";
state.enablemap			= true;
state.capturing			= false; -- are we capturing
state.capturearea		= nil; -- name of capture area we are capturing
state.capture				= -1; -- current capture amount
state.lastcapture			= -1;
state.nextcapcheck		= 0;
state.capper				= 0;

-- set our initial tutorial state
ra.InitState(state);

-- add our capture timer
--scenario.RegisterUpdate("OnCaptureUpdate");

-- some overrides
function ra.OnSpawn(handler)
	
	-- run default behavior
	scenario.OnSpawn(handler);
	
	state.capture = 0;
	state.depotcapture = false;
	
	local victory 		= tonumber(state.config.victory or 30);
	local objective 	= ra.GetStateNumber("objective1");
	
	-- update the hud to the current objective amounts
	local capper = ra.GetStateNumber("capper");
	
	ra.AddObjective("axis", "objective1", "objective1", "flag");
	
	if(capper == 0) then
		ra.SetObjective("objective1", 0);
	else
		ra.SetObjective("objective1", objective, victory);
	end
	
	return 1 
end

function ra.OnDie(handler)
	state.capture = 0;
	state.depotcapture = false;
 	return scenario.OnDie(handler);
end

function ra.OnDespawn(handler)
	state.capture = 0;
	state.depotcapture = false;
	return scenario.OnDespawn(handler);
end

function ra.OnUpdate(handler)

	scenario.OnUpdate(handler);

	if(state.victory ~= 0 or ra.GetTeam() ~= 2) then
		return 1;
	end
	
	local capper 	= 0;
	local me 			= player.playerGetVehicle();
	local ft				= ra.FrameTime();
	local victory		= tonumber(state.config.victory or 30);
	local secDelta	= msDelta / 1000;
	local meIndex = me.VehicleHostIndex;
	
	if(ra.IsOnline() == false) then
		meIndex = 1;
	end
	
	-- make sure we're not considered dead
	if(state.depotcapture and game.Dead()) then
		state.depotcapture = false;
	end
	
	if(state.depotcapture) then
		capper = ra.GetStateNumber("capper");
	end
	
	if(state.depotcapture and capper == 0) then
		-- noone capping
		ra.KeepAlive("capper", meIndex);
		state.nextcapcheck = ft;
	elseif(state.depotcapture and capper == meIndex) then
		-- me
		if(ft >= state.nextcapcheck) then
			ra.KeepAlive("capper", meIndex);
			state.nextcapcheck = ft + 1000;
		end
		local amount = secDelta * tonumber(state.config.capturerate or 1);
		state.capture = state.capture + amount;
		-- let everyone know what the capture percentage is 
		ra.SetState("objective1", state.capture);
	else
		state.capture = -1;
	end
	
	if(state.lastcapture ~= state.capture) then
		state.lastcapture = state.capture;

		if(state.capture >= victory) then
			ra.SetUIProgress(1, "capturing");
			ra.SetState("victory", 2);
		elseif(state.capture >= 0) then
			ra.SetUIProgress(state.capture / victory, "capturing");
		else
			ra.SetUIProgress(-1, "capturing");
		end
	end
	
	return 1;
end

function OnCapper(name, value)
	
	if(state.victory ~= 0) then
		return 1;
	end
	
	-- ui.ChatPrint("OnCapper: " ..  name .. " / " .. value);
	
	local capper		= ra.GetStateNumber(name);
	local capveh 	= vehicle.vehFindVehicle(capper);
	
	if(capper > 0) then
		if(ra.IsOnline() == false or capveh:IsMe() == false) then
			-- scenario.manager:RunObject(name, 1);
			ra.RunObject("axiscapon", 1);
		end
	else
		ra.SetObjective("objective1", 0);
		ra.RunObject("axiscapoff", 1);
	end
	
	return 1;
end

function OnCapturing(name, value)
	
	if(state.victory ~= 0) then
		return 1;
	end
	
	-- only counts if we actually have a capper
	local capper = ra.GetStateNumber("capper"); 
	
	if(capper == 0) then
		ra.SetObjective("objective1", 0);
		return 1;
	end
	
	-- amount the allies have captured
	local cap = ra.GetStateNumber("objective1");
	
	-- this is the amount needed
	local victory	= tonumber(state.config.victory or 30);
	
	-- update the ui
	ra.SetObjective("objective1", cap, victory);
	
	return 1;
end


-- override the default round timer
function ra.OnRoundTimer(name, value)
	local secondsLeft = tonumber(value);
	if(secondsLeft > 0) then
		scenario.OnRoundTimer(name, value);
	elseif(secondsLeft == 0) then
		-- team 1 allies wins if the round ends
		ra.SetState("victory", 1);
	end
end

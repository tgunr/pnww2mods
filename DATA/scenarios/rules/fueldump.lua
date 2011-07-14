
-- ui and tutorial libs already loaded by tutorial manager
-- imported additional game libs as needed
Include("wwii");
Include("scenario");

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
tutorial.SetState(state);

-- add our capture timer
scenario.RegisterUpdate("OnCaptureUpdate");

-- some overrides
function OnSpawn(handler)
	
	-- run default behavior
	scenario.OnSpawn(handler);
	
	state.capture = 0;
	state.depotcapture = false;
	
	local victory 		= tonumber(state.config.victory or 30);
	local objective 	= Instancing:GetStateNumber("objective1");
	
	-- update the hud to the current objective amounts
	local capper = Instancing:GetStateNumber("capper");
	
	scenario.AddObjective("axis", "objective1", "objective1", "flag");
	
	if(capper == 0) then
		scenario.SetObjective("objective1", 0);
	else
		scenario.SetObjective("objective1", objective, victory);
	end
	
	return 1 
end

function OnDie(handler)
	state.capture = 0;
	state.depotcapture = false;
 	return 1;
end

function OnDespawn(handler)
	state.capture = 0;
	state.depotcapture = false;
	return 1;
end

function OnCaptureUpdate(msDelta)

	if(state.victory ~= 0 or GetTeam() ~= 2) then
		return 1;
	end
	
	local capper 	= 0;
	local me 			= player.playerGetVehicle();
	local ft				= game.Frametime();
	local victory		= tonumber(state.config.victory or 30);
	local secDelta	= msDelta / 1000;
	local meIndex = me.VehicleHostIndex;
	
	if(game.Online() == false) then
		meIndex = 1;
	end
	
	if(state.depotcapture) then
		capper = Instancing:GetStateNumber("capper");
	end
	
	if(state.depotcapture and capper == 0) then
		-- noone capping
		Instancing:KeepAlive("capper", meIndex);
		state.nextcapcheck = ft;
	elseif(state.depotcapture and capper == meIndex) then
		-- me
		if(ft >= state.nextcapcheck) then
			Instancing:KeepAlive("capper", meIndex);
			state.nextcapcheck = ft + 1000;
		end
		local amount = secDelta * tonumber(state.config.capturerate or 1);
		state.capture = state.capture + amount;
		-- let everyone know what the capture percentage is 
		Instancing:SendStateValue("objective1", state.capture);
	else
		state.capture = -1;
	end
	
	if(state.lastcapture ~= state.capture) then
		state.lastcapture = state.capture;
		if(state.capture >= victory) then
			Instancing:SendStateValue("victory", 2);
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
			-- scenario.manager:RunObject(name, 1);
			scenario.manager:RunObject("axiscapon", 1);
		end
	else
		scenario.SetObjective("objective1", 0);
		scenario.manager:RunObject("axiscapoff", 1);
	end
	
	return 1;
end

function OnCapturing(name, value)
	
	if(state.victory ~= 0) then
		return 1;
	end
	
	-- only counts if we actually have a capper
	local capper = Instancing:GetStateNumber("capper"); 
	
	if(capper == 0) then
		scenario.SetObjective("objective1", 0);
		return 1;
	end
	
	-- amount the allies have captured
	local cap = Instancing:GetStateNumber("objective1");
	
	-- this is the amount needed
	local victory	= tonumber(state.config.victory or 30);
	
	-- update the ui
	scenario.SetObjective("objective1", cap, victory);
	
	return 1;
end


-- override the default round timer
function OnRoundTimer(name, value)
	local secondsLeft = tonumber(value);
	if(secondsLeft > 0) then
		scenario.OnRoundTimer(name, value);
	elseif(secondsLeft == 0) then
		-- team 1 allies wins if the round ends
		Instancing:SendStateValue("victory", 1);
	end
end

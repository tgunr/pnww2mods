
-- ui and tutorial libs already loaded by tutorial manager
-- imported additional game libs as needed
Include("wwii");
Include("ra");

-- set tutorial state here
state.name 					= "scenario.dday";
state.enablemap			= true;

-- stage 1 data
state.beachcrossing			= false;
state.reinforcing				= false;
state.nextreinforcement	= 0;
state.reinforcements		= 0;

-- stage 2 data
state.bunkercapture		= false; -- are we capturing
state.capture					= -1; -- current capture amount
state.lastcapture				= -1;
state.nextcapcheck			= 0;
state.capper					= 0;

-- set our initial tutorial state
ra.InitState(state);

-- add our capture timer
--scenario.RegisterUpdate("OnDoggreenUpdate");
-- scenario.RegisterUpdate("OnDoggreenUpdate");
-- scenario.RegisterUpdate("OnDoggreenUpdate");

-- some overrides
function ra.OnSpawn(handler)
	
	-- run default behavior
	scenario.OnSpawn(handler);
	
	state.capture 				= 0;
	state.beachcrossing 	= false;
	state.reinforcing 			= false;
	state.bunkercapture 	= false;
	
	local target1 = tonumber(state.config.objective1);
	local target2 = tonumber(state.config.objective2);
	
	local objective1 = ra.GetStateNumber("objective1");
	local objective2 = ra.GetStateNumber("objective2");
	
	ra.AddObjective("allied", "objective1", "objective1", "flag");
	ra.AddObjective("allied", "objective2", "objective2", "building");
	
	-- update the hud to the current objective amounts
	if(ra.GetStage() == 2) then
		ra.SetObjective("objective1", 1);
		
		local capper = ra.GetStateNumber("capper"); 
		
		if(capper == 0) then
			ra.SetObjective("objective2", 0);
		else
			ra.SetObjective("objective2", objective2, target2);
		end
	else
		ra.SetObjective("objective1", objective1, target1);
		ra.SetObjective("objective2", 0);
	end
	
	return 1 
end

function ra.OnDie(handler)
	state.beachcrossing = false;
	state.reinforcing = false;
	state.bunkercapture = false;
 	return scenario.OnDie(handler);
end

function ra.OnDespawn(handler)
	state.beachcrossing = false;
	state.reinforcing = false;
	state.bunkercapture = false;
	return scenario.OnDespawn(handler);
end

function ra.OnUpdate(handler)

	-- ui.ChatPrint("Doggreen update");

	if(ra.GetStage() == 1) then
		OnStage1Update(handler);
	else
		OnStage2Update(handler);
	end
end

---------------------------------------------------------------
------------ stage 1 handlers ----------------------------
---------------------------------------------------------------

function OnStage1Update(handler)

	-- ui.ChatPrint("Stage 1 update");

	if(state.victory ~= 0 or ra.GetTeam() ~= 1) then
		return 1;
	end
	
	local ft	= ra.FrameTime();
	
	-- make sure we're not considered dead
	if(game.Dead()) then
		state.beachcrossing = false;
	end
	
	-- if(state.beachcrossing) then
		-- ui.ChatPrint("Crossed the beach!");
		state.reinforcing = state.beachcrossing;
	-- end
	
	if(state.reinforcing and ft >= state.nextreinforcement) then
		local rate = tonumber(state.config.reinforcementrate or 1);
		local players = ra.GetPlayerCount(1);
		if(players == 0) then
			players = 1;
		end
		local contribution = rate / players;
		ra.AddState("objective1", contribution);
		-- ui.ChatPrint("Sending reinforcements!");
		state.nextreinforcement = ft + 1000;
	end
	
	return 1;
end

function OnReinforcements(name, value)
	-- ui.ChatPrint("New reinforcements: " .. value); 
	local stage = ra.GetStage();
	if(stage == 1) then
		-- ui.ChatPrint("Received reinforcements!"); 
		local reinforcements 	= tonumber(value);
		local needed				= tonumber(state.config.objective1 or 30); 
		
		if(state.reinforcements ~= reinforcements) then
			state.reinforcements = reinforcements;
			
			if(state.reinforcements >= needed) then
				ra.SetObjective("objective1", 1);
				ra:SetState("stage", 2);
			else
				ra.SetObjective("objective1", state.reinforcements, needed);
			end
			ra.RunObject("objective1", 1);
		end
	else
		ra.SetObjective("objective1", 1);
	end
end

function ra.OnStage(name, value)
	local nextStage = tonumber(value);
	local stage = ra.GetStage();
	
	if(stage ~= nextStage) then
		-- Doggreen has 2 stages
		state.beachcrossing = false;
		state.reinforcing = false;
		ra.SetObjective("objective1", 1);
		ra.SetStage(nextStage);
		
		-- sync our round timer to the next stage
		-- but only if we've been in the game for a bit
		-- prevents resets on new player arrivals (hack)
		if(ra.FrameTime() - state.starttime >= 60) then	
			local seconds = tonumber(state.config.duration2) * 60;
			ra.SetTimer("roundtimer", seconds);
		end
	end
	return 1;
end

---------------------------------------------------------------
------------ stage 2 handlers ----------------------------
---------------------------------------------------------------

function OnStage2Update(msDelta)

	if(state.victory ~= 0 or ra.GetTeam() ~= 1) then
		return 1;
	end
		
	local capper 	= 0;
	local me 			= player.playerGetVehicle();
	local ft				= ra.FrameTime();
	local victory		= tonumber(state.config.objective2 or 30);
	local secDelta	= msDelta / 1000;
	local meIndex = me.VehicleHostIndex;
	local stage		= ra.GetStage();
	
	if(ra.IsOnline() == false) then
		meIndex = 1;
	end
	
	-- make sure we're not considered dead
	if(state.bunkercapture and game.Dead()) then
		state.bunkercapture = false;
	end
	
	if(state.bunkercapture) then
		capper = ra.GetStateNumber("capper");
	end
	
	if(state.bunkercapture and capper == 0) then
		-- noone capping
		ra.KeepAlive("capper", meIndex);
		state.nextcapcheck = ft;
	elseif(state.bunkercapture and capper == meIndex) then
		-- me
		if(ft >= state.nextcapcheck) then
			ra.KeepAlive("capper", meIndex);
			state.nextcapcheck = ft + 1000;
		end
		local amount = secDelta * tonumber(state.config.capturerate or 1);
		state.capture = state.capture + amount;
		-- let everyone know what the capture percentage is 
		ra.SetState("objective2", state.capture);
	else
		state.capture = -1;
	end
	
	if(state.lastcapture ~= state.capture) then
		state.lastcapture = state.capture;
		
		if(state.capture >= victory) then
			ra.SetUIProgress(1, "capturing");
			ra.SetState("victory", 1);
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
			ra.RunObject("alliedcapon", 1);
		end
	else
		ra.SetObjective("objective2", 0);
		ra.RunObject("alliedcapoff", 1);
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
		ra.SetObjective("objective2", 0);
		return 1;
	end
	
	-- amount the allies have captured
	local cap = ra.GetStateNumber("objective2");
	
	-- this is the amount needed
	local victory	= tonumber(state.config.objective2 or 30);
	
	-- update the ui
	ra.SetObjective("objective2", cap, victory);
	
	return 1;
end


-- override the default round timer
function ra.OnRoundTimer(name, value)
	local secondsLeft = tonumber(value);
	if(secondsLeft > 0) then
		scenario.OnRoundTimer(name, value);
	elseif(secondsLeft == 0) then
		-- team 2 axis wins if its the round ends
		ra.SetState("victory", 2);
	end
end


-- ui and tutorial libs already loaded by tutorial manager
-- imported additional game libs as needed
Include("wwii");
Include("scenario");

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
tutorial.SetState(state);

-- add our capture timer
scenario.RegisterUpdate("OnDoggreenUpdate");
-- scenario.RegisterUpdate("OnDoggreenUpdate");
-- scenario.RegisterUpdate("OnDoggreenUpdate");

-- some overrides
function OnSpawn(handler)
	
	-- run default behavior
	scenario.OnSpawn(handler);
	
	state.capture 				= 0;
	state.beachcrossing 	= false;
	state.reinforcing 			= false;
	state.bunkercapture 	= false;
	
	local target1 = tonumber(state.config.objective1);
	local target2 = tonumber(state.config.objective2);
	
	local objective1 = Instancing:GetStateNumber("objective1");
	local objective2 = Instancing:GetStateNumber("objective2");
	
	scenario.AddObjective("allied", "objective1", "objective1", "flag");
	scenario.AddObjective("allied", "objective2", "objective2", "building");
	
	-- update the hud to the current objective amounts
	if(scenario.manager:GetStage() == 2) then
		scenario.SetObjective("objective1", 1);
		
		local capper = Instancing:GetStateNumber("capper"); 
		
		if(capper == 0) then
			scenario.SetObjective("objective2", 0);
		else
			scenario.SetObjective("objective2", objective2, target2);
		end
	else
		scenario.SetObjective("objective1", objective1, target1);
		scenario.SetObjective("objective2", 0);
	end
	
	return 1 
end

function OnDie(handler)
	state.beachcrossing = false;
	state.reinforcing = false;
	state.bunkercapture = false;
 	return 1;
end

function OnDespawn(handler)
	state.beachcrossing = false;
	state.reinforcing = false;
	state.bunkercapture = false;
	return 1;
end

function OnDoggreenUpdate(msDelta)

	-- ui.ChatPrint("Doggreen update");

	if(scenario.manager:GetStage() == 1) then
		OnStage1Update(msDelta);
	else
		OnStage2Update(msDelta);
	end
end

---------------------------------------------------------------
------------ stage 1 handlers ----------------------------
---------------------------------------------------------------

function OnStage1Update(msDelta)

	-- ui.ChatPrint("Stage 1 update");

	if(state.victory ~= 0 or GetTeam() ~= 1) then
		return 1;
	end
	
	local ft	= game.Frametime();
	
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
		local players = scenario.manager:GetPlayerCount(1);
		if(players == 0) then
			players = 1;
		end
		local contribution = rate / players;
		Instancing:SendAddState("objective1", contribution);
		-- ui.ChatPrint("Sending reinforcements!");
		state.nextreinforcement = ft + 1000;
	end
	
	return 1;
end

function OnReinforcements(name, value)
	-- ui.ChatPrint("New reinforcements: " .. value); 
	local stage = scenario.manager:GetStage();
	if(stage == 1) then
		-- ui.ChatPrint("Received reinforcements!"); 
		local reinforcements 	= tonumber(value);
		local needed				= tonumber(state.config.objective1 or 30); 
		
		if(state.reinforcements ~= reinforcements) then
			state.reinforcements = reinforcements;
			
			if(state.reinforcements >= needed) then
				scenario.SetObjective("objective1", 1);
				Instancing:SendStateValue("stage", 2);
			else
				scenario.SetObjective("objective1", state.reinforcements, needed);
			end
			scenario.manager:RunObject("objective1", 1);
		end
	else
		scenario.SetObjective("objective1", 1);
	end
end

function OnStage(name, value)
	local nextStage = tonumber(value);
	local stage = scenario.manager:GetStage();
	
	if(stage ~= nextStage) then
		-- Doggreen has 2 stages
		state.beachcrossing = false;
		state.reinforcing = false;
		scenario.SetObjective("objective1", 1);
		scenario.manager:SetStage(nextStage);
		
		-- sync our round timer to the next stage
		-- but only if we've been in the game for a bit
		-- prevents resets on new player arrivals (hack)
		if(game.Frametime() - state.starttime >= 60) then	
			local seconds = tonumber(state.config.duration2) * 60;
			Instancing:TimedEvent("roundtimer", seconds);
		end
	end
	return 1;
end

---------------------------------------------------------------
------------ stage 2 handlers ----------------------------
---------------------------------------------------------------

function OnStage2Update(msDelta)

	if(state.victory ~= 0 or GetTeam() ~= 1) then
		return 1;
	end
		
	local capper 	= 0;
	local me 			= player.playerGetVehicle();
	local ft				= game.Frametime();
	local victory		= tonumber(state.config.objective2 or 30);
	local secDelta	= msDelta / 1000;
	local meIndex = me.VehicleHostIndex;
	local stage		= scenario.manager:GetStage();
	
	if(game.Online() == false) then
		meIndex = 1;
	end
	
	-- make sure we're not considered dead
	if(state.bunkercapture and game.Dead()) then
		state.bunkercapture = false;
	end
	
	if(state.bunkercapture) then
		capper = Instancing:GetStateNumber("capper");
	end
	
	if(state.bunkercapture and capper == 0) then
		-- noone capping
		Instancing:KeepAlive("capper", meIndex);
		state.nextcapcheck = ft;
	elseif(state.bunkercapture and capper == meIndex) then
		-- me
		if(ft >= state.nextcapcheck) then
			Instancing:KeepAlive("capper", meIndex);
			state.nextcapcheck = ft + 1000;
		end
		local amount = secDelta * tonumber(state.config.capturerate or 1);
		state.capture = state.capture + amount;
		-- let everyone know what the capture percentage is 
		Instancing:SendStateValue("objective2", state.capture);
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
			-- scenario.manager:RunObject(name, 1);
			scenario.manager:RunObject("alliedcapon", 1);
		end
	else
		scenario.SetObjective("objective2", 0);
		scenario.manager:RunObject("alliedcapoff", 1);
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
		scenario.SetObjective("objective2", 0);
		return 1;
	end
	
	-- amount the allies have captured
	local cap = Instancing:GetStateNumber("objective2");
	
	-- this is the amount needed
	local victory	= tonumber(state.config.objective2 or 30);
	
	-- update the ui
	scenario.SetObjective("objective2", cap, victory);
	
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


-- imported game libs
Include("player");
Include("input");
Include("ui");
Include("fp");
Include("vehicle");
Include("wwii");
Include("map");
game.LoadLib("tutorial");

-- create an easy reference to the tutorial manager
tutorial.manager 		= tutorial.TutorialManager:GetInstance();
tutorial.currentGoal	= 1;
tutorial.initStep 		= 0;
tutorial.currentStep 	= 0;
tutorial.nextStep 		= 1;
tutorial.callbacks		= {};

-------------------- PRIVATE HELPER CALLS -------------------------

tutorial.timedalert = function(handler)
	tutorial.AddUIAlert(tutorial.timedmessages[handler.name]);
	tutorial.timedmessages[handler.name] = nil;
end

tutorial.getcallback = function(from)
	if(type(from) == "string") then
		local scope, callback = string.match(from, "(%w+)%.(%w+)");
		if(callback ~= nil and _G[scope] ~= nil) then
			return _G[scope][callback];
		else
			return _G[from];
		end
	end
	return nil;
end

------------------------ PUBLIC INTERFACE -----------------------

tutorial.IsComplete = function(id)
	return tutorial.state.complete;
end

tutorial.Complete = function(id)
	if(not tutorial.IsComplete()) then
		-- this tutorial is done
		tutorial.state.complete = true;
		
		-- tutorial cleanup and finish
		--tutorial.CleanUP();
		tutorial.SetUpdate(nil);
		tutorial.CompleteGoal();
		tutorial.CallJS("TutComplete");
	end
end

tutorial.ValidVehicle = function()
	if(game.Ingame() and tutorial.state.spawn ~= nil and tutorial.state.spawn.requires ~= nil) then
		-- setup some variables
		local spawned 	= vehicle.vehPlayerVehicle();
		local spec 		= spawned:GetType().WeaponSpec;
		local requires 	= tutorial.state.spawn.requires;
		-- check our country, category, class and type
		if(requires.wCountry ~= vehicle.VEH_ANY and requires.wCountry ~= spec.wCountry) then return false end
		if(requires.wCategory ~= vehicle.VEH_ANY and requires.wCategory ~= spec.wCategory) then return false end
		if(requires.wClass ~= vehicle.VEH_ANY and requires.wClass ~= spec.wClass) then return false end
		if(requires.wType ~= vehicle.VEH_ANY and requires.wType ~= spec.wType) then return false end
	end
	return true;
end

----------------------- core tutorial calls --------------------------

-- set the tutorial's state; pass nil to reset it
tutorial.SetState = function(s)
	tutorial.state = s or {};
	
	-- init whether this tutorial is already complete or not
	tutorial.state.complete = false; -- tutorial.IsComplete();
end

-- called when this tutorial is first started
function OnStart(handler)
	tutorial.OnStart(handler);
end

tutorial.OnStart = function(handler)
	tutorial.Start();
end

-- init's the tutorial
tutorial.Start = function()
	-- tutorial.ShowOK("intro", "tutorial.Spawn");
	tutorial.AllowStrat(false);
	tutorial.Spawn();
end

-- call this to spawn the player
tutorial.Spawn = function(veh)
	-- get our spawn position, could be nil for default or doesn't matter
	local pos = tutorial.state.spawn and tutorial.state.spawn.position;
	
	if(not game.Ingame()) then
		-- lookup the vehicle we want them to spawn with
		local spawnVeh = veh;
		
		if(spawnVeh == nil and tutorial.state.spawn ~= nil) then
			if(tutorial.state.spawn.spec ~= nil) then
				spawnVeh = vehicle.vehTypeGetBySpec(tutorial.state.spawn.spec);
			elseif(tutorial.state.spawn.requires ~= nil) then
				spawnVeh = vehicle.vehTypeGetByRequires(tutorial.state.spawn.requires);
			end
		end
		
		if(spawnVeh ~= nil) then
			if(pos ~= nil) then
				game.SpawnAt(spawnVeh, pos.x, pos.y, pos.z);
			else
				game.Spawn(spawnVeh, nil);
			end
		end
	else
		if(tutorial.ValidVehicle()) then
			if(pos ~= nil) then
				local v = vehicle.vehPlayerVehicle();
				if(pos.tolerance == nil or v:DistanceTo(pos.x, pos.y, pos.z) > pos.tolerance) then
					v:SetPosition(pos.x, pos.y, pos.z);
				else
					-- clear out the yaw so we dont get a abrupt view change if
					-- we're already in the game
					if(tutorial.state.spawn and tutorial.state.spawn.position) then
						tutorial.state.spawn.position.yaw = nil;
					end
				end
			end
			
			-- do whatever onspawn normally does
			OnSpawn();
		else
			tutorial.ShowOK("badvehicle", "tutorial.Despawn", 1);
		end
	end
end

-- call after you enter the world
function OnSpawn(handler)
	return tutorial.OnSpawn(handler);
end

tutorial.OnSpawn = function(handler)
	-- show the ui
	tutorial.ShowUI();
	
	local veh 	= vehicle.vehPlayerVehicle();
	local pos 	= tutorial.state.spawn and tutorial.state.spawn.position;
	
	if(pos ~= nil and pos.yaw ~= nil) then
		veh:SetYaw(pos.yaw);
	end
	
	-- setup any vspawn vehicles
	if(tutorial.state.spawn and tutorial.state.spawn.vspawn ~= nil) then
		tutorial.state.spawn.vspawned = {};
		for i,v in ipairs(tutorial.state.spawn.vspawn) do 
			local req = {
				wCountry 	= v[1],
				wCategory 	= v[2],
				wClass 		= v[3],
				wType 		= v[4]
			};
			local vtype = vehicle.vehTypeGetByRequires(req);
			if(vtype ~= nil and (v[10] == nil or v[10] == veh:GetCountry())) then
				local icon = ((v[11] ~= nil) and v[11] or "");
				table.insert(tutorial.state.spawn.vspawned, vehicle.vehmainAddSTO(vtype, v[5], v[6], v[7], v[8], v[9], icon));
			end
		end
	end
	
	-- set the onupdate handler
	if(tutorial.state.onupdate) then
		tutorial.SetUpdate(tutorial.state.onupdate);
	end
	
	-- set our initial control blocks, if any
	if(tutorial.state.spawn and tutorial.state.spawn.block) then
		for index,value in ipairs(tutorial.state.spawn.block) do 
			fp.fpFPSControlBlockSet(value);
		end
	end
	
	-- hide the map if its up
	if(map.uiMapIngameMapUp()) then
		map.uiMapHideIngameMap(false);
	end
	
	if(tutorial.state.enablemap ~= true) then
		-- lock the map off
		map.uiMapLock(true);
	end
	
	-- show the hud if its off
	player.persHUDShowHUD();
	
	-- lock the hud on
	player.persHUDLock(true);
	
	return 1;
end

-- set the current script update callback
tutorial.SetUpdate = function(callback)
	tutorial.callbacks.onupdate = nil;
	if(callback ~= nil) then
		tutorial.callbacks.onupdate = tutorial.getcallback(callback);
	end
end

-- called when space is called
function OnContinue(handler, func, param)
	if(param > 0 and func == input.IMAP_CONTINUE_TUTORIAL) then
		if(state.continued == nil or (game.Frametime() - state.continued >= 300)) then
			tutorial.OnContinue(handler);
			state.continued = game.Frametime();
		end
	end
	return 1;
end

tutorial.OnContinue = function(handler)
	if(tutorial.ui ~= nil) then
		tutorial.CallJS("TutContinue");
	end
end

function OnUpdate(handler)
	return tutorial.OnUpdate(handler);
end

tutorial.OnUpdate = function(handler)
	if(tutorial.callbacks.onupdate ~= nil and (not tutorial.state.ingameupdate or game.Ingame())) then
		-- allow the step to init some handlers
		if(tutorial.InitStep()) then
			tutorial.callbacks.onupdate(tutorial.nextStep);
		end
		
		-- if we have a ui and its not ready, wait
		if(not tutorial.IsUIReady()) then return 1 end
		
		-- don't do anything if we're waiting to handle the next step
		if(not tutorial.IsStepComplete()) then return 1 end
		
		-- ok, we're good to go to the next step
		tutorial.Step();
	end
	return 1;
end

-- call this to despawn the player
tutorial.Despawn = function(when)
	if(game.Ingame()) then
		if(type(when) == "number") then
			tutorial.manager:AddTimedHandler("tutorial.Despawn", nil, when);
		else
			ui.LoadView("exitvehicle");
		end
	else
		OnDespawn();
	end
end

-- called after getting back to the UI
function OnDespawn(handler)
	return tutorial.OnDespawn(handler);
end

tutorial.OnDespawn = function(handler)
	if(tutorial.state.spawn and tutorial.state.spawn.vspawned ~= nil) then
		for i,v in ipairs(tutorial.state.spawn.vspawned) do 
			vehicle.vehmainRemoveSTO(v);
		end
	end
	tutorial.Stop();
end

-- call this to stop the tutorial
tutorial.Stop = function()
	tutorial.manager:Stop();
end

-- called whent tutorial is finished
function OnStop(handler)
	tutorial.OnStop(handler);
end

tutorial.OnStop = function(handler)
	-- lets do some cleanup
	tutorial.CleanUP();
end

-- called whent tutorial is finished
function OnDie(handler)
	return tutorial.OnDie(handler);
end

tutorial.OnDie = function(handler)
	-- what to do?
	tutorial.ShowOK("died", "tutorial.OnDead");
	return 1;
end

tutorial.OnDead = function()
	tutorial.Stop();
	ui.LoadView("exitvehicle");
end

tutorial.CleanUP = function()
	-- reset any control blocks that were in place
	fp.fpFPSControlBlockReset();
	
	-- cleanup any waypoints
	map.uiMapClearWaypoints();
	
	-- make sure the HUD can be managed
	player.persHUDLock(false);
	
	-- make sure the map can be used again
	map.uiMapLock(false);
	
	-- kill the UI if we have one
	tutorial.HideUI(true);
end
---------------------- handler calls ------------------------

function SetNextStep(delay)
	tutorial.state.onnextstep = delay;
	tutorial.AddHandler(tutorial.TUT_EVENT_UI_READY, "OnNextStep");
end

function OnNextStep(handler, ok)
	if(ok) then
		tutorial.CompleteStep(tutorial.state.onnextstep);
		return 0;
	end
	return 1; -- keep handler running
end

function SetInput(delay, inlo, inhi)
	tutorial.state.oninput = {
		delay = delay,
		inlo = inlo,
		inhi = ((inhi ~= nil) and inhi or inlo)
	};
	tutorial.AddHandler(tutorial.TUT_EVENT_INPUT, "OnInput");
end

function OnInput(handler, func, param)
	local o = tutorial.state.oninput;
	if(o == nil or (param ~= 0 and func >= o.inlo and func <= o.inhi)) then
		tutorial.CompleteStep(o.delay);
		return 0;
	end
	return 1; -- keep handler running
end

-- primary add handlers
tutorial.AddHandler = function(event, callback, name)
	tutorial.manager:AddHandler(event, callback, name);
end

tutorial.AddTimedHandler = function(callback, name, duration)
	tutorial.manager:AddTimedHandler(callback, name, duration);
end

tutorial.AddTimer = tutorial.AddTimedHandler;

tutorial.AddLocationHandler = function(callback, name, x, y, z, d, waypoint, wtype, wstype, addtoui, wnotes)
	tutorial.manager:AddLocationHandler(callback, name, x, y, z, d);
	-- add a waypoint?
	if(waypoint ~= nil and waypoint ~= "") then
		wtype 	= (wtype ~= nil) and wtype or 1;
		wstype 	= (wstype ~= nil) and wstype or 0;
		wnotes 	= (wnotes ~= nil) and wnotes or "";
		addtoui = (addotui ~= nil) and addotui or true; 
		tutorial.AddWaypoint(waypoint, wtype, wstype, x, y, z, addtoui, wnotes);
	end
end

tutorial.AddLocation = tutorial.AddLocationHandler;

tutorial.AddAreaHandler = function(callback, name, x, y, z, x2, y2, z2)
	tutorial.manager:AddAreaHandler(callback, name, x, y, z, x2, y2, z2);
end

tutorial.AddArea = tutorial.AddAreaHandler;

-- tutorial.AddLocationHandler = function(callback, name, latlon, d)
--		tutorial.manager:AddLocationHandler(callback, name, latlon, d);
-- end

-- handler removal
tutorial.RemoveHandler = function(name)
	tutorial.manager:RemoveHandler(name);
end

tutorial.RemoveHandlers = function()
	tutorial.manager:RemoveHandlers();
end

tutorial.AllowStrat = function(allow)
	if(allow ~= nil) then
		tutorial.manager:SetStratAllow(allow);
	end
	return tutorial.manager:AllowStrat();
end

-- register some default handlers
-- these handlers have to be defined by the tutorial writer
tutorial.AddHandler(tutorial.TUT_EVENT_START, "OnStart");
tutorial.AddHandler(tutorial.TUT_EVENT_STOP, "OnStop");
tutorial.AddHandler(tutorial.TUT_EVENT_SPAWN, "OnSpawn");
tutorial.AddHandler(tutorial.TUT_EVENT_DESPAWN, "OnDespawn");
tutorial.AddHandler(tutorial.TUT_EVENT_DIED, "OnDie");

-- these default handlers are defined, although they could be redefined
-- by the tutorial writer
tutorial.AddHandler(tutorial.TUT_EVENT_INPUT, "OnContinue");
tutorial.AddHandler(tutorial.TUT_EVENT_UPDATE, "OnUpdate");
tutorial.AddHandler(tutorial.TUT_EVENT_UI_POPUP, "tutorial.OnPopup");
tutorial.AddHandler(tutorial.TUT_EVENT_UI_DESTROYED, "tutorial.OnUIDestroyed");
tutorial.AddHandler(tutorial.TUT_EVENT_UI_READY, "tutorial.OnUIReady");

----------------------- UI interface -----------------------

tutorial.OnPopup = function(handler, ok)
	-- save this popup's response
	tutorial.uiok = ok;
	
	-- call the callback
	if(tutorial.callbacks.onpopup ~= nil) then
		local args = tutorial.callbacks.onpopupargs or {};
		
		-- perform the callback
		tutorial.callbacks.onpopup(args[1], args[2]);
		
		-- reset the popup parameters
		tutorial.callbacks.onpopup 		= nil;
		tutorial.callbacks.onpopupargs 	= nil;
	end
	return 1;
end

tutorial.OnUIDestroyed = function(handler)
	tutorial.ui = nil;
	return 1;
end

tutorial.OnUIReady = function(handler, ready)
	tutorial.uiready = ready;
	return 1;
end

tutorial.CallJS = function(callback, ...)
	if(tutorial.ui ~= nil) then
		tutorial.ui:CallJS(callback, {...});
		return true;
	end
	return false;
end

tutorial.AddUIAlert = function(message, when)
	if(tutorial.ui == nil) then
		return;
	end
	if(type(when) == "number") then
		local name = "timedmessage";
		if(tutorial.timedmessages == nil) then
			tutorial.timedmessages = {};
			tutorial.timedmessagecount = 0;
		end
		tutorial.timedmessagecount = tutorial.timedmessagecount + 1;
		name = name .. tutorial.timedmessagecount;
		tutorial.timedmessages[name] = message;
		tutorial.manager:AddTimedHandler("tutorial.timedalert", name, when);
	else
		tutorial.CallJS("TutAddAlert", message);
	end
end

tutorial.AddUIMessage = function(message, when)
	tutorial.CallJS("TutAddLocMessage", message);
end

tutorial.AddWaypoint = function(name, t, st, x, y, z, addtoui, notes)
	map.uiMapAddWaypoint(name, t, st, math.floor(x), math.floor(y), notes or "");
	if(addtoui == true) then
		tutorial.CallJS("TutAddWaypoint", name, x, y, z);
	end
end

tutorial.RemoveWaypoint = function(name)
	map.uiMapRemoveWaypoint(name);
	tutorial.CallJS("TutRemoveWaypoint", name);
end

tutorial.ShowUI = function(path)
	-- hide the current ui if we have one
	tutorial.HideUI(true);
	
	-- load the override, custom or default ui
	tutorial.ui = ui.LoadView(path or tutorial.state.ui or "tutorial");
	
	-- init the ui
	tutorial.CallJS("InitTutorial");
	
	-- init it
	tutorial.CallJS("TutSetName", tutorial.state.name, tutorial.currentGoal, tutorial.nextStep);
end

tutorial.HideUI = function(close)
	if(tutorial.ui ~= nil) then
		tutorial.ui:Hide();
		if(close) then 
			tutorial.ui:Close();
			tutorial.ui = nil;
		end
	end
end

tutorial.IsUIReady = function()
	if(tutorial.ui == nil or tutorial.uiready == true) then
		return true;
	else
		return false;
	end
end

-- popup calls
tutorial.ShowError = function(message, stop)
	tutorial.ShowOK(message);
	if(stop) then 
		tutorial.Stop();
	end
end

tutorial.ShowOK = function(loc, callback, ...)
	tutorial.callbacks.onpopup 		= tutorial.getcallback(callback);
	tutorial.callbacks.onpopupargs	= {...};
	local message = tutorial.LocKey(loc);
	
	if(not tutorial.CallJS("TutShowOK", message)) then
		ui.ShowOK(message);
	end
end

tutorial.ShowConfirm = function(loc, callback, ...)
	tutorial.callbacks.onpopup 		= tutorial.getcallback(callback);
	tutorial.callbacks.onpopupargs 	= {...};
	local message = tutorial.LocKey(loc);
	
	if(not tutorial.CallJS("TutShowConfirm", message)) then
		ui.ShowConfirm(message);
	end
end

tutorial.LocKey = function(loc)
	local tutLoc = "tutorials." .. tutorial.state.name .. "." .. loc;
	if(ui.uiHasLocString(tutLoc)) then
		return tutLoc;
	end
	-- return the general version if the tutorial
	-- specific version wasn't found
	return "tutorials." .. loc;
end

------------------------ tutorial step interface ------------------------

tutorial.InitStep = function()
	if(tutorial.nextStep > 0 and tutorial.initStep ~= tutorial.nextStep) then
		tutorial.initStep = tutorial.nextStep;
		return true;
	end
	return false;
end

tutorial.CompleteStep = function(when)
	if(not tutorial.IsStepComplete()) then
		if(type(when) == "number") then
			tutorial.manager:AddTimedHandler("tutorial.CompleteStep", nil, when);
		else
			tutorial.currentStep = tutorial.nextStep;
			tutorial.CallJS("TutCompleteStep");
		end
	end
end

tutorial.IsStepComplete = function()
	if(tutorial.currentStep == tutorial.nextStep) then
		return true;
	else
		return false;
	end
end

tutorial.Step = function()
	-- increment the step counter
	tutorial.nextStep = tutorial.nextStep + 1;
	
	-- clear this flag so the next step can use it
	tutorial.uiready = false;
	
	-- tell the ui layer to try to add a new step
	tutorial.CallJS("TutAddStep");
	
	-- return it for use
	return tutorial.nextStep;
end

tutorial.CompleteGoal = function(when)
	if(type(when) == "number") then
		tutorial.manager:AddTimedHandler("tutorial.CompleteGoal", nil, when);
	else
		if(not tutorial.IsStepComplete()) then
			tutorial.CompleteStep();
		end
		tutorial.currentGoal	= tutorial.currentGoal + 1;
		tutorial.initStep		= 0;
		tutorial.currentStep 	= 0;
		tutorial.nextStep 		= 1;
		tutorial.CallJS("TutCompleteGoal");
	end
end



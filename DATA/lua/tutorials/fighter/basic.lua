
-- ui and tutorial libs already loaded by tutorial manager
-- imported additional game libs as needed
Include("input");
Include("terrain");
Include("player");
Include("state"); -- includes default state

-- set tutorial state here
state.name 				= "fighter.basic";
state.block 			= nil;
state.onupdate			= "OnGoalIntro";

local country = player.playerGetPlayer():GetCountry();

if(country == wwii.WWII_ENGLAND) then
	state.spawn.spec = vehicle.vehSpecByID("hurri1");
elseif(country == wwii.WWII_FRANCE) then
	state.spawn.spec = vehicle.vehSpecByID("hawk75");
elseif(country == wwii.WWII_GERMANY) then
	state.spawn.spec = vehicle.vehSpecByID("bf109e1");
end

state.spawn.vspawn			= nil;
state.spawn.requires		= nil;
state.spawn.position.x		= -314335;
state.spawn.position.y		= 3602532;
state.spawn.position.z		= 102;
state.spawn.position.yaw	= -2.33;
state.enablemap				= true;

-- set our initial tutorial state
tutorial.SetState(state);

function OnGoalIntro(step)
	if(step == 1) then
		SetNextStep(1);
	elseif(step == 2) then
		tutorial.SetUpdate("OnGoalLearnViews");
		tutorial.CompleteGoal();
	end
end

function OnGoalLearnViews(step)
	if(step == 1) then
		SetInput(2, input.IMAP_MOM_CANOPYCONTROL);
	elseif(step == 2) then
		SetInput(3, input.IMAP_LOOK_FORWARD, input.IMAP_LOOK_BACK_LEFT_DOWN);
	elseif(step == 3) then
		SetInput(1, input.IMAP_TOGGLE_MOUSE_LOOK);
	elseif(step == 4) then
		SetInput(1, input.IMAP_TOGGLE_MOUSE_LOOK);
	elseif(step == 5) then
		tutorial.SetUpdate("OnGoalLearnSurfaces");
		tutorial.CompleteGoal();
	end
end

function OnGoalLearnSurfaces(step)
	if(step == 1) then
		SetNextStep(1);
	elseif(step == 2) then
		state.looking = false;
		state.lookdir = input.IMAP_LOOK_RIGHT;
		state.control = input.IMAP_ASX_ROLL;
		-- these handlers handle this step and the next 3
		tutorial.AddHandler(tutorial.TUT_EVENT_INPUT, "OnLook");
		tutorial.AddHandler(tutorial.TUT_EVENT_INPUT, "OnControlSurface");
	elseif(step == 3) then
		state.lookdir = input.IMAP_LOOK_LEFT;
		state.control = input.IMAP_ASX_ROLL;
	elseif(step == 4) then
		SetInput(2, input.IMAP_ASX_YAW);
	elseif(step == 5) then
		SetInput(2, input.IMAP_ASX_PITCH);
	elseif(step == 6) then
		SetInput(2, input.IMAP_ASX_FLAPCONTROL);
	elseif(step == 7) then
		tutorial.RemoveHandler("OnLook");
		tutorial.RemoveHandler("OnControlSurface");
		tutorial.SetUpdate("OnGoalLearnGunsight");
		tutorial.CompleteGoal();
	end
end

function OnGoalLearnGunsight(step)
	if(step == 1) then
		SetInput(1, input.IMAP_TMP_GUNSIGHT_VIEW);
	elseif(step == 2) then
		tutorial.SetUpdate("OnGoalLearnInstruments");
		tutorial.CompleteGoal();
	end
end

function OnGoalLearnInstruments(step)
	if(step == 1) then
		SetInput(1, input.IMAP_TMP_INSTRUMENT_VIEW);
	elseif(step == 2) then
		SetNextStep(1);
	elseif(step == 3) then
		SetNextStep(1);
	elseif(step == 4) then
		SetInput(1, input.IMAP_TMP_INSTRUMENT_VIEW);
	elseif(step == 5) then
		tutorial.SetUpdate("OnGoalLearnVehicleStatus");
		tutorial.CompleteGoal();
	end
end

function OnGoalLearnVehicleStatus(step)
	if(step == 1) then
		SetInput(1, input.IMAP_SHOW_STATS);
	elseif(step == 2) then
		SetNextStep(1);
	elseif(step == 3) then
		SetNextStep(1);
	elseif(step == 4) then
		SetNextStep(1);
	elseif(step == 5) then
		tutorial.SetUpdate("OnGoalLearnTaxi");
		tutorial.CompleteGoal();
	end
end

function OnGoalLearnTaxi(step)
	if(step == 1) then
		SetInput(1, input.IMAP_ASX_LEFTBRAKE, input.IMAP_ASX_RIGHTBRAKE);
	elseif(step == 2) then
		SetInput(1, input.IMAP_MOM_STARTER_ON);
	elseif(step == 3) then
		SetInput(1, input.IMAP_MOM_TOGGLE_TAILLOCK);
	elseif(step == 4) then
		state.onrunway = false;
		tutorial.AddArea("OnAtRunway", nil, -314390, 3602482, 90, -314070, 3602655, 120);
		tutorial.AddTimer("OnLinedUP", nil, 1);
	elseif(step == 5) then
		SetInput(1, input.IMAP_MOM_STARTER_ON);
	elseif(step == 6) then
		tutorial.Complete();
	end
end

function OnAtRunway(handler)
	if(handler.state == tutorial.THS_EVENT_IN) then
		state.onrunway = true;
	else
		state.onrunway = false;
	end
	return 1;
end

function OnLinedUP(handler)
	if(state.onrunway) then
		local veh = player.playerGetVehicle();
		if(veh ~= nil) then
			local yaw = veh:GetYaw();
			if(yaw >= -75 and yaw <= -50) then
				tutorial.CompleteStep(0);
				return 0;
			end
		end
	end
	return 1; -- keep handler running
end

function OnLook(handler, func, param)
	if(func == state.lookdir) then
		if(param ~= 0) then
			state.looking = true;
		else
			state.looking = false;
		end
	end
	return 1; -- keep handler running
end

function OnControlSurface(handler, func, param)
	if(param ~= 0 and func == state.control) then
		if(state.looking) then
			state.control = -1;
			state.lookdir = -1;
			state.looking = false;
			tutorial.CompleteStep(1);
		end
	end
	return 1; -- keep handler running
end




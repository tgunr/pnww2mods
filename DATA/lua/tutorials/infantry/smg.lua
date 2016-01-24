
-- ui and tutorial libs already loaded by tutorial manager
-- imported additional game libs as needed
Include("input");
Include("terrain");
Include("player");
Include("ob");
Include("state");

-- setup tutorial state here
state.name 		= "infantry.smg";
state.onupdate	= "OnGoalLearnSMG";
state.spawn.requires.wType = 2; -- smg
state.hit 		= 0;
state.enablemap	= true;

-- set our initial tutorial state
tutorial.SetState(state);

function OnGoalLearnSMG(step)
	if(step == 1) then
		SetNextStep(1);
		tutorial.AddHandler(tutorial.TUT_EVENT_HIT, "OnHitTargets");
	elseif(step == 2) then
		state.waypoint = "gunrange";
		local chance = math.random(100);
		if(chance < 20) then
			tutorial.AddLocation("OnAtPosition", nil, -314010, 3603722, 103, 2, state.waypoint);
		elseif(chance < 40) then
			tutorial.AddLocation("OnAtPosition", nil, -314025, 3603721, 103, 2, state.waypoint);
		elseif(chance < 60) then
			tutorial.AddLocation("OnAtPosition", nil, -314039, 3603722, 103, 2, state.waypoint);
		elseif(chance < 80) then
			tutorial.AddLocation("OnAtPosition", nil, -314053, 3603722, 103, 2, state.waypoint);
		else
			tutorial.AddLocation("OnAtPosition", nil, -314068, 3603722, 103, 2, state.waypoint);
		end
	elseif(step == 3) then
		SetInput(2, input.IMAP_HOLD_FP_FIRE);
	elseif(step == 4) then
		SetInput(2, input.IMAP_HOLD_FP_GUNSIGHT);
	elseif(step == 5) then
		state.hit = 0;
		tutorial.AddHandler(tutorial.TUT_EVENT_HIT, "OnHitTarget");
	elseif(step == 6) then
		SetNextStep(1);
	elseif(step == 7) then
		SetNextStep(1);
	elseif(step == 8) then
		tutorial.Complete();
	end
end

function OnAtPosition(handler)
	if(handler.state == tutorial.THS_EVENT_IN) then
		tutorial.RemoveWaypoint(state.waypoint);
		tutorial.CompleteStep(1);
		return 0;
	end
	return 1;
end

function OnHitTarget(handler, to, co, x, y, z)
	OnHitTargets(handler, to, co, x, y, z);
	if(state.hit > 0) then
		tutorial.AddHandler(tutorial.TUT_EVENT_HIT, "OnHitTargets");
		tutorial.CompleteStep(1);
		return 0;
	end
	return 1; -- keep handler running
end

function OnHitTargets(handler, to, co, x, y, z)
	if(co.name == "o167") then
		state.hit = state.hit + 1;
		tutorial.CallJS("TutAddLocMessage", "20mhit", "true");
	elseif(co.name == "o169") then
		state.hit = state.hit + 1;
		tutorial.CallJS("TutAddLocMessage", "50mhit", "true");
	elseif(co.name == "o170") then
		state.hit = state.hit + 1;
		tutorial.CallJS("TutAddLocMessage", "100mhit", "true");
	elseif(co.name == "o171") then
		state.hit = state.hit + 1;
		tutorial.CallJS("TutAddLocMessage", "200mhit", "true");
	elseif(co.name == "o172") then
		state.hit = state.hit + 1;
		tutorial.CallJS("TutAddLocMessage", "500mhit", "true");
	end
	return 1; -- keep handler running
end





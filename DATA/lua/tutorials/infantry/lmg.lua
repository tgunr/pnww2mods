
-- ui and tutorial libs already loaded by tutorial manager
-- imported additional game libs as needed
Include("input");
Include("terrain");
Include("player");
Include("ob");
Include("state");

-- setup tutorial state here
state.name 		= "infantry.lmg";
state.onupdate	= "OnGoalLearnProneDeploy";
state.spawn.requires.wType = 6;
state.hit 		= 0;
state.enablemap	= true;

-- set our initial tutorial state
tutorial.SetState(state);

function OnGoalLearnProneDeploy(step)
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
		tutorial.AddHandler(tutorial.TUT_EVENT_FPS_POSE, "OnLayDown");
	elseif(step == 5) then
		SetInput(2, input.IMAP_HOLD_FP_DEPLOY);
	elseif(step == 6) then
		tutorial.AddHandler(tutorial.TUT_EVENT_HIT, "OnHitTarget");
	elseif(step == 7) then
		SetNextStep(1);
	elseif(step == 8) then
		SetInput(2, input.IMAP_HOLD_FP_DEPLOY);
	elseif(step == 9) then
		tutorial.SetUpdate("OnGoalLearnStandDeploy");
		tutorial.CompleteGoal();
	end
end

function OnLayDown(handler, pose)
	if(pose == fp.POSE_PRONE) then
		tutorial.CompleteStep(1);
		return 0;
	end
	return 1; -- keep handler running
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

function OnGoalLearnStandDeploy(step)
	if(step == 1) then
		state.waypoint = "vehiclerange";
		tutorial.AddLocation("OnAtPosition", nil, -313992, 3603761, 101, 2, state.waypoint);
	elseif(step == 2) then
		state.waypoint = "bunker";
		tutorial.AddLocation("OnAtPosition", nil, -313969, 3603763, 101, 1, state.waypoint);
	elseif(step == 3) then
		SetInput(2, input.IMAP_HOLD_FP_DEPLOY);
	elseif(step == 4) then
		SetNextStep(1);
	elseif(step == 5) then
		tutorial.Complete();
	end
end




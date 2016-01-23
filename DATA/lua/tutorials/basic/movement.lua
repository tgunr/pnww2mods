
-- ui and tutorial libs already loaded by tutorial manager
-- imported additional game libs as needed
Include("input");
Include("terrain");
Include("player");
Include("state"); -- includes default state

-- set tutorial state here
state.name 		= "basic.movement";
state.block 	= { fp.CB_MOVE, fp.CB_POSE, fp.CB_FIRE, fp.CB_SELECT };
state.onupdate	= "OnGoalLearnMovement";

-- set our initial tutorial state
tutorial.SetState(state);

----------------- goal 1: learn infantry movement ---------------------

function OnGoalLearnMovement(step)
	if(step == 1) then							-- step 1: mouse look around
		state.lookaround = 0;
		tutorial.RemoveWaypoint("resupply");
		tutorial.AddHandler(tutorial.TUT_EVENT_INPUT, "OnLookAround");
	elseif(step == 2) then						-- step 2: go outside
		tutorial.AddHandler(tutorial.TUT_EVENT_INPUT, "OnLookLeftRight");
	elseif(step == 3) then						-- step 3: look left and right
		fp.fpFPSControlBlockClear(fp.CB_MOVE);
		tutorial.AddHandler(tutorial.TUT_EVENT_INPUT, "OnMoveAround");
	elseif(step == 4) then						-- step 4: run until tired
		SetNextStep(1);
	elseif(step == 5) then						-- step 5: run until tired
		tutorial.AddLocation("OnAtResupply", nil, -314106.42, 3603737.10, 101.91, 5, "resupply");
	elseif(step == 6) then						-- step 6: review atp bar
		SetNextStep(1);
	elseif(step == 7) then						-- step 7: next goal
		tutorial.RemoveWaypoint("resupply");
		tutorial.SetUpdate("OnGoalLearnStances");
		tutorial.CompleteGoal();
	end
end

function OnLookAround(handler, func, param)
	if(func == input.IMAP_ASX_FP_TORSO_VERTICAL_AXIS) then
		state.lookaround = state.lookaround + math.abs(param); 
	elseif(func == input.IMAP_ASX_FP_TORSO_HORIZONTAL_AXIS) then
		state.lookaround = state.lookaround + math.abs(param);
	end
	if(state.lookaround > 5000) then
		tutorial.CompleteStep();
		return 0;
	end
	return 1; -- keep handler running
end

function OnMoveAround(handler, func, param)
	if(param ~= 0) then
		if(func == input.IMAP_HOLD_FP_FORWARD) then
			state.moveforward = true;
		elseif(func == input.IMAP_HOLD_FP_BACKWARD) then
			state.movebackward = true;
		elseif(func == input.IMAP_HOLD_FP_STRAFE_LEFT) then
			state.moveleft = true;
		elseif(func == input.IMAP_HOLD_FP_STRAFE_RIGHT) then
			state.moveright = true;
		end
	end
	if(state.moveforward and state.movebackward and state.moveleft and state.moveright) then
		tutorial.CompleteStep(2);
		return 0;
	end
	return 1; -- keep handler running
end

function OnLookLeftRight(handler, func, param)
	if(param > 0) then
		if(func == input.IMAP_HOLD_FP_LOOK_LEFT) then
			state.lookleft = true;
		elseif(func == input.IMAP_HOLD_FP_LOOK_RIGHT) then
			state.lookright = true;
		end
	end
	if(state.lookleft and state.lookright) then
		tutorial.CompleteStep(1);
		return 0;
	end
	return 1; -- keep handler running
end

function OnAtResupply(handler)
	if(handler.state == tutorial.THS_EVENT_IN) then
		tutorial.RemoveWaypoint("resupply");
		fp.fpFPSControlBlockSet(fp.CB_MOVE);
		tutorial.CompleteStep(1);
		return 0;
	end
	return 1;
end

-- function OnCheckATP(handler)
--	if(state.ran and player.playerGetPlayer():GetEnergy() < .7) then
--		tutorial.CompleteStep();
--		return 0;
--	end
--	return 1; -- keep handler running
-- end

----------------- goal 2: learn infantry stances ---------------------

function OnGoalLearnStances(step)
	if(step == 1) then							-- step 1: crouch down
		fp.fpFPSControlBlockClear(fp.CB_POSE);
		tutorial.AddHandler(tutorial.TUT_EVENT_FPS_POSE, "OnCrouchDown");
	elseif(step == 2) then						-- step 2: move while crouched
		fp.fpFPSControlBlockClear(fp.CB_MOVE);
		tutorial.AddHandler(tutorial.TUT_EVENT_INPUT, "OnCrouchMove");
	elseif(step == 3) then						-- step 3: lay down
		tutorial.AddHandler(tutorial.TUT_EVENT_FPS_POSE, "OnLayDown");
		fp.fpFPSControlBlockClear(fp.CB_POSE);
	elseif(step == 4) then						-- step 4: crawl around
		tutorial.AddHandler(tutorial.TUT_EVENT_INPUT, "OnCrawlAround");
	elseif(step == 5) then						-- step 5: sprint from prone
		tutorial.AddHandler(tutorial.TUT_EVENT_INPUT, "OnProneSprint");
		fp.fpFPSControlBlockClear(fp.CB_POSE);
		state.pronesprinted = false;
		state.sprinted = false;
		state.forward = false;
	elseif(step == 6) then						-- step 7: tutorial complete
		fp.fpFPSControlBlockClear(fp.CB_POSE);
		fp.fpFPSInput(input.IMAP_HOLD_FP_PRONE); -- stand them up
		tutorial.SetUpdate("OnGoalLearnMSP");
		tutorial.CompleteGoal();
	end
end

function OnCrouchDown(handler, pose)
	if(pose == fp.POSE_CROUCH) then
		fp.fpFPSControlBlockSet(fp.CB_POSE);
		tutorial.CompleteStep(1);
		return 0;
	end
	return 1; -- keep handler running
end

function OnCrouchMove(handler, func, param)
	if(fp.fpFPSGetPlayerPose() == fp.POSE_CROUCH) then 
		if(param > 0 and func >= input.IMAP_HOLD_FP_FORWARD and func <= input.IMAP_HOLD_FP_STRAFE_LEFT) then
			state.crouchmoved = true;
		end
	end
	
	if(state.crouchmoved) then
		tutorial.CompleteStep(1);
		return 0;
	end
	
	return 1; -- keep handler running
end

function OnLayDown(handler, pose)
	if(pose == fp.POSE_PRONE) then
		fp.fpFPSControlBlockSet(fp.CB_POSE);
		tutorial.CompleteStep(1);
		return 0;
	end
	return 1; -- keep handler running
end

function OnCrawlAround(handler, func, param)
	if(fp.fpFPSGetPlayerPose() == fp.POSE_PRONE) then 
		if(param > 0 and func >= input.IMAP_HOLD_FP_FORWARD and func <= input.IMAP_HOLD_FP_STRAFE_LEFT) then
			state.crawled = true;
		end
	end
	
	if(state.crawled) then
		tutorial.CompleteStep(1);
		return 0;
	end
	
	return 1; -- keep handler running
end

function OnProneSprint(handler, func, param)
	if(param ~= 0) then
		if(func == input.IMAP_HOLD_FP_SPRINT) then
			state.sprinted = true;
		elseif(func == input.IMAP_HOLD_FP_FORWARD) then
			state.forward = true;
		end
	elseif(state.sprinted and state.forward) then
		if(func == input.IMAP_HOLD_FP_SPRINT or func == input.IMAP_HOLD_FP_FORWARD) then
			state.pronesprinted = true;
		end
	end
	if(state.pronesprinted) then
		tutorial.CompleteStep(1);
		return 0;
	end
	return 1; -- keep handler running
end

----------------- goal 3: learn MSP ---------------------

function OnGoalLearnMSP(step)
	if(step == 1) then
		tutorial.AddLocation("OnAtUMS", nil, -314061.23, 3603755.46, 101.34, 5, "ums");
	elseif(step == 2) then
		SetNextStep(1);
	elseif(step == 3) then
		SetNextStep(1);
	elseif(step == 4) then
		tutorial.Complete();
	end
end

function OnAtUMS(handler)
	if(handler.state == tutorial.THS_EVENT_IN) then
		tutorial.RemoveWaypoint("ums");
		tutorial.CompleteStep(1);
		return 0;
	end
	return 1;
end



-- ui and tutorial libs already loaded by tutorial manager
-- imported additional game libs as needed
Include("fp");
Include("strat");
Include("input");
Include("vehicle");
-- Include("terrain");

-- keep tutorial state here
local state = {
	name		= "fpstest",										-- should be unique
	vehicle 	= vehicle.vehTypeGetById("de-lmg"),					-- vehicle to use; nil = don't spawn
	spawnat		= strat.FindStrat("Spontin","Spontin Armybase"),	-- nil = default
	offlineok	= true,												-- online only tutorial
	showui		= true,												-- nil = default
	customui	= nil, 												-- nil = default
};

----------------- start/stop handlers ---------------------

-- called when this tutorial is first started
function OnStart(handler)
	if(not tutorial.Start(state)) then
		tutorial.ShowError("error.badvehicle");
	end
end

-- call after you enter the world
function OnSpawn(handler)
	tutorial.ShowUI();
	-- tutorial.ShowOK("welcome");
	tutorial.SetUpdate("OnGoalGetToTraining");
end

-- called after getting back to the UI
function OnDespawn(handler)
	tutorial.ShowOK("done");
	tutorial.Stop();
end

-- called whent tutorial is finished
function OnStop(handler)
	tutorial.HideUI(true);
end

function OnComplete(ok)
	tutorial.Despawn();
end

----------------- goal 1: get to the training area ---------------------

function OnGoalGetToTraining(step)
	if(step == 1) then 							-- step 1: leave the barracks
		tutorial.AddHandler(tutorial.TUT_EVENT_LEAVE, "OnLeaveBarracks");
	elseif(step == 2) then						-- step 2: head to garages
		tutorial.AddLocationHandler("OnNearGarages", nil, -314295.50, 3603547.81, 100, 20);
	elseif(step == 3) then						-- step 3: goal complete
		-- tutorial.AddUIAlert("closeenuf");
		tutorial.SetUpdate("OnGoalLearnStances");
		tutorial.CompleteGoal();
	end
end

-- handler for when we leave the barracks
function OnLeaveBarracks(handler, building)
	state.leftbarracks = true;
	tutorial.CompleteStep();
end

-- handler for when we get near the garages
function OnNearGarages(handler, inrange)
	if(not inrange) then return 1 end
	state.neargarage = true;
	tutorial.CompleteStep();
end

----------------- goal 2: learn infantry poses ---------------------

function OnGoalLearnStances(step)
	if(step == 1) then							-- step 1: go prone
		tutorial.AddHandler(tutorial.TUT_EVENT_FPS_POSE, "OnPosed");
		state.pose = fp.POSE_PRONE;
	elseif(step == 2) then						-- step 2: kneel
		state.pose = fp.POSE_CROUCH;
	elseif(step == 3) then						-- step 3: stand
		state.pose = fp.POSE_STAND;
	elseif(step == 4) then						-- step 4: experiment
		tutorial.RemoveHandler("OnPosed");
		tutorial.CompleteStep(10);
	else										-- step 5: goal complete
		tutorial.SetUpdate("OnGoalLearnMovement");
		tutorial.CompleteGoal();
	end
end

function OnPosed(handler, pose)
	if(pose == state.pose) then tutorial.CompleteStep() end
	return 1; -- keep handler running
end

----------------- goal 3: learn infantry movement ---------------------

function OnGoalLearnMovement(step)
	if(step == 1) then							-- step 1: move forward/backward
		tutorial.AddHandler(tutorial.TUT_EVENT_INPUT, "OnForwardBackward");
	elseif(step == 2) then						-- step 2: strafe left/right
		tutorial.AddHandler(tutorial.TUT_EVENT_INPUT, "OnStrafeLeftRight");
	elseif(step == 3) then						-- step 3: crouch move
		tutorial.AddHandler(tutorial.TUT_EVENT_INPUT, "OnCrouchMove");
	elseif(step == 4) then						-- step 4: crawl
		tutorial.AddHandler(tutorial.TUT_EVENT_INPUT, "OnCrawl");
	elseif(step == 5) then						-- step 5: run
		state.ran = 0;
		tutorial.AddHandler(tutorial.TUT_EVENT_INPUT, "OnRun");
	else		
		tutorial.SetUpdate(nil);				-- don't update anything
		tutorial.CompleteGoal(); 				-- step 6: goal complete
		tutorial.ShowOK("complete", "OnComplete");
	end
end

function OnForwardBackward(handler, func, param)
	if(param > 0) then
		if(func == input.IMAP_HOLD_FP_FORWARD) then
			state.forward = true;
		elseif(func == input.IMAP_HOLD_FP_BACKWARD) then
			state.backward = true;
		end
	end
	
	if(state.forward and state.backward) then
		tutorial.CompleteStep(1);
		return 0;
	end
	
	return 1; -- keep handler running
end

function OnStrafeLeftRight(handler, func, param)
	if(param > 0) then
		if(func == input.IMAP_HOLD_FP_STRAFE_LEFT) then
			state.left = true;
		elseif(func == input.IMAP_HOLD_FP_STRAFE_RIGHT) then
			state.right = true;
		end
	end
	
	if(state.left and state.right) then
		tutorial.CompleteStep(1);
		return 0;
	end
	
	return 1; -- keep handler running
end

function OnCrouchMove(handler, func, param)
	if(param > 0 and fp.fpFPSGetPlayerPose() == fp.POSE_CROUCH) then 
		if(func >= input.IMAP_HOLD_FP_FORWARD and func <= input.IMAP_HOLD_FP_STRAFE_LEFT) then
			state.crouchmoved = true;
		end
	end
	
	if(state.crouchmoved) then
		-- tutorial.AddUIAlert("crouchmoved");
		tutorial.CompleteStep(1);
		return 0;
	end
	
	return 1; -- keep handler running
end

function OnCrawl(handler, func, param)
	if(param > 0 and fp.fpFPSGetPlayerPose() == fp.POSE_PRONE) then 
		if(func >= input.IMAP_HOLD_FP_FORWARD and func <= input.IMAP_HOLD_FP_STRAFE_LEFT) then
			state.crawled = true;
		end
	end
	
	if(state.crawled) then
		-- tutorial.AddUIAlert("crawled");
		tutorial.CompleteStep(1);
		return 0;
	end
	
	return 1; -- keep handler running
end

function OnRun(handler, func, param)
	if(func == input.IMAP_HOLD_FP_SPRINT) then
		if(param == 1) then
			state.runstart = game.Frametime();
		else
			state.ran = state.ran + (game.Frametime() - state.runstart);
		end
	end
	
	if(state.ran >= 5000) then
		tutorial.CompleteStep();
		return 0;
	end
	
	return 1; -- keep handler running
end


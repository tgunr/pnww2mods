
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
	spawnat		= nil,												-- nil = default
	ui			= nil, 												-- nil = default
	onupdate	= "OnGoalLearnStances",								-- nil = dont start updating
	prereq		= {"fpstest","dev2"}								-- tutorial prerequisites
};

-- set our initial tutorial state
tutorial.SetState(state);

----------------- default handler overrides ---------------------

function OnSpawn(handler)
	tutorial.OnSpawn(handler);
	tutorial.CompleteGoal();
end

function OnComplete(ok)
	tutorial.Despawn(5);
end

-- goal is bypasses so I could use goal two's steps

----------------- goal 2: learn infantry poses ---------------------

function OnGoalLearnStances(step)
	if(step == 1) then							-- step 1: go prone
		tutorial.AddHandler(tutorial.TUT_EVENT_FPS_POSE, "OnPosed");
		state.pose = fp.POSE_PRONE;
		ui.ChatPrint("Setting up 1");
	elseif(step == 2) then						-- step 2: kneel
		state.pose = fp.POSE_CROUCH;
		ui.ChatPrint("Setting up 2");
	elseif(step == 3) then						-- step 3: stand
		state.pose = fp.POSE_STAND;
		ui.ChatPrint("Setting up 3");
	elseif(step == 4) then						-- step 4: experiment
		tutorial.RemoveHandler("OnPosed");
		tutorial.CompleteStep(5);
		ui.ChatPrint("Setting up 4; completing 5 seconds");
	else										-- step 5: goal complete
		ui.ChatPrint("Setting up 5");
		ui.ChatPrint("Completing goal");
		tutorial.SetUpdate(nil);
		tutorial.CompleteGoal();
		tutorial.ShowOK("complete", "OnComplete");
	end
end

function OnPosed(handler, pose)
	if(pose == state.pose) then
		tutorial.CompleteStep();
	end
	return 1; -- keep handler running
end



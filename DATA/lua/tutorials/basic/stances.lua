
-- ui and tutorial libs already loaded by tutorial manager
-- imported additional game libs as needed
Include("fp");

-- keep tutorial state here
local state = {
	name					= "basic.stances",									-- should be unique
	ui						= nil, 												-- nil = default;
	spawn 					= {													-- nil means don't auto spawn
		spec 				= vehicle.vehSpecByID("derifle"),					-- default vehicle to spawn
		position			= {
			x			= -314138.53,
			y			= 3603516.75,
			z			= 100.00
		},
		requires			= {													-- spawn requirement
			wCountry 	= vehicle.VEH_ANY,										-- country
			wCategory 	= vehicle.VEH_CATEGORY_INFANTRY,						-- category
			wClass 		= vehicle.VEH_CLASS_TROOP,								-- class
			wType 		= vehicle.VEH_ANY										-- type
		}
	},
	onupdate				= "OnGoalLearnStances"								-- nil = dont start updating
};

-- set our initial tutorial state
tutorial.SetState(state);

----------------- goal 1: learn infantry stances ---------------------

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
		tutorial.Complete();
	end
end

function OnPosed(handler, pose)
	if(pose == state.pose) then
		tutorial.CompleteStep()
	end
	return 1; -- keep handler running
end


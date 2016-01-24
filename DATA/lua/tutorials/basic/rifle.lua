
-- ui and tutorial libs already loaded by tutorial manager
-- imported additional game libs as needed
Include("input");
Include("terrain");
Include("player");
Include("ob");

-- keep tutorial state here
local state = {
	name					= "basic.rifle",									-- should be unique
	ui						= nil, 												-- nil = default;
	spawn 					= {													-- nil means don't auto spawn
		spec 				= vehicle.vehSpecByID("derifle"),					-- default vehicle to spawn
		position			= {
			x 			= -314155,
			y			= 3603507,
			z			= 100
		},
		requires			= {													-- spawn requirement
			wCountry 	= vehicle.VEH_ANY,										-- country
			wCategory 	= vehicle.VEH_CATEGORY_INFANTRY,						-- category
			wClass 		= vehicle.VEH_CLASS_TROOP,								-- class
			wType 		= vehicle.VEH_ANY										-- type
		},
		block				= {
			fp.CB_FIRE,
			fp.CB_SELECT
		}
	},
	onupdate				= "OnGoalLearnRifle"								-- nil = dont start updating
};

-- set our initial tutorial state
tutorial.SetState(state);

----------------- goal 1: learn infantry movement ---------------------

function OnGoalLearnRifle(step)
	if(step == 1) then							-- step 1: move to gun range
		tutorial.AddLocation("OnAtGunrange", nil, -314121.25, 3603508.70, 100, 2, "gunrange");
	elseif(step == 2) then -- step 2: go outside
		tutorial.RemoveWaypoint("gunrange");
		fp.fpFPSControlBlockClear(fp.CB_FIRE);
		tutorial.AddHandler(tutorial.TUT_EVENT_INPUT, "OnFireRifle");
	elseif(step == 3) then						-- step 3: look left and right
		tutorial.AddHandler(tutorial.TUT_EVENT_INPUT, "OnReloadRifle");
	elseif(step == 4) then						-- step 4: run until tired
		state.hit = 0;
		tutorial.AddHandler(tutorial.TUT_EVENT_INPUT, "OnAimRifle");
		tutorial.AddHandler(tutorial.TUT_EVENT_HIT, "OnHitTarget");
	elseif(step == 5) then						-- step 5: next goal
		tutorial.Complete();
	end
end

function OnAtGunrange(handler)
	if(handler.state == tutorial.THS_EVENT_IN) then
		tutorial.CompleteStep();
		return 0;
	end
	return 1;
end

function OnFireRifle(handler, func, param)
	if(param > 0 and func == input.IMAP_HOLD_FP_FIRE) then
		tutorial.CompleteStep();
		return 0;
	end
	return 1; -- keep handler running
end

function OnReloadRifle(handler, func, param)
	if(param > 0 and func == input.IMAP_HOLD_FP_RELOAD) then
		tutorial.CompleteStep(1);
		return 0;
	end
	return 1; -- keep handler running
end

function OnAimRifle(handler, func, param)
	if(func == input.IMAP_HOLD_FP_GUNSIGHT) then
		state.aiming = (param > 0) and true or false;
	end
	return 1; -- keep handler running
end

function OnHitTarget(handler, to, co, x, y, z)
	if(state.aiming and co ~= nil and co.name == "o294") then
		state.hit = state.hit + 1;
		if(state.hit < 3) then
			tutorial.CallJS("TutAddLocAlert", "1.4.shot" .. state.hit, "true");
		elseif(state.hit >= 3) then
			tutorial.RemoveHandler("OnAimRifle");
			tutorial.CompleteStep();
			return 0;
		end
	end
	return 1; -- keep handler running
end


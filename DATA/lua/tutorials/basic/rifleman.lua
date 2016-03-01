
-- ui and tutorial libs already loaded by tutorial manager
-- imported additional game libs as needed
Include("input");
Include("terrain");
Include("player");
Include("ob");
Include("state");

-- setup tutorial state here
state.name 		= "basic.rifleman";
state.block 	= { fp.CB_FIRE, fp.CB_SELECT };
state.onupdate	= "OnGoalLearnRifle";

-- set our initial tutorial state
tutorial.SetState(state);

----------------- goal 1: learn the rifle ---------------------

function OnGoalLearnRifle(step)
	if(step == 1) then							-- step 1: move to gun range
		Setup();
		local chance = math.random(100);
		if(chance < 20) then
			tutorial.AddLocation("OnAtGunrange", nil, -314010, 3603722, 103, 2, "gunrange");
		elseif(chance < 40) then
			tutorial.AddLocation("OnAtGunrange", nil, -314025, 3603721, 103, 2, "gunrange");
		elseif(chance < 60) then
			tutorial.AddLocation("OnAtGunrange", nil, -314039, 3603722, 103, 2, "gunrange");
		elseif(chance < 80) then
			tutorial.AddLocation("OnAtGunrange", nil, -314053, 3603722, 103, 2, "gunrange");
		else
			tutorial.AddLocation("OnAtGunrange", nil, -314068, 3603722, 103, 2, "gunrange");
		end
	elseif(step == 2) then 						-- step 2: go outside
		fp.fpFPSControlBlockClear(fp.CB_FIRE);
		SetInput(2, input.IMAP_HOLD_FP_FIRE);
	elseif(step == 3) then						-- step 3: look left and right
		SetInput(2, input.IMAP_HOLD_FP_RELOAD);
	elseif(step == 4) then						-- step 4: run until tired
		state.hit = 0;
		tutorial.RemoveHandler("OnHitTargets");
		tutorial.AddHandler(tutorial.TUT_EVENT_INPUT, "OnAimRifle");
		tutorial.AddHandler(tutorial.TUT_EVENT_HIT, "OnHitTarget");
	elseif(step == 5) then						-- step 5: next goal
		state.hit = 0;
		SetNextStep(1);
	elseif(step == 6) then						-- step 5: next goal
		tutorial.SetUpdate("OnGoalLearnLoadout");
		tutorial.CompleteGoal();
	end
end

function OnAtGunrange(handler)
	if(handler.state == tutorial.THS_EVENT_IN) then
		tutorial.RemoveWaypoint("gunrange");
		tutorial.CompleteStep(1);
		return 0;
	end
	return 1;
end

function OnAimRifle(handler, func, param)
	if(func == input.IMAP_HOLD_FP_GUNSIGHT) then
		state.aiming = (param > 0) and true or false;
	end
	return 1; -- keep handler running
end

function OnHitTarget(handler, to, co, x, y, z)
	if(state.aiming) then
		OnHitTargets(handler, to, co, x, y, z);
	end
	if(state.hit >= 3) then
		tutorial.AddHandler(tutorial.TUT_EVENT_HIT, "OnHitTargets");
		tutorial.RemoveHandler("OnAimRifle");
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

----------------- goal 2: learn your loadout ---------------------

function OnGoalLearnLoadout(step)
	if(step == 1) then
		fp.fpFPSControlBlockClear(fp.CB_SELECT);
		SetInput(1, input.IMAP_HOLD_FP_WEAPON_2);
	elseif(step == 2) then
		SetInput(1, input.IMAP_HOLD_FP_WEAPON_3);
	elseif(step == 3) then
		SetInput(1, input.IMAP_HOLD_FP_WEAPON_4);
	elseif(step == 4) then
		SetInput(1, input.IMAP_HOLD_FP_WEAPON_5);
	elseif(step == 5) then
		tutorial.SetUpdate("OnGoalLearnGrenades");
		tutorial.CompleteGoal();
	end
end

----------------- goal 3: learn grenades ---------------------

function OnGoalLearnGrenades(step)
	if(step == 1) then
		fp.fpFPSControlBlockClear(fp.CB_FIRE);
		SetInput(1, input.IMAP_HOLD_FP_WEAPON_3);
	elseif(step == 2) then
		fp.fpFPSControlBlockSet(fp.CB_SELECT);
		SetInput(12, input.IMAP_HOLD_FP_FIRE);
	elseif(step == 3) then
		fp.fpFPSControlBlockClear(fp.CB_SELECT);
		SetInput(1, input.IMAP_HOLD_FP_WEAPON_2);
	elseif(step == 4) then
		fp.fpFPSControlBlockSet(fp.CB_SELECT);
		SetInput(12, input.IMAP_HOLD_FP_FIRE);
	elseif(step == 5) then
		tutorial.SetUpdate("OnGoalLearnKnife");
		tutorial.CompleteGoal();
	end
end

----------------- goal 4: learn knife ---------------------

function OnGoalLearnKnife(step)
	if(step == 1) then
		fp.fpFPSControlBlockClear(fp.CB_SELECT);
		SetInput(1, input.IMAP_HOLD_FP_WEAPON_4);
	elseif(step == 2) then
		fp.fpFPSControlBlockSet(fp.CB_SELECT);
		SetInput(2, input.IMAP_HOLD_FP_FIRE);
	elseif(step == 3) then
		tutorial.SetUpdate("OnGoalAmmoPack");
		tutorial.CompleteGoal();
	end
end

----------------- goal 5: learn ammo pack ---------------------

function OnGoalAmmoPack(step)
	if(step == 1) then
		fp.fpFPSControlBlockClear(fp.CB_SELECT);
		SetInput(1, input.IMAP_HOLD_FP_WEAPON_5);
	elseif(step == 2) then
		fp.fpFPSControlBlockSet(fp.CB_SELECT);
		SetInput(2, input.IMAP_HOLD_FP_FIRE);
	elseif(step == 3) then
		SetNextStep(1);
	elseif(step == 4) then
		tutorial.Complete();
	end
end

----------------- helper functions ---------------------

function OnNearResupply(handler)
	if(handler.state == tutorial.THS_EVENT_IN) then
		state.resupply = true;
	elseif(handler.state == tutorial.THS_EVENT_OUT) then
		state.resupply = false;
	end
	return 1;
end

function DoResupply(handler)
	if(state.resupply == true) then
		fp.fpFPSResupplySelf("truck");
	end
	return 1;
end

function Setup()
	state.hit = 0;
	tutorial.AddHandler(tutorial.TUT_EVENT_HIT, "OnHitTargets");
	tutorial.AddLocation("OnNearResupply", "resupply1", -314005.96, 3603739.35, 101.01, 5);
	tutorial.AddLocation("OnNearResupply", "resupply2", -314108.67, 3603735.05, 101.77, 5);
	tutorial.AddTimer("DoResupply", nil, 2);
end


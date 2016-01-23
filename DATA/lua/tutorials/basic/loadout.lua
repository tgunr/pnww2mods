
-- ui and tutorial libs already loaded by tutorial manager
-- imported additional game libs as needed
Include("input");
Include("state");

-- setup tutorial state here
state.name 		= "basic.loadout";
state.onupdate	= "OnGoalLearnWeapons";

-- set our initial tutorial state
tutorial.SetState(state);

----------------- goal 1: learn weapons ---------------------

function OnGoalLearnWeapons(step)
	if(step == 1) then
		tutorial.AddHandler(tutorial.TUT_EVENT_INPUT, "OnInput");
		fp.fpFPSInput(input.IMAP_HOLD_FP_WEAPON_1); -- select the rifle
		fp.fpFPSInput(input.IMAP_HOLD_FP_RELAXED); -- lower it
		SetInput(1, input.IMAP_HOLD_FP_RELAXED);
	elseif(step == 2) then
		SetInput(1, input.IMAP_HOLD_FP_FIRE);
	elseif(step == 3) then
		SetInput(1, input.IMAP_HOLD_FP_WEAPON_2);
	elseif(step == 4) then
		SetInput(2, input.IMAP_HOLD_FP_FIRE);
	elseif(step == 5) then
		SetInput(1, input.IMAP_HOLD_FP_WEAPON_3);
	elseif(step == 6) then
		SetInput(20, input.IMAP_HOLD_FP_FIRE);
	elseif(step == 7) then
		SetInput(1, input.IMAP_HOLD_FP_WEAPON_4);
	elseif(step == 8) then
		SetInput(1, input.IMAP_HOLD_FP_FIRE);
	elseif(step == 9) then
		tutorial.SetUpdate("OnGoalLearnItems");
		tutorial.CompleteGoal();
	end
end

----------------- goal 2: learn non-combat gear ---------------------

function OnGoalLearnItems(step)
	if(step == 1) then
		SetInput(1, input.IMAP_HOLD_FP_WEAPON_5);
	elseif(step == 2) then
		SetInput(1, input.IMAP_HOLD_FP_FIRE);
	elseif(step == 3) then
		SetInput(2, input.IMAP_HOLD_FP_WEAPON_10);
	elseif(step == 4) then
		SetInput(5, input.IMAP_HOLD_FP_FORWARD, input.IMAP_HOLD_FP_STRAFE_RIGHT);
	elseif(step == 5 or step == 6) then
		SetInput(1, input.IMAP_MOM_SHOW_IN_GAME_MAP);
	elseif(step == 7) then
		tutorial.Complete();
	end
end

function SetInput(delay, inlo, inhi)
	--fp.fpFPSControlBlockSet(fp.CB_ALL);
	state.delay = delay;
	state.inlo = inlo;
	state.inhi = (inhi ~= nil) and inhi or inlo;
end

function OnInput(handler, func, param)
	if(param > 0 and func >= state.inlo and func <= state.inhi) then
		tutorial.CompleteStep(state.delay);
		SetInput(0, -1);
		--fp.fpFPSControlBlockClear(fp.CB_ALL);
	end
	return 1; -- keep handler running
end



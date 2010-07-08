
state.spawn.spec 			= vehicle.vehSpecByID("h39");
state.spawn.vspawn			= {{3, 2, 4, 5, -314306, 3603794, 102, 0, false, 3}}

----------------- goal 1: learn the rifle ---------------------

function OnGoalIntro(step)
	if(step == 1) then
		SetNextStep(1);
		--tutorial.AddTimer("OnTurret", nil, 1);
	elseif(step == 2) then
		tutorial.CompleteGoal();
		tutorial.SetUpdate("OnGoalLearnDriver");
	end
end

function OnGoalLearnDriver(step)
	if(step == 1) then
		SetInput(2, input.IMAP_TMP_GUNSIGHT_VIEW); -- close
	elseif(step == 2) then
		SetInput(2, input.IMAP_MOM_CANOPYCONTROL); -- open
	elseif(step == 3) then
		SetInput(2, input.IMAP_TMP_INSTRUMENT_VIEW); -- instruments
	elseif(step == 4) then
		SetInput(2, input.IMAP_SHOW_STATS);
	elseif(step == 5) then
		SetInput(2, input.IMAP_MOM_STARTER_ON);
	elseif(step == 6) then
		SetInput(2, input.IMAP_MOM_SHIFTUP);
	elseif(step == 7) then
		tutorial.SetUpdate("OnGoalFiringPosition");
		tutorial.CompleteGoal();
	end
end

function OnGoalFiringPosition(step)
	if(step == 1) then
		SetNextWaypoint("move", "OnWaypoint");
	elseif(step == 2) then
		SetNextWaypoint("turn1", "OnWaypoint");
	elseif(step == 3) then
		SetNextWaypoint("offroad", "OnWaypoint");
	elseif(step == 4) then
		SetNextWaypoint("setup", "OnWaypoint");
	elseif(step == 5) then
		SetNextStep(1);
	elseif(step == 6) then
		tutorial.AddArea("OnAtFirePosition", nil, -314334, 3603798, 95, -314256, 3603791, 110);
	elseif(step == 7) then
		tutorial.CompleteGoal();
		tutorial.SetUpdate("OnGoalCommander");
	end
end

function OnGoalCommander(step)
	if(step == 1) then
		SetInput(2, input.IMAP_MOM_STARTER_ON);
	elseif(step == 2) then
		SetInput(2, input.IMAP_MOM_POSITION_2);
	elseif(step == 3) then
		SetInput(2, input.IMAP_MOM_CANOPYCONTROL);
	elseif(step == 4) then
		SetInput(2, input.IMAP_TMP_GUNSIGHT_VIEW);
	elseif(step == 5) then
		AddWaypoint("gunrange");
		tutorial.AddHandler(tutorial.TUT_EVENT_INPUT, "OnMoveTurret");
		tutorial.AddTimer("DoTurret", nil, 2);
		SetTurret(1, -10, 10);
	elseif(step == 6) then
		tutorial.RemoveWaypoint("gunrange");
		tutorial.CompleteGoal();
		tutorial.SetUpdate("OnGoalGunner");
	end
end

function OnGoalGunner(step)
	if(step == 1) then
		SetInput(2, input.IMAP_MOM_POSITION_3);
	elseif(step == 2) then
		SetInput(2, input.IMAP_TMP_GUNSIGHT_VIEW);
	elseif(step == 3) then
		SetInput(2, input.IMAP_ASX_TURRET_TRAVERSE);
	elseif(step == 4) then
		SetInput(2, input.IMAP_HOLD_MAINTRIGGER);
	elseif(step == 5) then
		SetInput(2, input.IMAP_HOLD_SECONDTRIGGER);
	elseif(step == 6) then
		SetTurret(2, -180, 180);
	elseif(step == 7) then
		tutorial.CompleteGoal();
		tutorial.SetUpdate("OnGoalSight");
	end
end

function OnGoalSight(step)
	if(step == 1) then
		SetBerm(-314334, 3604022);
		tutorial.AddHandler(tutorial.TUT_EVENT_HIT, "OnHitBerms");
	elseif(step == 2) then
		SetBerm(-314291, 3604272);
	elseif(step == 3) then
		SetBerm(-314250, 3604772, -314214, 3604772);
	elseif(step == 4) then
		tutorial.RemoveHandler("OnHitBerms");
		SetInput(2, input.IMAP_TMP_CYCLE_AMMO);
	elseif(step == 5) then
		SetInput(2, input.IMAP_MOM_POSITION_1);
	elseif(step == 6) then
		tutorial.CompleteGoal();
		tutorial.SetUpdate("OnGoalHome");
	end
end

function OnGoalHome(step)
	if(step == 1) then
		SetInput(2, input.IMAP_MOM_STARTER_ON);
	elseif(step == 2) then
		SetInput(2, input.IMAP_MOM_REVERSE);
	elseif(step == 3) then
		SetInput(2, input.IMAP_MOM_SHIFTUP);
	elseif(step == 4) then
		SetInput(2, input.IMAP_MOM_REVERSE);
	elseif(step == 5) then
		SetNextWaypoint("turn3", "OnChainedWaypoint");
	elseif(step == 6) then
		tutorial.CompleteGoal();
		tutorial.SetUpdate("OnTutorialCompleted");
	end
end

function OnTutorialCompleted(step)
	if(step == 1) then
		SetNextStep(1);
	elseif(step == 2) then
		tutorial.Complete();
	end
end


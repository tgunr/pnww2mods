
-- ui and tutorial libs already loaded by tutorial manager
-- imported additional game libs as needed
Include("input");
Include("terrain");
Include("player");
Include("ob");
Include("state");

-- setup tutorial state here
state.name 		= "infantry.grenadier";
state.onupdate	= "OnGoalLearnBasics";
state.spawn.requires.wType = 7; -- grenadier
state.enablemap	= true;

state.vtargets = 
{
	{-313885, 3603728, 100, "truckhit"},
	{-313889, 3603704, 100, "carhit"},
	{-313877, 3603712, 100, "tankhit"}
};

-- set our initial tutorial state
tutorial.SetState(state);

function OnGoalLearnBasics(step)
	if(step == 1) then
		SetNextStep(1);
		tutorial.AddHandler(tutorial.TUT_EVENT_HIT, "OnHitTargets");
	elseif(step == 2) then
		SetNextStep(1);
	elseif(step == 3) then
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
	elseif(step == 4) then
		SetInput(2, input.IMAP_HOLD_FP_DEPLOY);
	elseif(step == 5) then
		SetInput(2, input.IMAP_HOLD_FP_RELOAD);
	elseif(step == 6) then
		SetNextStep(1);
	elseif(step == 7) then
		SetInput(2, input.IMAP_HOLD_FP_FIRE);
--	elseif(step == 8) then
--		SetInput(2, input.IMAP_HOLD_FP_DEPLOY);
	elseif(step == 8) then
		SetNextStep(1);
	elseif(step == 9) then
		tutorial.SetUpdate("OnGoalLearnAdvanced");
		tutorial.CompleteGoal();
	end
end

function OnGoalLearnAdvanced(step)
	if(step == 1) then
		state.waypoint = "vehiclerange";
		tutorial.AddLocation("OnAtPosition", nil, -313969.8, 3603763.9, 102, 2, state.waypoint);
	elseif(step == 2) then
		SetNextStep(1);
	elseif(step == 3) then
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

function OnHitTargets(handler, to, co, x, y, z)
	if(not IsVehicleHit(x, y, z)) then
		if(co.name == "o86") then
			tutorial.CallJS("TutAddLocMessage", "20mhit", "true");
		elseif(co.name == "o97") then
			tutorial.CallJS("TutAddLocMessage", "50mhit", "true");
		elseif(co.name == "o98") then
			tutorial.CallJS("TutAddLocMessage", "100mhit", "true");
		elseif(co.name == "o99") then
			tutorial.CallJS("TutAddLocMessage", "200mhit", "true");
		elseif(co.name == "o100") then
			tutorial.CallJS("TutAddLocMessage", "500mhit", "true");
		end
	end
	return 1; -- keep handler running
end

function IsVehicleHit(x, y, z)
	local radiusCheck = 8; -- adjust this (in meters)
	for i,v in ipairs(tutorial.state.vtargets) do
		if(CheckDistance(v[1], v[2], v[3], x, y, z, radiusCheck)) then
			tutorial.CallJS("TutAddLocMessage", v[4], "true");
			return true;
		end
	end
	
	return false;
end

function CheckDistance(tx, ty, tz, px, py, pz, d)
	local x 		= tx - px;
	local y 		= ty - py;
	local z 		= tz - pz;
	local distance 	= math.sqrt(x*x + y*y + z*z);
	
	if(distance < d) then
		return true;
	end
	
	return false;
end


-- ui and tutorial libs already loaded by tutorial manager
-- imported additional game libs as needed
Include("input");
Include("terrain");
Include("player");
Include("ob");
Include("state");

-- setup tutorial state here
state.name 		= "infantry.mortar";
state.onupdate	= "OnGoalLearnMortar";
state.spawn.requires.wType = 13;
state.hit	= 0;
state.enablemap	= true;

state.vtargets = 
{
	{-313885, 3603728, 100, "truckhit"},
	{-313889, 3603704, 100, "carhit"},
	{-313877, 3603712, 100, "tankhit"},
	{-313611, 3603680, 100, "truckhit"},
	{-313638, 3603700, 100, "carhit"},
	{-313613, 3603714, 100, "tankhit"},
	{-313758, 3603631, 100, "truckhit"},
	{-313774, 3603604, 100, "carhit"},
	{-313753, 3603608, 100, "tankhit"}
};

-- set our initial tutorial state
tutorial.SetState(state);

function OnGoalLearnMortar(step)
	if(step == 1) then
		SetNextStep{1};
		tutorial.AddHandler(tutorial.TUT_EVENT_HIT, "OnHitTargets");
	elseif(step == 2) then
		state.waypoint = "vehiclerange";
			tutorial.AddLocation("OnAtPosition", nil, -313976, 3603750, 102, 3, state.waypoint);

	elseif(step == 3) then
		SetInput(2, input.IMAP_HOLD_FP_PRONE);
	elseif(step == 4) then
		SetInput(2, input.IMAP_HOLD_FP_DEPLOY);
	elseif(step == 5) then
		SetInput(2, input.IMAP_MOM_SHOW_IN_GAME_MAP);
	elseif(step == 6) then
		SetNextStep{1};
	elseif(step == 7) then
		SetInput(2, input.IMAP_HOLD_FP_FIRE);
	elseif(step == 8) then
		SetInput(2, input.IMAP_HOLD_FP_WEAPON_2);
	elseif(step == 9) then
		SetNextStep{1};
	elseif(step == 10) then
		SetNextStep{1};
	elseif(step == 11) then
		tutorial.Complete();
	end
end

function OnHitTargets(handler, to, co, x, y, z)
  if(co.name == "o86") then
    state.hit = state.hit + 1;
    tutorial.CallJS("TutAddLocMessage", "20mhit", "true");
  elseif(co.name == "o97") then
    state.hit = state.hit + 1;
    tutorial.CallJS("TutAddLocMessage", "50mhit", "true");
  elseif(co.name == "o98") then
    state.hit = state.hit + 1;
    tutorial.CallJS("TutAddLocMessage", "100mhit", "true");
  elseif(co.name == "o99") then
    state.hit = state.hit + 1;
    tutorial.CallJS("TutAddLocMessage", "200mhit", "true");
  elseif(co.name == "o100") then
    state.hit = state.hit + 1;
    tutorial.CallJS("TutAddLocMessage", "500mhit", "true");
  end
  return 1; -- keep handler running
--  end
end

function OnAtPosition(handler)
	if(handler.state == tutorial.THS_EVENT_IN) then
		tutorial.RemoveWaypoint(state.waypoint);
		tutorial.CompleteStep(1);
		return 0;
	end
	return 1;
end

-- copied below from grenadier
function IsVehicleHit(x, y, z)
	local radiusCheck = 20; -- adjust this (in meters)
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

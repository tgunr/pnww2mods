
-- ui and tutorial libs already loaded by tutorial manager
-- imported additional game libs as needed
Include("strat");
Include("wwii");
Include("input");
Include("map");
Include("state");

-- setup tutorial state here
state.name 		= "basic.map";
state.ui		= "tutmap";
state.onupdate	= "OnGoalLearnMap";

-- set our initial tutorial state
tutorial.SetState(state);

----------------- goal 1: learn map ---------------------

function OnGoalLearnMap(step)
	if(step == 1) then
		--SetUpMap();
		--SetInput(0, input.IMAP_MOM_SHOW_IN_GAME_MAP);
		tutorial.AddTimer("OnMapReady", nil, 1);
		map.uiMapLock(false);
	elseif(step == 2) then
		tutorial.AddHandler(tutorial.TUT_EVENT_MAP, "OnCenterMe");
	elseif(step == 3) then
		tutorial.AddHandler(tutorial.TUT_EVENT_MAP, "OnZoomIn");
	elseif(step == 4) then
		tutorial.AddHandler(tutorial.TUT_EVENT_MAP, "OnZoomOut");
	elseif(step == 5) then
		tutorial.AddHandler(tutorial.TUT_EVENT_MAP, "OnDragMap");
	elseif(step == 6) then
		tutorial.AddTimer("OnFindCity", nil, 2);
	elseif(step == 7) then
		SetMapCP(-1);
		tutorial.CallJS("OnStepComplete");
		tutorial.SetUpdate("OnGoalLearnElements");
		tutorial.CompleteGoal();
	end
end

function OnMapReady(handler)
	local mv = map.FindMap("mapview");
	if(mv ~= nil) then
		SetMapCP(-1);
		SetUpMap();
		map.uiMapLock(true);
		tutorial.CallJS("OnShowMap");
		tutorial.CompleteStep();
		return 0;
	end
	return 1; -- keep handler running
end


function SetMapPos(x, y, s)
	tutorial.ui:CallJS("setMapPos", x, y, s);
	tutorial.ui:CallJS("setMapToSync");
end

function SetMapSelection(cp, fac, jump)
	tutorial.ui:CallJS("setMapSelection", cp, fac, jump);
end

function SetMapCP(to)
	tutorial.ui:CallJS("setMapCP", to);
end

function OnCenterMe(handler, etype)
	if(etype == tutorial.TUT_MAP_CENTERME) then
		tutorial.CompleteStep(1);
		return 0;
	end
	return 1; -- keep handler running
end

function OnZoomOut(handler, etype)
	if(etype == tutorial.TUT_MAP_ZOOMOUT) then
		local map = map.FindMap("mapview");
		if(map:Scale() > 6.5) then
			tutorial.CompleteStep(1);
			return 0;
		end
	end
	return 1; -- keep handler running
end

function OnZoomIn(handler, etype)
	if(etype == tutorial.TUT_MAP_ZOOMIN) then
		local map = map.FindMap("mapview");
		if(map:Scale() < 1) then
			tutorial.CompleteStep(1);
			return 0;
		end
	end
	return 1; -- keep handler running
end

function OnDragMap(handler, etype)
	if(etype == tutorial.TUT_MAP_DRAG) then
		tutorial.CompleteStep(2);
		return 0;
	end
	return 1; -- keep handler running
end

function OnFindCity(handler)
	local map = map.FindMap("mapview");
	if((math.abs(map:PosX() - 234803) + math.abs(map:PosY() - 3015638)) < 200) then
		tutorial.CompleteStep(1);
		return 0;
	end
	return 1; -- keep handler running
end


------------ goal 2: map elements ---------------

function OnGoalLearnElements(step)
	if(step == 1) then
		-- cps
		SetMapCP(-1);
		SetNextStep(1);
	elseif(step == 2) then
		-- facs
		SetNextStep(1);
	elseif(step == 3) then
		tutorial.CallJS("OnStepComplete");
		tutorial.SetUpdate("OnGoalLearnWaypoints");
		tutorial.CompleteGoal();
	end
end

------------ goal 3: map waypoints ---------------

function OnGoalLearnWaypoints(step)
	if(step == 1) then
		tutorial.AddWaypoint("origin", 8, 0, 212435, 3072006, 0, false, "");
		SetNextStep(1);
	elseif(step == 2) then
		tutorial.AddWaypoint("target", 9, 0, 219750, 3073630, 0, false, "");
		SetNextStep(1);
	elseif(step == 3) then
		tutorial.AddHandler(tutorial.TUT_EVENT_MAP, "OnAddReport");
	elseif(step == 4) then
		map.uiMapLock(false);
		SetInput(1, input.IMAP_MOM_SHOW_IN_GAME_MAP);
	elseif(step == 5) then
		tutorial.CallJS("OnHideMap");
		SetNextStep(1);
	elseif(step == 6) then
		tutorial.CallJS("OnStepComplete");
		tutorial.Complete();
	end
end

function OnAddReport(handler, etype)
	if(etype == tutorial.TUT_MAP_REPORT) then
		tutorial.CompleteStep(1);
	end
	return 1; -- keep handler running
end

-------- misc functions

function SetUpMap()
	strat.PwnStrat(wwii.WWII_ENGLAND, "Antwerp");
	strat.PwnStrat(wwii.WWII_FRANCE, "Lier");
	strat.PwnStrat(wwii.WWII_GERMANY, "Schilde");
end

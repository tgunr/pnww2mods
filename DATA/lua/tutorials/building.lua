
-- ui and tutorial libs already loaded by tutorial manager
-- imported additional game libs as needed
Include("strat");
Include("terrain");

-- called when this tutorial is first started
function OnStart(handler)
	ui.ChatPrint("Welcome to the building tutorial!");
	tutorial.AddHandler(tutorial.TUT_EVENT_ENTER, "OnDoor", "enterbuilding");
	tutorial.AddHandler(tutorial.TUT_EVENT_LEAVE, "OnDoor", "leavebuilding");
	tutorial.AddTimedHandler("OnAlert", nil, 10000);
	tutorial.AddLocationHandler("OnLocation", nil, -314152.64, 3603663.64, 100.00, 3);
	
	hud = ui.FindView("hud");
	
	if(hud ~= nil) then
		hud:CallJS("showOk", "Hello!");
		-- hud:RunJS("showOk('test');");
		-- hud:Hide();
	end
end

function OnDoor(handler, building)
	if(handler.eventType == tutorial.TUT_EVENT_ENTER) then 
		ui.ChatPrint("Entered "..building:Name().."/"..building:Filename());
	else
		ui.ChatPrint("Exited "..building:Name().."/"..building:Filename());
	end
	
	return 1;
end

function OnAlert(handler)
	ui.ChatPrint("Times up!");
end

function OnLocation(handler)
	if(handler.state == tutorial.THS_EVENT_IN) then
		ui.ChatPrint("In range!");
	elseif(handler.state == tutorial.THS_EVENT_OUT) then
		ui.ChatPrint("Out of range!");
	end
	return 1;
end

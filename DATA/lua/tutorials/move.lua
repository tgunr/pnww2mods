
-- ui and tutorial libs already loaded by tutorial manager
-- imported additional game libs as needed
Include("input");
Include("strat");

-- called when this tutorial is first started
function OnStart(handler)
	ui.ChatPrint("Welcome to the move tutorial!");
	ui.ChatPrint("Move outside of the barracks!");
	tutorial.AddTimedHandler("ShowIntro", nil, 10);
	tutorial.AddHandler(tutorial.TUT_EVENT_LEAVE, "OnOutside", nil);
end

function OnOutside(handler, building)
	if(building:Filename() == "barracks1c") then
		ui.ChatPrint("Left building "..building:Name());
		return 0;
	end
	return 1;
end

function ShowIntro(handler)
	ui.ChatPrint("Hello from the timer!");
	return 1;
end

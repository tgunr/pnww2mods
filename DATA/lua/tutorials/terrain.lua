
-- ui and tutorial libs already loaded by tutorial manager
-- imported additional game libs as needed
Include("strat");
Include("terrain");
Include("ob");

-- called when this tutorial is first started
function OnStart(handler)
	ui.ChatPrint("Welcome to the terrain tutorial!");
	tutorial.AddHandler(tutorial.TUT_EVENT_ENTER, "OnDoor", "enterbuilding");
	tutorial.AddHandler(tutorial.TUT_EVENT_LEAVE, "OnDoor", "leavebuilding");
	tutorial.AddHandler(tutorial.TUT_EVENT_COLLISION, "OnCollided", nil);
	tutorial.AddHandler(tutorial.TUT_EVENT_HIT, "OnShootObject", nil);
	tutorial.AddLocationHandler("OnLocation", nil, -314152.64, 3603663.64, 100.00, 3);
end

function OnDoor(handler, building)
	if(handler.eventType == tutorial.TUT_EVENT_ENTER) then 
		ui.ChatPrint("Entered "..building:Name().."/"..building:Filename());
	else
		ui.ChatPrint("Exited "..building:Name().."/"..building:Filename());
	end
	
	return 1;
end

function OnLocation(handler)
	if(handler.state == tutorial.THS_EVENT_IN) then
		ui.ChatPrint("In range!");
	elseif(handler.state == tutorial.THS_EVENT_OUT) then
		ui.ChatPrint("Out of range!");
	end
	return 1;
end

function OnCollided(handler, ob)
	ui.ChatPrint("Collided with "..ob:ObjName());
	
	strat = ob:StratObj();
	
	if(strat ~= nil) then 
		ui.ChatPrint("Connected strat object is "..strat:Filename().."/"..strat:Name());
	end
	
	return 1;
end

function OnShootObject(handler, to, co, x, y, z)
	ui.ChatPrint("Shot terrain object "..to:ObjName() .. " with name " .. co.name .. " and texture " .. co.texname .. " at " .. x .. "," .. y .. "," .. z);
	
	strat = to:StratObj();
	
	if(strat ~= nil) then 
		ui.ChatPrint("Connected strat object is "..strat:Filename().."/"..strat:Name());
	end
	
	return 1;
end

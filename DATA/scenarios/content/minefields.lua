
function OnMineArea(handler)
	-- see if this mine area pertains to us
	if(not scenario.manager:PlayerRelevant(handler.name)) then
		return 1;
	end
	
	if(handler.state == tutorial.THS_EVENT_IN) then
		state.landmine = handler.name;
		-- get our player
		local v = player.playerGetVehicle();
		-- add a landmine handler
		tutorial.manager:AddLocationHandler("OnLandmine", nil, v:GetPos(1), v:GetPos(2), v:GetPos(3), 1);
	else
		tutorial.manager:RemoveHandler("OnLandmine");
		state.minearea = nil;
	end
	return 1;
end

function OnLandmine(handler)
	if(handler.state == tutorial.THS_EVENT_OUT) then
		
		local v = player.playerGetVehicle();
		
		-- check to see if we have stepped on a mine
		if(math.random() < .1) then
			-- try to run an ammo, effect or sound
			local sharedData = string.format("%s %u %.2f %.2f %.2f", state.landmine, v:GetChatHandle(), v:GetPos(1), v:GetPos(2), v:GetPos(3));
			
			--ui.ChatPrint("Sending shared data: " .. sharedData);
			
			-- send out our landmine
			Instancing:BroadcastEvent("landmine", sharedData);
		end
		
		-- add a new one if needed
		tutorial.manager:AddLocationHandler("OnLandmine", nil, v:GetPos(1), v:GetPos(2), v:GetPos(3), 1);
	end
	
	-- always run this handler
	return 1;
end

function DoLandmine(name, value)

	local data 	= GetStringData("[%-%w%.]+", value);
	local pos		= data[3] .. " " .. data[4] .. " " .. data[5];
	
	-- run our scenario object
	scenario.manager:RunObject(data[1], 1, pos);
	
	-- do we need to kill ourself?
	local veh = vehicle.vehFindVehicleByChatHandle(tonumber(data[2]));
	
	if(veh ~= nil and veh:IsMe() and not game.SuperTroop()) then
		fp.fpFPSKillTrooper();
	end
end

-- setup a shared landmine handler
RegisterState("landmine", "DoLandmine");
	


-- setup a shared landmine handler
scenario.game.RegisterState("landmine", "DoLandmine");

function OnMineArea(handler)
	-- see if this mine area pertains to us
	if(scenario.game.PlayerRelevant(handler.name) == false) then
		return 1;
	end
	
	if(scenario.InArea(handler)) then
		state.landmine = handler.name;
		-- get our player
		local v = player.playerGetVehicle();
		-- add a landmine handler
		tutorial.manager:AddLocationHandler("OnLandmine", nil, v:GetPos(1), v:GetPos(2), v:GetPos(3), 1);
	else
		tutorial.manager:RemoveHandler("OnLandmine");
		state.landmine = nil;
	end
	return 1;
end

function OnLandmine(handler)
	if(scenario.InArea(handler) == false) then
		
		local v = player.playerGetVehicle();
		
		-- check to see if we have stepped on a mine
		if(math.random() < .1) then
			-- try to run an ammo, effect or sound
			local vhid = v.VehicleHostIndex;
			if(game.Online() == false) then
				vhid = 1;
			end
			local sharedData = string.format("%s %u %.2f %.2f %.2f", state.landmine, vhid, v:GetPos(1), v:GetPos(2), v:GetPos(3));
			
			--ui.ChatPrint("Sending shared data: " .. sharedData);
			
			-- send out our landmine
			scenario.game.BroadcastEvent("landmine", sharedData);
		end
		
		-- add a new one if needed
		tutorial.manager:AddLocationHandler("OnLandmine", nil, v:GetPos(1), v:GetPos(2), v:GetPos(3), 1);
	end
	
	-- always run this handler
	return 1;
end

function DoLandmine(name, value)

	local data 	= scenario.game.GetStringData("[%-%w%.]+", value);
	local pos		= data[3] .. " " .. data[4] .. " " .. data[5];
	
	-- run our scenario object
	scenario.game.RunObject(data[1], 1, pos);
	
	-- do we need to kill ourself?
	local veh = vehicle.vehFindVehicle(tonumber(data[2]));
	
	if(veh ~= nil and veh:IsMe() and game.SuperTroop() == false and game.SuperFloat() == false) then
		ui.ChatPrint("You have detonated a mine!");
		fp.fpFPSKillTrooper();
		tutorial.manager:RemoveHandler("OnLandmine");
		state.landmine = nil;
	end
end


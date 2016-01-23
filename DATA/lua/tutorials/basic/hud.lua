
-- ui and tutorial libs already loaded by tutorial manager
-- imported additional game libs as needed
Include("input");
Include("state");

-- setup tutorial state here
state.name 		= "basic.hud";
state.ui		= "tuthud";
state.onupdate	= "OnGoalLearnHud";

-- set our initial tutorial state
tutorial.SetState(state);

----------------- goal 1: learn map ---------------------

function OnGoalLearnHud(step)
	if(step == 1) then
		player.persHUDShowHUD(); -- make sure the hud is showing
		SetNextStep(1);
		-- intro
	elseif(step == 2) then
		SetNextStep(1);
		-- health bar
	elseif(step == 3) then
		SetNextStep(1);
		-- atp bar
	elseif(step == 4) then
		SetNextStep(1);	
		-- chat window
	elseif(step == 5) then
		SetNextStep(1);
		-- minimap
	elseif(step == 6) then
		-- game info
		local gameinfo = ui.FindView("gameinfo");
		if(gameinfo == nil or gameinfo:IsVisible() == false) then
			-- doesn't matter what the params are except the 1st one needs to be 1
			player.persHUDToggleGameInfo(1, 0, 0);
		end
		SetNextStep(1);
	elseif(step == 7) then
		-- readout
		local readout = ui.FindView("readout");
		if(readout == nil or readout:IsVisible() == false) then
			-- doesn't matter what the params are except the 1st one needs to be 1
			player.persHUDToggleReadout(1, 0, 0);
		end
		SetNextStep(1);
	elseif(step == 8) then
		player.persHUDLock(false);
		tutorial.RemoveHandler("OnNextStep");
		tutorial.AddHandler(tutorial.TUT_EVENT_INPUT, "OnCycleHUD");
		state.toggled = 0;
		-- toggle hud
	elseif(step == 9) then
		-- customize
		SetInput(1, input.IMAP_MOM_RESET_HUD);
	elseif(step == 10) then
		-- done
		tutorial.Complete();
	end
end

function OnCycleHUD(handler, func, param)
	if(param > 0 and func == input.IMAP_MOM_TOGGLE_HUD) then
		state.toggled = state.toggled + 1;
		if(state.toggled >= 2) then
			tutorial.CompleteStep(0);
			return 0;
		end
	end
	return 1; -- keep handler running
end



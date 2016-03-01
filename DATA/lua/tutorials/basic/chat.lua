
-- ui and tutorial libs already loaded by tutorial manager
-- imported additional game libs as needed
Include("input");
Include("state");

-- setup tutorial state here
state.name 		= "basic.chat";
-- state.ui		= "tuthud";
state.onupdate	= "OnGoalLearnChat";
state.keyed		= 0;
state.channels	= {};

-- set our initial tutorial state
tutorial.SetState(state);

-- overrides
function OnStart(handler)
	-- save current chat channels
	for index = 1, 6 do 
		state.channels[index] = ui.uiChatGetRadio(index - 1);
	end
	
	-- set out tutorial channels
	ui.uiChatSetRadio(0, ui.MISSION_CHANNEL);
	ui.uiChatSetRadio(1, ui.OBJECTIVE_CP_CHANNEL);
	ui.uiChatSetRadio(2, ui.NO_CHANNEL);
	ui.uiChatSetRadio(3, ui.BRIGADE_CHANNEL);
	ui.uiChatSetRadio(4, ui.SIDE_OPS_CHANNEL);
	ui.uiChatSetRadio(5, ui.SIDE_HELP_CHANNEL);
	
	tutorial.OnStart(handler);
end

function OnStop(handler)
	-- reset all chat channels back to what they were
	for index = 1, 6 do 
		ui.uiChatSetRadio(index - 1, state.channels[index]);
	end
	
	tutorial.OnStop(handler);
end

----------------- goal 1: learn map ---------------------

function OnGoalLearnChat(step)
	if(step == 1) then
		player.persHUDShowHUD(); -- make sure chat is showing
		tutorial.AddHandler(tutorial.TUT_EVENT_KEY, "OnKey");
		SetKey(1, input.IAC_ENTER, 2);
	elseif(step == 2) then
		SetKey(1, input.IAC_F1, 1);
	elseif(step == 3) then
		SetKey(1, input.IAC_ENTER, 1);
	elseif(step == 4) then
		tutorial.AddHandler(tutorial.TUT_EVENT_CHANNEL, "OnTune");
	elseif(step == 5) then
		tutorial.AddHandler(tutorial.TUT_EVENT_CHAT, "OnChat");
	elseif(step == 6) then
		SetNextStep(1);
	elseif(step == 7) then
		tutorial.Complete();
	end
end

function OnTune(handler, radio, channel)
	if(radio == 2 and channel == ui.SIDE_GENERAL_CHANNEL) then
		tutorial.CompleteStep(1);
		return 0;
	end
	return 1;
end

function OnChat(handler, message)
	if(string.lower(message) == "/time" or string.lower(message) == ".time") then
		tutorial.CompleteStep(1);
		return 0;
	end
	return 1;
end

function SetKey(delay, iac, count)
	state.delay = delay;
	state.iac 	= iac;
	state.count = count;
	state.keyed	= 0;
end

function OnKey(handler, iac, param, count)
	if(param == 1 and iac == state.iac) then
		state.keyed = state.keyed + 1;
		if(state.keyed >= state.count) then
			tutorial.CompleteStep(state.delay);
			SetKey(0, -1, 0);
		end
	end
	return 1; -- keep handler running
end



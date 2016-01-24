
-- imported game libs
Include("input");
Include("player");
Include("vehicle");

local state = {};

-- called when this tutorial is first started
function OnStart(handler)
	input.ww2KeymapInit(0);
	ui.ChatPrint("Welcome to the input tutorial!");
	tutorial.AddHandler(tutorial.TUT_EVENT_INPUT, "OnInput");
	state.vid = player.playerGetPlayer():GetVehicle():GetType().VehicleTypeNum;
end

function OnStop(handler)
	input.ww2KeymapKill();
end

-- test scripts

function OnInput(handler, func, param)
	if(param == 1) then
		local out = "Function: ";
		out = out .. input.ww2GetFuncName(func).."/";
		out = out .. input.ww2FunctionControlName(func).."/";
		out = out .. input.ww2imapGetFuncKeyname(-1, state.vid, func, 0);
		ui.ChatPrint(out);
	end
	return 1;
end


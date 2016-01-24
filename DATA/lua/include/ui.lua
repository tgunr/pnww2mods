
-- imported game libs

game.LoadLib("ui");

-- set up some aliases
ui.SendChat = game.SendChat;
ui.ChatPrint = ui.uiChatPrintLine;
ui.ConPrint = ui.uiConsoleprintf;
ui.RunJS = ui.uiRunScript;

ui.FindView = function(name)
	return ui.viewinit(ui.uiFindView(name));
end

ui.LoadView = function(path)
	return ui.viewinit(ui.uiLoadView(path, true, true));
end

ui.ShowOK = function(message)
	ui.RunJS("game.DoOK(getlocstring('"..message.."'));");
end

ui.ShowConfirm = function(message)
	ui.RunJS("game.DoConfirm(getlocstring('"..message.."'));");
end

ui.ShowHelp = function(id, force)
	local arg2 = "true";
	if(not force) then arg2 = "false" end 
	ui.RunJS("game.quickhelp('".. id.."',"..arg2..")");
end

ui.viewrunjs = function(self, script)
	ui.uiRunScript(self, script);
end

ui.viewcalljs = function(self, callback, ...)
	local args = {...};
	local call = callback.."(";
	
	for k,v in ipairs(args) do
		if(type(v) == "table") then
			for k1,v1 in ipairs(v) do
				call = call.."'"..v1.."',";
			end
		else
			call = call.."'"..v.."',";
		end
	end
	
	call = call.."null);";
	
	ui.uiRunScript(self, call);
end

ui.viewfindview = function(self, name)
	return ui.viewinit(self:FindView(name));
end

ui.viewinit = function(view)
	if(view ~= nil) then 
		view.RunJS = ui.viewrunjs;
		view.CallJS = ui.viewcalljs;
		view.FindChild = ui.viewfindview;
	end
	
	return view;
end

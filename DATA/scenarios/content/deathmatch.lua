

if(true) then
	-- content we're going to add
	local hostStates = 
	{
		-- these are state names + handlers to call when a change occurs
		"hoststate roundstart OnRoundStart",
		"hoststate roundstop OnRoundStop",
		"hoststate victory OnVictory",
		"hoststate deaths1 CheckVictory",
		"hoststate deaths2 CheckVictory",
	};
	
	for i,hs in ipairs(hostStates) do
		local data = {};
		
		-- collect our data parts
		for d in string.gmatch(hs, "%a+") do
			data.insert(d);
		end
		
		-- data[1] is simply hoststate
		-- register our state handler
		scenario.RegisterState(data[2], data[3]);
		
	end
end



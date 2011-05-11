

if(true) then
	-- content we're going to add
	local content = 
	{
		"alert victory ",
		
		-- command,path
		"state victory toggle",
	};

	for i,v in ipairs(content) do 
		scenario.manager:AddContent(v);
	end
end



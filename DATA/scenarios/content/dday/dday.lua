

if(true) then
	-- content we're going to add
	local content = 
	{
		-- weapon pack 03
		"include scenarios/content/product02.lua",
	};

	for i,v in ipairs(content) do 
		scenario.manager:AddContent(v);
	end
end



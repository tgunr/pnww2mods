

if(true) then
	-- content we're going to add
	local content = 
	{
		-- include lua file
		-- command,path
		"include scenarios/terrain/doggreen/map.lua",
		
		

	};

	for i,v in ipairs(content) do 
		scenario.manager:AddContent(v);
	end
end



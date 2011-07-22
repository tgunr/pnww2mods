

if(true) then
	-- content we're going to add
	local content = 
	{
		-- define a permission requirement
		"weaponpack product03 us-sniper",
		"weaponpack product03 us-bar",
		"weaponpack product03 de-sniper",
	};
	
	for i,v in ipairs(content) do 
		scenario.manager:AddContent(v);
	end
end



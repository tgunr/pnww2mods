

if(true) then
	-- content we're going to add
	-- THIS IS THE D-DAY WEAPON PACK
	
	local content = 
	{
		-- define a permission requirement
		-- US WEAPONS
		"weaponpack product02 us-assault",
		"weaponpack product02 us-bar",
		"weaponpack product02 us-sniper",
		"weaponpack product02 us-bazooka",
		"weaponpack product02 m10_us",
		-- GERMAN WEAPONS
		"weaponpack product02 de-assault",
		"weaponpack product02 de-lmg",
		"weaponpack product02 de-sniper",
		"weaponpack product02 de-pzschreck",
		"weaponpack product02 de-ltmortar",
		"weaponpack product02 pzivg",
		

	};
	
	for i,v in ipairs(content) do 
		scenario.manager:AddContent(v);
	end
end



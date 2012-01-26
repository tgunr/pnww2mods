

if(true) then
	-- content we're going to add
	local content = 
	{
    	-- special handling
		-- type object shader x y z yaw
		"river water1 riverrun_river 0 0 2.5 0",
        -- command flt link x y z yaw
		"terrain tankmap maintile 0 0 0 0",
-- TERRAIN OBJECTS PLACEMENTS

	-- command,filename,worldx,worldy,worldz,roll,pitch,yaw,scalex,scaley,scalez,damage
	
	-- BRIDGES
		"place stonebridge -185.83 -75.77 5.45 0 0 0 0 0 0",
		"place stonebridge -9 -63 7.2 0 0 -5 0 0 0",	
		
	-- HULKS
		"place instance_hulk1_dam -85.96 -13.91 10.4 5 3 10 0 0 0",
		"place m4a2hulk -70.94 -121.06 8.2 -4 0 10 0 0 0",
	
	




	
	

	
	
	
	
	

	

		
		
		
		
		
		
		
		
		

	};
	
	for i,v in ipairs(content) do 
		scenario.manager:AddContent(v);
	end
end




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
		
		
	-- ROCKS
		"place rocks03 -269.16 41.84 11.7 0 10 0 0 0 180",
		"place rocks04 -277.73 46.06 14.7 0 10 0 0 0 180",
		"place rocks01 -270.51 35.19 11.5 0 10 0 0 0 0",
		
		"place rocks03 -124.40 130.23 24.0 0 10 25 0 0",
		"place rocks02 -120.22 127.82 22.9 10 0 0 0 0",		
		
		"place rocks04 179.32 -136.65 13.07 0 10 0 0 0 0",
		
		"place rocks03 147.73 -253.00 20.48 0 10 0 0 0 0",
		"place rocks01 142.36 -253.34 20.46 0 10 0 0 0 0",
		"place rocks04 138.36 -256.01 21.07 0 10 0 0 0 0",

		"place rocks04 18.66 -279.91 17.6 -15 0 0 0 0 180",
		"place rocks03 10.04 -278.86 17.33 -10 0 0 0 0 180",

		"place rocks01 -12.19 -281.60 19.68 -10 0 0 0 0 180",
	
		"place rocks03 -168.86 -239.14 3.94 0 10 0 0 0 0",
		"place rocks01 -174.95 -238.65 4.5 0 10 0 0 0 0",
		"place rocks04 -178.71 -234.39 4.25 0 10 0 0 0 0",	
	
		"place rocks04 -299.63 -124.98 17.44 0 15 15 0 0 0",	
		"place rocks02 -291.72 -126.95 13.3 0 25 15 0 0 0",
	
	

		
		
		
		
		
		
		
		
		

	};
	
	for i,v in ipairs(content) do 
		scenario.manager:AddContent(v);
	end
end


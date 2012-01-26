

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
		--"place stonebridge -185.83 -75.77 5.45 0 0 0 0 0 0",
		--"place stonebridge -9 -63 7.2 0 0 -5 0 0 0",	
		
	-- HULKS
		--"place instance_hulk1_dam -85.73 -15.95 8.1 0 0 10 0 0 0",
		--"place m4a2hulk -70.94 -121.06 7.2 0 0 10 0 0 0",
	
	
	
	-- THESE OBJECTS ARE FOR CAGEFIGHT AND SHOULD NOT BE INCLUDED IN FINAL TANKBRAWL SCENARIO




	"place bel4 319.13 288.0 49.85 0 0 -90 0 0 0 0",
	"place bel6 319.0 308.0 49.85 0 0 -90 0 0 0 0",
	"place bel6 319.0 323.0 49.85 0 0 -90 0 0 0 0",
	"place bel1 319.13 346.0 49.85 0 0 -90 0 0 0 0",

	
	
	"place bel5 300.0 336.0 49.95 0 0 180 0 0 0 0",
	"place bel7 300.0 335.85 49.95 0 0 90 0 0 0 0",
	
	"place urbldg03 295.81 400.94 50.0 0 0 0 0 0 0 0",
	"place urbldg03 400.0 326.29 50.0 0 0 90 0 0 0 0",
	"place urbldg03 270.0 512.50 50.0 0 0 0 0 0 0 0",
	
	"place bel4 330.0 337.29 49.85 0 0 -90 0 0 0 0",
	
	
	
	
	
	-- spawns
	"place citybild1 317.0 361.0 49.85 0 0 180 0 0 0 0",
	"place citybild2 299.0 300.99 49.95 0 0 0 0 0 0 0",
	
	
	--"place urbldg06 325.73 360.33 51.17 0 0 0 0 0 0 0",
	
	
	-- walls
	"place wall01 298.77 301.5 49.0 0 0 90 0 0 0 0",
	"place wall01 298.77 310.5 49.0 0 0 -90 0 0 0 0",
	
	"place wall02 320.0 343.25 49.0 0 0 90 0 0 0 0",
	"place wall02 323.0 308.5 48.55 0 0 90 0 0 0 0",
	
	"place wall01 316.75 300.34 48.5 0 0 -180 0 0 0 0",
	
	
	
	-- crates
	"place cratepile_outside 313.0 355.27 50.0 0 0 90 0 0 0 0",
	"place cratepile_outside 305.0 305.0 50.0 0 0 90 0 0 0 0",
	"place cratepile_outside 306.0 330.0 50.0 0 0 45 0 0 0 0",	
	"place cratepile_outside 322.76 366.0 50.0 0 0 0 0 0 0 0",	
	
	
	
	"place crate 310.25 313.01 50.0 0 0 0 0 0 0 0",
	"place crate 309.0 313.01 50.0 0 0 0 0 0 0 0",
	"place crate 307.5 313.01 50.0 0 0 0 0 0 0 0",
	"place crate 308.0 313.01 51.0 0 0 0 0 0 0 0",
	"place crate 309.5 313.01 51.0 0 0 0 0 0 0 0",
	"place crate 318.38 321.75 50.0 0 0 0 0 0 0 0",
	"place crate 316.81 323.14 49.8 0 0 -45 0 0 0 0",
	"place crate 315.05 324.35 49.8 0 0 -40 0 0 0 0",
	"place crate 316.05 323.7 50.8 0 0 -40 0 0 0 0",
	"place crate 318.38 336.82 50.0 0 0 0 0 0 0 0",
	"place crate 306.11 338.75 50.0 0 0 0 0 0 0 0",
	"place crate 306.11 340.5 50.0 0 0 0 0 0 0 0",
	"place crate 306.11 340.0 51.0 0 0 0 0 0 0 0",
	"place crate 317.0 337.08 50.0 0 0 0 0 0 0 0",
	"place crate 315.5 337.08 50.0 0 0 0 0 0 0 0",
	"place crate 316.25 337.08 51.0 0 0 0 0 0 0 0",
	"place crate 318.78 302.04 50.0 0 0 90 0 0 0 0",
	"place crate 318.78 302.2 51.0 0 0 110 0 0 0 0",
	"place crate 320.71 365.65 50.00 0 0 0 0 0 0 0",
	"place crate 319.4 365.65 50.00 0 0 0 0 0 0 0",
	"place crate 318.0 365.65 50.00 0 0 0 0 0 0 0",
	"place crate 319.0 365.65 51.00 0 0 9 0 0 0 0",
	"place crate 300.85 362.18 50.03 0 0 0 0 0  0",
	"place crate 301.2 362.18 51.03 0 0 0 0 0  0",
	"place crate 301.2 359.5 50.03 0 0 90 0 0  0",
	"place crate 307.84 291.9 50.03 0 0 90 0 0  0",
	"place crate 310.13 298.65 50.1 0 0 25 0 0  0",
	
	--boards
	"place boarding1 299.85 320.44 50.0 0 0 90 0 0 0 0",
	"place boarding1 299.85 329.25 50.0 0 0 90 0 0 0 0",
	"place boarding1 299.9 349.25 50.0 0 0 90 0 0 0 0",
	
	"place boarding1 302.63 291.1 50 0 0 0 0 0 0 0",
	
	"place boarding1 319.25 355.35 50.0 0 0 90 0 0 0 0",
	
	
	
	-- telephone poles
	"place dd_telegraph_07 317.2 291 48.5 5 0 -1 0 0 0 0",
	"place dd_telegraph_07 317.2 310.14 48.5 3 -2 0 0 0 0 0",
	"place dd_telegraph_07 317.2 343.0 48.5 1 0 0 0 0 0 0",
	
	
	
	
	
	
	
	

	
	-- vehicles
	--"place truck_dam_outside 312.0 312.02 49.98 0 0 -90 0 0 0 0",
	
	-- oildrums
	
	"place oildrums_outside 306.04 318.41 50.0 0 0 90 0 0 0 0",
	"place oildrums_outside 308.5 346.25 50.0 0 0 -90 0 0 0 0",
	

	
	
	
	
	

	

		
		
		
		
		
		
		
		
		

	};
	
	for i,v in ipairs(content) do 
		scenario.manager:AddContent(v);
	end
end


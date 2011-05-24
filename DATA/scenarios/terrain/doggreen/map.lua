

if(true) then
	-- content we're going to add
	local content = 
	{
		-- special handling
		-- type shader x y z yaw
		"coast water1 doggreen_coast 0 0 3.3 0.0",

		-- placed objects
		-- command,filename,worldx,worldy,worldz,roll,pitch,yaw,scalex,scaley,scalez,damage
		"place water1 800 0 3.3 0 0 0 0 0 0 0",
		"place water1 0 800 3.3 0 0 0 0 0 0 0",
		"place water1 800 800 3.3 0 0 0 0 0 0 0",
		"place water1 800 1600 3.3 0 0 0 0 0 0 0",
			
		"place doggreen_ob3 0 0 0 0 0 0 0 0 0 0",
		
		-- higgins boats
		"place dg_veh_lcvp -45.56 200.06 3.2 0 0 120 0 0 0 0",
		"place dg_veh_lcvp -38.89 174.78 3.50 0 0 105 0 0 0 0",
		"place dg_veh_lcvp -8.51 170.86 3.2 0 0 135 0 0 0 0",
		"place dg_veh_lcvp -35.66 189.92 3.2 0 0 130 0 0 0 0",
		"place dg_veh_lcvp 1.72 157.33 3.4 0 0 125 0 0 0 0",
		"place dg_veh_lcvp -42.57 244.33 2.7 -15 -10 125 0 0 0 0",
		
		
		

		-- belgium gates filenamemissing low poly
		"place dg_obs_elementc -14.31 270.78 2.75 0 0 195 0 0 0 0",
		"place dg_obs_elementc -2.13 266.69 2.65 0 0 200 0 0 0 0",
		"place dg_obs_elementc 9.51 258.79 2.75 0 0 205 0 0 0 0",
		"place dg_obs_elementc 23.11 252.81 2.75 0 0 205 0 0 0 0",
		"place dg_obs_elementc 36.71 244.43 2.75 0 0 210 0 0 0 0",
		"place dg_obs_elementc 59.24 250.55 1.65 0 0 215 0 0 0 0",
		"place dg_obs_elementc 71.03 244.42 1.65 0 0 220 0 0 0 0",
		"place dg_obs_elementc 83.15 238.88 1.65 0 0 220 0 0 0 0",
		"place dg_obs_elementc 95.33 226.13 1.85 0 0 225 0 0 0 0",
		"place dg_obs_elementc 111.59 223.10 1.65 0 0 225 0 0 0 0",
		"place dg_obs_elementc 118.50 199.66 2.59 0 0 210 0 0 0 0",
		"place dg_obs_elementc 133.23 193.64 2.59 0 0 205 0 0 0 0",
		"place dg_obs_elementc 145.24 188.25 2.59 0 0 200 0 0 0 0",
		"place dg_obs_elementc 159.12 178.97 2.59 0 0 215 0 0 0 0",
		"place dg_obs_elementc 170.79 169.18 2.8 0 0 205 0 0 0 0",
		
		-- sherman hulks
		"place m4a2hulk -49.85 162.93 3.95 0 5 205 0 0 0 0",
		"place m4a2hulk -18.65 165.73 2.7 0 -5 200 0 0 0 0",
		"place m4a2hulk -12.08 136.99 4.0 5 15 180 0 0 0 0",
		
		
		

		
		
		
		
		
		
		
		 -- belgium gates dg_obs_elementc high poly
		"place dg_obs_elementc -197.40 -72.03 24.60 -2 -3 190 0 0 0 0",
		"place dg_obs_elementc -200.93 -71.18 24.4 -2 -3 190 0 0 0 0",
		
		-- German FB
		"place cratepile_outside -18.86 -148.38 44.8 0 0 0 0 0 0 0",
		
		
		-- landmine signs
		"place dangersign -19.73 7.38 9.65 0 0 200 0 0 0 0",
		"place dangersign -52.71 22.08 10.57 0 0 200 0 0 0 0",
		"place dangersign -25.99 -8.87 11.0 0 0 20 0 0 0 0",
		"place dangersign -58.61 7.91 12.25 0 0 20 0 0 0 0",
		
		"place dangersign -235.12 -140.63 28 0 0 190 0 0 0 0",
		"place dangersign -266.61 -132.86 31 0 0 190 0 0 0 0",
		"place dangersign -238.47 -157.28 28.55 0 0 0 0 0 0 0",
		"place dangersign -274.00 -150.28 31.8 0 0 -10 0 0 0 0",
		
		"place dangersign -212.32 -246.59 40.5 0 0 -10 0 0 0 0",
		"place dangersign -159.41 -229.34 44.4 0 0 -10 0 0 0 0",
		"place dangersign -113.11 -213.09 44.9 0 0 -10 0 0 0 0",
		"place dangersign -113.91 -199.08 44.8 0 0 180 0 0 0 0",
		"place dangersign -157.02 -212.32 44.2 0 0 180 0 0 0 0",
		"place dangersign -205.00 -226.65 40.9 0 0 180 0 0 0 0",
		
		
		"place dangersign -22.75 -200.99 45.4 0 0 -10 0 0 0 0",
		"place dangersign -72.48 -197.40 45.4 0 0 0 0 0 0 0",
		"place dangersign -144.63 -172.68 44 0 0 -5 0 0 0 0",
		"place dangersign -162.73 -120.95 39.7 0 0 90 0 0 0 0",
		"place dangersign -150.62 -112.39 41.3 0 0 160 0 0 0 0",
		"place dangersign -122.74 -156.73 44.0 0 0 175 0 0 0 0",
		-- "place dangersign -212.32 -246.59 40.5 0 0 -10 0 0 0 0",
		-- "place dangersign -212.32 -246.59 40.5 0 0 -10 0 0 0 0",
		
	


	};
	
	for i,v in ipairs(content) do 
		scenario.manager:AddContent(v);
	end
end




if(true) then
	-- content we're going to add
	local content = 
	{
		-- special handling
		-- type shader x y z yaw
		"coast water1 doggreen_coast 0 0 3.65 0.0",

		-- placed objects
		-- command,filename,worldx,worldy,worldz,roll,pitch,yaw,scalex,scaley,scalez,damage
		"place water1 800 0 3.65 0 0 0 0 0 0 0",
		"place water1 0 800 3.65 0 0 0 0 0 0 0",
		"place water1 800 800 3.65 0 0 0 0 0 0 0",
		"place water1 800 1600 3.65 0 0 0 0 0 0 0",
		"place water1 -800 0 3.65 0 0 0 0 0 0 0",
		"place water1 -800 800 3.65 0 0 0 0 0 0 0",
			
		"place doggreen_ob3 0 0 0 0 0 0 0 0 0 0",
		"place doggreen_region_EE 0 0 0 0 0 0 0 0 0 0",
		--"place doggreen_region_NE 0 0 0 0 0 0 0 0 0 0",
		--"place doggreen_region_NN 0 0 0 0 0 0 0 0 0 0",
		"place doggreen_region_NW 0 0 0 0 0 0 0 0 0 0",
		"place doggreen_region_SE 0 0 0 0 0 0 0 0 0 0",
		"place doggreen_region_SS 0 0 0 0 0 0 0 0 0 0",
		"place doggreen_region_SW 0 0 0 0 0 0 0 0 0 0",
		"place doggreen_region_WW 0 0 0 0 0 0 0 0 0 0",

		
		-- higgins boats
		--damaged
		"place dg_veh_lcvp_lx -42.57 244.33 2.9 -15 -10 125 0 0 0 0",
		"place dg_veh_lcvp_lx -31.38 165.17 4.0 20 40 125 0 0 0 0",
		"place dg_veh_lcvp_lx -48.15 211.30 4.5 180 0 115 0 0 0 0",
		"place dg_veh_lcvp_lx -90.62 197.56 5.0 180 -5 -20 0 0 0 0",
		
	
		--empty
		"place dg_veh_lcvp_lx -1.38 234.70 3.6 -3 0 125 0 0 0 0",
		"place dg_veh_lcvp_lx 14.18 227.54 3.5 -3 0 135 0 0 0 0",
		"place dg_veh_lcvp -35.66 189.92 3.2 0 0 130 0 0 0 0",
		"place dg_veh_lcvp 1.72 157.33 3.4 0 0 125 0 0 0 0",
		"place dg_veh_lcvp -77.0 195.28 3.3 -3 10 100 0 0 0 0",
		"place dg_veh_lcvp 35.77 138.37 3.7 -3 0 115 0 0 0 0",
		"place dg_veh_lcvp 59.38 125.15 3.91 -3 0 100 0 0 0 0",
		"place dg_veh_lcvp_lx 84.96 141.06 3.72 -3 0 120 0 0 0 0",
		"place dg_veh_lcvp_lx 104.23 127.04 3.68 -3 0 130 0 0 0 0",
		"place dg_veh_lcvp -113.65 226.54 3.54 0 0 100 0 0 0 0",
		"place dg_veh_lcvp -134.64 235.54 3.62 0 0 115 0 0 0 0",
		"place dg_veh_lcvp_lx -106.32 264.14 3.5 0 0 115 0 0 0 0",
		

		
		--spawn boats
		"place dg_veh_lcvp 44.88 151.53 3.4 0 0 110 0 0 0 0",
		"place dg_veh_lcvp -14.0 178.89 3.2 0 0 135 0 0 0 0",
		"place dg_veh_lcvp -78.0 206.0 3.35 0 0 120 0 0 0 0",
		

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
		"place m4a2hulk -28.60 139.50 4.65 4 10 180 0 0 0 0",
		"place m4a2hulk -43.35 118.51 6.1 -2 -10 170 0 0 0 0",
		"place m4a2hulk -94.26 160.41 5.0 0 -5 215 0 0 0 0",
		"place m4a2hulk -122.22 138.22 6.0 0 0 180 0 0 0 0",
		"place m4a2hulk 40.0 126.0 3.75 0 0 225 0 0 0 0",
		

		
		 -- belgium gates dg_obs_elementc high poly
		"place dg_obs_elementc -197.40 -72.03 24.60 -2 -3 190 0 0 0 0",
		"place dg_obs_elementc -200.93 -71.18 24.4 -2 -3 190 0 0 0 0",
		
		-- German FB
		"place cratepile_outside -18.86 -148.38 44.8 0 0 0 0 0 0 0",
		
		-- German MG nests
		"place sandbagwall_curved_outside -144.90 -25.28 34.3 0 0 85 0 0 0 0",
		"place sandbagwall_curved_outside -146.5 -28.0 34.3 0 0 -25 0 0 0 0",
		"place dg_wire_barbed_apron	-138.48 -24.17 34.25 -4 0 0 0 0 0",
		"place dg_wire_barbed_box	-147.26 -30.81 34.85 -9 -10 75 0 0 0",
		"place dg_wire_barbed_box	-144.76 -34.30 35.7 -5 -5 25 0 0 0",
	
		
		
		
		"place ammocrate -81.76 -44.05 36.74 0 -10 -45 0 0 0 0",
		"place crate -81.1 -43.3 36.44 0 -10 -45 0 0 0 0",
		"place sandbagwall_curved_outside -80.25 -42.5 37.5 0 -12 135 0 0 0 0",
		"place ammocrate -87.2 -42.30 36.75 0 15 75 0 0 0 0",
		"place crate -87.33 -41.30 36.4 0 10 75 0 0 0 0",
		"place sandbagwall_curved_outside -87.3 -40.1 37.5 0 10 90 0 0 0 0",	
		
		"place ammocrate 17.8 -108.88 38.35 -3 -2 -50 0 0 0 0",
		"place crate 18.0 -108 37.89 0 0 -50 0 0 0 0",
		"place sandbagwall_curved_outside 19.0 -107.0 38.9 0 -5 125 0 0 0 0",	
		"place ammocrate 22.02 -113.26 38.65 -5 -5 -15 0 0 0 0",
		"place crate 22.82 -112.70 38.25 0 0 -25 0 0 0 0",
		"place sandbagwall_curved_outside 23.8 -111.99 39.4 0 -5 140 0 0 0 0",	
		

		-- german spawn
		"place infantryfb1c -50.5 -148.73 44.4 -1 0 0 0 0 0 0",
		
		
		
		
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


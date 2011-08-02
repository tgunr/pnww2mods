

if(true) then
	-- content we're going to add
	local content = 
	{
		-- special handling
		-- type shader x y z yaw
		"coast water1 doggreen_coast 0 0 3.65 0.0",
		"ocean water1 doggreen_ocean 800 0 3.65 0",
		"ocean water1 doggreen_ocean 0 790 3.8 0",
		"ocean water1 doggreen_ocean 800 800 3.65 0",
		"ocean water1 doggreen_ocean 800 1600 3.65 0",
		"ocean water1 doggreen_ocean 0 1590 3.65 0",
		"ocean water1 doggreen_ocean -800 0 3.65 0",
		"ocean water1 doggreen_ocean -800 800 3.65 0",
		"ocean water1 doggreen_ocean -800 1600 3.65 0",

        -- special handling for terrain tiles
        -- command flt link x y z yaw
		"terrain doggreen maintile 0 0 0 0",
		"terrain doggreen_region_EE edgetile 0 0 0 0",
		"terrain doggreen_region_NW edgetile 0 0 0 0",
		"terrain doggreen_region_SE edgetile 0 0 0 0",
		"terrain doggreen_region_SS edgetile_ss 0 0 0 0",
		"terrain doggreen_region_SW edgetile 0 0 0 0",
		"terrain doggreen_region_WW edgetile 0 0 0 0",

		-- placed objects
		-- command,filename,worldx,worldy,worldz,roll,pitch,yaw,scalex,scaley,scalez,damage		
		"place doggreen_ob3 0 0 0 0 0 0 0 0 0 0",
		"place doggreen_ob3_barbedwire 0 0 0 0 0 0 0 0 0 0",
		"place doggreen_ob3_logbunker 0 0 0 0 0 0 0 0 0 0",
		
		-- higgins boats
		
		--spawn boats
		"place normalbobber dg_veh_lcvp -14.0 178.89 3.2 0 0 135 0 0 0 0",
		"place normalbobber dg_veh_lcvp -78.0 206.0 3.35 0 0 120 0 0 0 0",
		"place normalbobber dg_veh_lcvp -118.93 235.00 3.35 0 0 125 0 0 0 0",

		
		-- damaged
		"place heavybobber dg_veh_lcvp_lx -42.57 244.33 2.9 -15 -10 125 0 0 0 0",
		"place heavybobber dg_veh_lcvp_lx -48.15 211.30 4.5 180 0 115 0 0 0 0",
		"place beachedbobber dg_veh_lcvp_lx -31.38 165.17 4.0 20 40 125 0 0 0 0",
		"place beachedbobber dg_veh_lcvp_lx -90.62 197.56 5.0 180 -5 -20 0 0 0 0",
		
		--empty
		"place beachedbobber dg_veh_lcvp -123.69 218.34 3.55 -1 0 110 0 0 0 0",
		"place normalbobber dg_veh_lcvp 44.88 151.53 3.4 0 0 110 0 0 0 0",
		
		"place normalbobber dg_veh_lcvp_lx -1.38 234.70 3.6 -3 0 125 0 0 0 0",
		"place beachedbobber dg_veh_lcvp_lx 14.18 227.54 3.5 -3 0 135 0 0 0 0",
		"place normalbobber dg_veh_lcvp -35.66 189.92 3.2 0 0 130 0 0 0 0",
		"place normalbobber dg_veh_lcvp 1.72 157.33 3.4 0 0 125 0 0 0 0",
		"place normalbobber dg_veh_lcvp -77.0 195.28 3.3 -3 10 100 0 0 0 0",
		"place beachedbobber dg_veh_lcvp 43.61 137.14 3.7 -3 0 115 0 0 0 0",
		"place normalbobber dg_veh_lcvp 58.94 135.27 3.3 -3 0 100 0 0 0 0",
		 
		"place normalbobber dg_veh_lcvp_lx 84.96 141.06 3.72 -3 0 120 0 0 0 0",
		"place normalbobber dg_veh_lcvp_lx 104.23 127.04 3.68 -3 0 130 0 0 0 0",
		"place normalbobber dg_veh_lcvp -113.65 226.54 3.54 0 0 100 0 0 0 0",
		"place normalbobber dg_veh_lcvp -134.64 235.54 3.62 0 0 115 0 0 0 0",
		"place normalbobber dg_veh_lcvp_lx -106.32 264.14 3.5 0 0 115 0 0 0 0",
		
		-- content name x1 y1 x2 y2 pitch roll bob pitchrate rollrate bobrate
		-- the x1,y1 to x2,y2 line segments defines the direction of the wave
		-- pitch and roll are in degrees to and fro
		-- bob is in meters up or down
		-- rates are arbitrary scalers, just choose something that looks right
		"wave normalbobber -93.45 285.45 -124.37 246.10 2.5 1.5 .05 .0005 .001 .001",
		"wave beachedbobber -93.45 285.45 -124.37 246.10 0 0 0 0 0 0",
		"wave heavybobber -93.45 285.45 -124.37 246.10 3.5 3.5 .05 .001 .001 .001",
	

		-- belgium gates
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
		"place m4a2hulk -48.27 166.50 3.95 0 5 205 0 0 0 0",
		"place m4a2hulk -18.65 165.73 2.7 0 -5 200 0 0 0 0",
		"place m4a2hulk -28.60 139.50 4.65 4 10 180 0 0 0 0",
		"place m4a2hulk -43.35 118.51 6.1 -2 -10 170 0 0 0 0",
		"place m4a2hulk -94.26 160.41 5.0 0 -5 215 0 0 0 0",
		"place m4a2hulk -122.22 138.22 6.0 0 0 180 0 0 0 0",
		"place m4a2hulk 40.0 126.0 3.75 0 0 225 0 0 0 0",
		"place m4a2hulk -134.86 195.41 4.8 -2 -4 245 0 0 0 0",
		"place m4a2hulk 4.14 92.50 6.41 0 0 210 0 0 0 0",
		"place m4a2hulk -168.88 189.35 6.4 0 0 210 0 0 0 0",
		
		

		
		 -- belgium gates dg_obs_elementc high poly
		"place dg_obs_elementc -197.40 -72.03 24.60 -2 -3 190 0 0 0 0",
		"place dg_obs_elementc -200.93 -71.18 24.4 -2 -3 190 0 0 0 0",
		
		-- German FB
		"place crates1c -56 -133 44.3 -0.6 0 0 0 0 0 0",
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
		"place dg_wire_barbed_apron	38.7 -176.5 44.25 0 0 -20 0 0 0",
		"place dg_wire_barbed_apron	72.16 -163.53 40.0 0 10 -20 0 0 0",
		"place dg_wire_barbed_apron	78 -162 39 0 10 -28 0 0 0",
		"place sandbagwall_outside -141.2 -25.6 34.2 -5 0 80 0 0 0 0",
		"place sandbagwall_outside -139 -25.28 34.2 -5 0 80 0 0 0 0",
		"place sandbagwall_outside -140.85 -25.55 34.7 -5 0 81 0 0 0 0",	
		"place sandbagwall_curved_outside -144.88 -388.10 46.75 0 0 85 0 0 0 0",	
		
		
		
		"place dg_obs_stake	-194.40 -192.18 40.75 10 0 0 0 0 0",
		"place dg_obs_stake	-192.7 -183.32 41.16 5 0 0 0 0 0",
		"place dg_obs_stake	-185.53 -146.3 39.0 10 0 0 0 0 0",
		"place dg_obs_stake	-182.47 -138.3 38.0 5 5 0 0 0 0",
		"place dg_obs_stake	-174.0 -123.11 38.17 5 0 0 0 0 0",
		"place dg_obs_stake	-170.54 -113.45 37.8 10 5 0 0 0 0",
		"place dg_obs_stake	-141.76 -34.46 35 0 5 0 0 0 0",
		"place dg_obs_stake	-111.55 -31.37 36.0 0 -5 0 0 0 0",
		"place dg_obs_stake	-104 -34 36.5 0 2 0 0 0 0",
		"place dg_obs_stake	49.46 -131.24 38.0 10 0 0 0 0 0",
		"place dg_obs_stake	63.53 -142.90 38.35 0 -10 0 0 0 0",
		"place dg_wire_barbed_box -109.03 -31.99 37.0 -10 -5 80 0 0 0",
		"place dg_wire_barbed_box -107.67 -32.5 37.4 -8 18 20 0 0 0",
		"place sandbagwall_outside -105.5 -33.85 37.35 -10 0 105 0 0 0 0",
		
		
		
		
		
		





		-- german spawn
		
		"place crate -137.19 -35.27 35.82 -5 0 0 0 0 0 0",
		"place crate -137.3 -35.0 36.8 -5 0 0 0 0 0 0",
		"place crate -138.35 -35.87 35.90 -5 0 0 0 0 0 0",
		
		-- trench decoration
		"place crate -30.8 -79.3 37.5 0 0 110 0 0 0 0",
		"place crate -49.27 -104.43 42.8 0 0 0 0 0 0 0",
		"place cratepile_outside -82.33 -101.48 43.9 0 2 0 0 0 0 0",
		"place cratepile_outside -47.74 -117.93 43.5 -3 1 25 0 0 0 0",
		"place cratepile_outside -142 -112.75 42.25 -1 -5 0 0 0 0 0",
		"place cratepile_outside -145.17 -69 40.2 -3.2 -5.5 0 0 0 0 0",
		
		
		
		
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
		"place dg_wire_barbed_apron	-51.8 -77.26 40.0 5 0 25 0 0 0",
		"place dg_wire_barbed_apron	-48.28 -79.48 39.8 0 0 25 0 0 0",
		"place dg_wire_barbed_apron	15.53 -98.45 37.0 0 5 15 0 0 0",
		
		
		
		
		
	
		
		
		
		
		
	


	};
	
	for i,v in ipairs(content) do 
		scenario.manager:AddContent(v);
	end
end


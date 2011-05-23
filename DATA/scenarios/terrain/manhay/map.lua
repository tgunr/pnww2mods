if(true) then
	-- content we're going to add
	local content = 
	{

-- PLACE ENVIRONMENTAL TERRAIN OBJECTS INTO THE PLAYSPACE
	-- command filename worldx worldy worldz roll pitch yaw scalex scaley scalez damage

	-- Hulked Armoured Vehicles
		

		"place truck_dam_outside 272906.08 3017038.00 480.86 0 -4 45 0 0 0 0",
		"place instance_hulk2_dam 272902.58 3017035.73 480.88 -2 -3 215 0 0 0 0",
		--"place instance_hulk1_dam 292914.06 2976638.86 274.00 0 0 315 0 0 0 0",
		--"place instance_hulk1_dam 293198.80 2976555.09 274.00 0 0 19 0 0 0 0",
		
		
	-- Tank Traps

		
		"place tanktrap 272877.11 3016991.59 481.00 0 0 0 0 0 0 0",
		"place tanktrap 272877.09 3016993.43 481.00 0 0 0 0 0 0 0",
		"place tanktrap 272877.10 3016995.35 481.00 0 0 0 0 0 0 0",
		"place tanktrap 272877.14 3016997.19 481.00 0 0 0 0 0 0 0",
		"place tanktrap 272877.19 3016999.43 481.00 0 0 0 0 0 0 0",
		"place tanktrap 272877.24 3017002.23 481.00 0 0 0 0 0 0 0",
		"place tanktrap 272877.29 3017004.47 481.00 0 0 0 0 0 0 0",
		"place tanktrap 272877.35 3017006.79 481.00 0 0 0 0 0 0 0",
		"place tanktrap 272877.40 3017009.11 481.00 0 0 0 0 0 0 0",
		"place tanktrap 272877.36 3017010.63 481.00 0 0 0 0 0 0 0",
		"place tanktrap 272877.89 3017032.07 481.00 0 0 0 0 0 0 0",
		"place tanktrap 272877.91 3017033.35 481.00 0 0 0 0 0 0 0",
		"place tanktrap 272877.95 3017034.47 481.00 0 0 0 0 0 0 0",
		"place tanktrap 281312.86 3029541.17 307.00 0 0 0 0 0 0 0",
		"place tanktrap 281366.68 3029690.22 307.00 0 0 92 0 0 0 0",
		"place tanktrap 281368.60 3029690.18 307.00 0 0 92 0 0 0 0",
		"place tanktrap 281370.20 3029690.15 307.00 0 0 92 0 0 0 0",
		"place tanktrap 281371.80 3029690.11 307.00 0 0 92 0 0 0 0",
		"place tanktrap 281373.16 3029690.08 307.00 0 0 92 0 0 0 0",
		


	-- Extra Buildings

		--"place truck_dam_outside 281580.50 3029404.40 307.00 -5 -3 260 0 0 0 0",
		"place truck_dam_outside 281580.51 3029400.94 307.00 -5 -3 260 0 0 0 0",
		"place oildrums_outside 281402.65 3029684.11 307.00 0 0 103 0 0 0 0",
		"place oildrums_outside 281414.84 3029681.53 307.00 0 0 148 0 0 0 0",
		"place oildrums_outside 281400.27 3029684.72 307.00 0 0 283 0 0 0 0",
		"place oildrums_outside 281417.50 3029680.96 307.00 0 0 42 0 0 0 200",
		"place truck_dam_outside 281192.91 3029529.49 307.00 0 0 212 0 0 0 0",
		"place crate 272877.68 3017022.13 481.00 0 0 0 0 0 0 0",
		"place crate 272877.72 3017023.49 481.00 0 0 0 0 0 0 0",
		"place crate 281208.43 3029510.07 307.00 0 0 0 0 0 0 0",
		"place crate 281299.01 3029588.97 307.00 0 0 0 0 0 0 0",




		-- MINEFIELD WARNING SIGNS

		--"place dangersign 156.67 60.02 5.7 0 0 110 0 0 0",
		--"place dangersign 152.83 49.54 5.8 0 0 112 0 0 0",
		--"place dangersign 150.37 39.46 6.9 0 0 110 0 0 0",
		--"place dangersign 146.41 22.67 7.8 0 0 110 0 0 0",
		--"place dangersign 154.02 20.63 7.7 0 0 0 0 0 0",
		--"place dangersign 173.21 18.03 7.6 0 0 5 0 0 0",
		--"place dangersign 202.39 17.01 7.2 0 0 5 0 0 0",
		--"place dangersign 230.86 17.78 7.2 0 0 5 0 0 0",
		--"place dangersign 256.56 18.20 6.8 0 0 5 0 0 0",
		--"place dangersign 289.66 19.51 3.7 15 0 5 0 0 0",
		--"place dangersign 125.43 40.20 5.7 0 0 170 0 0 0",
		--"place dangersign 96.23 83.09 6.5 0 10 240 0 0 0",
		--"place dangersign 100.66 74.60 6.2 0 0 235 0 0 0",
		--"place dangersign 107.61 61.40 6.0 0 0 240 0 0 0",
		--"place dangersign 117.95 42.16 5 0 0 240 0 0 0",
		--"place dangersign 109.42 4.50 5.9 0 0 -50 0 0 0",
		--"place dangersign 82.02 -12.05 6 0 0 -40 0 0 0",
		
		-- ROCK WALLS ALONG BOUNDARY

		"place instance_rockwallberm2 281430.71 3029678.04 307.00 0 0 283 0 0 0 0",
		"place instance_rockwallberm2 281473.40 3029668.77 307.00 0 0 283 0 0 0 0",
		"place instance_rockwallberm2 281514.28 3029659.90 307.00 0 0 283 0 0 0 0",
		"place instance_rockwallberm2 281547.45 3029652.67 307.86 0 0 283 0 0 0 0",
		"place instance_rockwallberm2 281566.97 3029628.37 307.00 0 0 347 0 0 0 0",
		"place instance_rockwallberm2 281575.93 3029590.49 307.00 0 0 347 0 0 0 0",
		"place instance_rockwallberm2 281580.87 3029554.51 306.00 0 0 0 0 0 0 0",
		"place instance_rockwallberm2 281580.78 3029519.30 306.00 0 0 0 0 0 0 0",
		"place instance_rockwallberm2 281580.70 3029487.97 306.00 0 0 0 0 0 0 0",
		"place instance_rockwallberm2 281580.64 3029461.15 306.00 0 0 0 0 0 0 0",
		"place instance_rockwallberm2 281580.56 3029432.43 307.00 0 0 0 0 0 0 0",
		"place instance_rockwallberm2 281580.45 3029389.18 307.00 0 0 0 0 0 0 0",
		"place instance_rockwallberm2 281386.18 3029687.79 307.00 0 0 283 0 0 0 0",
		"place instance_rockwallberm2 281336.04 3029267.49 306.30 0 0 270 0 0 0 0",
		"place instance_rockwallberm2 281355.96 3029267.08 306.30 0 0 270 0 0 0 0",
		"place instance_rockwallberm2 281380.11 3029266.54 306.30 0 0 270 0 0 0 0",
		"place instance_rockwallberm2 281407.54 3029265.96 306.30 0 0 270 0 0 0 0",
		"place instance_rockwallberm2 281439.05 3029265.28 306.30 0 0 270 0 0 0 0",
		"place instance_rockwallberm2 281470.93 3029264.59 306.30 0 0 270 0 0 0 0",
		"place instance_rockwallberm2 281498.69 3029264.01 306.30 0 0 270 0 0 0 0",
		"place instance_rockwallberm2 281528.62 3029263.36 306.30 0 0 270 0 0 0 0",
		"place instance_rockwallberm2 281556.61 3029262.76 306.90 0 0 270 0 0 0 0",
		"place instance_rockwallberm2 281141.28 3029489.41 306.30 0 0 180 0 0 0 0",
		"place instance_rockwallberm2 281141.77 3029519.57 306.30 0 0 180 0 0 0 0",
		"place instance_rockwallberm2 281161.84 3029531.83 306.30 0 0 90 0 0 0 0",
		"place instance_rockwallberm2 281180.16 3029531.91 306.30 0 0 90 0 0 0 0",
		"place instance_rockwallberm2 281288.40 3029611.11 306.30 0 0 3 0 0 0 0",
		"place instance_rockwallberm2 281289.50 3029633.16 306.30 0 0 3 0 0 0 0",
		"place instance_rockwallberm2 281290.56 3029654.42 306.30 0 0 3 0 0 0 0",
		"place instance_rockwallberm2 281291.88 3029681.39 306.30 0 0 3 0 0 0 0",
		"place instance_rockwallberm2 281309.51 3029691.59 306.30 0 0 92 0 0 0 0",
		"place instance_rockwallberm2 281333.91 3029691.01 306.30 0 0 92 0 0 0 0",
		"place instance_rockwallberm2 281355.50 3029690.49 306.30 0 0 92 0 0 0 0",
		--"place instance_rockwallberm2 281161.84 3029531.83 306.30 0 0 90 0 0 0 0",
		--"place instance_rockwallberm2 281180.16 3029531.91 306.30 0 0 90 0 0 0 0",
	
		
		-- WALL BLOCKING TOWN

		--"place wall03 132 -83.89 6.8 0 0 21 0 0 0 0",
		--"place wall03 126.2 -81.7 6.8 0 0 21 0 0 0 0",
		--"place wall03 120.5 -79.55 6.8 0 0 21 0 0 0 0",
		--"place sandbagwall_outside 115.09 -77.91 8.0 0 0 -68 0 0 0 0",
		--"place sandbagwall_outside 113.4 -77.16 8.0 0 0 -68 0 0 0 0",
		--"place oildrums_outside 95.27 -27.98 8.3 0 6 0 0 0 0 1",
		--"place wall02 102 -31.5 6.5 0 0 205 0 0 0 0",
		
			
	};
	
	for i,v in ipairs(content) do 
		scenario.manager:AddContent(v);
	end
end


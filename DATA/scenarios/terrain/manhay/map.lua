


if(true) then
	-- content we're going to add
	local content = 
	{
		-- placed objects
		-- command,filename,worldx,worldy,worldz,roll,pitch,yaw,scalex,scaley,scalez,damage

--"place tanktrap 273196.17 3017004.05 481.0 0 0 10 0 0 0 0",
--"place tanktrap 273196.43 3017000.89 481.0 0 0 0 0 0 0 0",
--"place tanktrap 273197.00 3016996.48 481.0 0 0 -10 0 0 0 0",
--"place tanktrap 273197.05 3016992.21 481.0 0 0 5 0 0 0 0",

--"place oildrums_outside 273115.28 3016921.62 480.95 0 0 55 0 0 0 1",
--"place oildrums_outside 273119.68 3016921.62 480.95 0 0 55 0 0 0 1",

--"place crate 273098.30 3016924.39 480.8 0 0 0 0 0 0 0",
--"place crate 273100.15 3016925.18 480.8 0 0 -45 0 0 0 0",

--"place crate 273054.30 3016923.97 480.9 0 0 0 0 0 0 0",
--"place crate 273052.98 3016925.58 480.9 0 0 30 0 0 0 0",

--"place crate 272940.72 3016916.89 480.9 0 0 0 0 0 0 0",

--"place crate 272922.69 3016921.63 480.9 0 0 -25 0 0 0 0",


--"place oildrums_outside 272996.38 3016911.40 480.95 0 0 55 0 0 0 1",

--"place tanktrap 272875.33 3016994.49 480.9 0 0 10 0 0 0 0",
--"place tanktrap 272875.30 3016997.14 480.9 0 0 -20 0 0 0 0",
--"place tanktrap 272875.28 3016999.12 480.9 0 0 -5 0 0 0 0",
--"place tanktrap 272875.24 3017002.75 480.9 0 0 6 0 0 0 0",

--"place crate 272877.79 3017033.62 480.9 0 0 15 0 0 0 0",

--"place tanktrap 272901.43 3017036.69 480.9 0 0 6 0 0 0 0",
--"place tanktrap 272903.89 3017036.68 480.9 0 0 -10 0 0 0 0",
--"place tanktrap 272906.37 3017036.68 480.9 0 0 0 0 0 0 0",

--"place crate 272958.49 3017113.59 480.9 0 0 -25 0 0 0 0",

--"place truck_dam_outside 272996.81 3016997.13 481 0 0 20 0 0 0 0",
--"place oildrums_outside 272994.25 3016993.48 481 0 0 20 0 0 0 1",

--"place instance_hulk1_dam 273049.46 3016997.69 480.8 0 0 60 0 0 0 0",
--"place instance_hulk2_dam 272923.80 3016995.20 480.8 0 0 -80 0 0 0 0",
--"place instance_hulk2_dam 272996.40 3017067.56 480.8 0 0 0 0 0 0 0",


--"place cratepile_outside 272890.65 3016972.55 480.9 0 0 0 0 0 0",
--"place cratepile_outside 273003.29 3016944.88 480.9 0 0 0 0 0 0",
--"place cratepile_outside 273103.79 3017086.31 480.9 0 0 -30 0 0 0",





		-- "place tanktrap -13.00 -153.00 7.78 0 0 -30 0 0 0 0",
		-- "place boarding1 1.08 -141.00 8.55 0 0 105 0 0 0 0",
		-- "place crate -5.00 -134.70 8.33 0 0 0 0 0 0 0",
		-- "place oildrums_outside 12.80 -135.70 8.64 0 0 55 0 0 0 1",
		-- "place truck_dam_outside 24.95 -145.90 8.63 5 0 20 0 0 0 0",
		-- "place sandbagwall_outside 66.50 -147.60 7.91 0 0 110 0 0 0 0",
		-- "place wall03 61.50 -145.00 7.34 0 0 200 0 0 0 0",
		-- "place cratepile_outside 126.50 -31.60 7.83 0 0 200 0 0 0 0",
		-- "place instance_hulk1_dam -14.00 -112.00 8.07 11 10 0 0 0 0 0",
		-- "place ammocrate -26.35 -126.00 8.36 0 0 -5 0 0 0 0",
		-- "place instance_hulk2_dam 107.00 -30.00 7.28 0 5 -120 0 0 0 0",
		-- "place dd_telegraph_07 102.00 -28.00 7.06 5 10 20 0 0 0 0",
		
	};
	
	for i,v in ipairs(content) do 
		scenario.manager:AddContent(v);
	end
end


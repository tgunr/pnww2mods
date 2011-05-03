

if(true) then
	-- content we're going to add
	local content = 
	{
		-- placed objects
		-- command,filename,worldx,worldy,worldz,roll,pitch,yaw,scalex,scaley,scalez,damage
		"place water1 0 0 2 0 0 0 0 0 0 0",
		-- "place bel4 -75.06 -117.81 7.80 0 0 16 0 0 0 1",
		-- "place bel6 -18.38 -147.54 8.28 0 0 200 0 0 0 1",
		-- "place bel6 -10.87 -118.52 8.36 0 0 112 0 0 0 1",
		-- "place bel6 -13.21 -151.75 8.18 0 0 290 0 0 0 1",
		-- "place tanktrap -13.00 -153.00 7.78 0 0 -30 0 0 0 0",
		-- "place tanktrap -14.50 -154.50 7.74 0 0 15 0 0 0 0",
		-- "place boarding1 1.08 -141.00 8.55 0 0 105 0 0 0 0",
		-- "place crate -5.00 -134.70 8.33 0 0 0 0 0 0 0",
		-- "place crate -5.10 -135.00 9.25 0 0 10 0 0 0 0",
		-- "place kr_brg_s_dam 0.00 0.00 0.62 0 0 0 0 0 0 0",
		-- "place bel4 -4.03 -123.47 8.44 0 0 21 0 0 0 0",
		-- "place vinbarn1 14.39 -131.72 8.42 0 0 20 0 0 0 0",
		-- "place brokencart 11.5 -136.5 8.39 0 0 -90 0 0 0 0",
		-- "place crate 8.68 -129.54 8.75 0 0 -70 0 0 0 0",
		


		-- "place brokencart 118.00 -58.00 8.05 0 0 110 0 0 0 0",
		-- "place oildrums_outside 55.5 -144.41 8.5 0 0 -45 0 0 0 0",
		-- "place citybild1 40.19 -138.39 7.93 0 -3 110 0 0 0 1",
		-- "place truck_dam_outside 24.95 -145.90 8.63 5 0 20 0 0 0 0",
		-- "place boarding1 36.25 -149.20 9.04 10 0 -67 0 0 0 0",
		-- "place bel6 40.11 -139.90 8.31 0 3 21 0 0 0 1",
		-- "place sandbagwall_outside 66.50 -147.60 7.91 0 0 110 0 0 0 0",
		-- "place sandbagwall_outside 69.40 -148.61 7.97 0 0 110 0 0 0 0",
		-- "place wall03 61.50 -145.00 7.34 0 0 200 0 0 0 0",
		-- "place wall03 59.00 -144.10 7.33 0 0 20 0 0 0 0",
		-- "place wall03 75.00 -150.00 7.27 0 0 20 0 0 0 0",
		-- "place wall03 80.55 -152.00 7.23 0 0 20 0 0 0 0",
		-- "place wall03 85.75 -153.90 7.25 0 0 200 0 0 0 0",
		-- "place wall03 91.60 -156.00 7.21 0 0 200 0 0 0 0",
		-- "place boarding1 50.60 -154.25 7.58 0 0 20 0 0 0 0",
		
		
		
		
		-- "place citybild1 26.04 -109.09 8.39 0 0 110 0 0 0 0",
		-- "place bel6 41.06 -112.12 8.48 0 0 111 0 0 0 1",
		-- "place bel4 47.75 -123.90 8.42 0 0 18 0 0 0 0",
		"place newcloister 73.94 -92.81 8.36 0 0 22 0 0 0 1",
		"place bel1 18.75 -91.94 8.38 0 0 115 0 0 0 0",
		"place citybild2 27.72 -64.72 8.29 0 0 113 0 0 0 1",
		"place citybild2 50.23 -81.07 8.28 0 0 110 0 0 0 0",
		"place bel6 70.64 -76.45 8.29 0 0 22 0 0 0 1",
		-- "place citybild2 89.24 -131.26 8.22 0 -1 110 0 0 0 1",
		"place bel3 104.11 -133.52 8.18 0 0 200 0 0 0 0",
		"place vinbarn1 92.47 -103.01 8.36 0 0 20 0 0 0 0",
		"place bel6 95.18 -101.24 8.37 0 0 293 0 0 0 1",
		"place citybild2 138.39 -105.39 8.09 3 0 115 0 0 0 1",
		"place bel4 96.99 -64.35 7.96 0 0 19 0 0 0 1",
		"place crate 117.13 -48.03 7.98 0 0 120 0 0 0 0",
		"place crate 110.25 -45.38 8.05 0 0 115 0 0 0 0",
		"place bel3 137.70 -76.21 7.80 0 0 20 0 0 0 0",
		"place boarding1 154.20 -92.90 8.00 0 0 18 0 0 0 0",
		"place sandbagwall_outside 163.00 -85.20 7.46 0 1 -70 0 0 0 0",
		"place sandbagwall_outside 166.00 -86.25 7.37 0 3 -70 0 0 0 0",
		"place sandbagwall_outside 171.50 -86.00 7.51 0 -4 -70 0 0 0 0",
		"place citybild1 187.64 -75.77 6.88 0 0 110 0 0 0 1",
		"place cratepile_outside 183.50 -92.50 6.66 3 7 110 0 0 0 0",
		-- "place oildrums_outside 125.78 -22.59 8.1 0 6 0 0 0 0 1",
		"place truck_dam_outside 186.30 -89.93 6.56 0 6 180 0 0 0 0",
		"place tanktrap 167.00 -85.00 7.55 0 0 0 0 0 0 0",
		"place tanktrap 170.00 -86.93 7.61 0 -9 25 0 0 0 0",
		"place vinbarn1 103.34 -52.47 7.93 0 0 20 0 0 0 0",
		"place wall03 116.40 -54.6 7.15 0 0 -75 0 0 0 0",
		"place bel3 108.03 -48.65 8.01 0 0 290 0 0 0 0",
		"place boarding1 115.45 -29.00 8.28 0 0 110 0 0 0 0",
		"place boarding1 114.40 -32.00 8.54 0 0 110 0 0 0 0",
		"place boarding1 111.80 -39.00 7.55 0 0 110 0 0 0 0",
		"place boarding1 110.65 -42.00 7.96 0 0 110 0 0 0 0",
		"place boarding1 124.80 -32.00 8.02 0 0 110 0 0 0 0",
		"place boarding1 112.70 -36.50 8.25 0 0 109 0 0 0 0",
		-- "place boarding1 2.29 -126.075 8.75 0 0 18 0 0 0 0",




		"place cratepile_outside 126.50 -31.60 7.83 0 0 200 0 0 0 0",
		"place bel1 120.39 -16.04 7.89 0 0 20 0 0 0 1",
		"place sandbagwall_outside 136.25 -21.00 7.59 -5 0 93 0 0 0 0",
		"place sandbagwall_outside 139.50 -22.25 7.58 0 0 -50 0 0 0 0",
		"place sandbagwall_outside 141.00 -26.00 7.50 0 0 0 0 0 0 0",
		"place oildrums_outside 135.50 -23.00 8.08 0 0 30 0 0 0 1",
		"place citybild2 99.74 -29.71 7.68 0 2 113 0 0 0 1",
		"place wall02 87.70 -25.50 6.58 0 0 19 0 0 0 0",
		"place wall02 81.40 -23.30 6.60 0 0 19 0 0 0 0",
		"place wall02 75.20 -21.00 6.52 0 0 19 0 0 0 0",
		"place wall02 71.20 -23.00 6.55 0 0 -75 0 0 0 0",
		"place boarding1 88.60 -31.00 7.66 0 0 -67 0 0 0 0",
		"place boarding1 89.25 -29.00 8.45 15 0 -67 0 0 0 0",
		"place boarding1 90.30 -27.00 8.14 0 0 -67 0 0 0 0",
		"place crate 88.00 -34.30 8.19 0 0 25 0 0 0 0",
		"place crate 90.00 -36.00 8.07 0 0 0 0 0 0 0",
		"place crate 88.00 -42.00 8.07 0 0 0 0 0 0 0",
		"place crate 86.60 -43.20 8.07 0 0 25 0 0 0 0",
		"place bel6 94.01 -44.26 8.15 0 -4 111 0 0 0 1",
		"place crate 78.80 -54.30 8.24 0 0 18 0 0 0 0",
		"place crate 78.60 -58.40 8.03 0 3 25 0 0 0 0",
		"place bel3 89.02 -73.61 8.12 0 0 200 0 0 0 0",
		"place vinbarn1 53.55 -53.11 8.24 0 0 20 0 0 0 0",
		"place bel1 37.09 -53.88 8.03 0 0 200 0 0 0 0",
		"place bel4 29.50 -26.39 7.93 0 0 16 0 0 0 1",
		-- "place citybild2 -8.58 -46.45 8.27 0 0 115 0 0 0 1",
		"place bel1 -3.96 -49.92 -0.75 0 0 20 0 0 0 1",
		-- "place bel6 7.29 -61.58 8.37 0 0 114 0 0 0 1",
		-- "place citybild1 -14.22 -90.11 8.35 0 0 290 0 0 0 0",
		-- "place bel4 -11.69 -94.65 8.46 0 0 106 0 0 0 1",
		-- "place instance_hulk1_dam -14 -108.13 8.25 0 0 30 0 0 0 0",
		-- "place wall01 -19.00 -115.10 7.52 0 0 108 0 0 0 0",
		-- "place crate -26.35 -128.50 8.28 0 0 20 0 0 0 0",
		-- "place crate -26.35 -128.50 9.30 0 0 15 0 0 0 0",
		-- "place ammocrate -26.35 -126.00 8.36 0 0 -5 0 0 0 0",
		-- "place crate -24.5 -133.50 8.35 0 0 20 0 0 0 0",
		-- "place crate -26.55 -132.00 8.40 0 0 15 0 0 0 0",
		-- "place bel6 -26.16 -89.87 7.96 0 0 111 0 0 0 1",
		-- "place oildrums_outside -25.00 -97.00 8.15 0 0 0 0 0 0 1",
		-- "place oildrums_outside -30.00 -106.00 8.22 0 0 30 0 0 0 1",
		-- "place cratepile_outside -22.70 -88.50 8.26 0 0 -70 0 0 0 0",
		-- "place bel3 -25.56 -46.58 8.36 0 0 125 0 0 0 0",
		"place tanktrap 106.74 -33.49 7.3 0 0 0 0 0 0 0",
		"place tanktrap 108.65 -34.12 7.5 0 0 20 0 0 0 0",
		"place tanktrap 110.29 -35.06 7.6 0 0 -10 0 0 0 0",
		"place tanktrap 112.06 -34.00 7.7 0 0 -10 0 0 0 0",
		-- "place sandbagwall_outside 114.50 -25.00 7.41 1 -3 -65 0 0 0 0",
		-- "place sandbagwall_outside 108.50 -22.50 7.09 1 0 -65 0 0 0 0",
		"place instance_hulk2_dam 104.5 -36.35 7.4 0 5 -120 0 0 0 0",
		-- "place bel6 -30.13 -68.99 7.84 0 -2 19 0 0 0 1",
		-- "place bel6 -57.89 -84.67 8.35 0 0 22 0 0 0 1",
		-- "place bel3 -65.45 -101.13 8.26 0 0 20 0 0 0 0",
		-- "place sandbagwall_outside -46.00 -108.00 8.19 0 -1 -70 0 0 0 0",
		-- "place sandbagwall_outside -53.50 -105.30 8.11 0 -1 -70 0 0 0 0",
		-- "place sandbagwall_outside -62.00 -102.00 8.14 7 -1 -70 0 0 0 0",
		-- "place sandbagwall_outside -49.00 -118.00 8.13 0 -1 110 0 0 0 0",
		-- "place sandbagwall_outside -36.80 -116.50 7.71 0 0 113 0 0 0 0",
		-- "place sandbagwall_outside -32.50 -120.50 7.76 2 0 160 0 0 0 0",
		-- "place sandbagwall_outside -31.00 -125.00 7.76 0 0 160 0 0 0 0",
		"place kr_brg_n_dam 0.00 0.00 0.62 0 0 0 0 0 0 0",
		"place instance_hulk2_dam 92.00 -78.00 7.76 -3 5 125 0 0 0 0",
		"place truck_dam_outside 63.93 -53.93 8.15 0 0 0 0 0 0 0",
		-- "place sandbagwall_outside -16.60 -157.00 7.59 5 0 25 0 0 0 0",
		-- "place sandbagwall_outside -12.80 -150.00 7.95 0 -10 20 0 0 0 0",
		-- "place oildrums_outside -59.93 -92.93 8.45 0 0 75 0 0 0 1",
		"place haystack_outside 112.48 -66.75 8.00 0 0 110 0 0 0 0",
		-- "place haystack_outside 107.93 -115.93 8.43 0 0 110 0 0 0 0",
		-- "place haystack_outside 109.93 -109.93 8.52 0 0 110 0 0 0 0",
		"place cratepile_outside 50.93 -40.93 8.21 0 0 0 0 0 0 0",
		-- "place cratepile_outside 46.93 -54.93 7.82 0 0 110 0 0 0 0",
		-- "place cratepile_outside 97.93 -85.93 8.22 0 0 25 0 0 0 0",
		"place crates1c 204.50 -15.50 7.36 0 0 25 0 0 0 0",
		"place cratepile_outside 171.00 -12.00 7.86 0 0 0 0 0 0 0",
		"place cratepile_outside 161.00 -3.00 7.92 0 0 0 0 0 0 0",
		"place sandbagwall_outside 189.00 -24.50 7.43 0 1 -70 0 0 0 0",
		"place sandbagwall_outside 185.00 -22.50 7.47 0 1 -58 0 0 0 0",
		"place sandbagwall_outside 182.40 -19.00 7.52 0 1 -11 0 0 0 0",
		"place sandbagwall_outside 182.00 -15.00 7.48 0 1 0 0 0 0 0",
		"place sandbagwall_outside 180.00 -58.50 7.36 0 1 -50 0 0 0 0",
		"place sandbagwall_outside 175.50 -54.00 7.55 0 1 -25 0 0 0 0",
		"place dd_telegraph_07 102.00 -28.00 7.06 5 10 20 0 0 0 0",
		"place dd_telegraph_07 96.50 -44.00 7.09 0 5 20 0 0 0 0",
		"place dd_telegraph_07 64.00 -128.00 7.81 0 0 20 0 0 0 0",
		"place dd_telegraph_07 -18.00 -40.50 7.23 -3 -2 110 0 0 0 0",
		"place dd_telegraph_07 12.00 -53.50 7.22 0 0 110 0 0 0 0",
		"place dd_telegraph_07 -4.00 -96.00 7.34 0 0 110 0 0 0 0",
		-- "place dd_telegraph_07 -3.00 -123.00 7.46 0 0 20 0 0 0 0",
		-- "place dd_telegraph_07 -81.0 -97.15 8.67 20 77 -25 0 0 0 0",
		-- "place wall03 -67.93 -100.7 8.05 0 0 20 0 0 0 0",
		-- "place tanktrap -80.02 -96.88 7.85 0 5 0 0 0 0 0",
		-- "place tanktrap -78.01 -97.99 7.8 0 0 45 0 0 0 0",
		-- "place tanktrap -75.01 -98.40 8.0 0 -10 0 0 0 0 0",
		"place dd_telegraph_07 42.00 -138.00 8.77 84 60 20 0 0 0 0",
		"place dd_telegraph_07 165.00 -85.00 8 61 70 0 0 0 0 0",
		-- "place instance_rockwallberm1 104.50 -26.25 6.94 0 0 22 0 0 0 0",
		-- "place instance_rockwallberm1 111.00 -10.00 6.79 0 0 22 0 0 0 0",
		"place instance_rockwallberm1 138.00 13.50 7.0 -3 0 105 0 0 0 0",
		"place instance_rockwallberm1 156.00 8.75 7.10 0 0 105 0 0 0 0",
		"place instance_rockwallberm1 174.00 4.00 6.95 0 0 105 0 0 0 0",
		"place instance_rockwallberm1 192.00 -0.75 6.68 0 0 105 0 0 0 0",
		"place instance_rockwallberm1 210.00 -5.40 6.49 0 0 105 0 0 0 0",
		"place instance_rockwallberm1 228.00 -10.00 6.26 0 0 105 0 0 0 0",
		-- "place wall02 -38.00 -34.00 6.54 0 0 160 0 0 0 0",
		-- "place wall02 -42.80 -37.80 6.59 0 0 132 0 0 0 0",
		-- "place wall02 -47.00 -42.80 6.58 0 0 132 0 0 0 0",
		-- "place wall02 -51.25 -48.00 6.58 0 0 125 0 0 0 0",
		-- "place wall02 -54.75 -53.30 6.62 0 0 125 0 0 0 0",
		-- "place wall02 -57.90 -57.80 6.64 0 0 -55 0 0 0 0",
		-- "place instance_rockwallberm1 -18.00 -28.00 6.68 0 2 75 0 0 0 0",
		-- "place instance_rockwallberm1 1.00 -26.25 6.60 0 0 80 0 0 0 0",
		-- "place instance_rockwallberm1 36.00 -20.00 6.43 0 2 260 0 0 0 0",
		"place instance_rockwallberm1 60.00 -24.00 6.82 0 -2 95 0 0 0 0",
		-- "place instance_rockwallberm1 102.50 -153.00 6.11 0 0 60 0 0 0 0",
		-- "place instance_rockwallberm1 131.00 -136.00 6.20 0 0 60 0 0 0 0",
		-- "place instance_rockwallberm1 153.00 -122.00 5.80 0 0 59 0 0 0 0",
		"place instance_rockwallberm1 193.00 -84.00 5.41 0 0 25 0 0 0 0",
		"place instance_rockwallberm1 210.00 -59.00 4.99 0 0 25 0 0 0 0",
		"place instance_rockwallberm1 230.00 -26.00 5.82 2 0 25 0 0 0 0",
		-- "place instance_rockwallberm1 -57.00 -157.00 6.40 0 0 107 0 0 0 0",
		-- "place instance_rockwallberm1 -80.00 -150.00 6.47 0 0 107 0 0 0 0",
		-- "place instance_rockwallberm1 -89.00 -105.00 7.58 0 0 20 0 0 0 0",
		-- "place instance_rockwallberm1 -69.00 -74.00 6.97 0 0 36 0 0 0 0",
		"place windmill1 -235.17 274.79 19.43 0 0 185 0 0 0 0",
		"place vinbarn1 -28.71 272.04 14.50 0 0 180 0 0 0 0",
		"place blumaine1c -6.00 8.00 6.12 0 0 210 0 0 0 0",
		-- "place ammocrate 60.55 -88.75 27.15 0 0 0 0 0 0 0",
		-- "place crate 61.54 -89.90 27.15 0 0 30 0 0 0 0",
		-- "place truck_dam_outside 156.29 -16.3 7.3 -10 -5 0 0 0 0 0",
		-- "place instance_hulk2_dam 31.26 -57.52 8.0 -10 0 -120 0 0 0 0",
		-- "place oildrums_outside 37.89 -147.87 8.2 0 0 0 0 0 0 1",
		-- "place oildrums_outside -82.61 -95.68 8.2 0 0 45 0 0 0 1",

		
		
		
		
		
		




		-- allied hulks near bridge
		"place instance_hulk2_dam 144.60 72.28 6.95 0 -2 30 0 0 0 0",
		"place instance_hulk2_dam 152.80 64.43 2.08 25 -14 -35 0 0 0 0",
		
		 
		
		-- near bridge
		"place tanktrap 142.43 56.22 6.6 15 30 0 0 0 0 0",
		"place tanktrap 137.0 58.5 7.0 -20 0 15 0 0 0 0",
		"place tanktrap 136.20 59.62 6.9 10 0 0 0 0 0",
		"place sandbagwall_curved_outside 132.08 18.19 7.7 0 0 80 0 0 0 0",
		"place ammocrate 135.38 16.71 8.1 0 0 80 0 0 0 0",
		"place crate 135.39 18.43 7.85 -3 -2 -30 0 0 0 0",
		-- minefield signs
		"place dangersign 156.67 60.02 5.7 0 0 110 0 0 0",
		"place dangersign 152.83 49.54 5.8 0 0 112 0 0 0",
		"place dangersign 150.37 39.46 6.9 0 0 110 0 0 0",
		"place dangersign 146.41 22.67 7.8 0 0 110 0 0 0",
		"place dangersign 154.02 20.63 7.7 0 0 0 0 0 0",
		"place dangersign 173.21 18.03 7.6 0 0 5 0 0 0",
		"place dangersign 202.39 17.01 7.2 0 0 5 0 0 0",
		"place dangersign 230.86 17.78 7.2 0 0 5 0 0 0",
		"place dangersign 256.56 18.20 6.8 0 0 5 0 0 0",
		"place dangersign 289.66 19.51 3.7 15 0 5 0 0 0",
		"place dangersign 125.43 40.20 5.7 0 0 170 0 0 0",
		"place dangersign 96.23 83.09 6.5 0 10 240 0 0 0",
		"place dangersign 100.66 74.60 6.2 0 0 235 0 0 0",
		"place dangersign 107.61 61.40 6.0 0 0 240 0 0 0",
		"place dangersign 117.95 42.16 5 0 0 240 0 0 0",
		"place dangersign 109.42 4.50 5.9 0 0 -50 0 0 0",
		"place dangersign 82.02 -12.05 6 0 0 -40 0 0 0",
		
		
		
		
		
		
		
		
		
		
		
		
		-- ALLIED SPAWN
		
		"place cratepile_outside 207.10 141.04 5.3 2 0 30 0 0 0",
		
		-- ROCK WALLS ALONG ROAD
		"place instance_rockwallberm2 196.22 179.71 6.3 0 0 44 0 0 0 0",
		"place instance_rockwallberm2 177.66 162.34 6.3 0 0 44 0 0 0 0",
		"place instance_rockwallberm2 161.36 147.27 6.3 0 0 44 0 0 0 0",
		"place instance_rockwallberm2 148.24 134.07 6.3 0 0 44 0 0 0 0",
		"place instance_rockwallberm1 127.84 115.2 4.6 0 0 44 0 0 0 0",
		"place instance_rockwallberm2 106.26 93.17 4.3 0 4 44 0 0 0 0",
		
		
		"place instance_rockwallberm2 226.66 159.00 3.4 4 0 10 0 0 0 0",
		"place instance_rockwallberm2 222.58 131.44 3.1 -2 0 10 0 0 0 0",
		"place instance_rockwallberm2 214.31 110.05 3.5 -2 0 40 0 0 0 0",
		"place instance_rockwallberm2 198.73 98.92 3.5 -5 0 70 0 0 0 0",
		"place instance_rockwallberm2 181.18 89.42 3.5 -5 0 70 0 0 0 0",
		"place instance_rockwallberm1 158.71 79.64 4.2 5 10 70 0 0 0 0",
		
		-- WALL BLOCKING TOWN
		"place wall03 132 -83.89 6.8 0 0 21 0 0 0 0",
		"place wall03 126.2 -81.7 6.8 0 0 21 0 0 0 0",
		"place wall03 120.5 -79.55 6.8 0 0 21 0 0 0 0",
		"place sandbagwall_outside 115.09 -77.91 8.0 0 0 -68 0 0 0 0",
		"place sandbagwall_outside 113.4 -77.16 8.0 0 0 -68 0 0 0 0",
		"place oildrums_outside 95.27 -27.98 8.3 0 6 0 0 0 0 1",
		"place wall02 102 -31.5 6.5 0 0 205 0 0 0 0",
		
		-- RIVER CROSSING
		"place crate 93.53 2.87 1.5 0 0 55 0 0 0 0",
		"place crate 93.98 1.36 1.5 0 0 80 0 0 0 0",
		"place crate 93.87 -1.68 1.5 0 0 80 0 0 0 0",
		"place ammocrate 93.8 -0.1 1.9 0 0 0 0 0 0 0",
		

		-- "place boarding1 93.92 3.01 2.6 90 0 0 0 0 0 0",
		-- "place boarding1 93.96 1 2.6 90 0 0 0 0 0 0",
		
		
		"place instance_rockwallberm1 86 -16 6.7 -15 -8 60 0 0 0 0",
		"place instance_rockwallberm1 105.46 -3.96 6.7 -10 -5 60 0 0 0 0",
		
	



	
		
		

		
		
		

		
		
		
		
		
		
		
		
	

		




















		
		
		
		
		
	









	};
	
	for i,v in ipairs(content) do 
		scenario.manager:AddContent(v);
	end
end


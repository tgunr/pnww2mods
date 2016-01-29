
-- imported game libs

game.LoadLib("strat");
Include("map");

strat.FindStrat = function(cp, fac)
	if(fac == nil) then fac = "" end
	return strat.StratDB.FindStratObject(cp, fac);
end

strat.UpdateStrat = function(stratObj, country)
	if(stratObj ~= nil) then
		if(country == nil) then country = -1 end
		map.uiMapStratUpdate(stratObj, country, -1);
	end
end

strat.PwnCP = function(country, cp)
	if(type(cp) == "table") then
		for i,v in ipairs(cp) do
			strat.UpdateStrat(strat.FindStrat(v), country);
		end
	elseif(type(cp) == "string") then
		strat.UpdateStrat(strat.FindStrat(cp), country);
	end
end

strat.PwnFac = function(country, cp, fac)
	if(type(fac) == "table") then
		for i,v in ipairs(fac) do
			strat.UpdateStrat(strat.FindStrat(cp, v), country);
		end
	elseif(type(fac) == "string") then
		strat.UpdateStrat(strat.FindStrat(cp, fac), country);
	end
end

strat.PwnStrat = function(country, cp, fac)
	if(fac ~= nil) then
		strat.PwnFac(country, cp, fac);
	else
		strat.PwnCP(country, cp);
	end
end

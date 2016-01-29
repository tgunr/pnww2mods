
-- imported game libs
Include("ui");
game.LoadLib("map");

map.FindMap = function(name)
	return tolua.cast(ui.FindView(name), "SuperCellMapView");
end


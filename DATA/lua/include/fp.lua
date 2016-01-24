
-- imported game libs

game.LoadLib("fp");

fp.fpFPSInput = function(id)
	-- key down
	fp.fpFPSControlInput(1, id, 0);
	-- key up
	fp.fpFPSControlInput(0, id, 0);
end

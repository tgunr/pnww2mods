
-- remove unsued features from the core libs

io 		= nil;
file 	= nil;
os 		= nil;

-- add some common functions

function Include(lib, force)
	if(_G[lib] == nil or force == true) then
		game.RunScript("include/"..lib..".lua");
	end
end

-- add it to the game lib for consistency sake
game.Include = Include; 


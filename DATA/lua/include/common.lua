
-- remove unsued features from the core libs

io 		= nil;
file 	= nil;
os 	= nil;

require 'package';
require 'table';

-- add some common functions

function Include(lib, force)
	if(_G[lib] == nil or force == true) then
		game.RunScript("include/"..lib..".lua");
	end
end

function GameLibLoader(lib)
	return game.Include;
end

-- client and host implement these
function IsClient()
	return true;
end

-- client and host implement these
function IsHost()
	return false;
end

-- add them to the game lib for consistency sake

game.Include = Include;
game.IsClient = IsClient;
game.IsHost = IsHost;

-- this is our fallback require search function
-- allows us to require modules that are loaded
-- from our archives on the client
table.insert(package.loaders, GameLibLoader); 

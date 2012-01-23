
-- common interface between the host and client

-- first we include some stuff 

if IsHost() then
	require 'glue'
	require 'teul'
end

-- should return the current frametime in ms
function FrameTime()
	if IsHost() then
		return teul.time_s
	else
		return game.Frametime()
	end
end

-- are we online or not
-- always true for host
function IsOnline()
	if IsHost() then
		return true
	else
		return game.Online()
	end
end


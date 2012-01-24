
-- common interface between the host and client

-- include some stuff? 

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
	return game.Online()
end


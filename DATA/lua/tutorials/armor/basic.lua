
-- ui and tutorial libs already loaded by tutorial manager
-- imported additional game libs as needed
Include("input");
Include("terrain");
Include("player");
Include("ob");
Include("state");

-- setup tutorial state here
state.name 					= "armor.basic";
state.key					= 1;
state.block 				= nil;
state.onupdate				= "OnGoalIntro";
state.spawn.requires		= nil;
state.spawn.position.x		= -314230.38;
state.spawn.position.y		= 3603625.27;
state.spawn.position.z		= 101.34;
state.spawn.position.yaw	= 1.58;
state.wp 					= nil;
state.firepos				= 3;
state.enablemap				= true;

-- waypoints used
waypoints = 
{
	start 	= 
	{
		x 	= -314230,
		y 	= 3603625,
		z 	= 102,
		r 	= 10
	},
	offroad	= 
	{
		x 	= -314327,
		y 	= 3603708,
		z 	= 102,
		r 	= 10
	},
	gunrange	= 
	{
		x 	= -314286,
		y 	= 3604014,
		z 	= 102,
		r 	= 10
	},
	berm1	= 
	{
		x 	= -314335,
		y 	= 3604030,
		z 	= 104,
		r 	= 10
	},
	berm2	= 
	{
		x 	= -314291,
		y 	= 3604279,
		z 	= 104,
		r 	= 10
	},
	berm3	= 
	{
		x 	= -314250,
		y 	= 3604779,
		z 	= 102,
		r 	= 10
	},
	move 	= 
	{
		x 	= -314270,
		y 	= 3603625,
		z 	= 102,
		r 	= 10
	},
	turn1 	= 
	{
		x 	= -314328,
		y 	= 3603630,
		z 	= 102,
		r 	= 10
	},
	turn2 	=
	{
		x 	= -314332,
		y 	= 3603781,
		z 	= 102,
		r 	= 10
	},
	setup 	= 
	{
		x 	= -314314,
		y 	= 3603765,
		z 	= 102,
		r 	= 10
	},
	fire 	=
	{
		x 	= -314295,
		y 	= 3603795,
		z 	= 103,
		r 	= 3
	},
	turn3 	=
	{
		x 	= -314253,
		y 	= 3603781,
		z 	= 102,
		r 	= 10
	},
	turn4 	=
	{
		x 	= -314234,
		y 	= 3603729,
		z 	= 102,
		r 	= 10
	},
	turn5 	=
	{
		x 	= -314193,
		y 	= 3603691,
		z 	= 101,
		r 	= 10
	},
	stop 	=
	{
		x 	= -314189,
		y 	= 3603632,
		z 	= 101,
		r 	= 10
	},
};

-- include our country specific script
game.RunScript("tutorials/armor/basic."..player.playerGetPlayer():GetCountry()..".lua");

-- set our tutorial state
tutorial.SetState(state);

----------------- helper functions -------------------

function OnAtFirePosition(handler)
	if(handler.state == tutorial.THS_EVENT_IN) then
		tutorial.CompleteStep();
		return 0;
	end
	return 1;
end

function SetBerm(bx1, by1, bx2, by2)
	state.berm1 = {
		x = bx1,
		y = by1
	};
	if(bx2 ~= nil) then
		state.berm2 = {
			x = bx2,
			y = by2
		};
	else
		state.berm2 = nil;
	end
end

function OnHitBerms(handler, to, co, x, y, z)
	if((co.name == "o294" or co.name == "o278_2") and HitBerm(x, y)) then
		if(co.name == "o294") then
			tutorial.CallJS("TutAddLocMessage", "bullseye", "true");
		end
		state.berm = nil;
		tutorial.CompleteStep(1);
	end
	return 1; -- keep handler running
end

function HitBerm(x, y)
	local hit = false;
	if(state.berm1 ~= nil) then
		local diffx = state.berm1.x - x;
		local diffy = state.berm1.y - y;
		if(math.sqrt(diffx*diffx + diffy*diffy) <= 10) then
			hit = true;
		end
	end
	if(not hit and state.berm2 ~= nil) then
		local diffx = state.berm2.x - x;
		local diffy = state.berm2.y - y;
		if(math.sqrt(diffx*diffx + diffy*diffy) <= 10) then
			hit = true;
		end
	end
	return hit;
end

function SetNextWaypoint(name, handler)
	local wp = waypoints[name];
	if(wp ~= nil) then
		state.wp = name;
		tutorial.AddLocation(handler, name, wp.x, wp.y, wp.z, wp.r, name);
	end
end

function OnWaypoint(handler)
	if(handler.state == tutorial.THS_EVENT_IN) then
		tutorial.RemoveWaypoint(state.wp);
		tutorial.CompleteStep(1);
		state.wp = nil;
		return 0;
	end
	return 1;
end

function OnFireWaypoint(handler)
	if(handler.state == tutorial.THS_EVENT_IN) then
		for v = 1,state.firepos do
			local wname = "fire"..v;
			tutorial.RemoveWaypoint(wname);
		end
		tutorial.CompleteStep(1);
		return 0;
	end
	return 1;
end

function OnChainedWaypoint(handler)
	if(handler.state == tutorial.THS_EVENT_IN) then
		tutorial.RemoveWaypoint(state.wp);
		if(state.wp == "turn3") then
			SetNextWaypoint( "turn4", "OnChainedWaypoint");
		elseif(state.wp == "turn4") then
			SetNextWaypoint( "turn5", "OnChainedWaypoint");
		elseif(state.wp == "turn5") then
			SetNextWaypoint( "stop", "OnChainedWaypoint");
		elseif(state.wp == "stop") then
			tutorial.CompleteStep(1);
			state.wp = nil;
		end
		return 0;
	end
	return 1;
end

function AddWaypoint(name)
	local wp = waypoints[name];
	if(wp ~= nil) then
		tutorial.AddWaypoint(name, 1, 0, wp.x, wp.y, wp.z, true, "");
	end
end

function SetTurret(t, tgt, tlt)
	state.turret = 
	{
		index 	= t,
		tmin 	= tgt,
		tmax 	= tlt,
		moved 	= false;
	};
end

function OnMoveTurret(handler, func, param)
	if(state.turret ~= nil and func == input.IMAP_ASX_TURRET_TRAVERSE) then
		state.turret.moved = true;
	end
	return 1; -- keep handler running
end

function DoTurret(handler)
	if(state.turret ~= nil and state.turret.moved) then
		local traverse = player.playerGetPlayer():GetVehicle():GetTraverse(state.turret.index, true);
		if(traverse >= state.turret.tmin and traverse <= state.turret.tmax) then
			state.turret = nil;
			tutorial.CompleteStep(3);
		end
	end
	return 1;
end

function OnTurret(handler)
	local v = player.playerGetPlayer():GetVehicle();
	local t = 1;
	
	local out = "Yaw = "..v:GetYaw().." ";
	out = out .. "Turret = "..v:GetTraverse(t, false).. " ";
	out = out .. "World Turret = "..v:GetTraverse(t, true).. "\n";
	ui.ChatPrint(out);
	return 1;
end


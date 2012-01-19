Include("Instancing")

Instance = InstanceState:create()
InstanceInterface = { __index = Instance }
 
function Instance:create()
	local data = InstanceState:create()
	
	-- string instance id
	data.id = "",
	
	-- our send data callback
	data.sendCallback = nil,
	
	-- our list of players
	data.players = {},
	
	return setmetatable(data, InstanceInterface)
end

function Instance:new(i, s)
	local instance = Instance:create()
	
	-- string instance id
	instance.id = i,
	
	-- our send data callback
	instance.sendCallback = s,
	
	return instance
end

-- string id of instance
function Instance:Id = function()
	return self.id
end

-- number id of instance
function Instance:No = function()
	return tonumber(self.id)
end

-- look up a command by number
function Instance:CommandNumber(cmdName)
	for cNum, cName in ipairs(Instancing.Commands)
	do
		if cName == cmdName then
			return InstanceResult:success(cNum)
		end
	end
	return InstanceResult:failure("No such command "..cmdName..".")
end

-- look up a command by name
function Instance:CommandName(cmdNum)
	for cNum, cName in ipairs(Instancing.Commands)
	do
		if cNum == cmdNum then
			return InstanceResult:success(cName)
		end
	end
	return InstanceResult:failure("No such command "..cmdNum..".")
end


-- sends off a json argument
function Instance:SendCommand(cmdName, ...)
	-- First argument must be a string.
	if type(cmdName) ~= "string" then
		return InstanceResult:failure("Invalid cmd argument - expected string.")
	end
	
	-- Look for the command.
	local lookup = self:CommandNumber(cmdName)
	
	if lookup:IsFailure() then
		return lookup
	end
	
	-- setup our arguments
	local args = {self.id, lookup.data};
	
	-- add all of the arguments as parts.
	for _, val in ipairs(arg)
	do
		if type(val) == "number" then
			table.insert(args, val);
		else
			table.insert(args, string.format('%q', val));
		end
	end
	
	-- send it!
	if self.sendCallback ~= nil then
		self.sendCallback(self.id, json.encode(args))
		return InstanceResult:success("-- data sent, may not actually have been sent yet.")
	else
		return InstanceResult:failure("-- send callback not defined.")
	end
end

-- takes a json argument
function Instance:RecvCommand(data)
	-- Command number argument must be numeric.
	if type(data) ~= "string" then
		return InstanceResult:failure("Invalid ReceiveCommand - expected string")
	end
	
	local args = json.decode(data);
	
	if type(args) ~= "table" then
		return InstanceResult:failure("Invalid ReceiveCommand - unable to parse table")
	end
	
	if args[1] ~= self.id then
		return InstanceResult:failure("Invalid ReceiveCommand - incorrect id")
	end
	
	local id = table.remove(args, 1)
	local cmdNum = tonumber(table.remove(args, 1))
	local lookup = self:CommandName(cmdNum)
	
	if lookup:IsFailure() then
		return InstanceResult:failure("Invalid command number #" .. cmdNum)
	end
	
	-- Name of the command.
	local cmdName = lookup.data
	
	-- get our function
	local fn = self["Recv" .. cmdName]
	
	if not fn then
		return InstanceResult:failure("Could not find registered function Instance."..cmdName..".")
	end
	
	if type(fn) ~= "function" then
		return InstanceResult:failure("Instance."..cmdName.." does not appear to be a function.")
	end
	
	-- debug it
	local dbug = "Invoking "..cmdName.."("
	for i, v in ipairs(args) do dbug = dbug .. tostring(v).." " end
	dbug = dbug .. ")"
	Instancing:report('D', 'ReceiveCommand', dbug)

	-- Invoke the function, passing any remaining args to it.
	local success, output = pcall(fn, self, unpack(args))
	if success == false then
		return InstanceResult:failure(output)
	end
	
	-- Handle case where we return {code, result}
	if type(output) == "table" and output["_result"] == true then
		return output
	else
		return InstanceResult:success(output)
	end
end

function Instance:CreatePlayer(callsign)
	if self.players[callsign] == nil then
		self.players[callsign] = InstancePlayer:new(self, callsign)
	end
end

function Instance:DeletePlayer(callsign)
	if self.players[callsign] ~= nil then
		self.players[callsign] = nil
	end
end

function Instance:GetPlayer(callsign)
	-- ensure the player is created
	self.CreatePlayer(callsign)
	
	-- return it
	return self.players[callsign]
end

--------------------------------------------------------------
-- functions that can be overriden
--------------------------------------------------------------

--------- --------- --------- --------- --------- ---------
-- SetState

function Instance:SetState(valueName, value)
	return self:SendSetState(valueName, value)
end

function Instance:SendSetState(valueName, value)
	return self:SendCommand("SetState", valueName, value)
end

function Instance:RecvSetState(valueName, value)
	return self:ChangeState(valueName, value)
end

--------- --------- --------- --------- --------- ---------
-- Tell thes erver to add a new state value.

function Instance:AddState(valueName, value)
	return self:SendAddState(valueName, value)
end

function Instance:SendAddState(valueName, value)
	return self:SendCommand("AddState", valueName, value)
end

function Instance:RecvAddState(valueName, value)
	local oldValue = self:GetStateNumber(valueName)
	local newValue = oldValue + tonumber(value)
	return self:ChangeState(valueName, newVale)
end

--------- --------- --------- --------- --------- ---------
-- Tell the server to change a state value.

function Instance:KeepAlive(valueName, value)
	return self:SendKeepAlive(valueName, value)
end

function Instance:SendKeepAlive(valueName, value)
	return self:SendCommand("KeepAlive", valueName, value)
end

function Instance:RecvKeepAlive(valueName, value)
	return self:ChangeState(valueName, newVale)
end

--------- --------- --------- --------- --------- ---------
-- Tell the server to do something with a timed event?

function Instance:SetTimer(timerName, duration)
	return self:SendSetTimer(timerName, duration)
end

function Instance:SendSetTimer(timerName, duration)
	return self:SendCommand("SetTimer", timerName, duration)
end

function Instance:RecvSetTimer(timerName, duration)
	return self:ChangeState(timerName, duration)
end

--------- --------- --------- --------- --------- ---------
-- General broadcast - nothing is saved, just relayed

function Instance:BroadcastEvent(valueName, value)
	return self:SendBroadcastEvent(valueName, value)
end

function Instance:SendBroadcastEvent(valueName, value)
	return self:SendCommand("BroadcastEvent", valueName, value)
end

-- no saving, just handle it
function Instance:RecvBroadcastEvent(valueName, value)
	return self:HandleState(valueName, value)
end

--------- --------- --------- --------- --------- ---------
-- Send updated info about myself

function Instance:SetPlayerState(callsign, valueName, value)
	return self:SendSetPlayerState(callsign, valueName, value)
end

function Instance:SendSetPlayerState(callsign, valueName, value)
	return self:SendCommand("SetPlayerState", callsign, valueName, value)
end

function Instance:RecvSetPlayerState(callsign, valueName, value)
	local player = self:GetPlayer(callsign)
	player:SetState(valueName, value)
end

--------- --------- --------- --------- --------- ---------
-- Send incremental info about myself

function Instance:AddPlayerState(callsign, valueName, value)
	return self:SendAddPlayerState(callsign, valueName, value)
end

function Instance:SendAddPlayerState(callsign, valueName, value)
	return self:SendCommand("AddPlayerState", callsign, valueName, value)
end

function Instance:RecvAddPlayerState(callsign, valueName, value)
	local player = self:GetPlayer(callsign)
	player:AddState(valueName, value)
end

--------- --------- --------- --------- --------- ---------
-- Let the instance know about us

function Instance:RegisterClient(callsign)
	return self:SendRegisterClient(callsign)
end

function Instance:SendRegisterClient(callsign)
	return self:SendCommand("RegisterClient", callsign)
end

function Instance:RecvRegisterClient(state, players)
	for k,v in pairs(state)
	do
		-- this will cause handlers to be called, desired?
		self:ChangeState(k, v)
	end
	
	-- set our current list of players
	self.players = players
end


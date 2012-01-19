Include("InstanceState")

InstancePlayer = InstanceState:create()
InstancePlayerInterface = { __index = InstancePlayer }
 
function InstancePlayer:new(i, c)
	local player = InstanceState:create()
	
	player.instance = i
	player.callsign = c
	
	return setmetatable(player, InstancePlayerInterface)
end

--------- --------- --------- --------- --------- ---------
-- Set a state

function InstancePlayer:SetState(valueName, value)
	self:ChangeState(valueName, value)
	self.instance:HandleState("OnPlayer", self.callsign, valueName, value)
	return InstanceResult:success("SetPlayerState success")
end

--------- --------- --------- --------- --------- ---------
-- Add a state

function InstancePlayer:AddState(valueName, value)
	local oldValue = self:GetStateNumber(valueName)
	local newValue = oldValue + tonumber(value)
	return self:SetState(valueName, newValue)
end



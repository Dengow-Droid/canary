local riverTeleport = MoveEvent()

function riverTeleport.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if not player:canFightBoss("The Sandking") then
		player:sendCancelMessage("You need to wait for 10 hours to face this boss again.")
		player:teleportTo(fromPosition)
		return false
	end

	if  player:teleportTo(Position(33479, 32235, 10)) then
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end
	return true
end

riverTeleport:type("stepin")
riverTeleport:aid(5517)
riverTeleport:register()

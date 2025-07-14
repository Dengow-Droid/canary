local lastquest = MoveEvent()

function lastquest.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end
		if player:getLevel() >= 1000 then
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "danger! This area reeks of danger.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You do not have level 1000+ to enter here.")
			player:teleportTo(fromPosition, true)
			end
	return true
end

lastquest:type("stepin")
lastquest:position({x = 33172, y = 31714, z = 13}, {x = 33570, y = 31951, z = 14})
lastquest:register()
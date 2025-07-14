local lastquest = MoveEvent()

function lastquest.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end
		if player:getLevel() >= 1000 then
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "danger! This area reeks of danger.")
			player:teleportTo(Position(33861, 32413, 6))
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You do not have level 1000+ to enter here.")
			player:teleportTo(fromPosition, true)
			end
	return true
end

lastquest:type("stepin")
lastquest:position({x = 33281, y = 31845, z = 8})
lastquest:register()
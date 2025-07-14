local exithunt = MoveEvent()
function exithunt.onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
	if not player then
		return true
	end
	
	player:teleportTo(Position(33281, 31844, 8))
	return true
end

exithunt:type("stepin")
exithunt:position({x = 33862, y = 32413, z = 6})
exithunt:register()
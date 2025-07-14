local portalsCookQuest = MoveEvent()
function portalsCookQuest.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end
	
	player:setStorageValue(Storage.Quest.U12_30.FeasterOfSouls.DesporKilled, -1)
	--player:teleportTo(Position(33266, 31425, 15))
end

portalsCookQuest:type("stepin")
portalsCookQuest:position({ x = 33266, y = 31427, z = 15 })
portalsCookQuest:register()
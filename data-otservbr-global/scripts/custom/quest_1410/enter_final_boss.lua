local storagesTable = {
	{ storage = Storage.Quest.U12_30.FeasterOfSouls.gralvalonKilled, bossName = "gralvalon" },
	{ storage = Storage.Quest.U12_30.FeasterOfSouls.malvarothKilled, bossName = "malvaroth" },
	{ storage = Storage.Quest.U12_30.FeasterOfSouls.twisterrorKilled, bossName = "twisterror" },
}

local portalQuest = MoveEvent()
function portalQuest.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end
	player:teleportTo(Position(34056, 32400, 14))
	local text = ""
	for value in pairs(storagesTable) do
		if player:getStorageValue(storagesTable[value].storage) < 0 then
			text = text .. "\n" .. storagesTable[value].bossName
		end
	end
	if text == "" then
		return true
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You still need to defeat:" .. text)
		player:teleportTo(fromPosition, true)
		return false
	end
end

portalQuest:type("stepin")
portalQuest:position({ x = 33876, y = 32401, z = 10 })
portalQuest:register()
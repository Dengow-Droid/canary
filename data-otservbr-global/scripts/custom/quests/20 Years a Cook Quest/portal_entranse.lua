local storagesTable = {
	{ storage = Storage.Quest.U12_30.FeasterOfSouls.MalizKilled, bossName = "Maliz" },
	{ storage = Storage.Quest.U12_30.FeasterOfSouls.VengarKilled, bossName = "Vengar" },
	{ storage = Storage.Quest.U12_30.FeasterOfSouls.BrutonKilled, bossName = "Bruton" },
	{ storage = Storage.Quest.U12_30.FeasterOfSouls.GreedokKilled, bossName = "Greedok" },
	{ storage = Storage.Quest.U12_30.FeasterOfSouls.VilearKilled, bossName = "Vilear" },
	{ storage = Storage.Quest.U12_30.FeasterOfSouls.CrultorKilled, bossName = "Crultor" },
	{ storage = Storage.Quest.U12_30.FeasterOfSouls.DesporKilled, bossName = "Despor" },
}

local portalCookQuest = MoveEvent()
function portalCookQuest.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end
	player:teleportTo(Position(33266, 31425, 15))
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

portalCookQuest:type("stepin")
portalCookQuest:position({ x = 33265, y = 31415, z = 15 })
portalCookQuest:register()
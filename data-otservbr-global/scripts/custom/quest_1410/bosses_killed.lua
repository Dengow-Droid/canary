local bosses = {
	["gralvalon"] = { storage = Storage.Quest.U12_30.FeasterOfSouls.gralvalonKilled },
	["malvaroth"] = { storage = Storage.Quest.U12_30.FeasterOfSouls.malvarothKilled },
	["twisterror"] = { storage = Storage.Quest.U12_30.FeasterOfSouls.twisterrorKilled },
	["arbaziloth"] = { storage = Storage.Quest.U12_30.FeasterOfSouls.arbazilothKilled },
}

local bossesQuest = CreatureEvent("QuestBossDeath")
function bossesQuest.onDeath(creature)
	local bossConfig = bosses[creature:getName():lower()]
	if not bossConfig then
		return true
	end
	onDeathForDamagingPlayers(creature, function(creature, player)
		if bossConfig.storage then
			player:setStorageValue(bossConfig.storage, 1)
		end
	end)
	return true
end

bossesQuest:register()
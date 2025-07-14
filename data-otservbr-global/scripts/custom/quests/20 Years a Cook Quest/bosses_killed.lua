local bosses = {
	["maliz"] = { storage = Storage.Quest.U12_30.FeasterOfSouls.MalizKilled },
	["vengar"] = { storage = Storage.Quest.U12_30.FeasterOfSouls.VengarKilled },
	["bruton"] = { storage = Storage.Quest.U12_30.FeasterOfSouls.BrutonKilled },
	["greedok"] = { storage = Storage.Quest.U12_30.FeasterOfSouls.GreedokKilled },
	["vilear"] = { storage = Storage.Quest.U12_30.FeasterOfSouls.VilearKilled },
	["crultor"] = { storage = Storage.Quest.U12_30.FeasterOfSouls.CrultorKilled },
	["despor"] = { storage = Storage.Quest.U12_30.FeasterOfSouls.DesporKilled },
}

local bossesCookQuest = CreatureEvent("CookQuestBossDeath")
function bossesCookQuest.onDeath(creature)
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

bossesCookQuest:register()
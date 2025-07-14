local table = 
{
	-- [level] = type = "item", id = {ITEM_ID, QUANTITY}, msg = "MESSAGE"},
	-- [level] = type = "bank", id = {QUANTITY, 0}, msg = "MESSAGE"},
	-- [level] = type = "addon", id = {ID_ADDON_FEMALE, ID_ADDON_MALE}, msg = "MESSAGE"},
	-- [level] = type = "coin", id = {QUANTITY, 0}, msg = "MESSAGE"},
	-- [level] = type = "mount", id = {ID_MOUNT, 0}, msg = "MESSAGE"},

	[20] = {type = "item", id = {3043, 2}, msg = "You win 2 crystal coins for reach the level 20!"},
	[50] = {type = "item", id = {3043, 5}, msg = "You win 2 crystal coins for reach the level 50!"},
	[400] = {type = "addon", id = {1576, 1575}, msg = "You win the addon Fencer full for reach the level 400!"},
	[100] = {type = "item", id = {3043, 10}, msg = "You win 5 crystal coins for reach the level 100!"},
	[600] = {type = "mount", id = {73, 0}, msg = "You win the mount Black Stag!"},
	[1000] = {type = "item", id = {60312, 1}, msg = "You win roullete scroll for reach the level 1000!"},
	[200] = {type = "item", id = {60311, 1}, msg = "You win roullete scroll for reach the level 200!"},
	[450] = {type = "item", id = {60311, 1}, msg = "You win roullete scroll for reach the level 450!"},
	[650] = {type = "item", id = {60311, 1}, msg = "You win roullete scroll for reach the level 650!"},
	[800] = {type = "item", id = {60311, 1}, msg = "You win roullete scroll for reach the level 800!"},
}

local storage = 15000

local levelReward = CreatureEvent("LevelReward")
function levelReward.onAdvance(player, skill, oldLevel, newLevel)

	if skill ~= SKILL_LEVEL or newLevel <= oldLevel then
		return true
	end

	for level, _ in pairs(table) do
		if newLevel >= level and player:getStorageValue(storage) < level then
			if table[level].type == "item" then	
				player:addItem(table[level].id[1], table[level].id[2])
			elseif table[level].type == "bank" then
				player:setBankBalance(player:getBankBalance() + table[level].id[1])
			elseif table[level].type == "addon" then
				player:addOutfitAddon(table[level].id[1], 3)
				player:addOutfitAddon(table[level].id[2], 3)
			elseif table[level].type == "coin" then
				player:addTibiaCoins(table[level].id[1])
			elseif table[level].type == "mount" then
				player:addMount(table[level].id[1])
			else
				return false
			end

			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, table[level].msg)
			player:setStorageValue(storage, level)
		end
	end

	player:save()

	return true
end

levelReward:register()
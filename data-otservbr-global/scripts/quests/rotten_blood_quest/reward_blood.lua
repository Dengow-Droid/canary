local rewards = {
    {id = 43895, name = "bag you covet"}
}

local outfits = { 1322, 1323 }

local function addOutfits(player)
	if player:getStorageValue(Storage.Quest.U12_40.SoulWar.OutfitReward) < 0 then
		player:addOutfit(outfits[1], 0)
		player:addOutfit(outfits[2], 0)
		player:setStorageValue(Storage.Quest.U12_40.SoulWar.OutfitReward, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Congratulations you received the Revenant Outfit.")
	end
end

local rewardSoulWar = Action()
function rewardSoulWar.onUse(creature, item, fromPosition, target, toPosition, isHotkey)
	local randId = math.random(1, #rewards)
	local rewardItem = rewards[randId]
	local player = creature:getPlayer()
	if not player then
		return false
	end
	if player:getStorageValue(Storage.Quest.U12_40.SoulWar.BloodReward) < 0 then
		player:addItem(rewardItem.id, 1)
		player:addMount(216)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found a ' .. rewardItem.name .. ' and mount Darkfire Devourer.')
		player:setStorageValue(Storage.Quest.U12_40.SoulWar.BloodReward, 1)
		return true
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have already collected your reward')
		return false
	end
end

rewardSoulWar:position({x = 34087, y = 32047, z = 13})
rewardSoulWar:register()

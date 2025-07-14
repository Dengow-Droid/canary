local rewards = {
	[1310] = 60289,
	[1311] = 60288,
}

local chestRewards = Action()
function chestRewards.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(Storage.Quest.U8_2.TheInquisitionQuest.ChestReward) < 1 then
		player:setStorageValue(Storage.Quest.U8_2.TheInquisitionQuest.ChestReward, 1)
		player:addItem(rewards[item.uid], 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found " .. ItemType(rewards[item.uid]):getName() .. ".")
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
	end
	return true
end

for uniqueId, info in pairs(rewards) do
	chestRewards:uid(uniqueId)
end

chestRewards:register()
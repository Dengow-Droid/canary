local rewards = {
	[13001] = 49520,
	[13002] = 49522,
	[13003] = 49523,
	[13004] = 49524,
	[13005] = 49525,
	[13006] = 49526,
	[13007] = 49527,
	[13008] = 49530,
	[13009] = 49528,
	[13010] = 49529,
}

local QuestRewards = Action()
function QuestRewards.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(Storage.Quest.U8_2.TheInquisitionQuest.QuestReward) < 1 then
		player:setStorageValue(Storage.Quest.U8_2.TheInquisitionQuest.QuestReward, 1)
		player:addItem(rewards[item.uid], 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found " .. ItemType(rewards[item.uid]):getName() .. ".")
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
	end
	return true
end

for uniqueId, info in pairs(rewards) do
	QuestRewards:uid(uniqueId)
end

QuestRewards:register()

local config = {
	storage = 30060, -- Storage para verificar se o jogador pode pegar novamente.
	actionId = 12345, -- action id do baú.
	timeToReward = 1, -- Tempo em horas pra pegar o bau novamente.
	itemsList = {
	
		{id = 60272, count = 1, chance = 95},
		{id = 60284, count = 1, chance = 95}, 
	},
}

local function generateItemList()
	local finalList = {}
	for _, item in ipairs(config.itemsList) do
		local itemRand = math.random(100) -- random chance for each individual item listed in the list
		if itemRand <= item.chance then
			finalList[#finalList + 1] = item -- insert item into a new index of finalList
		end
	end
	return finalList
end

local function getMinutes(seconds)
	return math.floor(seconds/60)
end

local rewardChest = Action()

function rewardChest.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local generateList = generateItemList()
	while #generateList == 0 do
		generateList = generateItemList()
	end

	if player:getStorageValue(config.storage) > os.time() then
		--print(player:getStorageValue(config.storage))
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("You need wait more %d minutes to take this again!", getMinutes(player:getStorageValue(config.storage) - os.time())))
		return false
	end

	for _, item in ipairs(generateList) do
		if player:addItem(item.id, item.count) then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format('Congratulations, you won %d %s(s).', item.count, ItemType(item.id):getName()))
			player:setStorageValue(config.storage, os.time() + config.timeToReward * 60 * 60)
			return true
		end
	end

	return true
end

rewardChest:position({x = 33264, y = 31425, z = 15})
rewardChest:register()

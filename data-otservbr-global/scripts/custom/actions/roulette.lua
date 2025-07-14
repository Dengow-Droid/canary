local config = {
    uniqueId = 30000, -- on lever

    lever = {
        left = 21126,
        right = 21130
    },

    playItem = {
        itemId = 60312,
        count = 1
    },

    rouletteOptions = {
        ignoredItems = {}, -- if you have tables/counters/other items on the roulette tiles, add them here
        winEffects = {CONST_ANI_FIRE, CONST_ME_SOUND_YELLOW, CONST_ME_SOUND_PURPLE, CONST_ME_SOUND_BLUE, CONST_ME_SOUND_WHITE}, -- first effect needs to be distance effect
        effectDelay = 333,
        spinTime = {min = 8, max = 12}, -- seconds
        spinSlowdownRamping = 6,
        rouletteStorage = "roulette-finishes" -- required storage to avoid player abuse (if they logout/die before roulette finishes.. they can spin again for free)
    },

    prizePool = {
        {itemId = 60262, count = {1, 1}, chance = 300 }, -- {itemId = itemid, count = {min, max}, chance = chance/10000} (crystal coins)
        {itemId = 60257, count = {1, 1}, chance = 200 }, -- crown legs
        {itemId = 60272, count = {1, 1}, chance = 1350 }, -- boots of haste
        {itemId = 60284, count = {1, 1}, chance = 2500 }, -- royal helmet
        {itemId = 60306, count = {1, 1}, chance = 3500 }, -- old sudden death rune -- runes are given as stackable items, even tho they have 'charges'
        {itemId = 44621, count = {1, 1}, chance = 2000 }, -- loot seller chest     -- items with 'charges' and have 'showCharges' in items.xml will be given charges
        {itemId = 60249, count = {1, 1}, chance = 3000 }, -- roulette token
        {itemId = 60248, count = {1, 1}, chance = 1000 }, -- golden legs
        {itemId = 60247, count = {1, 1}, chance = 1500 }, -- magic plate armor
        {itemId = 60268, count = {1, 1}, chance = 300 },  -- golden boots
		{itemId = 60267, count = {1, 1}, chance = 300 },  -- golden boots
		{itemId = 60264, count = {1, 1}, chance = 400 },  -- golden boots
		{itemId = 60271, count = {1, 1}, chance = 1000 },  -- golden boots
		{itemId = 8176, count = {1, 1}, chance = 2300 },  -- golden boots
		{itemId = 8153, count = {1, 1}, chance = 2200 },  -- golden boots
		{itemId = 31267, count = {1, 1}, chance = 3200 },  -- golden boots
		{itemId = 22772, count = {1, 1}, chance = 3100 },  -- golden boots
		{itemId = 60311, count = {1, 1}, chance = 3700 },  -- golden boots
		{itemId = 60312, count = {1, 1}, chance = 3600 },  -- golden boots

    },

    roulettePositions = {
	    Position(1292, 1025, 7),
        Position(1291, 1025, 7),
        Position(1290, 1025, 7),
        Position(1289, 1025, 7),
        Position(1288, 1025, 7),
        Position(1287, 1025, 7), -- position 11 in this list is hard-coded to be the reward location, which is the item given to the player
        Position(1286, 1025, 7),
        Position(1285, 1025, 7),
        Position(1284, 1025, 7),
        Position(1283, 1025, 7),
		Position(1282, 1025, 7),
    }
}

local chancedItems = {}

local function resetLever(position)
    local lever = Tile(position):getItemById(config.lever.right)
    lever:transform(config.lever.left)
end

local function broadcast(message)
	for _, targetPlayer in ipairs(Game.getPlayers()) do
		targetPlayer:sendTextMessage(MESSAGE_EVENT_ADVANCE, message)
	end

	return true
end

local function updateRoulette(newItemInfo)
    local positions = config.roulettePositions
    for i = #positions, 1, -1 do
        local item = Tile(positions[i]):getTopVisibleThing()
        if item and item:getId() ~= Tile(positions[i]):getGround():getId() and not table.contains(config.rouletteOptions.ignoredItems, item:getId()) then
            if i ~= 11 then
                item:moveTo(positions[i + 1])
            else
                item:remove()
            end
        end
    end

    if ItemType(newItemInfo.itemId):getCharges() then
        local item = Game.createItem(newItemInfo.itemId, 1, positions[1])
        item:setAttribute(ITEM_ATTRIBUTE_CHARGES, newItemInfo.count)
    else
        Game.createItem(newItemInfo.itemId, newItemInfo.count, positions[1])
    end
end

local function clearRoulette(newItemInfo)
    local positions = config.roulettePositions
    for i = #positions, 1, -1 do
        local item = Tile(positions[i]):getTopVisibleThing()
        if item and item:getId() ~= Tile(positions[i]):getGround():getId() and not table.contains(config.rouletteOptions.ignoredItems, item:getId()) then
            item:remove()
        end

        if newItemInfo == nil then
            positions[i]:sendMagicEffect(CONST_ME_POFF)
        else
            if ItemType(newItemInfo.itemId):getCharges() then
                local item = Game.createItem(newItemInfo.itemId, 1, positions[i])
                item:setAttribute(ITEM_ATTRIBUTE_CHARGES, newItemInfo.count)
            else
                Game.createItem(newItemInfo.itemId, newItemInfo.count, positions[i])
            end
        end
    end
end

local function chanceNewReward()
    local newItemInfo = {itemId = 0, count = 0}
    local rewardTable = {}
    while #rewardTable < 1 do
        for i = 1, #config.prizePool do
            if config.prizePool[i].chance >= math.random(10000) then
                rewardTable[#rewardTable + 1] = i
            end
        end
    end

    local rand = math.random(#rewardTable)
    newItemInfo.itemId = config.prizePool[rewardTable[rand]].itemId
    newItemInfo.count = math.random(config.prizePool[rewardTable[rand]].count[1], config.prizePool[rewardTable[rand]].count[2])
    chancedItems[#chancedItems + 1] = config.prizePool[rewardTable[rand]].chance
    return newItemInfo
end

local function initiateReward(leverPosition, effectCounter)
    if effectCounter < #config.rouletteOptions.winEffects then
        effectCounter = effectCounter + 1
        if effectCounter == 1 then
            config.roulettePositions[11]:sendDistanceEffect(config.roulettePositions[6], config.rouletteOptions.winEffects[1])
            config.roulettePositions[11]:sendDistanceEffect(config.roulettePositions[6], config.rouletteOptions.winEffects[1])
        else
            for i = 1, #config.roulettePositions do
                config.roulettePositions[i]:sendMagicEffect(config.rouletteOptions.winEffects[effectCounter])
            end
        end

        if effectCounter == 2 then
            local item = Tile(config.roulettePositions[6]):getTopVisibleThing()
            local newItemInfo = {itemId = item:getId(), count = item:getCount()}
            clearRoulette(newItemInfo)
        end

        addEvent(initiateReward, config.rouletteOptions.effectDelay, leverPosition, effectCounter)
        return
    end

    resetLever(leverPosition)
end

local function rewardPlayer(playerId, leverPosition)
    local player = Player(playerId)
    if not player then
        return
    end

    local item = Tile(config.roulettePositions[6]):getTopVisibleThing()
    local inbox = player:getInbox()
    if inbox then
        local addedItem = inbox:addItem(item:getId(), 1, INDEX_WHEREEVER, FLAG_NOLIMIT)
        if addedItem and ItemType(item:getId()):getCharges() then
            addedItem:setAttribute(ITEM_ATTRIBUTE_CHARGES, item:getCharges())
        end
    end

    player:sendTextMessage(MESSAGE_STATUS, "Congratulations! You have won " .. item:getName() .. ". The item has been sent to your inbox.")
    player:kv():set(config.rouletteOptions.rouletteStorage, -1)
    player:setMoveLocked(false)
    broadcast(player:getName() .. " has won ".. item:getName() .. " on the roulette!")
end

local function roulette(playerId, leverPosition, spinTimeRemaining, spinDelay)
    local player = Player(playerId)
    if not player then
        resetLever(leverPosition)
        return
    end

    local newItemInfo = chanceNewReward()
    updateRoulette(newItemInfo)

    if spinTimeRemaining > 0 then
        spinDelay = spinDelay + config.rouletteOptions.spinSlowdownRamping
        addEvent(roulette, spinDelay, playerId, leverPosition, spinTimeRemaining - (spinDelay - config.rouletteOptions.spinSlowdownRamping), spinDelay)
        return
    end

    initiateReward(leverPosition, 0)
    rewardPlayer(playerId, leverPosition)
end

local casinoRoulette = Action()

function casinoRoulette.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if item:getId() == config.lever.right then
        player:sendTextMessage(MESSAGE_FAILURE, "Casino Roulette is currently in progress. Please wait.")
        return true
    end

    if player:getItemCount(config.playItem.itemId) < config.playItem.count then
        if player:kv():get(config.rouletteOptions.rouletteStorage) < 1 then
            player:sendTextMessage(MESSAGE_FAILURE, "Casino Roulette requires " .. config.playItem.count .. " " .. (ItemType(config.playItem.itemId):getName()) .. " to use.")
            return true
        end
    end

    item:transform(config.lever.right)
    clearRoulette()
    chancedItems = {}

    player:removeItem(config.playItem.itemId, config.playItem.count)
    player:kv():set(config.rouletteOptions.rouletteStorage, 1)
    player:setMoveLocked(true)

    local spinTimeRemaining = math.random((config.rouletteOptions.spinTime.min * 1000), (config.rouletteOptions.spinTime.max * 1000))
    roulette(player:getId(), toPosition, spinTimeRemaining, 100)
    return true
end

casinoRoulette:uid(config.uniqueId)
casinoRoulette:register()

local callback = EventCallback("disableMovingItemsToRoulettePositions")


function callback.playerOnMoveItem(self, item, count, fromPosition, toPosition, fromCylinder, toCylinder)
    for v, k in pairs(config.roulettePositions) do
        if toPosition == k then
            return false
        end
    end
    return true
end

callback:register()

local rouletteLogout = CreatureEvent("Roulette Logout")

function rouletteLogout.onLogout(player)
    if player:kv():get(config.rouletteOptions.rouletteStorage) == 1 then
        player:sendTextMessage(MESSAGE_FAILURE, "You cannot disconnect while using roulette!")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return false
    end
    return true
end

rouletteLogout:register()
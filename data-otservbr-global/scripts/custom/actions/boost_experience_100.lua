local expscroll = Action()

-- Define the exact XP boost to apply (50%)
local BOOST_XP_VALUE = 100

-- Define storage keys for boost tracking
GameStore = GameStore or {}
GameStore.Storages = GameStore.Storages or {}
GameStore.Storages.expBoostStart = 1000 -- This is where we store the start time of the boost
GameStore.Storages.expBoostCount = 1001 -- Used to check if the boost is already applied

-- Function to apply a 50% XP boost
local function applyXpBoost(player)
    -- Check if a boost is already active
    local currentBoost = player:getStorageValue(GameStore.Storages.expBoostCount) or 0

    -- If a boost is active (i.e. we already have 50% XP boost)
    if currentBoost == 1 then
        local remainingTime = player:getXpBoostTime()
        local minutes = math.floor(remainingTime / 60)
        local seconds = remainingTime % 60
        player:say("You already have an active 100% XP boost. Time left: " .. minutes .. " minutes and " .. seconds .. " seconds.", TALKTYPE_MONSTER_SAY)
        return false -- Exit if a boost is already active
    end

    -- Add exactly 50% XP boost
    local currentXpGain = player:getXpBoostPercent() or 100 -- Get the current XP gain
    player:setXpBoostPercent(currentXpGain + BOOST_XP_VALUE) -- Add 50%

    -- Set the boost duration to 60 minutes (3600 seconds)
    player:setXpBoostTime(3600)

    -- Mark that a 50% XP boost is active
    player:setStorageValue(GameStore.Storages.expBoostCount, 1)

    -- Set the start time for the XP boost
    player:setStorageValue(GameStore.Storages.expBoostStart, os.time())

    return true
end

-- Function to reset XP boost and revert to the player's original XP gain
local function resetXpBoost(player)
    -- Get the player's current XP gain and reduce by 50%
    local currentXpGain = player:getXpBoostPercent() or 100
    player:setXpBoostPercent(currentXpGain - BOOST_XP_VALUE)  -- Reduce by 50% boost

    -- Reset boost time and start time
    player:setXpBoostTime(0)
    player:setStorageValue(GameStore.Storages.expBoostCount, 0) -- Mark that boost is no longer active
    player:setStorageValue(GameStore.Storages.expBoostStart, -1) -- Reset start time

    -- Inform the player
    player:say("Your XP boost has expired. You are back to your previous experience rate.", TALKTYPE_MONSTER_SAY)
end

-- Function to check if XP boost has expired and reset it if necessary
local function checkXpBoostExpiration(player)
    local boostStartTime = player:getStorageValue(GameStore.Storages.expBoostStart)

    -- If no boost has started, skip the check
    if boostStartTime == -1 or boostStartTime == nil then
        return
    end

    -- Calculate how long the boost has been active
    local elapsedTime = os.time() - boostStartTime

    -- If the boost duration has passed (3600 seconds = 60 minutes), reset the boost
    if elapsedTime >= 3600 then
        resetXpBoost(player)
    end
end

-- Main function for using XP scroll
function expscroll.onUse(player, item, fromPosition, itemEx, toPosition)
    -- Check if the boost should be reset first
    checkXpBoostExpiration(player)

    -- Apply the XP boost if no other boost is active
    if applyXpBoost(player) then
        item:remove(1) -- Remove the scroll after use
    end

    return true -- XP boost successfully applied
end

-- Register action for XP scroll
expscroll:id(8176)
expscroll:register()

-- Check and apply boost when the player logs in
local login = CreatureEvent("onLogin")
function login.onLogin(player)
    checkXpBoostExpiration(player) -- Check if the boost has expired at login
    return true
end
login:register()

-- Periodically check if XP boost has expired during the game
function onThink(interval)
    local players = Game.getPlayers() -- Get all online players
    for _, player in ipairs(players) do
        checkXpBoostExpiration(player) -- Check if the XP boost has expired for each player
    end
    return true
end
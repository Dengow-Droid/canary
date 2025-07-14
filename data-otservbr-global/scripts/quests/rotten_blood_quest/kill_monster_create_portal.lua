local settings = {
    portalId = 22761,

    monsters = {
        ["bakragore"] = {
            creationMessage = "The bakragore soul generated a portal!",
            portalPosition = Position(33043, 32396, 15),
            destinationPosition = Position(34090, 32049, 13),
            durationInSeconds = 60,
        },
    },
}

local function initiateCountdown(timeLeft, portalPosition)
    local spectators = Game.getSpectators(portalPosition, false, false, 5, 5, 5, 5)
    for _, spectator in ipairs(spectators) do
        if timeLeft > 1 then
            spectator:say(string.format("%d", timeLeft), TALKTYPE_MONSTER_SAY, false, spectator, portalPosition)
        else
            spectator:say("Time's up!", TALKTYPE_MONSTER_SAY, false, spectator, portalPosition)
            break
        end
    end

    local portal = Tile(portalPosition):getItemById(settings.portalId)
    if portal then
        addEvent(initiateCountdown, 1000, timeLeft - 1, portalPosition)
    end
end

local function destroyPortal(portalPosition)
    local portal = Tile(portalPosition):getItemById(settings.portalId)
    if portal then
        portal:remove()
    end
end

local portalOnMonsterDeath = CreatureEvent("PortalOnMonsterDeath")

function portalOnMonsterDeath.onDeath(creature, corpse, killer, mostDamageKiller, lastHitUnjustified, mostDamageUnjustified)
    local monster = creature:getMonster()
    if not monster then
        return true
    end

    local monsterName = monster:getName():lower()
    local configuration = settings.monsters[monsterName]
    if not configuration then
        return true
    end

    local portalPosition = configuration.portalPosition
    if Tile(portalPosition):getItemById(settings.portalId) then
        return true
    end

    local portal = Game.createItem(settings.portalId, 1, portalPosition)
    if portal:isTeleport() then
        portal:setDestination(configuration.destinationPosition)
    end

    monster:say(configuration.creationMessage, TALKTYPE_MONSTER_SAY)

    addEvent(initiateCountdown, 500, configuration.durationInSeconds, portalPosition)
    addEvent(destroyPortal, configuration.durationInSeconds * 1000, portalPosition)
    return true
end

portalOnMonsterDeath:register()

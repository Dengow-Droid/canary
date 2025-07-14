local config = {
	[1] = {
		teleportPosition = { x = 33399, y = 32658, z = 3 },
		bossName = "Guard Captain Quaid",
		requiredLevel = 250,
		timeToFightAgain = 10, -- In hour
		timeToDefeat = 10, -- In minutes
		destination = Position(33398, 32658, 3),
		bossPosition = Position(33393, 32665, 3),
		specPos = {
			from = Position(33386, 32653, 3),
			to = Position(33399, 32667, 3),
		},
		exitPosition = Position(33403, 32658, 3),
	},
	[2] = {
		teleportPosition = { x = 33389, y = 32674, z = 4 },
		bossName = "Gaffir",
		requiredLevel = 250,
		timeToFightAgain = 10, -- In hour
		timeToDefeat = 10, -- In minutes
		destination = Position(33390, 32674, 4),
		bossPosition = Position(33396, 32669, 4),
		specPos = {
			from = Position(33389, 32667, 4),
			to = Position(33399, 32682, 4),
		},
		exitPosition = Position(33385, 32680, 4),
	},
	[3] = {
		teleportPosition = { x = 33386, y = 32825, z = 8 },
		bossName = "Custodian",
		requiredLevel = 250,
		timeToFightAgain = 10, -- In hour
		timeToDefeat = 10, -- In minutes
		destination = Position(33385, 32825, 8),
		bossPosition = Position(33368, 32824, 8),
		specPos = {
			from = Position(33366, 32815, 8),
			to = Position(33386, 32836, 8),
		},
		exitPosition = Position(33390, 32824, 8),
	},
	[4] = {
		teleportPosition = { x = 33387, y = 32666, z = 3 },
		exitPosition = Position(33403, 32658, 3),
	},
	[5] = {
		teleportPosition = { x = 33397, y = 32668, z = 4 },
		exitPosition = Position(33385, 32680, 4),
	},
	[6] = {
		teleportPosition = { x = 33369, y = 32819, z = 8 },
		exitPosition = Position(33390, 32824, 8),
	},
}

local teleportBoss = MoveEvent()
function teleportBoss.onStepIn(creature, item, position, fromPosition)
	if not creature or not creature:isPlayer() then
		return false
	end
	for index, value in pairs(config) do
		if Tile(position) == Tile(value.teleportPosition) then
			if not value.specPos then
				creature:teleportTo(value.exitPosition)
				creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				return true
			end
			local spec = Spectators()
			spec:setOnlyPlayer(false)
			spec:setRemoveDestination(value.exitPosition)
			spec:setCheckPosition(value.specPos)
			spec:check()
			if spec:getPlayers() > 0 then
				creature:teleportTo(fromPosition, true)
				creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				creature:say("There's someone fighting with " .. value.bossName .. ".", TALKTYPE_MONSTER_SAY)
				return true
			end
			if creature:getLevel() < value.requiredLevel then
				creature:teleportTo(fromPosition, true)
				creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "All the players need to be level " .. value.requiredLevel .. " or higher.")
				return true
			end
			if not creature:canFightBoss(value.bossName) then
				creature:teleportTo(fromPosition, true)
				creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have to wait " .. value.timeToFightAgain .. " hours to face " .. value.bossName .. " again!")
				return true
			end
			spec:removeMonsters()
			local monster = Game.createMonster(value.bossName, value.bossPosition, true, true)
			if not monster then
				return true
			end
			creature:teleportTo(value.destination)
			creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			creature:setBossCooldown(value.bossName, os.time() + value.timeToFightAgain * 3600)
			addEvent(function()
				spec:clearCreaturesCache()
				spec:setOnlyPlayer(true)
				spec:check()
				spec:removePlayers()
			end, value.timeToDefeat * 60 * 1000)
		end
	end
end

for index, value in pairs(config) do
	teleportBoss:position(value.teleportPosition)
end

teleportBoss:type("stepin")
teleportBoss:register()
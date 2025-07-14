local config = {
	[1] = {
		teleportPosition = { x = 33558, y = 31282, z = 11 },
		bossName = "Jaul",
		requiredLevel = 250,
		timeToFightAgain = 10, -- In hour
		timeToDefeat = 10, -- In minutes
		destination = Position(33545, 31263, 11),
		bossPosition = Position(33544, 31275, 11),
		specPos = {
			from = Position(33528, 31258, 11),
			to = Position(33553, 31282, 11),
		},
		exitPosition = Position(33559, 31283, 11),
	},
	[2] = {
		teleportPosition = { x = 33438, y = 31248, z = 11 },
		bossName = "Obujos",
		requiredLevel = 250,
		timeToFightAgain = 10, -- In hour
		timeToDefeat = 10, -- In minutes
		destination = Position(33419, 31255, 11),
		bossPosition = Position(33439, 31265, 11),
		specPos = {
			from = Position(33413, 31252, 11),
			to = Position(33441, 31275, 11),
		},
		exitPosition = Position(33439, 31248, 11),
	},
	[3] = {
		teleportPosition = { x = 33648, y = 31261, z = 11 },
		bossName = "Tanjis",
		requiredLevel = 250,
		timeToFightAgain = 10, -- In hour
		timeToDefeat = 10, -- In minutes
		destination = Position(33641, 31233, 11),
		bossPosition = Position(33648, 31250, 11),
		specPos = {
			from = Position(33631, 31230, 11),
			to = Position(33655, 31256, 11),
		},
		exitPosition = Position(33647, 31262, 11),
	},
	[4] = {
		teleportPosition = { x = 33545, y = 31262, z = 11 },
		exitPosition = Position(33559, 31283, 11),
	},
	[5] = {
		teleportPosition = { x = 33419, y = 31254, z = 11 },
		exitPosition = Position(33439, 31248, 11),
	},
	[6] = {
		teleportPosition = { x = 33641, y = 31232, z = 11 },
		exitPosition = Position(33647, 31262, 11),
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
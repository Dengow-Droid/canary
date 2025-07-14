local config = {
	[1] = {
		teleportPosition = { x = 33373, y = 31308, z = 7 },
		bossName = "Grand Canon Dominus",
		requiredLevel = 250,
		timeToFightAgain = 10, -- In hour
		timeToDefeat = 10, -- In minutes
		destination = Position(33382, 31292, 7),
		bossPosition = Position(33385, 31280, 6),
		specPos = {
			from = Position(33373, 31276, 6),
			to = Position(33393, 31296, 7),
		},
		exitPosition = Position(33374, 31310, 7),
	},
	[2] = {
		teleportPosition = { x = 33364, y = 31322, z = 5 },
		bossName = "Grand Chaplain Gaunder",
		requiredLevel = 250,
		timeToFightAgain = 10, -- In hour
		timeToDefeat = 10, -- In minutes
		destination = Position(33429, 31336, 5),
		bossPosition = Position(33424, 31336, 5),
		specPos = {
			from = Position(33423, 31333, 5),
			to = Position(33431, 31339, 5),
		},
		exitPosition = Position(33364, 31324, 5),
	},
	[3] = {
		teleportPosition = { x = 33366, y = 31352, z = 3 },
		bossName = "Preceptor Lazare",
		requiredLevel = 250,
		timeToFightAgain = 10, -- In hour
		timeToDefeat = 10, -- In minutes
		destination = Position(33369, 31344, 3),
		bossPosition = Position(33374, 31351, 3),
		specPos = {
			from = Position(33367, 31342, 3),
			to = Position(33379, 31353, 3),
		},
		exitPosition = Position(33365, 31352, 3),
	},
	[4] = {
		teleportPosition = { x = 33372, y = 31319, z = 2 },
		bossName = "Grand Commander Soeren",
		requiredLevel = 250,
		timeToFightAgain = 10, -- In hour
		timeToDefeat = 10, -- In minutes
		destination = Position(33374, 31319, 2),
		bossPosition = Position(33378, 31318, 2),
		specPos = {
			from = Position(33373, 31315, 2),
			to = Position(33380, 31323, 2),
		},
		exitPosition = Position(33371, 31319, 2),
	},
	[5] = {
		teleportPosition = { x = 33380, y = 31290, z = 7 },
		exitPosition = Position(33374, 31310, 7),
	},
	[6] = {
		teleportPosition = { x = 33430, y = 31334, z = 5 },
		exitPosition = Position(33364, 31324, 5),
	},
	[7] = {
		teleportPosition = { x = 33368, y = 31343, z = 3 },
		exitPosition = Position(33365, 31352, 3),
	},
	[8] = {
		teleportPosition = { x = 33374, y = 31316, z = 2 },
		exitPosition = Position(33371, 31319, 2),
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
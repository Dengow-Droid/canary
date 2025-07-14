local config = {
	boss = {
		name = "Greedok",
		position = Position(33268, 31478, 15),
	},
	requiredLevel = 250,
	playerPositions = {
		{ pos = Position(33399, 31483, 15), teleport = Position(33283, 31472, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(33400, 31483, 15), teleport = Position(33283, 31472, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(33401, 31483, 15), teleport = Position(33283, 31472, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(33402, 31483, 15), teleport = Position(33283, 31472, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(33403, 31483, 15), teleport = Position(33283, 31472, 15), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(33264, 31465, 15),
		to = Position(33299, 31496, 15),
	},
	exit = Position(33261, 31417, 15),
}

local lever = BossLever(config)
lever:position(Position(33398, 31483, 15))
lever:register()

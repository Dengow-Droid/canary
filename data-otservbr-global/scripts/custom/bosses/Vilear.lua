local config = {
	boss = {
		name = "Vilear",
		position = Position(33268, 31478, 15),
	},
	requiredLevel = 250,
	playerPositions = {
		{ pos = Position(33346, 31506, 15), teleport = Position(33283, 31472, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(33347, 31506, 15), teleport = Position(33283, 31472, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(33348, 31506, 15), teleport = Position(33283, 31472, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(33349, 31506, 15), teleport = Position(33283, 31472, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(33350, 31506, 15), teleport = Position(33283, 31472, 15), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(33264, 31465, 15),
		to = Position(33299, 31496, 15),
	},
	exit = Position(33261, 31417, 15),
}

local lever = BossLever(config)
lever:position(Position(33345, 31506, 15))
lever:register()
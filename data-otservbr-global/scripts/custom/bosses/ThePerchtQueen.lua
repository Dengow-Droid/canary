local config = {
	boss = {
		name = "The Percht Queen",
		position = Position(33757, 31050, 9),
	},
	requiredLevel = 250,
	playerPositions = {
		{ pos = Position(33790, 31098, 9), teleport = Position(33744, 31061, 8), effect = CONST_ME_TELEPORT },
		{ pos = Position(33790, 31099, 9), teleport = Position(33744, 31061, 8), effect = CONST_ME_TELEPORT },
		{ pos = Position(33790, 31100, 9), teleport = Position(33744, 31061, 8), effect = CONST_ME_TELEPORT },
		{ pos = Position(33790, 31101, 9), teleport = Position(33744, 31061, 8), effect = CONST_ME_TELEPORT },
		{ pos = Position(33790, 31102, 9), teleport = Position(33744, 31061, 8), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(33742, 31047, 8),
		to = Position(33773, 31077, 9),
	},
	exit = Position(33793, 31100, 9),
}

local lever = BossLever(config)
lever:position(Position(33790, 31097, 9))
lever:register()

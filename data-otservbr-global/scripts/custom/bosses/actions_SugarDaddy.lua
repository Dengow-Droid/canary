local config = {
	boss = {
		name = "Sugar Daddy",
		position = Position(33372, 32219, 9),
	},
	requiredLevel = 250,
	playerPositions = {
		{ pos = Position(33372, 32238, 9), teleport = Position(33372, 32232, 9), effect = CONST_ME_TELEPORT },
		{ pos = Position(33372, 32239, 9), teleport = Position(33372, 32232, 9), effect = CONST_ME_TELEPORT },
		{ pos = Position(33372, 32240, 9), teleport = Position(33372, 32232, 9), effect = CONST_ME_TELEPORT },
		{ pos = Position(33372, 32241, 9), teleport = Position(33372, 32232, 9), effect = CONST_ME_TELEPORT },
		{ pos = Position(33372, 32242, 9), teleport = Position(33372, 32232, 9), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(33361, 32215, 9),
		to = Position(33380, 32235, 9),
	},
	exit = Position(33397, 32202, 9),
}

local lever = BossLever(config)
lever:position(Position(33372, 32237, 9))
lever:register()

local config = {
	boss = {
		name = "The Abomination",
		position = Position(32498, 31095, 15),
	},
	requiredLevel = 250,
	playerPositions = {
		{ pos = Position(32533, 31086, 15), teleport = Position(32503, 31078, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(32534, 31086, 15), teleport = Position(32503, 31078, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(32535, 31086, 15), teleport = Position(32503, 31078, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(32536, 31086, 15), teleport = Position(32503, 31078, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(32537, 31086, 15), teleport = Position(32503, 31078, 15), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(32481, 31074, 15),
		to = Position(32508, 31100, 15),
	},
	exit = Position(32535, 31084, 15),
}

local lever = BossLever(config)
lever:position(Position(32532, 31086, 15))
lever:register()

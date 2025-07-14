local config = {
	boss = {
		name = "The Rootkraken",
		position = Position(32625, 32954, 15),
	},
	requiredLevel = 450,
	playerPositions = {
		{ pos = Position(32618, 32909, 15), teleport = Position(32623, 32932, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(32618, 32910, 15), teleport = Position(32623, 32932, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(32618, 32911, 15), teleport = Position(32623, 32932, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(32618, 32912, 15), teleport = Position(32623, 32932, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(32618, 32913, 15), teleport = Position(32623, 32932, 14), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(32611, 32930, 14),
		to = Position(32638, 32961, 15),
	},
	exit = Position(33847, 31984, 11),
}

local lever = BossLever(config)
lever:position(Position(32618, 32908, 15))
lever:register()

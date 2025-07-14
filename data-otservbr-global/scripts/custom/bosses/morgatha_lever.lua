local config = {
	boss = {
		name = "Ancient Spawn Of Morgathla",
		position = Position(33779, 32330, 15),
	},
	requiredLevel = 250,
	playerPositions = {
		{ pos = Position(33760, 32327, 15), teleport = Position(33781, 32348, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(33760, 32328, 15), teleport = Position(33781, 32348, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(33760, 32329, 15), teleport = Position(33781, 32348, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(33760, 32330, 15), teleport = Position(33781, 32348, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(33760, 32331, 15), teleport = Position(33781, 32348, 15), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(33771, 32326, 15),
		to = Position(33789, 32353, 15),
	},
	exit = Position(33757, 32331, 15),
}

local lever = BossLever(config)
lever:position(Position(33760, 32326, 15))
lever:register()

local config = {
	boss = {
		name = "Arbaziloth",
		position = Position(34068, 32332, 14),
	},
	requiredLevel = 1000,
	playerPositions = {
		{ pos = Position(34058, 32396, 14), teleport = Position(34068, 32343, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(34058, 32397, 14), teleport = Position(34068, 32343, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(34058, 32398, 14), teleport = Position(34068, 32343, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(34058, 32399, 14), teleport = Position(34068, 32343, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(34058, 32400, 14), teleport = Position(34068, 32343, 14), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(34059, 32325, 14),
		to = Position(34078, 32345, 14),
	},
	exit = Position(34055, 32398, 14),
}

local lever = BossLever(config)
lever:position(Position(34058, 32395, 14))
lever:register()

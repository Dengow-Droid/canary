local mType = Game.createMonsterType("Goggle Cake")
local monster = {}

monster.description = "a Goggle Cake"
monster.experience = 2700
monster.outfit = {
	lookType = 1740,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 2534
monster.Bestiary = {
	class = "Construct",
	race = BESTY_RACE_CONSTRUCT,
	toKill = 2500,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 0,
	Locations = "Dessert Dungeons.",
}

monster.health = 2700
monster.maxHealth = 2700
monster.race = "blood"
monster.corpse = 48272
monster.speed = 136
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 80,
	targetDistance = 1,
	runHealth = 50,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = true,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Grzzzzzzz!", yell = false },
	{ text = "Kzzzzzzz!", yell = false },
	{ text = "Garrrblarrrrzzzz!", yell = false },
}

monster.loot = {
	{ name = "gold coin", chance = 10500, maxCount = 100 },
	{ name = "platinum coin", chance = 12493, maxCount = 10 },
	{ name = "small enchanted sapphire", chance = 11568, maxCount = 5 },
	{ name = "combat knife", chance = 11765, maxCount = 1 },
	{ name = "great mana potion", chance = 7275, maxCount = 1 },
	{ name = "rainbow quartz", chance = 12382, maxCount = 3 },
	{ name = "small sapphire", chance = 7359, maxCount = 2 },
	{ id = 3039, chance = 7714, maxCount = 1 }, -- red gem
	{ name = "spirit cloak", chance = 7337, maxCount = 1 },
	{ name = "gummy rotworm", chance = 10418, maxCount = 1 },
	{ name = "churro heart", chance = 8675, maxCount = 1 },
	{ name = "glacier amulet", chance = 5942, maxCount = 1 },
	{ name = "milk chocolate coin", chance = 7859, maxCount = 16 },
	{ name = "flour", chance = 12817, maxCount = 1 },
	{ name = "cookie", chance = 13585, maxCount = 2 },
	{ name = "glacier robe", chance = 12533, maxCount = 1 },
	{ name = "epee", chance = 11920, maxCount = 1 },
	{ name = "ice rapier", chance = 7543, maxCount = 1 },
	{ name = "cream cake", chance = 12051, maxCount = 1 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -360 },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 15, minDamage = -240, maxDamage = -320, length = 3, spread = 2, effect = CONST_ME_POISONAREA, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = -190, maxDamage = -340, radius = 3, effect = CONST_ME_HITBYPOISON, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_EARTHDAMAGE, minDamage = -90, maxDamage = -180, length = 8, spread = 3, effect = CONST_ME_GREEN_RINGS, target = false },
}

monster.defenses = {
	defense = 45,
	armor = 28,
	mitigation = 0.94,
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 75, maxDamage = 125, effect = CONST_ME_MAGIC_GREEN, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 20 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 10 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)

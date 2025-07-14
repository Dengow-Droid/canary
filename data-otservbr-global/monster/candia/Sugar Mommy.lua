local mType = Game.createMonsterType("Sugar Mommy")
local monster = {}

monster.description = "Sugar Mommy"
monster.experience = 6800
monster.outfit = {
	lookType = 1764,
	lookHead = 78,
	lookBody = 113,
	lookLegs = 94,
	lookFeet = 18,
	lookAddons = 3,
	lookMount = 0,
}

monster.bosstiary = {
	bossRaceId = 2580,
	bossRace = RARITY_BANE,
}

monster.health = 6000
monster.maxHealth = 6000
monster.race = "blood"
monster.corpse = 48417
monster.speed = 150
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 4,
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
	canPushCreatures = true,
	staticAttackChance = 98,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{ name = "cherry", chance = 11558, maxCount = 2 },
	{ name = "platinum coin", chance = 13115, maxCount = 13 },
	{ name = "milk chocolate coin", chance = 10979, maxCount = 7 },
	{ name = "dark chocolate coin", chance = 8103, maxCount = 5 },
	{ name = "taiyaki ice cream", chance = 10379, maxCount = 1 },
	{ id = 3039, chance = 6314, maxCount = 1 }, -- red gem
	{ name = "yellow gem", chance = 6776, maxCount = 1 },
	{ name = "green gem", chance = 10825, maxCount = 1 },
	{ name = "rainbow quartz", chance = 6228, maxCount = 2 },
	{ name = "dream blossom staff", chance = 7655, maxCount = 1 },
	{ name = "cream cake", chance = 5223, maxCount = 1 },
}

monster.attacks = {
	{ name = "melee", interval = 1000, chance = 100, skill = 150, attack = 280 },
	{ name = "combat", interval = 2000, chance = 12, type = COMBAT_DEATHDAMAGE, minDamage = -900, maxDamage = -1500, length = 8, spread = 0, effect = CONST_ME_MORTAREA, target = false },
	{ name = "combat", interval = 2000, chance = 12, type = COMBAT_DEATHDAMAGE, minDamage = -210, maxDamage = -600, length = 8, spread = 0, effect = CONST_ME_MORTAREA, target = false },
	{ name = "combat", interval = 2000, chance = 12, type = COMBAT_DEATHDAMAGE, minDamage = -210, maxDamage = -600, range = 7, radius = 3, effect = CONST_ME_MORTAREA, target = false },
	{ name = "combat", interval = 2000, chance = 12, type = COMBAT_LIFEDRAIN, minDamage = -1500, maxDamage = -2000, range = 7, radius = 3, effect = CONST_ME_DRAWBLOOD, target = false },
}

monster.defenses = {
	defense = 40,
	armor = 40,
	--	mitigation = ???,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 5 },
	{ type = COMBAT_EARTHDAMAGE, percent = -5 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 20 },
	{ type = COMBAT_HOLYDAMAGE, percent = -5 },
	{ type = COMBAT_DEATHDAMAGE, percent = 10 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)

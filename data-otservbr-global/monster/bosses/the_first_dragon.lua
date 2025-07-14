local mType = Game.createMonsterType("The First Dragon")
local monster = {}

monster.description = "the first dragon"
monster.experience = 2900000
monster.outfit = {
	lookType = 947,
	lookHead = 94,
	lookBody = 80,
	lookLegs = 101,
	lookFeet = 79,
	lookAddons = 3,
	lookMount = 0,
}

monster.health = 5000000
monster.maxHealth = 5000000
monster.race = "blood"
monster.corpse = 25065
monster.speed = 475
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 0,
}

monster.bosstiary = {
	bossRaceId = 1368,
	bossRace = RARITY_NEMESIS,
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = true,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
}

monster.events = {
	"FirstDragonDeath",
}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 420, attack = 530 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -410, maxDamage = -695, range = 5, radius = 5, effect = CONST_ME_FIREAREA, target = true },
	{ name = "speed", interval = 2000, chance = 20, speedChange = -600, radius = 7, effect = CONST_ME_MAGIC_RED, target = false, duration = 10000 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -1010, maxDamage = -1995, length = 9, spread = 3, effect = CONST_ME_FIREAREA, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -410, maxDamage = -1595, radius = 7, effect = CONST_ME_HITBYFIRE, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_LIFEDRAIN, minDamage = -150, maxDamage = -1280, radius = 6, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "combat", interval = 2000, chance = 35, type = COMBAT_ICEDAMAGE, minDamage = -400, maxDamage = -2750, range = 7, shootEffect = CONST_ANI_SHIVERARROW, effect = CONST_ME_ICEATTACK, target = true },
	{ name = "quarasmallicering", interval = 2000, chance = 35 },
	{ name = "podzillaphyschain", interval = 2000, chance = 35 },
	{ name = "quaracrossdeath", interval = 2000, chance = 20, minDamage = -1100, maxDamage = -5700, target = false },
	{ name = "quarasmokedeath", interval = 2000, chance = 20, minDamage = -850, maxDamage = -7150, target = false },
	{ name = "quaralargeicering", interval = 2000, chance = 20, minDamage = -1250, maxDamage = -3400, target = false },
	{ name = "quararaidershoot", interval = 2000, chance = 35, minDamage = -650, maxDamage = -2900, range = 7, target = true },
	{ name = "quarawatersplash", interval = 2000, chance = 18, minDamage = -1350, maxDamage = -2600, target = false },
	{ name = "quaraseamonster", interval = 2000, chance = 18, minDamage = -1350, maxDamage = -3600, target = false },
}

monster.defenses = {
	defense = 64,
	armor = 52,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 1500, maxDamage = 4500, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)

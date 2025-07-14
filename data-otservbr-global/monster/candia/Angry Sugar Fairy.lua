local mType = Game.createMonsterType("Angry Sugar Fairy")
local monster = {}

monster.description = "an Angry Sugar Fairy"
monster.experience = 3100
monster.outfit = {
	lookType = 1747,
	lookHead = 55,
	lookBody = 101,
	lookLegs = 55,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 2552
monster.Bestiary = {
	class = "Fey",
	race = BESTY_RACE_FEY,
	toKill = 2500,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 0,
	Locations = "Dessert Dungeons, Candy Carnival.",
}

monster.health = 3000
monster.maxHealth = 3000
monster.race = "blood"
monster.corpse = 48341
monster.speed = 105
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
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
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 80,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = true,
	isPreyExclusive = true,
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
	{ name = "platinum coin", chance = 8512, maxCount = 11 },
	{ name = "small enchanted emerald", chance = 7076, maxCount = 2 },
	{ name = "wild flowers", chance = 8987, maxCount = 1 },
	{ name = "small enchanted sapphire", chance = 9092, maxCount = 4 },
	{ name = "green crystal splinter", chance = 10852, maxCount = 1 },
	{ name = "violet crystal shard", chance = 12928, maxCount = 1 },
	{ name = "small enchanted ruby", chance = 10186, maxCount = 3 },
	{ name = "wand of cosmic energy", chance = 8116, maxCount = 1 },
	{ name = "white pearl", chance = 13330, maxCount = 3 },
	{ name = "prismatic quartz", chance = 11870, maxCount = 1 },
	{ name = "ruby necklace", chance = 12094, maxCount = 1 },
	{ name = "wafer paper flower", chance = 12405, maxCount = 1 },
	{ name = "spellbook of enlightenment", chance = 10419, maxCount = 1 },
	{ name = "butterfly ring", chance = 9998, maxCount = 1 },
	{ name = "milk chocolate coin", chance = 7761, maxCount = 10 },
	{ id = 3098, chance = 8573, maxCount = 1 }, -- ring of healing
	{ name = "hibiscus dress", chance = 7921, maxCount = 1 },
	{ id = 3040, chance = 1573, maxCount = 1 }, -- ring of healing
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -150 },
	{ name = "speed", interval = 4000, chance = 20, speedChange = -350, range = 7, shootEffect = CONST_ANI_POISON, target = true, duration = 12000 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -80, maxDamage = -100, range = 7, shootEffect = CONST_ANI_POISON, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_EARTHDAMAGE, minDamage = -50, maxDamage = -100, length = 8, spread = 0, effect = CONST_ME_POISONAREA, target = false },
}

monster.defenses = {
	defense = 35,
	armor = 38,
	mitigation = 0.99,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 250, maxDamage = 400, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = -10 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 20 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 20 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)

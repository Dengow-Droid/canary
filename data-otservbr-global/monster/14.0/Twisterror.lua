local mType = Game.createMonsterType("Twisterror")
local monster = {}

monster.description = "a Twisterror"
monster.experience = 2500000
monster.outfit = {
	lookType = 1792,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 1,
	lookMount = 0,
}

monster.bosstiary = {
	bossRaceId = 2605,
	bossRace = RARITY_BANE,
}

monster.events = {
	"QuestBossDeath"
}

monster.health = 135000
monster.maxHealth = 135000
monster.race = "blood"
monster.corpse = 50039
monster.speed = 480
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
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = true,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.summon = {
	maxSummons = 8,
	summons = {
		{ name = "spellreaper inferniarch", chance = 100, interval = 2000, count = 8 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "CHA..RAK!", yell = true },
	
}

monster.loot = {
	{ id = 3035, chance = 50000, maxCount = 20 }, -- platinum coin
	{ name = "fire mushroom", chance = 19660, maxCount = 6 },
	{ id = 238, chance = 19600, maxCount = 2 }, -- great mana potion
	{ id = 3033, chance = 13000, maxCount = 10 }, -- small amethyst
	{ id = 3028, chance = 13900, maxCount = 10 }, -- small diamond
	{ name = "giant amethyst", chance = 2325, maxCount = 1 },
	{ name = "giant emerald", chance = 3681, maxCount = 1 },
	{ name = "giant ruby", chance = 3841, maxCount = 1 },
	{ name = "giant sapphire", chance = 3847, maxCount = 1 },
	{ id = 16125, chance = 3900, maxCount = 10 }, -- Cyan Crystal Fragment
	{ id = 3030, chance = 12000, maxCount = 25 }, -- small ruby
	{ id = 24962, chance = 12900, maxCount = 1 }, -- prismatic quartz
	{ id = 49909, chance = 5300, maxCount = 1 }, -- demonic core essence
	{ id = 49890, chance = 3000 }, -- skin of Twisterror
	{ id = 49893, chance = 11600 }, -- demonic matter
	{ id = 3027, chance = 11800 }, -- black pearl
	{ name = "wand of inferno", chance = 12560 },
	{ id = 818, chance = 11500 }, -- magma boots
	{ id = 821, chance = 11200 }, -- magma legs
	{ id = 8074, chance = 11900 }, -- spellbook of mind control
	{ id = 49908, chance = 5800 }, -- mummified demon finger
	
}

monster.attacks = {
	{name = "melee", interval = 2000, chance = 100, minDamage = -100, maxDamage = -2500, condition = { type = CONDITION_CURSE, totalDamage = 600, interval = 9000 } },
	{name ="combat", interval = 2000, chance = 18, type = COMBAT_AGONYDAMAGE, minDamage = -80, maxDamage = -3200, range = 7, effect = 263, target = true},
	{name ="combat", interval = 2000, chance = 17, type = COMBAT_DEATHDAMAGE, minDamage = -380, maxDamage = -2720, radius = 4, effect = CONST_ME_INSECTS, target = false},
    {name ="combat", interval = 2000, chance = 18, type = COMBAT_ENERGYDAMAGE, minDamage = -280, maxDamage = -3700, range = 7, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYHIT, target = true},
    {name ="combat", interval = 3000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = -180, maxDamage = -520, radius = 4, effect = CONST_ME_DRAWBLOOD, target = false},
	{ name = "combat", interval = 2000, chance = 35, type = COMBAT_ICEDAMAGE, minDamage = -400, maxDamage = -2750, range = 7, shootEffect = CONST_ANI_SHIVERARROW, effect = CONST_ME_ICEATTACK, target = true },
	{ name = "quarasmallicering", interval = 2000, chance = 25 },
	{ name = "podzillaphyschain", interval = 2000, chance = 35 },
}

monster.defenses = {
	defense = 20,
	armor = 73,
	mitigation = 2.20,
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 80, maxDamage = 95, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 15 },
	{ type = COMBAT_EARTHDAMAGE, percent = -15 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 5 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = -15 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)

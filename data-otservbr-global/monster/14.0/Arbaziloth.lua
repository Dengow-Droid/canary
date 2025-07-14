local mType = Game.createMonsterType("Arbaziloth")
local monster = {}

monster.description = "Arbaziloth"
monster.experience = 7000000
monster.outfit = {
	lookType = 1798,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.bosstiary = {
	bossRaceId = 2594,
	bossRace = RARITY_ARCHFOE,
}

monster.events = {
	"QuestBossDeath",
	"PortalArbazilothDeath",
}

monster.health = 1350000
monster.maxHealth = 1350000
monster.race = "blood"
monster.corpse = 50029
monster.speed = 570
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
	staticAttackChance = 95,
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
	{ text = "I am superior!!", yell = false },
	{ text = "You are mad to challange a demon prince!!", yell = false },
	{ text = "You can't stop me or my plans!!", yell = false },
	{ text = "Pesky humans!!", yell = false },
	{ text = "This insolence!!", yell = false },
}

monster.loot = {
	{ name = "crystal coin", chance = 100000, maxCount = 3 },
	{ name = "platinum coin", chance = 100000, maxCount = 100 },
	{ name = "great mana potion", chance = 5188, maxCount = 15 },
	{ name = "great spirit potion", chance = 8600, maxCount = 6 },
	{ name = "ultimate mana potion", chance = 7706, maxCount = 40 },
	{ name = "ultimate health potion", chance = 9257, maxCount = 20 },
	{ name = "supreme health potion", chance = 10447, maxCount = 10 },
	{ name = "ultimate spirit potion", chance = 10313, maxCount = 15 },
	{ name = "blue gem", chance = 12433, maxCount = 2 },
	{ id = 3039, chance = 11545, maxCount = 2 }, -- red gem
	{ name = "yellow gem", chance = 5571, maxCount = 2 },
	{ name = "devil helmet", chance = 12129, maxCount = 1 },
	{ name = "fire axe", chance = 8312, maxCount = 1 },
	{ name = "fire sword", chance = 9092, maxCount = 1 },
	{ name = "giant sword", chance = 5516, maxCount = 1 },
	{ name = "gold ring", chance = 6878, maxCount = 1 },
	{ name = "golden sickle", chance = 13353, maxCount = 1 },
	{ name = "ice rapier", chance = 11805, maxCount = 1 },
	{ name = "magma amulet", chance = 13702, maxCount = 1 },
	{ name = "magma legs", chance = 9285, maxCount = 1 },
	{ name = "might ring", chance = 11432, maxCount = 1 },
	{ name = "platinum amulet", chance = 6855, maxCount = 1 },
	{ name = "purple tome", chance = 11802, maxCount = 1 },
	{ id = 3098, chance = 14001, maxCount = 1 }, -- ring of healing
	{ name = "silver amulet", chance = 9202, maxCount = 1 },
	{ name = "skull staff", chance = 5044, maxCount = 1 },
	{ name = "spellweaver's robe", chance = 8155, maxCount = 1 },
	{ name = "stone skin amulet", chance = 12354, maxCount = 1 },
	{ name = "strange helmet", chance = 11457, maxCount = 1 },
	{ name = "underworld rod", chance = 7308, maxCount = 1 },
    { name = "arbaziloth shoulder piece", chance = 6041, maxCount = 1 },
	{ name = "demon shield", chance = 10365, maxCount = 1 },
	{ name = "demonbone amulet", chance = 14550, maxCount = 1 },
	{ name = "demonrage sword", chance = 9399, maxCount = 1 },
	{ name = "giant amethyst", chance = 11325, maxCount = 1 },
	{ name = "giant emerald", chance = 14681, maxCount = 1 },
	{ name = "giant ruby", chance = 11841, maxCount = 1 },
	{ name = "giant sapphire", chance = 11847, maxCount = 1 },
	{ name = "golden legs", chance = 7188, maxCount = 1 },
	{ id = 50061, chance = 6388, maxCount = 1 },
	{ name = "demon in a green box", chance = 6918, maxCount = 1 },
	{ name = "inferniarch arbalest", chance = 133, maxCount = 1 },
	{ name = "inferniarch battleaxe", chance = 348, maxCount = 1 },
	{ name = "inferniarch blade", chance = 188, maxCount = 1 },
	{ name = "inferniarch bow", chance = 120, maxCount = 1 },
	--{ name = "inferniarch claw", chance = 116, maxCount = 1 },
	{ name = "inferniarch flail", chance = 144, maxCount = 1 },
	{ name = "inferniarch greataxe", chance = 126, maxCount = 1 },
	{ name = "inferniarch rod", chance = 128, maxCount = 1 },
	{ name = "inferniarch slayer", chance = 106, maxCount = 1 },
	{ name = "inferniarch wand", chance = 171, maxCount = 1 },
	{ name = "inferniarch warhammer", chance = 181, maxCount = 1 },
	{ name = "maliceforged helmet", chance = 272, maxCount = 1 },
	{ name = "hellstalker visor", chance = 362, maxCount = 1 },
	{ name = "dreadfire headpiece", chance = 274, maxCount = 1 },
	{ name = "demonfang mask", chance = 227, maxCount = 1 },
	--{ name = "demon mengu", chance = 334, maxCount = 1 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -2650, maxDamage = -5650 },
	{name ="sineaterwave", interval = 2000, chance = 17, minDamage = -218, maxDamage = -12445, target = false},
    {name ="combat", interval = 2000, chance = 18, type = COMBAT_DEATHDAMAGE, minDamage = -425, maxDamage = -11454, effect = CONST_ME_BIG_SCRATCH, target = false},
    {name = "firefield", interval = 2000, chance = 10, range = 7, radius = 1, shootEffect = CONST_ANI_FIRE, target = true },
	{name = "whitechain", interval = 2000, chance = 15, minDamage = -100, maxDamage = -8380, range = 8 },
	{name ="combat", interval = 2000, chance = 16, type = COMBAT_DEATHDAMAGE, minDamage = -200, maxDamage = -5750, range = 7, shootEffect = CONST_ANI_ONYXARROW, effect = CONST_ME_MORTAREA, target = true},
	{ name = "quaracrossdeath", interval = 2000, chance = 20, minDamage = -1100, maxDamage = -13700, target = false },
	{ name = "quarasmokedeath", interval = 2000, chance = 20, minDamage = -850, maxDamage = -12150, target = false },
	{name ="extended fire chain", interval = 2000, chance = 20, minDamage = -389, maxDamage = -8438},
    {name ="combat", interval = 2000, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -440, maxDamage = -3459, effect = 264, target = true},
}

monster.defenses = {
	defense = 76,
	armor = 76,
	mitigation = 2.02,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 15 },
	{ type = COMBAT_EARTHDAMAGE, percent = -10 },
	{ type = COMBAT_FIREDAMAGE, percent = -15 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
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
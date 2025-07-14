-- Minlevel and multiplier are MANDATORY
-- Maxlevel is OPTIONAL, but is considered infinite by default
-- Create a stage with minlevel 1 and no maxlevel to disable stages
experienceStages = {
	{
		minlevel = 1,
		maxlevel = 8,
		multiplier = 15,
	},
	{
		minlevel = 9,
		maxlevel = 100,
		multiplier = 900,
	},
	{
		minlevel = 101,
		maxlevel = 250,
		multiplier = 750,
	},
	{
		minlevel = 251,
		maxlevel = 350,
		multiplier = 500,
	},
	{
		minlevel = 351,
		maxlevel = 600,
		multiplier = 100,
	},
	{
		minlevel = 601,
		maxlevel = 700,
		multiplier = 50,
	},
	{
		minlevel = 701,
		maxlevel = 900,
		multiplier = 30,
	},
	{
		minlevel = 901,
		multiplier = 10,
	},
}

skillsStages = {
	{
		minlevel = 10,
		maxlevel = 60,
		multiplier = 150,
	},
	{
		minlevel = 61,
		maxlevel = 100,
		multiplier = 100,
	},
	{
		minlevel = 101,
		maxlevel = 130,
		multiplier = 60,
	},
	{
		minlevel = 131,
		maxlevel = 155,
		multiplier = 40,
	},
	{
		minlevel = 156,
		multiplier = 20,
	},
}

magicLevelStages = {
	{
		minlevel = 0,
		maxlevel = 60,
		multiplier = 100,
	},
	{
		minlevel = 61,
		maxlevel = 100,
		multiplier = 70,
	},
	{
		minlevel = 101,
		maxlevel = 130,
		multiplier = 50,
	},
	{
		minlevel = 131,
		maxlevel = 150,
		multiplier = 40,
	},
	{
		minlevel = 151,
		maxlevel = 165,
		multiplier = 30,
	},
	{
		minlevel = 166,
		multiplier = 20,
	},
}

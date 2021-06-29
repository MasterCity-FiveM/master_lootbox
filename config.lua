Config = {}

Config["chance"] = {
	[1] = { name = "Common", rate = 50 },
	[2] = { name = "Rare", rate = 40 },
	[3] = { name = "Epic", rate = 8 },
	[4] = { name = "Unique", rate = 1.7} ,
	[5] = { name = "Legendary", rate = 0.1 },
}


Config["item_chests"] = {
	["codchest1"] = {
		name = "Case #1",
		list = {
			{ money = 1500, tier = 3 },
			{ money = 1000, tier = 2 },
			{ money = 500, tier = 1 },
			{ item = "mp3player", amount=1, tier = 3 },
			{ weapon = "weapon_pistol", amount=1, tier = 4 },
			{ weapon = "weapon_appistol", amount=1, tier = 5 },
		}
	},

	["codchest2"] = {
		name = "Case #2",
		list = {
			{ money = 3000, tier = 3 },
			{ money = 2500, tier = 2 },
			{ money = 1000, tier = 1 },
			{ item = "mp3player", amount=1, tier = 3 },
			{ weapon = "weapon_pistol50", amount=1, tier = 4 },
			{ weapon = "weapon_appistol", amount=1, tier = 5 },
		}
	},
	
	["codchest3"] = {
		name = "Case #3",
		list = {
			{ money = 5000, tier = 3 },
			{ money = 3500, tier = 2 },
			{ money = 2500, tier = 1 },
			{ weapon = "weapon_appistol", amount=1, tier = 4 },
			{ weapon = "weapon_minismg", amount=1, tier = 5 },
		}
	},
	
	["codchest4"] = {
		name = "Case #4",
		list = {
			{ money = 20000, tier = 5 },
			{ money = 10000, tier = 3 },
			{ money = 7500, tier = 2 },
			{ money = 5000, tier = 1 },
			{ weapon = "weapon_smg", amount=1, tier = 4 },
			{ weapon = "weapon_assaultrifle", amount=1, tier = 5 },
			{ weapon = "weapon_assaultsmg", amount=1, tier = 5 },
		}
	},
}
local config = {
	key_break 		= 5,		-- Porcentagem de chave quebrar
	crate_itemid	= 60273,		-- ItemID da Crate

	rewards = {

		[1] = {
			item = {3043, 50},
			chance = 85,
		},

		[2] = {
			item = {21892, 1},
			chance = 80,
		},

		[3] = {
			item = {3387, 1},
			chance = 80,
		},

		[4] = {
			item = {34156, 1},
			chance = 60,
		},

		[5] = {
			item = {10385, 1},
			chance = 70,
		},

		[6] = {
			item = {3388, 1},
			chance = 67,
		},
		
		[7] = {
			item = {8054, 1},
			chance = 65,
		},
		
		[8] = {
			item = {31579, 1},
			chance = 66,
		},
		[9] = {
			item = {25779, 1},
			chance = 68,
		},
		[10] = {
			item = {32617, 1},
			chance = 55,
		},
		[11] = {
			item = {16106, 1},
			chance = 55,
		},
		[12] = {
			item = {13999, 1},
			chance = 55,
		},
		[13] = {
			item = {60308, 1},
			chance = 5,
		},
		[14] = {
			item = {60309, 1},
			chance = 5,
		},
		[15] = {
			item = {60286, 1},
			chance = 5,
		},
		
		[16] = {
			item = {32618, 1},
			chance = 35,
		},
		[17] = {
			item = {3422, 1},
			chance = 55,
		},
		[18] = {
			item = {60250, 1},
			chance = 5,
		},
		[19] = {
			item = {34154, 1},
			chance = 55,
		},
		
		[20] = {
			item = {29424, 1},
			chance = 55,
		},
		[21] = {
			item = {27451, 1},
			chance = 55,
		},
		[22] = {
			item = {34253, 1},
			chance = 55,
		},
		[23] = {
			item = {8097, 1},
			chance = 35,
		},
		[24] = {
			item = {7450, 1},
			chance = 55,
		},
		
		[25] = {
			item = {8103, 1},
			chance = 35,
		},
		[26] = {
			item = {8104, 1},
			chance = 35,
		},
		[27] = {
			item = {3365, 1},
			chance = 35,
		},
		[28] = {
			item = {3390, 1},
			chance = 35,
		},
		[29] = {
			item = {60311, 1},
			chance = 15,
		},
		[30] = {
			item = {60316, 1},
			chance = 35,
		},
		[31] = {
			item = {60317, 1},
			chance = 35,
		},
	}
}


local function broadcast(message)
	for _, targetPlayer in ipairs(Game.getPlayers()) do
		targetPlayer:sendTextMessage(MESSAGE_EVENT_ADVANCE, message)
	end

	return true
end

local bossCrate = Action()
function bossCrate.onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)

	if (itemEx.itemid ~= config.crate_itemid) then
		return false
	end

	if (math.random(100) <= config.key_break) then
		toPosition:sendMagicEffect(3)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "In an attempt to open the crate, your key broke!")
	else

		local random = math.random(100)

		local i = 1
		while (i <= #config.rewards) do
			local v = config.rewards[i]

			if (random <= v.chance) then
				if (v.item == "addon") then
					local lookType = v.lookType[player:getSex()]

					if (not player:hasOutfit(lookType, v.addon)) then
						player:addOutfitAddon(lookType, v.addon)

						broadcast(player:getName() .. " opened a loot crate and won the addon ".. v.name .. ".")
						i = 9999
						break
					else
						random = math.random(100)
					end
				elseif(v.item == "mount") then
					if (not player:hasMount(v.mountId)) then
						player:addMount(v.mountId)
						broadcast(player:getName() .. " opened a loot crate and won the mount ".. v.name .. ".")
						i = 9999
						break
					else
						random = math.random(100)
					end
				else
					local new_item = player:addItem(v.item[1], v.item[2])

					if (type(new_item) == "table") then
						new_item = new_item[1]
					end

					broadcast(player:getName() .. " opened a loot crate and won ".. v.item[2] .. " ".. new_item:getName() .. ".")
					i = 9999
					break
				end
			end

			i = i + 1
		end

		if (i == 9999) then
			toPosition:sendMagicEffect(14)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "it is a pity, but the loot crate was empty.")
		else
			toPosition:sendMagicEffect(15)
		end
	end


	itemEx:remove()
	item:remove()
	return true
end

bossCrate:id(60311)
bossCrate:register()
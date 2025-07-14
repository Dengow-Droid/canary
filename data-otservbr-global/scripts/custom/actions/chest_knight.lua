local config = {
	key_break 		= 5,		-- Porcentagem de chave quebrar
	crate_itemid	= 60290,		-- ItemID da Crate

	rewards = {

		[1] = {
			item = {60318, 1},
			chance = 15,
		},

		[2] = {
			item = {60258, 1},
			chance = 15,
		},

		[3] = {
			item = {60259, 1},
			chance = 15,
		},

		[4] = {
			item = {60260, 1},
			chance = 15,
		},

		[5] = {
			item = {60263, 1},
			chance = 15,
		},

		[6] = {
			item = {60314, 1},
			chance = 15,
		},
		
		[7] = {
			item = {60315, 1},
			chance = 15,
		},
		
		[8] = {
			item = {60251, 1},
			chance = 20,
		},
		[9] = {
			item = {60264, 1},
			chance = 15,
		},
		[10] = {
			item = {60266, 1},
			chance = 15,
		},
		[11] = {
			item = {60268, 1},
			chance = 15,
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

bossCrate:id(60320)
bossCrate:register()
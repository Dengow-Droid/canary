local config = {
	key_break 		= 5,		-- Porcentagem de chave quebrar
	crate_itemid	= 60272,		-- ItemID da Crate

	rewards = {

		[1] = {
			item = {3043, 50},
			chance = 70,
		},

		[2] = {
			item = {44621, 1},
			chance = 15,
		},

		[3] = {
			item = {44754, 1},
			chance = 20,
		},

		[4] = {
			item = {44751, 1},
			chance = 60,
		},

		[5] = {
			item = {44750, 1},
			chance = 70,
		},

		[6] = {
			item = {44752, 1},
			chance = 67,
		},
		
		[7] = {
			item = {44624, 1},
			chance = 25,
		},
		
		[8] = {
			item = {44753, 1},
			chance = 25,
		},
		
		[9] = {
			item = {44743, 1},
			chance = 55,
		},
	}
}


local function broadcast(message)
	for _, targetPlayer in ipairs(Game.getPlayers()) do
		targetPlayer:sendTextMessage(MESSAGE_EVENT_ADVANCE, message)
	end

	return true
end

local lootCrate = Action()
function lootCrate.onUse(cid, item, fromPosition, itemEx, toPosition)
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

lootCrate:id(60284)
lootCrate:register()
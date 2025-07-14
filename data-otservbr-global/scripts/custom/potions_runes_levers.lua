local items = Action()
local levers = {
	[16000] = {id = 268, count = 100, value = 10000}, -- magic wall rune
	[16001] = {id = 237, count = 100, value = 25000}, -- paralyze rune
	[16002] = {id = 238, count = 100, value = 50000}, -- firebomb rune
	[16003] = {id = 23373, count = 100, value = 150000}, -- ultimate healing rune
	[16004] = {id = 23374, count = 100, value = 150000}, -- avalanche rune
	[16005] = {id = 7643, count = 100, value = 50000}, -- sudden death rune
	[16006] = {id = 23375, count = 100, value = 150000}, -- strong health potion
	[16007] = {id = 762, count = 100, value = 5000}, -- strong mana potion
	[16008] = {id = 15793, count = 100, value = 10000}, -- great health potion
	[16009] = {id = 16143, count = 100, value = 5000}, -- great mana potion
	[16010] = {id = 35901, count = 100, value = 50000}, -- great spirit potion
	[16011] = {id = 16141, count = 100, value = 10000}, -- ultimate health potion
	[16012] = {id = 6528, count = 100, value = 90000}, -- ultimate mana potion
	[16013] = {id = 25758, count = 100, value = 100000}, -- supreme health potion
	
	[16025] = {id = 3180, count = 100, value = 150000}, -- ultimate spirit potion
	[16026] = {id = 3165, count = 100, value = 145000}, -- ultimate spirit potion
	[16027] = {id = 3161, count = 100, value = 155000}, -- ultimate spirit potion
	[16028] = {id = 3156, count = 100, value = 150000}, -- ultimate spirit potion
	[16029] = {id = 3192, count = 100, value = 90000}, -- ultimate spirit potion
	[16030] = {id = 3202, count = 100, value = 145000}, -- ultimate spirit potion
	[16031] = {id = 3155, count = 100, value = 250000}, -- ultimate spirit potion
	[16032] = {id = 3191, count = 100, value = 150000}, -- ultimate spirit potion
}

function items.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	local choose = levers[item.actionid]

	if not choose then
		return false
	end

	if player:getStorageValue(77124) >= os.time() then
		player:sendCancelMessage("You need to wait 1 second between one purchase and another.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return true
	end

	local userItem = ItemType(choose.id)
	local itemWeight = userItem:getWeight() * choose.count

	if player:getFreeCapacity() < itemWeight then
		player:sendCancelMessage("You don't have enough space.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return true
	end

	if not player:removeMoney(choose.value) then
		player:sendCancelMessage("You don't have enough money.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return true
	end

	player:sendCancelMessage("You bought ".. choose.count .."x ".. userItem:getName() ..".")
	player:addItem(choose.id,choose.count)
	player:getPosition():sendMagicEffect(29)
	player:setStorageValue(77124, os.time() + 1)

	item:transform(item.itemid == 2773 and 2772 or 2773)

	return true
end

items:aid(16000,16001,16002,16003,16004,16005,16006,16007,16008,16009,16010,16011,16012,16013,16025,16026,16027,16028,16029,16030,16031,16032)
items:register()

local food = TalkAction("!food")

local config = {
	storage = 11111,
	exhaust = 10*60
}

function food.onSay(player, words, param)
	if player:getStorageValue(config.storage) > os.time() then
		player:sendTextMessage(MESSAGE_LOOK, "You can only use this action every " .. (config.exhaust / 60) .. " minutes.")
		return false
	end

	if player:removeMoneyBank(1000) then
        player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
        player:addItem(3725, 100)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You won an 100 Brown Mushroom.")
		player:setStorageValue(config.storage, os.time() + config.exhaust)
    else
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        player:sendCancelMessage("You do not have enough money.")
    end
	return true
end

food:groupType("normal")
food:register()

local shared = TalkAction("!shared")

function shared.onSay(player, words, param)
    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
    if player then
        local text = '-- Party Info -- \n\n'
        text = text .. '-----------\n'
        text = text .. 'Min Level: ' .. math.ceil((player:getLevel() * 2) / 3) .. '  \n'
        text = text .. 'Max Level: ' .. math.ceil((player:getLevel() * player:getLevel()) / ((player:getLevel() * 2) / 3)) .. '  \n'
        text = text .. '-----------\n'
        player:showTextDialog(34266, text)
    end
    return false
end

shared:groupType("normal")
shared:register()
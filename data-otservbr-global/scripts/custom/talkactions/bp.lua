local bp = TalkAction("!bp")

local config = {
	storage = 1111,
	exhaust = 1*60
}

function bp.onSay(cid, words, param)
	if player:getStorageValue(config.storage) > os.time() then
		player:sendTextMessage(MESSAGE_LOOK, "You can only use this action every " .. (config.exhaust / 60) .. " minutes.")
		return false
	end

	if player:removeMoneyBank(1000) then
        player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
        player:addItem(2854, 1)
        player:sendTextMessage(MESSAGE_LOOK, "You won an 1 backpack.")
		player:setStorageValue(config.storage, os.time() + config.exhaust)
    else
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        player:sendCancelMessage("You do not have enough money.")
    end
	return true
end

bp:groupType("normal")
bp:register()
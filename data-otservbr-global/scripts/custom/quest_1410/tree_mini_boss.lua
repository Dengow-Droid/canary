local TreeMiniBoss = Action()
function TreeMiniBoss.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if target.itemid ~= 49407 then
		return true
	end
	
    if not player:canFightBoss("Gralvalon") then
		player:teleportTo(fromPosition, true)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have to wait 12 hours to face Gralvalon again!")
	return true
	end


	if Game.getStorageValue(Storage.TreeMiniBoss) == 10 then
		player:say("All Sacrificial Are Working, Gralvalon Now Merge.", TALKTYPE_MONSTER_SAY)
		Game.createMonster("Gralvalon", Position(33810, 32297, 10))
		Game.setStorageValue(Storage.TreeMiniBoss, Game.getStorageValue(Storage.TreeMiniBoss) - 9)
		player:setBossCooldown("Gralvalon", os.time() + 12 * 3600)
	    player:sendBosstiaryCooldownTimer()
	end

	Game.setStorageValue(Storage.TreeMiniBoss, Game.getStorageValue(Storage.TreeMiniBoss) + 1)
	player:say("~Zzzz~\n The machine is working!", TALKTYPE_MONSTER_SAY, false, nil, toPosition)
	item:remove(1)
	return true
end

TreeMiniBoss:id(50055)
TreeMiniBoss:register()
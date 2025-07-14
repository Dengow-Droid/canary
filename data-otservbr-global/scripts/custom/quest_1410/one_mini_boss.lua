local OneMiniBoss = Action()
function OneMiniBoss.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if target.itemid ~= 49407 then
		return true
	end
	
    if not player:canFightBoss("Malvaroth") then
		player:teleportTo(fromPosition, true)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have to wait 12 hours to face Malvaroth again!")
	return true
	end


	if Game.getStorageValue(Storage.OneMiniBoss) == 10 then
		player:say("All Sacrificial Are Working, Malvaroth Now Merge.", TALKTYPE_MONSTER_SAY)
		Game.createMonster("Malvaroth", Position(33773, 32392, 8))
		Game.setStorageValue(Storage.OneMiniBoss, Game.getStorageValue(Storage.OneMiniBoss) - 9)
		player:setBossCooldown("Malvaroth", os.time() + 12 * 3600)
	    player:sendBosstiaryCooldownTimer()
	end

	Game.setStorageValue(Storage.OneMiniBoss, Game.getStorageValue(Storage.OneMiniBoss) + 1)
	player:say("~Zzzz~\n The machine is working!", TALKTYPE_MONSTER_SAY, false, nil, toPosition)
	item:remove(1)
	return true
end

OneMiniBoss:id(50101)
OneMiniBoss:register()
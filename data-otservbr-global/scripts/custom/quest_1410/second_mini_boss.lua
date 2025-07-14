local SecondMiniBoss = Action()
function SecondMiniBoss.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if target.itemid ~= 49407 then
		return true
	end
	
    if not player:canFightBoss("Twisterror") then
		player:teleportTo(fromPosition, true)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have to wait 12 hours to face Twisterror again!")
	return true
	end


	if Game.getStorageValue(Storage.SecondMiniBoss) == 10 then
		player:say("All Sacrificial Are Working, Twisterror Now Merge.", TALKTYPE_MONSTER_SAY)
		Game.createMonster("Twisterror", Position(33826, 32297, 9))
		Game.setStorageValue(Storage.SecondMiniBoss, Game.getStorageValue(Storage.SecondMiniBoss) - 9)
		player:setBossCooldown("Twisterror", os.time() + 12 * 3600)
	    player:sendBosstiaryCooldownTimer()
	end

	Game.setStorageValue(Storage.SecondMiniBoss, Game.getStorageValue(Storage.SecondMiniBoss) + 1)
	player:say("~Zzzz~\n The machine is working!", TALKTYPE_MONSTER_SAY, false, nil, toPosition)
	item:remove(1)
	return true
end

SecondMiniBoss:id(50054)
SecondMiniBoss:register()
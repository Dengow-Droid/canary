local condition = Condition(CONDITION_OUTFIT)
condition:setOutfit({ lookType = 2813 }) -- Avatar of Storm lookType

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	if not creature or not creature:isPlayer() then
		return false
	end

	local grade = creature:revelationStageWOD("Avatar of Storm")
	if grade == 0 then
		creature:sendCancelMessage("You cannot cast this spell")
		creature:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end

	local duration = 60000
	condition:setTicks(duration)
	creature:getPosition():sendMagicEffect(CONST_ME_AVATAR_APPEAR)
	creature:addCondition(condition)
	creature:avatarTimer((os.time() * 1000) + duration)
	creature:reloadData()
	addEvent(ReloadDataEvent, duration, creature:getId())
	return true
end

spell:group("support")
spell:id(266)
spell:name("Avatar of Merlin")
spell:words("uteta res merlin")
spell:level(500)
spell:mana(3200)
spell:isPremium(true)
spell:cooldown(30 * 60 * 1000) -- Default cooldown = 2 hours
spell:groupCooldown(2 * 1000)
spell:vocation("sorcerer;true", "master sorcerer;true")
spell:hasParams(true)
spell:isAggressive(false)
spell:needLearn(false)
spell:register()
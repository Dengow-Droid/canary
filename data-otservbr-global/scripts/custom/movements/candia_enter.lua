local teleports = {
	{position = {x = 33574, y = 32222, z = 7}, destination = Position(33338, 32126, 7)},
	{position = {x = 33338, y = 32125, z = 7}, destination = Position(33574, 32223, 7)},
	{position = {x = 33829, y = 32025, z = 7}, destination = Position(33826, 32000, 8)},
	{position = {x = 33825, y = 32000, z = 8}, destination = Position(33829, 32024, 7)},
	
	{position = {x = 32799, y = 32365, z = 8}, destination = Position(32874, 32375, 8)},
	{position = {x = 32875, y = 32376, z = 8}, destination = Position(32799, 32366, 8)},
	--[[{positions = {
		{x = 33296, y = 31287, z = 9},
		{x = 33297, y = 31287, z = 9},
		{x = 33298, y = 31287, z = 9},
		{x = 33296, y = 31288, z = 9},
		{x = 33298, y = 31288, z = 9},
		{x = 33298, y = 31289, z = 9},
		{x = 33297, y = 31289, z = 9}
	}, 
	destination = Position(33363, 31342, 9)
 }]]--
}

local falconCastle = MoveEvent()

function falconCastle.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end
	for c = 1, #teleports do
		if teleports[c].position then
			if player:getPosition() == Position(teleports[c].position) then
				if teleports[c].access then
					if player:getStorageValue(teleports[c].access) == 1 then
						player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
						player:teleportTo(teleports[c].destination)
						player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
					else
						player:teleportTo(fromPosition)
					end
				else
					player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
					player:teleportTo(teleports[c].destination)
					player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				end
		end
		end
	end
end

for a = 1, #teleports do
	if teleports[a].position then
		falconCastle:position(teleports[a].position)
	elseif teleports[a].positions then
		for b = 1, #teleports[a].positions do
			falconCastle:position(teleports[a].positions[b])
		end
	end
end
falconCastle:register()
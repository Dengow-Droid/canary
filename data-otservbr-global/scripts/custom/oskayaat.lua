local boatExit = Action()
function boatExit.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	player:teleportTo(Position(34039, 31726, 10))
	return true
end

boatExit:position(Position(34000, 31732, 9))
boatExit:register()

local boatEntry = Action()
function boatEntry.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	player:teleportTo(Position(34001, 31733, 9))
	return true
end

boatEntry:position(Position(34038, 31726, 10))
boatEntry:register()

local boatExits = Action()
function boatExits.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	player:teleportTo(Position(34071, 31446, 11))
	return true
end

boatExits:position(Position(34070, 31442, 11))
boatExits:register()

local boatEntrys = Action()
function boatEntrys.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	player:teleportTo(Position(34071, 31442, 11))
	return true
end

boatEntrys:position(Position(34071, 31445, 11))
boatEntrys:register()

local bossexit = Action()
function bossexit.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	player:teleportTo(Position(34058, 31433, 11))
	return true
end

bossexit:position(Position(34068, 31418, 11))
bossexit:register()

local Maliz = Action()
function Maliz.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	player:teleportTo(Position(33321, 31480, 15))
	return true
end

Maliz:position(Position(33256, 31412, 15))
Maliz:register()

local Vengar = Action()
function Vengar.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	player:teleportTo(Position(33351, 31479, 15))
	return true
end

Vengar:position(Position(33257, 31408, 15))
Vengar:register()

local Bruton = Action()
function Bruton.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	player:teleportTo(Position(33376, 31480, 15))
	return true
end

Bruton:position(Position(33260, 31406, 15))
Bruton:register()

local Greedok = Action()
function Greedok.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	player:teleportTo(Position(33401, 31480, 15))
	return true
end

Greedok:position(Position(33265, 31406, 15))
Greedok:register()

local Vilear = Action()
function Vilear.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	player:teleportTo(Position(33348, 31503, 15))
	return true
end

Vilear:position(Position(33270, 31406, 15))
Vilear:register()

local Crultor = Action()
function Crultor.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	player:teleportTo(Position(33372, 31503, 15))
	return true
end

Crultor:position(Position(33273, 31408, 15))
Crultor:register()

local Despor = Action()
function Despor.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	player:teleportTo(Position(33398, 31506, 15))
	return true
end

Despor:position(Position(33274, 31412, 15))
Despor:register()

-- tibiadrome_map_generator.lua
local positions = {
    portal = {x = 999, y = 1000, z = 7},
    exit = {x = 1005, y = 1000, z = 7},
    npc = {x = 998, y = 1002, z = 7},
    hallStart = {x = 995, y = 995, z = 7},
    arena1 = {x = 1015, y = 985, z = 7},
    arena2 = {x = 1035, y = 985, z = 7},
    arena3 = {x = 1055, y = 985, z = 7}
}

local function placeTile(x, y, z, id)
    Game.createItem(id, 1, Position(x, y, z))
end

local function buildHall()
    -- Piso e paredes
    for x = positions.hallStart.x, positions.hallStart.x + 8 do
        for y = positions.hallStart.y, positions.hallStart.y + 8 do
            placeTile(x, y, positions.hallStart.z, 407) -- stone tile
        end
    end
    -- Decoração
    Game.createItem(4305, 1, Position(positions.portal.x, positions.portal.y - 1, positions.portal.z)) -- Placa
        :setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, "Tibiadrome Entrance")

    -- Tochas e estátuas
    local deco = {
        {id = 1431, x = positions.hallStart.x + 1, y = positions.hallStart.y + 1}, -- Statue
        {id = 1431, x = positions.hallStart.x + 7, y = positions.hallStart.y + 1}, -- Statue
        {id = 1431, x = positions.hallStart.x + 1, y = positions.hallStart.y + 7}, -- Statue
        {id = 1431, x = positions.hallStart.x + 7, y = positions.hallStart.y + 7}, -- Statue
        {id = 1481, x = positions.hallStart.x + 4, y = positions.hallStart.y},     -- Banner
        {id = 1481, x = positions.hallStart.x + 4, y = positions.hallStart.y + 8}  -- Banner
    }
    for _, v in ipairs(deco) do
        Game.createItem(v.id, 1, Position(v.x, v.y, positions.hallStart.z))
    end

    -- Bancos
    Game.createItem(3811, 1, Position(positions.hallStart.x + 3, positions.hallStart.y + 3, positions.hallStart.z))
    Game.createItem(3811, 1, Position(positions.hallStart.x + 5, positions.hallStart.y + 3, positions.hallStart.z))

    -- Portal mágico
    local portal = Game.createItem(1387, 1, Position(positions.portal.x, positions.portal.y, positions.portal.z))
    portal:setActionId(45001) -- action id do script principal

    -- Efeito do portal
    addEvent(function()
        local pos = Position(positions.portal.x, positions.portal.y, positions.portal.z)
        pos:sendMagicEffect(CONST_ME_TELEPORT)
    end, 1000)
end

local function buildArena(center)
    -- Piso base
    for x = center.x - 4, center.x + 4 do
        for y = center.y - 4, center.y + 4 do
            placeTile(x, y, center.z, 406)
        end
    end
    -- Borda de paredes
    for x = center.x - 5, center.x + 5 do
        placeTile(x, center.y - 5, center.z, 1025)
        placeTile(x, center.y + 5, center.z, 1025)
    end
    for y = center.y - 5, center.y + 5 do
        placeTile(center.x - 5, y, center.z, 1025)
        placeTile(center.x + 5, y, center.z, 1025)
    end
    -- Decoração interna
    Game.createItem(1431, 1, Position(center.x - 4, center.y - 4, center.z)) -- estatua canto
    Game.createItem(1431, 1, Position(center.x + 4, center.y - 4, center.z))
    Game.createItem(1431, 1, Position(center.x - 4, center.y + 4, center.z))
    Game.createItem(1431, 1, Position(center.x + 4, center.y + 4, center.z))
    Game.createItem(1481, 1, Position(center.x, center.y - 5, center.z)) -- banner
    Game.createItem(1481, 1, Position(center.x, center.y + 5, center.z))
    Game.createItem(1498, 1, Position(center.x, center.y, center.z)) -- piso especial central
end

local function spawnNPC()
    local npc = Game.createNpc("Tibiadrome Shopkeeper", Position(positions.npc.x, positions.npc.y, positions.npc.z))
    npc:setOutfit({lookType = 146, lookHead = 78, lookBody = 69, lookLegs = 58, lookFeet = 95})
end

local mapGenerator = GlobalEvent("TibiadromeMapGen")
function mapGenerator.onStartup()
    print("[Tibiadrome] Construindo hall e arenas com decoração...")
    buildHall()
    buildArena(positions.arena1)
    buildArena(positions.arena2)
    buildArena(positions.arena3)
    spawnNPC()
    print("[Tibiadrome] Áreas do Tibiadrome geradas!")
    return true
end
mapGenerator:register()

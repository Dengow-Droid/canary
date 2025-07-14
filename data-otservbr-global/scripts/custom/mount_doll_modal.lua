local mounts = {

    -- Config
        dollID = 2991, -- Change this to your dolls or items, item ID
     
        -- Main Window Messages (The first window the player sees)
        mainTitle = "Choose a Mount!",
        mainMsg = "Choose a mount to unlock.",
     
        -- Already Owned Window (The window that appears when the player already owns the addon)
        ownedTitle = "Whoops!",
        ownedMsg = "You already have this mount. Please choose another.",
     
        -- No Doll in Backpack (The window that appears when the player doesnt have the doll in their backpack)
        dollTitle = "Whoops!",
        dollMsg = "The sacrificial item must be in your backpack.",
    -- End Config

    -- Mounts Table
        [1] = {name = "Petista(100%EXP)", ID = 232},
        [2] = {name = "Black Tornado(100%EXP)", ID = 233},
        [3] = {name = "Grey Tornado(100%EXP)", ID = 234},
        [4] = {name = "Simba Galactico(100%EXP)", ID = 235},
        [5] = {name = "Pegasus Grey(100%EXP)", ID = 236},
        [6] = {name = "Pegasus Black(100%EXP)", ID = 237},
    }
     
local mountsDollModal = Action()

function mountsDollModal.onUse(player, item, fromPosition, target, toPosition, isHotkey)
        player:sendMountWindow(mounts)
    end

mountsDollModal:position(Position(33708, 32096, 15))
mountsDollModal:register()
    
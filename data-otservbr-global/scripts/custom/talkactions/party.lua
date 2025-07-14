local talkAction = TalkAction("!party")

function talkAction.onSay(player, words, param, type)
    local split = param:splitTrimmed(",")
    local action = split[1] and split[1]:lower() or ""
    if action == "" then
        player:sendCancelMessage("Command param required.\nOptions: create, join, leave, invite, kick, leader, disband.")
        return false
    end

    local party = player:getParty()
    if action == "create" then
        if party then
            player:sendCancelMessage("You are already in a party.")
            return false
        end

        party = Party(player)
        player:sendTextMessage(MESSAGE_STATUS, "You have created a party.")
    elseif action == "join" then
        if party then
            player:sendCancelMessage("You are already in a party.")
            return false
        end

        local target = Player(split[2])
        if not target then
            player:sendCancelMessage("Player not found.")
            return false
        end

        local targetParty = target:getParty()
        if not targetParty then
            player:sendCancelMessage("Player is not in a party.")
            return false
        end

        for _, invitee in pairs(targetParty:getInvitees()) do
            if invitee == player then
                targetParty:addMember(player)
                return false
            end
        end

        player:sendCancelMessage("You have not been invited to this party.")
    elseif action == "leave" then
        if not party then
            player:sendCancelMessage("You are not in a party.")
            return false
        end

        party:removeMember(player)
    elseif action == "invite" then
        local target = Player(split[2])
        if not target then
            player:sendCancelMessage("Player not found.")
            return false
        end

        if target:getParty() then
            player:sendCancelMessage("Player is already in a party.")
            return false
        end

        if not party then
            party = Party(player)
        end

        party:addInvite(target)
    elseif action == "kick" then
        if not party then
            player:sendCancelMessage("You are not in a party.")
            return false
        end

        local target = Player(split[2])
        if not target then
            player:sendCancelMessage("Player not found.")
            return false
        end

        if target:getParty() ~= party then
            player:sendCancelMessage("Player is not in your party.")
            return false
        end

        party:removeMember(target)
    elseif action == "leader" then
        if not party then
            player:sendCancelMessage("You are not in a party.")
            return false
        end

        local target = Player(split[2])
        if not target then
            player:sendCancelMessage("Player not found.")
            return false
        end

        if target:getParty() ~= party then
            player:sendCancelMessage("Player is not in your party.")
            return false
        end

        party:setLeader(target)
    elseif action == "disband" then
        if not party then
            player:sendCancelMessage("You are not in a party.")
            return false
        end

        party:disband()
    else
        player:sendCancelMessage("Invalid option.")
        return false
    end
    return false
end

talkAction:groupType("normal")
talkAction:separator(" ")
talkAction:register()
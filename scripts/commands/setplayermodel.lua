---------------------------------------------------------------------------------------------------
-- func: setplayermodel <player> <slot> <modelid>
-- desc: Sets the look of the user or target player based on model id offset and slot (for testing).
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "sii"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!setplayermodel {player} <slot> <model>")
    player:PrintToPlayer("Slots: 0=main 1=sub 2=ranged 3=ammo 4=head 5=body 6=hands 7=legs 8=feet")
end

function onTrigger(player, target, slot, model)
    -- validate model
    if model == nil then
        error(player, "Invalid model ID.")
        return
    end

    -- validate slot
    if slot == nil or slot < 0 or slot > 8 then
        error(player, "Invalid slot ID.")
        return
    end

    -- validate target
    local targ
    if target == nil then
        targ = player
    else
        targ = GetPlayerByName(target)
        if targ == nil then
            error(player, string.format("Player named '%s' not found!", target))
            return
        end
    end

    local slotNameByNum =
    {
        [0] = "main",
        [1] = "sub",
        [2] = "ranged",
        [3] = "ammo",
        [4] = "head",
        [5] = "body",
        [6] = "hands",
        [7] = "legs",
        [8] = "feet"
    }

    -- set model
    targ:setModelId(model, slot)
    player:PrintToPlayer(string.format("Set %s's %s slot to model %i.", targ:getName(), slotNameByNum[slot], model))
end

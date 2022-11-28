---------------------------------------------------------------------------------------------------
-- func: getstatus <statusID>
-- desc: gets a status by ID on the player or cursor target
---------------------------------------------------------------------------------------------------
require("scripts/globals/status")

cmdprops =
{
    permission = 1,
    parameters = "s"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!getstatus <statusID>")
end

function onTrigger(player, id)
    -- invert tpz.effect table
    local statusNameByNum = {{}, {}}
    for k, v in pairs(tpz.effect) do
        statusNameByNum[1][v] = v
        statusNameByNum[2][v] = k
    end

    -- validate statusID
    id = string.upper(id)
    local statusId   = statusNameByNum[id]
    local statusName = nil

    for i = 1, #statusNameByNum[2] do
        if statusNameByNum[2][i] == id then
            statusId   = statusNameByNum[1][i]
            statusName = statusNameByNum[2][i]
            break
        end
    end

    if statusName == nil or statusId == nil then
        error(player, "Invalid status ID.")
        return
    end

    -- validate target
    local effectTarget = player:getCursorTarget()

    if effectTarget == nil then
        effectTarget = player
    elseif effectTarget:isNPC() then
        error(player, "Current target is an NPC, which can not have statuses.")
        return
    end

    if effectTarget:hasStatusEffect(statusId) then
        local statusEffect = effectTarget:getStatusEffect(statusId)

        player:PrintToPlayer(string.format("%s's effect %i (%s) Effect Power: [%i]  Total Duration: [%i]", effectTarget:getName(), statusId, statusName, statusEffect:getPower(), statusEffect:getDuration()))
    else
        player:PrintToPlayer(string.format("Target does not have the %s effect.", statusName))
    end
end

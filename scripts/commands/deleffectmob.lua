---------------------------------------------------------------------------------------------------
-- func: !deleffectmob {effect}
-- desc: Removes the given effect from the given monster.
---------------------------------------------------------------------------------------------------

require("scripts/globals/status")

cmdprops =
{
    permission = 1,
    parameters = "ss"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!deleffectmob <effect>")
end

function onTrigger(player, arg1)
    local targ = player:getCursorTarget()
	local fixedMobName = string.gsub(targ:getName(), "_", " ")
    local id

    -- validate effect
    id = tonumber(arg1) or tpz.effect[string.upper(arg1)]
    if (id == nil or id == 0) then
        error(player, "You must provide an effect ID.")
        return
    end

    if targ:hasStatusEffect(id) then
        -- delete status effect
        targ:delStatusEffect(id)
        
        player:PrintToPlayer(string.format("Removed effect %i from %s.", id, fixedMobName))
    else
        player:PrintToPlayer(string.format("%s does not have status %i.", fixedMobName, id))
    end
end
-----------------------------------------------------------------------
-- func: reset <player>
-- desc: If no name is specified, resets your own JA timers.
-- If a player name is specified, resets all of that players JA timers.
-----------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!reset {player}")
end

function onTrigger(player, target)
    -- Validate target
    local targ

    if not target then
        targ = player
    else
        targ = GetPlayerByName(target)

        if targ == nil then
            error(player, string.format( "Player named '%s' not found!", target ))

            return
        end
    end

    -- Reset target recasts
    targ:resetRecasts()

    if targ:getID() ~= player:getID() then
        player:PrintToPlayer( string.format( "Reset %s's recast timers.", targ:getName() ) )
    end

    -- Clear debilitating effects from player
    player:eraseAllStatusEffect()

    -- Table of non-erasable effects
    local effects =
    {
        tpz.effect.TERROR,
        tpz.effect.SLEEP_I,
        tpz.effect.SLEEP_II,
        tpz.effect.LULLABY,
        tpz.effect.STUN,
        tpz.effect.SILENCE,
        tpz.effect.WEAKNESS,
        tpz.effect.PARALYSIS,
        tpz.effect.BLINDNESS,
        tpz.effect.AMNESIA,
        tpz.effect.CHARM_I,
        tpz.effect.CHARM_II,
        tpz.effect.POISON,
    }

    for _, v in pairs(effects) do
        player:delStatusEffect(v)
    end
end

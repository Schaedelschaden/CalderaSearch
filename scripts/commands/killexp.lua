---------------------------------------------------------------------------------------------------
-- func: killexp
-- desc: Removes the player's exp ring effect.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!logoff {player}")
end

function onTrigger(player)
	player:delStatusEffect(tpz.effect.DEDICATION)
end
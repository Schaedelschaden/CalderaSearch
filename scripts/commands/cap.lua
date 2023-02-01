---------------------------------------------------------------------------------------------------
-- func: !cap
-- desc: Caps the player to level 75.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player, target)
	local effect = tpz.effect.LEVEL_SYNC

    if
        player:hasStatusEffect(effect) and
        player:getStatusEffect(effect):getPower() == 75
    then
		player:delStatusEffect(tpz.effect.LEVEL_SYNC)
		player:delStatusEffect(tpz.effect.REGEN)
		player:delStatusEffect(tpz.effect.REFRESH)
        player:delStatusEffect(tpz.effect.REGAIN)
	else
		player:addStatusEffect(effect, 75)
	end
end

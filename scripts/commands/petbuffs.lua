---------------------------------------------------------------------------------------------------
-- func: !petbuffs
-- desc: Gives the player's pet several strong buffs.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
}

function onTrigger(player)
    local pet = player:getPet()

    pet:addStatusEffect(tpz.effect.REGAIN,300,3,0)
    pet:addStatusEffect(tpz.effect.REGEN,150,3,0)
	pet:addStatusEffect(tpz.effect.MEVA,1000,3,0)
end
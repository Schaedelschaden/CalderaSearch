--------------------------------------------------------------
-- func: !DeathRace
-- auth: Bart
-- desc: takes away magic, items, and abilities
--------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "i"
}

function onTrigger(target)
	local DeathRace = target:getCharVar("DeathRace")


    if DeathRace == 1 then
        target:delStatusEffect(tpz.effect.IMPAIRMENT)
        target:delStatusEffect(tpz.effect.OMERTA)
        target:delStatusEffect(tpz.effect.MUDDLE)
    else
        target:addStatusEffect(tpz.effect.IMPAIRMENT, 1, 0, 28800) 
        target:addStatusEffect(tpz.effect.OMERTA, 1, 0, 28800) 
        target:addStatusEffect(tpz.effect.MUDDLE, 1, 0, 28800) 
        target:setCharVar("DeathRace", 1)
    end
end

---------------------------------------------------------------------------------------------------
-- func: !blueteam
-- desc: sets player pvp flags for red team.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
    if player:getZoneID() == 43 then
        player:setAllegiance(3)
        player:addStatusEffect(tpz.effect.ALLIED_TAGS, 1, 0, 0)
        player:getStatusEffect(tpz.effect.ALLIED_TAGS):setFlag(tpz.effectFlag.ON_ZONE)
    else
        player:PrintToPlayer("Use !pvp command to go to designated zone first!")
    end
end
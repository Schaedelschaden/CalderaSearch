-----------------------------------
-- !chocobo
--
-- gives a GM a chocobo anywhere.
-----------------------------------
require("scripts/globals/status")

cmdprops =
{
    permission = 0,
    parameters = "s"
}

function onTrigger(player)
    if player:getGMLevel() > 0 then
        player:delStatusEffectSilent(tpz.effect.MOUNTED)
        player:addStatusEffectEx(tpz.effect.MOUNTED, tpz.effect.MOUNTED, tpz.mount.CHOCOBO, 0, 1800, 0, 64, true)
    end
end
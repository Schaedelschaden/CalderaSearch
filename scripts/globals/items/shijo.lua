-----------------------------------------
-- ID: 20598
-- Item: Shijo
-- Additional effect: "Flee" procs on direct damage to mobs above player's item level
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player, target, damage)
    local chance  = 10
    local iLvl    = player:getMainLvl() + player:getItemLevel()
    local targLvl = target:getMainLvl()

    if targLvl < iLvl then
        return 0, 0, 0
    elseif math.random(1, 100) <= chance then
        player:addStatusEffect(tpz.effect.FLEE, 100, 0, 10)

        return tpz.subEffect.HASTE, tpz.msg.basic.ADD_EFFECT_STATUS, tpz.effect.FLEE
    end
end

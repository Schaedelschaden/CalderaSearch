-----------------------------------
-- Ability: Snake Eye
-- Your next roll will automatically be a 1.
-- Obtained: Corsair Level 75
-- Recast Time: 0:05:00
-- Duration: 0:01:00 or the next usage of Phantom Roll or Double-Up
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0
end

function onUseAbility(player, target, ability)
    local power    = player:getMerit(tpz.merit.SNAKE_EYE) - 10
    local duration = 60

    player:addStatusEffect(tpz.effect.SNAKE_EYE, power, 0, duration)

    return tpz.effect.SNAKE_EYE
end

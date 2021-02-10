-----------------------------------
-- Ability: Perfect Counter
-- Allows you to counter the next attack directed at you.
-- Obtained: Monk Level 79
-- Recast Time: 01:00
-- Duration: 0:30
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0
end

function onUseAbility(player, target, ability)
    player:addStatusEffect(tpz.effect.PERFECT_COUNTER, 1, 0, 30)
end
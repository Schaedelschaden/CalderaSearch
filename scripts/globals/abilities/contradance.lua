-----------------------------------
-- Ability: Contradance
-- Increases the amount of HP restored by your next Waltz.
-- Obtained: Dancer Level 50
-- Recast Time: 5:00
-- Duration: 1 Waltz or 60 seconds, whichever occurs first.
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0
end

function onUseAbility(player, target, ability)
    player:addStatusEffect(tpz.effect.CONTRADANCE, 1, 0, 60)
end
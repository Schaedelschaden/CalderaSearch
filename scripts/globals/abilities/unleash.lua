-----------------------------------
-- Ability: Unleash
-- Increases the accuracy of Charm and reduces the recast times of Sic and Ready. 
-- Obtained: Beastmaster Level 96
-- Recast Time: 1:00:00
-- Duration: 01:00
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0
end

function onUseAbility(player, target, ability)
    target:addStatusEffect(tpz.effect.UNLEASH, 1, 0, 60)
end

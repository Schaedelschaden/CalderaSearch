-----------------------------------
-- Ability: Restraint
-- Enhances your weapon skill power with each normal attack you land.
-- Obtained: Warrior Level 77
-- Recast Time: 10:00
-- Duration: 5:00
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0
end

function onUseAbility(player, target, ability)
    player:addStatusEffect(tpz.effect.RESTRAINT,1,0,300)
end

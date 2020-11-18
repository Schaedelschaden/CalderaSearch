-----------------------------------
-- Ability: Flashy Shot
-- Your next attack will generate more enmity and both have increased accuracy and deal increased damage based on the level difference between you and the target.  
-- Obtained: Ranger Level 75
-- Recast Time: 10:00
-- Duration: 01:00 (or next ranged attack)
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0
end

function onUseAbility(player, target, ability)
    player:addStatusEffect(tpz.effect.FLASHY_SHOT, 1, 0, 60)
end

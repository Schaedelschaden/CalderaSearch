-----------------------------------
-- Ability: Stealth Shot
-- Your next attack will generate less enmity. 
-- Obtained: Ranger Level 75
-- Recast Time: 5:00
-- Duration: 01:00 (or next ranged attack)
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0
end

function onUseAbility(player, target, ability)
    player:addStatusEffect(tpz.effect.STEALTH_SHOT, 1, 0, 60)
end
-----------------------------------
-- Ability: Decoy Shot
-- Diverts enmity when launching a ranged attack from behind a party member.
-- Obtained: Ranger Level 95
-- Recast Time: 5:00
-- Duration: 3:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0
end

function onUseAbility(player,target,ability)
    player:addStatusEffect(tpz.effect.DECOY_SHOT,1,0,180)
end
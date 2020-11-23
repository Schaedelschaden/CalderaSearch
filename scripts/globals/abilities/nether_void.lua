-----------------------------------
-- Ability: Nether Void
-- Increases the absorption of your next dark magic spell. 
-- Obtained: Dark Knight Level 78
-- Recast Time: 0:05:00
-- Duration: 0:01:00 (or until next Dark Magic cast)
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0
end

function onUseAbility(player, target, ability)
    player:addStatusEffect(tpz.effect.NETHER_VOID,1,0,60)
end

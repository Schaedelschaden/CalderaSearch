-----------------------------------
-- Ability: Convergence
-- Increases the power of your next magical Blue Magic spell. Limits area of effect to single target.
-- Obtained: Blue Mage Level 75
-- Recast Time: 10:00
-- Duration: 1:00 or the next magical Blue Magic spell
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player,target,ability)
--	printf("Convergence PLAYER onAbilityCheck START\n")
    return 0,0
end

function onUseAbility(player, target, ability)
--	printf("Convergence PLAYER onUseAbility\n")
    player:addStatusEffect(tpz.effect.CONVERGENCE,1,0,60)

    return tpz.effect.CONVERGENCE
end
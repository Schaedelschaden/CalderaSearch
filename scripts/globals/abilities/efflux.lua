-----------------------------------
-- Ability: Efflux
-- If the next spell you cast is a "physical" Blue magic spell, a TP bonus will be granted.
-- Obtained: Blue Mage Level 83
-- Recast Time: 3 minutes
-- Duration: 1:00 or the next physical Blue Magic spell
-- May be used with Sneak Attack and Trick Attack.
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player,target,ability)
--	printf("Efflux PLAYER onAbilityCheck START\n")
    return 0,0
end

function onUseAbility(player, target, ability)
--	printf("Efflux PLAYER onUseAbility\n")
    player:addStatusEffect(tpz.effect.EFFLUX,1,0,60)

    return tpz.effect.EFFLUX
end
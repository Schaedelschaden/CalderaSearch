-----------------------------------
-- Ability: Unbridled Learning
-- Allows access to additional blue magic spells.
-- Obtained: Blue Mage Level 95
-- Recast Time: 5:00
-- Duration: 1:00 or until one of the unlocked spells is cast
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player,target,ability)
--	printf("Unbridled Learning PLAYER onAbilityCheck START\n")
    return 0,0
end

function onUseAbility(player, target, ability)
--	printf("Unbridled Learning PLAYER onUseAbility\n")
    player:addStatusEffect(tpz.effect.UNBRIDLED_LEARNING,1,0,60)

    return tpz.effect.UNBRIDLED_LEARNING
end
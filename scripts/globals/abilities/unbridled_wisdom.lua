-----------------------------------
-- Ability: Unbridled Wisdom
-- Allows certain blue magic spells to be cast.
-- Obtained: Blue Mage Level 96
-- Recast Time: 1:00:00
-- Duration: 1:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player,target,ability)
--	printf("Unbridled Wisdom PLAYER onAbilityCheck START\n")
    return 0,0
end

function onUseAbility(player, target, ability)
--	printf("Unbridled Wisdom PLAYER onUseAbility\n")
    player:addStatusEffect(tpz.effect.UNBRIDLED_WISDOM,1,0,60)

    return tpz.effect.UNBRIDLED_WISDOM
end
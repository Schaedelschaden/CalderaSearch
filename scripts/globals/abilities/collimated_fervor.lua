-----------------------------------
-- Ability: Collimated Fervor
-- Enhances the influence of your next Cardinal Chant cast.
-- Obtained: Geomancer Level 40
-- Recast Time: 5:00
-- Duration: 1:00, or until the next black magic spell is cast.
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0
end

function onUseAbility(player, target, ability)
    player:addStatusEffect(tpz.effect.COLLIMATED_FERVOR, 1, 0, 60)

    return tpz.effect.COLLIMATED_FERVOR
end
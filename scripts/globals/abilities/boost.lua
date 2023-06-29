-----------------------------------
-- Ability: Boost
-- Enhances user's next attack.
-- Obtained: Monk Level 5
-- Recast Time: 0:15
-- Duration: 3:00
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0
end

function onUseAbility(player, target, ability)
    local power = 50 + (player:getMod(tpz.mod.BOOST_EFFECT) / 100)

    player:addStatusEffect(tpz.effect.BOOST, power, 0, 180)
end

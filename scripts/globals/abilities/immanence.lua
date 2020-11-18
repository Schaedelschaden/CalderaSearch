-----------------------------------
-- Ability: Immanence
-- Makes it possible for your next elemental magic spell to be used in a skillchain, but not a magic burst.
-- Obtained: Scholar Level 87
-- Duration: 1 Black Magic Spell or 60 seconds, whichever occurs first.
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0
end

function onUseAbility(player, target, ability)
    player:addStatusEffect(tpz.effect.IMMANENCE, 1, 0, 60)
end
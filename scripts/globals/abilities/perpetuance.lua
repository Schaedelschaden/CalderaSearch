-----------------------------------
-- Ability: Perpetuance
-- Increases the enhancement effect duration of your next white magic spell.
-- Obtained: Scholar Level 87
-- Duration: 1 Enhancing Magic Spell or 60 seconds, whichever occurs first.
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0
end

function onUseAbility(player, target, ability)
    player:addStatusEffect(tpz.effect.PERPETUANCE, 1, 0, 60)
end
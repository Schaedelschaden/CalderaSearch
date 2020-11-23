-----------------------------------
-- Ability: Clarion Call
-- Increases the number of songs that can affect party members by one. 
-- Obtained: Bard Level 96
-- Recast Time: 1:00:00
-- Duration: 03:00
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0
end

function onUseAbility(player, target, ability)
    player:addStatusEffect(tpz.effect.CLARION_CALL, 1, 0, 180)
end

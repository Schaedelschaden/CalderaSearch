-----------------------------------
-- Ability: Yaegasumi
-- Allows you to evade special attacks. Grants a weapon skill damage bonus that varies with the number of special attacks evaded. 
-- Obtained: Samurai Level 96
-- Recast Time: 1:00:00
-- Duration: 0:45
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0
end

function onUseAbility(player,target,ability)
    player:addStatusEffect(tpz.effect.YAEGASUMI,20,0,45)
end
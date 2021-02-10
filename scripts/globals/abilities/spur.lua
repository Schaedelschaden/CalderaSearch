-----------------------------------
-- Ability: Spur
-- Grants "Store TP" effect to pets. 
-- Obtained: Beastmaster Level 83
-- Recast Time: 03:00
-- Duration: 0:01:30
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0
end

function onUseAbility(player, target, ability)
	local power = 20 + player:getMod(tpz.mod.ENH_SPUR)
    target:addStatusEffect(tpz.effect.SPUR, power, 0, 90)
end
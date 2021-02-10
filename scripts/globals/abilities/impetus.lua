-----------------------------------
-- Ability: Impetus
-- Enhances attack and critical hit rate with each successive melee attack you land.
-- Obtained: Monk Level 88
-- Recast Time: 05:00
-- Duration: 03:00
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0
end

function onUseAbility(player, target, ability)
	local subPower = player:getMod(tpz.mod.AUGMENT_IMPETUS)
    player:addStatusEffect(tpz.effect.IMPETUS, 1, 0, 180, 0, subPower)
end
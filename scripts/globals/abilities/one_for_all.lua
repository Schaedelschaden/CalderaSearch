-----------------------------------
-- Ability: One For All
-- Grants a Magic Shield effect for party members within area of effect.
-- Obtained: Rune Fencer Level 95
-- Recast Time: 5:00
-- Duration: 0:30
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0
end

function onUseAbility(player, target, ability)
	local power = math.floor(target:getMaxHP() * 0.2)

	target:delStatusEffect(tpz.effect.RAMPART)
	target:delStatusEffect(tpz.effect.SHINING_RUBY)
	target:delStatusEffect(tpz.effect.WINDS_BLESSING)
    target:addStatusEffect(tpz.effect.ONE_FOR_ALL, power, 0, 30)
end
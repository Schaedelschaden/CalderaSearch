-----------------------------------------
-- ID: 21100
-- Item: Magesmasher +1
-- Additional Effect vs. Arcana: Weakens defense
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player, target, damage)
	if (target:getSystem() == tpz.eco.ARCANA) then
		local chance = 15

		if (math.random(0, 99) >= chance or applyResistanceAddEffect(player, target, tpz.magic.ele.WIND, 0) <= 0.5) then
			return 0, 0, 0
		else
			target:delStatusEffect(tpz.effect.DEFENSE_BOOST)
			target:addStatusEffect(tpz.effect.DEFENSE_DOWN, 20, 0, 60)
			return tpz.subEffect.DEFENSE_DOWN, tpz.msg.basic.ADD_EFFECT_STATUS, tpz.effect.DEFENSE_DOWN
		end
	end
end
-----------------------------------------
-- ID: 21089
-- Item: Rubicundity
-- Additional Effect: HP, MP, or TP Drain
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player, target, damage)
    local chance = 100
	local chooseEffect = math.random(1, 100)

    if (math.random(0, 99) >= chance or target:isUndead()) then
        return 0, 0, 0
    else
		local subEffect
		local addEffect
		local drain
		
		if (chooseEffect >= 1 and chooseEffect <= 45 and target:getHP() > 10) then
			subEffect = tpz.subEffect.HP_DRAIN
			addEffect = tpz.msg.basic.ADD_EFFECT_HP_DRAIN
			drain = player:addHP(math.random(5, 10))
			target:setHP(target:getHP() - drain)
		elseif (chooseEffect >= 46 and chooseEffect <= 90 and target:getMP() > 8) then
			subEffect = tpz.subEffect.MP_DRAIN
			addEffect = tpz.msg.basic.ADD_EFFECT_MP_DRAIN
			drain = player:addMP(math.random(3, 8))
			target:setMP(target:getMP() - drain)
		elseif (chooseEffect >= 91 and chooseEffect <= 100 and target:getTP() > 50) then
			subEffect = tpz.subEffect.TP_DRAIN
			addEffect = tpz.msg.basic.ADD_EFFECT_TP_DRAIN
			drain = player:addTP(math.random(1, 50))
			target:setTP(target:getTP() - drain)
		end
		
        return subEffect, addEffect, drain
    end
end
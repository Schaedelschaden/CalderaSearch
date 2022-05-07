-----------------------------------------
-- ID: 19132
-- Item: Twilight Knife
-- Additional Effect: HP, MP, or TP Drain
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player, target, damage)
    local chance = 66
	local chooseEffect = math.random(1, 100)

    if (math.random(0, 99) >= chance or target:isUndead()) then
        return 0, 0, 0
    else
        -- local diff = player:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT)
		
        -- if (diff > 20) then
            -- diff = 20 + (diff - 20) / 2
        -- end
		
        -- local drain = diff + (player:getMainLvl() - target:getMainLvl()) + damage / 2
        -- local params = {}
		
        -- params.bonusmab = 0
        -- params.includemab = false
        -- drain = addBonusesAbility(player, tpz.magic.ele.DARK, target, drain, params)
        -- drain = drain * applyResistanceAddEffect(player, target, tpz.magic.ele.DARK, 0)
        -- drain = adjustForTarget(target, drain, tpz.magic.ele.DARK)
		
        -- if (drain < 0) then
            -- drain = 0
        -- end
		
        -- drain = finalMagicNonSpellAdjustments(player, target, tpz.magic.ele.DARK, drain)
		
		local subEffect
		local addEffect
		local drain
		
		if (chooseEffect >= 1 and chooseEffect <= 45 and target:getHP() > 6) then
			subEffect = tpz.subEffect.HP_DRAIN
			addEffect = tpz.msg.basic.ADD_EFFECT_HP_DRAIN
			drain = player:addHP(math.random(1, 6))
			target:setHP(target:getHP() - drain)
		elseif (chooseEffect >= 46 and chooseEffect <= 90 and target:getMP() > 5) then
			subEffect = tpz.subEffect.MP_DRAIN
			addEffect = tpz.msg.basic.ADD_EFFECT_MP_DRAIN
			drain = player:addMP(math.random(1, 5))
			target:setMP(target:getMP() - drain)
		elseif (chooseEffect >= 91 and chooseEffect <= 100 and target:getTP() > 30) then
			subEffect = tpz.subEffect.TP_DRAIN
			addEffect = tpz.msg.basic.ADD_EFFECT_TP_DRAIN
			drain = player:addTP(math.random(1, 30))
			target:setTP(target:getTP() - drain)
		end
		
        return subEffect, addEffect, drain
    end
end
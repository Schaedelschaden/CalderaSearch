-----------------------------------
-- Ability: Desperate Flourish
-- Weighs down a target with a low rate of success. Requires one Finishing Move.
-- Obtained: Dancer Level 30
-- Finishing Moves Used: 1
-- Recast Time: 00:20
-- Duration: ??
-----------------------------------
require("scripts/globals/weaponskills")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
    if (player:getAnimation() ~= 1) then
        return tpz.msg.basic.REQUIRES_COMBAT,0
	elseif (player:hasStatusEffect(tpz.effect.FINISHING_MOVE_1) or
        player:hasStatusEffect(tpz.effect.FINISHING_MOVE_2) or
        player:hasStatusEffect(tpz.effect.FINISHING_MOVE_3) or
        player:hasStatusEffect(tpz.effect.FINISHING_MOVE_4) or
        player:hasStatusEffect(tpz.effect.FINISHING_MOVE_5) or
		player:hasStatusEffect(tpz.effect.GRAND_PAS)) then
        return 0,0
    else
        return tpz.msg.basic.NO_FINISHINGMOVES,0
    end
end

function onUseAbility(player, target, ability, action)

    local isSneakValid = player:hasStatusEffect(tpz.effect.SNEAK_ATTACK)
    if (isSneakValid and not player:isBehind(target)) then
        isSneakValid = false
    end

    local hitrate = player:getHitRate(target)

    if (math.random() <= hitrate or isSneakValid) then
        local spell = getSpell(216)
        local params = {}
			params.diff = 0
			params.skillType = player:getWeaponSkillType(tpz.slot.MAIN)
			params.bonus = 50 - target:getMod(tpz.mod.STUNRES)
        local resist = applyResistance(player, target, spell, params)

        if resist > 0.25 then
            target:delStatusEffectSilent(tpz.effect.WEIGHT)
            target:addStatusEffect(tpz.effect.WEIGHT, 50, 0, 60 * resist)
        else
            ability:setMsg(tpz.msg.basic.JA_DAMAGE)
        end
        ability:setMsg(tpz.msg.basic.JA_ENFEEB_IS)
        action:animation(target:getID(), getFlourishAnimation(player:getWeaponSkillType(tpz.slot.MAIN)))
        action:speceffect(target:getID(), 2)
		
		if (player:hasStatusEffect(tpz.effect.FINISHING_MOVE_1)) then
			if not (player:hasStatusEffect(tpz.effect.GRAND_PAS)) then
				player:delStatusEffect(tpz.effect.FINISHING_MOVE_1)
			end
        elseif (player:hasStatusEffect(tpz.effect.FINISHING_MOVE_2)) then
			if not (player:hasStatusEffect(tpz.effect.GRAND_PAS)) then
				player:delStatusEffectSilent(tpz.effect.FINISHING_MOVE_2)
				player:addStatusEffect(tpz.effect.FINISHING_MOVE_1, 1, 0, 7200)
			end
        elseif (player:hasStatusEffect(tpz.effect.FINISHING_MOVE_3)) then
			if not (player:hasStatusEffect(tpz.effect.GRAND_PAS)) then
				player:delStatusEffectSilent(tpz.effect.FINISHING_MOVE_3)
				player:addStatusEffect(tpz.effect.FINISHING_MOVE_2, 1, 0, 7200)
			end
        elseif (player:hasStatusEffect(tpz.effect.FINISHING_MOVE_4)) then
			if not (player:hasStatusEffect(tpz.effect.GRAND_PAS)) then
				player:delStatusEffectSilent(tpz.effect.FINISHING_MOVE_4)
				player:addStatusEffect(tpz.effect.FINISHING_MOVE_3, 1, 0, 7200)
			end
        elseif (player:hasStatusEffect(tpz.effect.FINISHING_MOVE_5)) then
			if not (player:hasStatusEffect(tpz.effect.GRAND_PAS)) then
				player:delStatusEffectSilent(tpz.effect.FINISHING_MOVE_5)
				player:addStatusEffect(tpz.effect.FINISHING_MOVE_4, 1, 0, 7200)
			end
        end
		
        return tpz.effect.WEIGHT
    else
        ability:setMsg(tpz.msg.basic.JA_MISS)
		
        return 0
    end
end
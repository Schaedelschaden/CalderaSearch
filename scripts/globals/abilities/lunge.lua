-----------------------------------
-- Ability: Lunge
-- Expends all runes to deal damage to a target.
-- Obtained: Rune Fencer Level 25
-- Cast Time: Instant
-- Recast Time: 3:00 minutes
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/ability")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
	if (player:hasStatusEffect(tpz.effect.IGNIS) or
		player:hasStatusEffect(tpz.effect.GELUS) or
		player:hasStatusEffect(tpz.effect.FLABRA) or
		player:hasStatusEffect(tpz.effect.TELLUS) or
		player:hasStatusEffect(tpz.effect.SULPOR) or
		player:hasStatusEffect(tpz.effect.UNDA) or
		player:hasStatusEffect(tpz.effect.LUX) or
		player:hasStatusEffect(tpz.effect.TENEBRAE)) then
		return 0,0
	else
		return tpz.msg.basic.UNABLE_TO_USE_JA
	end
end

function onUseAbility(player, target, ability, action)	
	local RuneEnhancement = {tpz.effect.IGNIS, tpz.effect.GELUS, tpz.effect.FLABRA, tpz.effect.TELLUS, tpz.effect.SULPOR, tpz.effect.UNDA, tpz.effect.LUX, tpz.effect.TENEBRAE}
	local RuneEnspell = {tpz.effect.ENFIRE, tpz.effect.ENBLIZZARD, tpz.effect.ENAERO, tpz.effect.ENSTONE, tpz.effect.ENTHUNDER, tpz.effect.ENWATER, tpz.effect.ENLIGHT, tpz.effect.ENDARK}
	local element = {tpz.magic.ele.FIRE, tpz.magic.ele.ICE, tpz.magic.ele.WIND, tpz.magic.ele.EARTH, tpz.magic.ele.LIGHTNING, tpz.magic.ele.WATER, tpz.magic.ele.LIGHT, tpz.magic.ele.DARK}
	
	local Ele = tpz.magic.ele.NONE
	local Type = tpz.magic.ele.NONE
	local skillType = player:getWeaponSkillType(tpz.slot.MAIN)
	local RuneCounter = 0
	local bonus = 1.0
	local lungeBonus = player:getMod(tpz.mod.LUNGE_BONUS) / 100
	local multiplier = 2
	
	for i,v in ipairs(RuneEnhancement) do
		player:delStatusEffectSilent(RuneEnspell[i])
		if (player:hasStatusEffect(RuneEnhancement[i])) then
			RuneCounter = RuneCounter + player:countEffect(RuneEnhancement[i])
		end
		if (player:getOldestRune() == RuneEnhancement[i]) then
			Ele = element[i]
		end
	end
	
--	printf("lunge.lua onUseAbility LUNGE RUNE COUNTER: [%i]", RuneCounter)
	
	local runeBonus = RuneCounter * 0.25
	local dmg = player:getSkillLevel(skillType) * (0.50 + runeBonus + lungeBonus) * multiplier
	
	local params = {}
		params.includemab = true
		params.canBurst = true
		params.element = Ele
	
	local resist = applyResistanceAbility(player, target, Ele, tpz.skill.NONE, bonus)
	
	dmg = addBonusesAbility(player, Ele, target, dmg, params, ability)
	dmg = dmg * resist
    dmg = adjustForTarget(target, dmg, Ele)
	dmg = takeAbilityDamage(target, player, params, true, dmg, tpz.attackType.MAGICAL, Ele, tpz.slot.MAIN, 1, 0, 0, 0, action, nil)
	
	ability:setMsg(tpz.msg.basic.JA_DAMAGE)
	
	player:removeAllRunes()
	
	return dmg
end
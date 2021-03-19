-----------------------------------
-- Ability: Vivacious Pulse
-- Restores the caster's HP.
-- Obtained: Rune Fencer Level 65
-- Recast Time: 1:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

local statusAilments = {tpz.effect.BLINDNESS, tpz.effect.POISON, tpz.effect.PARALYSIS, tpz.effect.SILENCE, tpz.effect.CURSE, tpz.effect.DISEASE, tpz.effect.PLAGUE}

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

function onUseAbility(player, target, ability)
	local RuneEnhancement = {tpz.effect.IGNIS, tpz.effect.GELUS, tpz.effect.FLABRA, tpz.effect.TELLUS, tpz.effect.SULPOR, tpz.effect.UNDA, tpz.effect.LUX}
	local RuneStats = {player:getStat(tpz.mod.STR), player:getStat(tpz.mod.INT), player:getStat(tpz.mod.DEX), player:getStat(tpz.mod.VIT), player:getStat(tpz.mod.AGI), player:getStat(tpz.mod.MND), player:getStat(tpz.mod.CHR)}
	
	local RuneCounter = 0
	local Tenebrae = 0
	local TenebraeMulti = 0
	local skill = player:getSkillLevel(tpz.skill.DIVINE_MAGIC)
	local potency = 10 + math.floor(skill / 2)
--	printf("vivacious_pulse.lua onUseAbility POTENCY: [%i]", potency)
	
	for i,v in ipairs(RuneEnhancement) do
		if (player:hasStatusEffect(RuneEnhancement[i])) then
			RuneCounter = RuneCounter + player:countEffect(RuneEnhancement[i])
			potency = potency + math.floor(RuneStats[i] * 0.5)
--			printf("vivacious_pulse.lua onUseAbility RUNE POTENCY: [%i]", potency)
		end
	end
	
	if (player:hasStatusEffect(tpz.effect.TENEBRAE)) then
		Tenebrae = player:countEffect(tpz.effect.TENEBRAE)
		TenebraeMulti = math.floor((skill / 10) * (Tenebrae + 1))
--		printf("vivacious_pulse.lua onUseAbility TENEBRAE POTENCY: [%i]", TenebraeMulti)
	end
	
	local currentHP = player:getHP()
	local currentMP = player:getMP()
	
	player:setHP(currentHP + potency)
	player:setMP(currentMP + TenebraeMulti)
end
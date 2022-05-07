-----------------------------------
-- Ability: Rayke
-- Expends runes to reduce elemental resistance of the target.
-- Obtained: Rune Fencer Level 75 (Merit)
-- Cast Time: Instant
-- Recast Time: 5:00
-- Duration: 00:30
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/ability")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
	if (player:hasStatusEffect(tpz.effect.IGNIS) or player:hasStatusEffect(tpz.effect.GELUS) or player:hasStatusEffect(tpz.effect.FLABRA) or
		player:hasStatusEffect(tpz.effect.TELLUS) or player:hasStatusEffect(tpz.effect.SULPOR) or player:hasStatusEffect(tpz.effect.UNDA) or
		player:hasStatusEffect(tpz.effect.LUX) or player:hasStatusEffect(tpz.effect.TENEBRAE)) then
		return 0,0
	else
		return tpz.msg.basic.REQUIRES_RUNES
	end
end

function onUseAbility(player, target, ability, action)	
	local RuneEnhancement = {tpz.effect.IGNIS, tpz.effect.GELUS, tpz.effect.FLABRA, tpz.effect.TELLUS, tpz.effect.SULPOR, tpz.effect.UNDA, tpz.effect.LUX, tpz.effect.TENEBRAE}
	local resistPower = {"Rayke_Fire", "Rayke_Ice", "Rayke_Wind", "Rayke_Earth", "Rayke_Lightning", "Rayke_Water", "Rayke_Light", "Rayke_Dark"}
	
	local power = 100
	local RuneCounter = 0
	local duration = 30 + 15 -- Merits currently do not work so adding max Rayke duration bonus
	
	for i,v in ipairs(RuneEnhancement) do
		RuneCounter = 0
	
		if (player:hasStatusEffect(RuneEnhancement[i])) then
			RuneCounter = player:countEffect(RuneEnhancement[i])
			power = power * RuneCounter
			target:setLocalVar(resistPower[i], power)
--			printf("rayke.lua onUseAbility Rayke RUNE COUNTER: [%i]", RuneCounter[i])
		end
	end
	
	player:removeAllRunes()
	
	target:addStatusEffect(tpz.effect.RAYKE, 1, 0, duration)
	
	return tpz.effect.RAYKE
end
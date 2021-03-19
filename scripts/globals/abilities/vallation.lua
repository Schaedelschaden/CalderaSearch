-----------------------------------
-- Ability: Vallation
-- Reduces elemental damage. The types of elemental damage reduced depend on the runes you harbor.
-- Obtained: Rune Fencer Level 10
-- Recast Time: 3:00
-- Duration: 02:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
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

function onUseAbility(player, target, ability)
	local RuneEnhancement = {tpz.effect.IGNIS, tpz.effect.GELUS, tpz.effect.FLABRA, tpz.effect.TELLUS, tpz.effect.SULPOR, tpz.effect.UNDA, tpz.effect.LUX, tpz.effect.TENEBRAE}
	local sdtPower = {"Vallation_Ice", "Vallation_Wind", "Vallation_Earth", "Vallation_Lightning", "Vallation_Water", "Vallation_Fire", "Vallation_Dark", "Vallation_Light"}
	
	local merits = player:getMerit(tpz.merit.VALLATION_EFFECT)
	local power = 15 + merits
	local RuneCounter = 0
	local duration = 120 + player:getMod(tpz.mod.VALLATION_DURATION)
	
	for i,v in ipairs(RuneEnhancement) do
		RuneCounter = 0
		
		if (player:getMainJob() ~= tpz.job.RUN) then
			power = 10
		end

		if (player:hasStatusEffect(RuneEnhancement[i])) then
			RuneCounter = player:countEffect(RuneEnhancement[i])
			power = power * RuneCounter
			player:setCharVar(sdtPower[i], power)
--			printf("vallation.lua onUseAbility VALLATION RUNE: [%i] COUNTER: [%i] POWER: [%i]", RuneEnhancement[i], RuneCounter, power)
		end
	end
	
    target:addStatusEffect(tpz.effect.VALLATION, power, 0, duration)
end
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
	local RuneEnhancement = {tpz.effect.IGNIS, tpz.effect.GELUS, tpz.effect.FLABRA, tpz.effect.TELLUS, tpz.effect.SULPOR, tpz.effect.UNDA, tpz.effect.LUX, tpz.effect.TENEBRAE}
	local SDT = {tpz.mod.SDT_ICE, tpz.mod.SDT_WIND, tpz.mod.SDT_EARTH, tpz.mod.SDT_LIGHTNING, tpz.mod.SDT_WATER, tpz.mod.SDT_FIRE, tpz.mod.SDT_DARK, tpz.mod.SDT_LIGHT}
	
	local merits = player:getMerit(tpz.merit.VALLATION_EFFECT)
	local power = 15
	local RuneCounter = 0
	local duration = 120 + player:getMod(tpz.mod.VALLATION_DURATION)
	
	for i,v in ipairs(RuneEnhancement) do
		power = 15 + merits
		if (player:getMainJob() ~= tpz.job.RUN) then
			power = 10
		end
		RuneCounter = 0

		if (player:hasStatusEffect(RuneEnhancement[i])) then
			RuneCounter = player:countEffect(RuneEnhancement[i])
			power = power * RuneCounter
			player:addMod(SDT[i], power)
--			printf("vallation.lua onUseAbility VALLATION RUNE: [%i] COUNTER: [%i] POWER: [%i]", RuneEnhancement[i], RuneCounter, power)
		end
	end
	
    target:addStatusEffect(tpz.effect.VALLATION, power, 0, duration)
end
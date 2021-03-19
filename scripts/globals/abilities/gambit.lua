-----------------------------------
-- Ability: Gambit
-- Expends all runes harbored to reduce an enemy's elemental defense. The types of elemental defense reduced depend on the runes you harbor.
-- Obtained: Rune Fencer Level 70
-- Cast Time: Instant
-- Recast Time: 5:00
-- Duration: 1:00
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
	local sdtPower = {"Gambit_Fire", "Gambit_Ice", "Gambit_Wind", "Gambit_Earth", "Gambit_Lightning", "Gambit_Water", "Gambit_Light", "Gambit_Dark"}
	
	local power = 10
	local RuneCounter = 0
	local duration = 60 + player:getMod(tpz.mod.GAMBIT_DURATION)
	
	for i,v in ipairs(RuneEnhancement) do
		RuneCounter = 0
		
		if (player:hasStatusEffect(RuneEnhancement[i])) then
			RuneCounter = player:countEffect(RuneEnhancement[i])
			power = power * RuneCounter
			target:setLocalVar(sdtPower[i], power)
--			printf("gambit.lua onUseAbility GAMBIT RUNE COUNTER: [%i]", RuneCounter)
		end
	end
	
	player:removeAllRunes()
	
	target:addStatusEffect(tpz.effect.GAMBIT, 1, 0, duration)
	
	return tpz.effect.GAMBIT
end
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
	local RuneCounter = {0, 0, 0, 0, 0, 0, 0, 0}
	local power = 10
	local duration = 60 + player:getMod(tpz.mod.GAMBIT_DURATION)
	
	for i,v in ipairs(RuneEnhancement) do
		if (player:hasStatusEffect(RuneEnhancement[i])) then
			RuneCounter[i] = player:countEffect(RuneEnhancement[i])
--			printf("gambit.lua onUseAbility GAMBIT RUNE COUNTER: [%i]", RuneCounter[i])
		end
	end
	
	if (player:hasStatusEffect(RuneEnhancement[1])) then
		target:addMod(tpz.mod.SDT_FIRE, power * RuneCounter[1])
		target:setCharVar("Gambit_Fire", power * RuneCounter[1])
	end
	if (player:hasStatusEffect(RuneEnhancement[2])) then
		target:addMod(tpz.mod.SDT_ICE, power * RuneCounter[2])
		target:setCharVar("Gambit_Ice", power * RuneCounter[2])
	end
	if (player:hasStatusEffect(RuneEnhancement[3])) then
		target:addMod(tpz.mod.SDT_WIND, power * RuneCounter[3])
		target:setCharVar("Gambit_Wind", power * RuneCounter[3])
	end
	if (player:hasStatusEffect(RuneEnhancement[4])) then
		target:addMod(tpz.mod.SDT_EARTH, power * RuneCounter[4])
		target:setCharVar("Gambit_Earth", power * RuneCounter[4])
	end
	if (player:hasStatusEffect(RuneEnhancement[5])) then
		target:addMod(tpz.mod.SDT_LIGHTNING, power * RuneCounter[5])
		target:setCharVar("Gambit_Lightning", power * RuneCounter[5])
	end
	if (player:hasStatusEffect(RuneEnhancement[6])) then
		target:addMod(tpz.mod.SDT_WATER, power * RuneCounter[6])
		target:setCharVar("Gambit_Water", power * RuneCounter[6])
	end
	if (player:hasStatusEffect(RuneEnhancement[7])) then
		target:addMod(tpz.mod.SDT_LIGHT, power * RuneCounter[7])
		target:setCharVar("Gambit_Light", power * RuneCounter[7])
	end
	if (player:hasStatusEffect(RuneEnhancement[8])) then
		target:addMod(tpz.mod.SDT_DARK, power * RuneCounter[8])
		target:setCharVar("Gambit_Dark", power * RuneCounter[8])
	end
	
	player:removeAllRunes()
	
	target:addStatusEffect(tpz.effect.GAMBIT, 1, 0, duration)
	
--	ability:setMsg(tpz.msg.basic.SKILL_ENFEEB)
	
	return tpz.effect.GAMBIT
end
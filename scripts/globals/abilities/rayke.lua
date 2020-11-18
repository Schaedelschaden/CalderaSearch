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
	local power = 100
	local duration = 30
	
	for i,v in ipairs(RuneEnhancement) do
		if (player:hasStatusEffect(RuneEnhancement[i])) then
			RuneCounter[i] = player:countEffect(RuneEnhancement[i])
--			printf("rayke.lua onUseAbility Rayke RUNE COUNTER: [%i]", RuneCounter[i])
		end
	end
	
	if (player:hasStatusEffect(RuneEnhancement[1])) then
		target:delMod(tpz.mod.FIRERES, power * RuneCounter[1])
		target:setCharVar("Rayke_Fire", power * RuneCounter[1])
	end
	if (player:hasStatusEffect(RuneEnhancement[2])) then
		target:delMod(tpz.mod.ICERES, power * RuneCounter[2])
		target:setCharVar("Rayke_Ice", power * RuneCounter[2])
	end
	if (player:hasStatusEffect(RuneEnhancement[3])) then
		target:delMod(tpz.mod.WINDRES, power * RuneCounter[3])
		target:setCharVar("Rayke_Wind", power * RuneCounter[3])
	end
	if (player:hasStatusEffect(RuneEnhancement[4])) then
		target:delMod(tpz.mod.EARTHRES, power * RuneCounter[4])
		target:setCharVar("Rayke_Earth", power * RuneCounter[4])
	end
	if (player:hasStatusEffect(RuneEnhancement[5])) then
		target:delMod(tpz.mod.THUNDERRES, power * RuneCounter[5])
		target:setCharVar("Rayke_Lightning", power * RuneCounter[5])
	end
	if (player:hasStatusEffect(RuneEnhancement[6])) then
		target:delMod(tpz.mod.WATERRES, power * RuneCounter[6])
		target:setCharVar("Rayke_Water", power * RuneCounter[6])
	end
	if (player:hasStatusEffect(RuneEnhancement[7])) then
		target:delMod(tpz.mod.LIGHTRES, power * RuneCounter[7])
		target:setCharVar("Rayke_Light", power * RuneCounter[7])
	end
	if (player:hasStatusEffect(RuneEnhancement[8])) then
		target:delMod(tpz.mod.DARKRES, power * RuneCounter[8])
		target:setCharVar("Rayke_Dark", power * RuneCounter[8])
	end
	
	player:removeAllRunes()
	
	target:addStatusEffect(tpz.effect.RAYKE, 1, 0, duration)
	
--	ability:setMsg(tpz.msg.basic.SKILL_ENFEEB)
	
	return tpz.effect.RAYKE
end
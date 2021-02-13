-----------------------------------
-- Ability: Liement
-- Absorbs elemental damage. The types of elemental damage absorbed depend on the runes you harbor.
-- Obtained: Rune Fencer Level 85
-- Recast Time: 3:00
-- Duration: 00:10
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)	
	-- if (player:getEquipID(tpz.slot.MAIN) == 20753 or player:getEquipID(tpz.slot.MAIN) == 21685) then
		-- printf("liement.lua onAbilityCheck EPEOLATRY DETECTED")
		-- player:setAbilityAoE(357, 1, 20, 3)
	-- else
		-- player:setAbilityAoE(357, 0, 0, 1)
		-- printf("liement.lua onAbilityCheck OTHER WEAPON DETECTED")
	-- end
	
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
	
	local power = 100
	local RuneCounter = {0, 0, 0, 0, 0, 0, 0, 0}
	
	for i,v in ipairs(RuneEnhancement) do
		if (player:hasStatusEffect(RuneEnhancement[i])) then
			RuneCounter[i] = player:countEffect(RuneEnhancement[i])
			if (RuneCounter[i] > 0) then
				RuneCounter[i] = (RuneCounter[i] - 1) * 15
			end
		end
	end
	
	if (player:hasStatusEffect(RuneEnhancement[1])) then
		target:addMod(tpz.mod.ICE_ABSORB, power + RuneCounter[1])
		target:setCharVar("Liement_Ice", power + RuneCounter[1])
	end
	if (player:hasStatusEffect(RuneEnhancement[2])) then
	target:addMod(tpz.mod.WIND_ABSORB, power + RuneCounter[2])
		target:setCharVar("Liement_Wind", power + RuneCounter[2])
	end
	if (player:hasStatusEffect(RuneEnhancement[3])) then
	target:addMod(tpz.mod.EARTH_ABSORB, power + RuneCounter[3])
		target:setCharVar("Liement_Earth", power + RuneCounter[3])
	end
	if (player:hasStatusEffect(RuneEnhancement[4])) then
		target:addMod(tpz.mod.LTNG_ABSORB, power + RuneCounter[4])
		target:setCharVar("Liement_Lightning", power + RuneCounter[4])
	end
	if (player:hasStatusEffect(RuneEnhancement[5])) then
		target:addMod(tpz.mod.WATER_ABSORB, power + RuneCounter[5])
		target:setCharVar("Liement_Water", power + RuneCounter[5])
	end
	if (player:hasStatusEffect(RuneEnhancement[6])) then
		target:addMod(tpz.mod.FIRE_ABSORB, power + RuneCounter[6])
		target:setCharVar("Liement_Fire", power + RuneCounter[6])
	end
	if (player:hasStatusEffect(RuneEnhancement[7])) then
		target:addMod(tpz.mod.DARK_ABSORB, power + RuneCounter[7])
		target:setCharVar("Liement_Dark", power + RuneCounter[7])
	end
	if (player:hasStatusEffect(RuneEnhancement[8])) then
		target:addMod(tpz.mod.LIGHT_ABSORB, power + RuneCounter[8])
		target:setCharVar("Liement_Light", power + RuneCounter[8])
	end
	
--	printf("Liement.lua FIRE: [%i]  ICE: [%i]  WIND: [%i]  EARTH: [%i]  THUNDER: [%i]  WATER: [%i]  LIGHT: [%i]  DARK: [%i]", RuneCounter[1], RuneCounter[2], RuneCounter[3], RuneCounter[4], RuneCounter[5], RuneCounter[6], RuneCounter[7], RuneCounter[8])
	
	player:removeAllRunes()	
    target:addStatusEffect(tpz.effect.LIEMENT, 3, 0, 10)
	
	return tpz.effect.LIEMENT
end
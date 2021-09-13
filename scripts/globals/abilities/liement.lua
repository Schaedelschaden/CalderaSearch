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
	local absorbPower = {"Liement_Ice", "Liement_Wind", "Liement_Earth", "Liement_Lightning", "Liement_Water", "Liement_Fire", "Liement_Dark", "Liement_Light"}
	
	local power = 100
	local duration = 10 + player:getMod(tpz.mod.LIEMENT_DURATION)
	local RuneCounter = 0
	
	for i, v in ipairs(RuneEnhancement) do
		RuneCounter = 0
		if (player:hasStatusEffect(RuneEnhancement[i])) then
			RuneCounter = player:countEffect(RuneEnhancement[i])
			
			if (RuneCounter > 0) then
				RuneCounter = (RuneCounter - 1) * 15
			end
			
			target:setCharVar(absorbPower[i], power + RuneCounter)
		end
	end
	
--	printf("Liement.lua FIRE: [%i]  ICE: [%i]  WIND: [%i]  EARTH: [%i]  THUNDER: [%i]  WATER: [%i]  LIGHT: [%i]  DARK: [%i]", RuneCounter[1], RuneCounter[2], RuneCounter[3], RuneCounter[4], RuneCounter[5], RuneCounter[6], RuneCounter[7], RuneCounter[8])
	
--	player:removeAllRunes()
    target:addStatusEffect(tpz.effect.LIEMENT, 1, 0, duration)
	
	local party = player:getParty()
	local mob = player:getTarget()
	
	for i, v in ipairs(party) do
		if (v:hasStatusEffect(tpz.effect.LIEMENT) and mob ~= nil) then
			local currentCE = mob:getCE(player)
			local currentVE = mob:getVE(player)
			printf("liement.lua OnUseAbility  CE: [%i]  VE: [%i]", currentCE, currentVE)
			mob:setCE(player, currentCE + 450)
			mob:setVE(player, currentVE + 900)
		end
	end
	
	return tpz.effect.LIEMENT
end
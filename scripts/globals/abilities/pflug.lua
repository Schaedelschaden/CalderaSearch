-----------------------------------
-- Ability: Pflug
-- Enhances resistance. The types of resistance enhanced depend upon the runes you harbor.
-- Obtained: Rune Fencer Level 40
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
	local resistPower = {"Pflug_Fire", "Pflug_Ice", "Pflug_Wind", "Pflug_Earth", "Pflug_Lightning", "Pflug_Water", "Pflug_Light", "Pflug_Dark"}
	
	local merits = player:getMerit(tpz.merit.PFLUG_EFFECT)
	local bonus = player:getMod(tpz.mod.PFLUG_BONUS)
	local power = 15
	local RuneCounter = 0
	local duration = 120
	
	for i,v in ipairs(RuneEnhancement) do
		RuneCounter = 0
		power = 15 + merits
		
		if (player:getMainJob() ~= tpz.job.RUN) then
			power = 7
		end
		
		if (player:hasStatusEffect(RuneEnhancement[i])) then
			RuneCounter = player:countEffect(RuneEnhancement[i])
			power = power * RuneCounter
			player:setCharVar(resistPower[i], power)
		end
	end
	
    target:addStatusEffect(tpz.effect.PFLUG, power, 0, duration)
end
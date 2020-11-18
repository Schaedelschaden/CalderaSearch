-----------------------------------
-- Ability: Flabra
-- Increases resistance against earth and deals wind damage.
-- Obtained: Rune Fencer Level 5
-- Recast Time: 0:05
-- Duration: 5:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0
end

function onUseAbility(player, target, ability)
	local RuneEnhancement = {tpz.effect.IGNIS, tpz.effect.GELUS, tpz.effect.FLABRA, tpz.effect.TELLUS, tpz.effect.SULPOR, tpz.effect.UNDA, tpz.effect.LUX, tpz.effect.TENEBRAE}
	
	local MainLevel = player:getMainLvl()
	local RuneCounter = 0
	local merits = player:getMerit(tpz.merit.RUNE_ENHANCE)
	local potency = math.floor((((49 * MainLevel) / 99) + 5.5) + merits)
	
	if (player:getMainJob() ~= tpz.job.RUN) then
		MainLevel = math.floor(MainLevel / 2)
	end
	
	for i,v in ipairs(RuneEnhancement) do
		if (player:hasStatusEffect(RuneEnhancement[i])) then
			RuneCounter = RuneCounter + player:countEffect(RuneEnhancement[i])
		end
	end
	
--	printf("flabra.lua onUseAbility FLABRA RUNE ENHANCEMENT COUNTER: [%i]", RuneCounter)
	
	if ((MainLevel < 35) and (RuneCounter <= 1)) then
		for i,v in ipairs(RuneEnhancement) do
			player:delStatusEffect(RuneEnhancement[i])
		end
	elseif ((MainLevel > 35) and (MainLevel < 65) and (RuneCounter >= 2)) then
		player:removeOldestRune()
	elseif ((MainLevel > 65) and (RuneCounter >= 3)) then
		player:removeOldestRune()
	end

	player:addStatusEffect(RuneEnhancement[3], potency, 3, 300)
end
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
	-- local RESEffects = 
	-- {
		-- {id = 1, effects = {tpz.mod.PARALYZERES, tpz.mod.BINDRES}},
		-- {id = 2, effects = {tpz.mod.SILENCERES, tpz.mod.GRAVITYRES}},
		-- {id = 3, effects = {tpz.mod.PETRIFYRES, tpz.mod.SLOWRES}},
		-- {id = 4, effects = {tpz.mod.STUN}},
		-- {id = 5, effects = {tpz.mod.POISONRES, tpz.mod.VIRUSRES}},
		-- {id = 6, effects = {tpz.mod.AMNESIARES}},
		-- {id = 7, effects = {tpz.mod.SLEEPRES, tpz.mod.BLINDRES, tpz.mod.CURSERES}},
		-- {id = 8, effects = {tpz.mod.CHARMRES, tpz.mod.LULLABYRES, tpz.mod.DEATHRES}},
	-- }
	
	local merits = player:getMerit(tpz.merit.PFLUG_EFFECT)
	local bonus = player:getMod(tpz.mod.PFLUG_BONUS)
	local power = 15
	local RESPower = {0, 0, 0, 0, 0, 0, 0, 0}
	local RuneCounter = 0
	local duration = 120
	
	for i,v in ipairs(RuneEnhancement) do
		power = 15 + merits
		if (player:getMainJob() ~= tpz.job.RUN) then
			power = 7
		end
		RuneCounter = 0
		if (player:hasStatusEffect(RuneEnhancement[i])) then
			RuneCounter = player:countEffect(RuneEnhancement[i])
			RESPower[i] = power * RuneCounter
		end
	end
	
	if (player:hasStatusEffect(RuneEnhancement[1])) then
		player:addMod(tpz.mod.PARALYZERES, RESPower[1])
		player:addMod(tpz.mod.BINDRES, RESPower[1])
		player:setCharVar("Pflug_Fire", RESPower[1])
	elseif (player:hasStatusEffect(RuneEnhancement[2])) then
		player:addMod(tpz.mod.SILENCERES, RESPower[2])
		player:addMod(tpz.mod.GRAVITYRES, RESPower[2])
		player:setCharVar("Pflug_Ice", RESPower[2])
	elseif (player:hasStatusEffect(RuneEnhancement[3])) then
		player:addMod(tpz.mod.PETRIFYRES, RESPower[3])
		player:addMod(tpz.mod.SLOWRES, RESPower[3])
		player:setCharVar("Pflug_Wind", RESPower[3])
	elseif (player:hasStatusEffect(RuneEnhancement[4])) then
		player:addMod(tpz.mod.STUNRES, RESPower[4])
		player:setCharVar("Pflug_Earth", RESPower[4])
	elseif (player:hasStatusEffect(RuneEnhancement[5])) then
		player:addMod(tpz.mod.POISONRES, RESPower[5])
		player:addMod(tpz.mod.VIRUSRES, RESPower[5])
		player:setCharVar("Pflug_Lightning", RESPower[5])
	elseif (player:hasStatusEffect(RuneEnhancement[6])) then
		player:addMod(tpz.mod.AMNESIARES, RESPower[6])
		player:setCharVar("Pflug_Water", RESPower[6])
	elseif (player:hasStatusEffect(RuneEnhancement[7])) then
		player:addMod(tpz.mod.SLEEPRES, RESPower[7])
		player:addMod(tpz.mod.BLINDRES, RESPower[7])
		player:addMod(tpz.mod.CURSERES, RESPower[7])
		player:setCharVar("Pflug_Light", RESPower[7])
	elseif (player:hasStatusEffect(RuneEnhancement[8])) then
		player:addMod(tpz.mod.CHARMRES, RESPower[8])
		player:addMod(tpz.mod.LULLABYRES, RESPower[8])
		player:addMod(tpz.mod.DEATHRES, RESPower[8])
		player:setCharVar("Pflug_Dark", RESPower[8])
	end
	
	-- printf("pflug.lua PARALYZE/BIND: [%i]  SILENCE/GRAVITY: [%i]  PETRIFY/SLOW: [%i]  STUN: [%i]  POISON/VIRUS: [%i]", RESPower[1], RESPower[2], RESPower[3], RESPower[4], RESPower[5])
	-- printf("pflug.lua AMNESIA: [%i]  SLEEP/BLIND/CURSE: [%i]  CHARM/LULLABY/DEATH: [%i]", RESPower[6], RESPower[7], RESPower[8])
	
    target:addStatusEffect(tpz.effect.PFLUG, power, 0, duration)
end
-----------------------------------
--
-- tpz.effect.PFLUG
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local resistPower = {"Pflug_Fire", "Pflug_Ice", "Pflug_Wind", "Pflug_Earth", "Pflug_Lightning", "Pflug_Water", "Pflug_Light", "Pflug_Dark"}
local resistMod = {
					{mod = {tpz.mod.PARALYZERES, tpz.mod.BINDRES}},
					{mod = {tpz.mod.SILENCERES, tpz.mod.GRAVITYRES}},
					{mod = {tpz.mod.PETRIFYRES, tpz.mod.SLOWRES}},
					{mod = {tpz.mod.STUNRES}},
					{mod = {tpz.mod.POISONRES, tpz.mod.VIRUSRES}},
					{mod = {tpz.mod.AMNESIARES}},
					{mod = {tpz.mod.SLEEPRES, tpz.mod.BLINDRES, tpz.mod.CURSERES}},
					{mod = {tpz.mod.CHARMRES, tpz.mod.LULLABYRES, tpz.mod.DEATHRES}}
				  }

function onEffectGain(target, effect)
	-- Check resistPower table for rune values
	for i= 1, #resistPower do
		local power = target:getCharVar(resistPower[i])
		
		-- When the rune power is higher than 0 we add the mods from the resistMod table
		for v = 1, #resistMod[i].mod do
			if (power > 0) then
				target:addMod(resistMod[i].mod[v], power)
--				printf("pflug.lua onEffectGain MOD: [%i]", resistMod[i].mod[v])
			end
		end
	end
end

function onEffectTick(target, effect)
	
end

function onEffectLose(target, effect)
	-- Check resistPower table for rune values
	for i= 1, #resistPower do
		local power = target:getCharVar(resistPower[i])
		
		-- When the rune power is higher than 0 we delete the mods from the resistMod table
		for v = 1, #resistMod[i].mod do
			if (power > 0) then
				target:delMod(resistMod[i].mod[v], power)
--				printf("pflug.lua onEffectLose MOD: [%i]", resistMod[i].mod[v])
			end
		end
		
		target:setCharVar(resistPower[i], 0)
	end
end
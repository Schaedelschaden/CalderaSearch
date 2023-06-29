-----------------------------------
--
-- tpz.effect.PFLUG
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local resistPower = {"Pflug_Fire", "Pflug_Ice", "Pflug_Wind", "Pflug_Earth", "Pflug_Lightning", "Pflug_Water", "Pflug_Light", "Pflug_Dark"}
local resistMod =
{
    {mod = {tpz.mod.PARALYZERES, tpz.mod.BINDRES,                                       }}, -- (Fire rune)
    {mod = {tpz.mod.SILENCERES,  tpz.mod.GRAVITYRES,                                    }}, -- (Ice rune)
    {mod = {tpz.mod.PETRIFYRES,  tpz.mod.SLOWRES,                                       }}, -- (Wind rune)
    {mod = {tpz.mod.STUNRES,                                                            }}, -- (Earth rune)
    {mod = {tpz.mod.POISONRES,   tpz.mod.VIRUSRES,                                      }}, -- (Thunder rune)
    {mod = {tpz.mod.AMNESIARES,                                                         }}, -- (Water rune)
    {mod = {tpz.mod.SLEEPRES,    tpz.mod.BLINDRES,   tpz.mod.CURSERES, tpz.mod.DEATHRES,}}, -- Lux (Light Rune)
    {mod = {tpz.mod.CHARMRES,    tpz.mod.LULLABYRES,                                    }}, -- Tenebrae (Dark Rune)
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
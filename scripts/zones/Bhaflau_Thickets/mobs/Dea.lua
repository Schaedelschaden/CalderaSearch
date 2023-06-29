-----------------------------------
-- Area: Bhaflau Thickets
-- Mob: Dark Pheliont (Dea)
-----------------------------------
local ID = require("scripts/zones/Bhaflau_Thickets/IDs")
require("scripts/globals/mobs")

function onMobSpawn(mob, target)
    mob:renameEntity("Dark Pheliont")
    mob:addMod(tpz.mod.PARALYZERES, 50) -- Resistance to Paralyze
    mob:addMod(tpz.mod.STUNRES, 60) -- Resistance to Stun
    mob:addMod(tpz.mod.BINDRES, 100) -- Resistance to Bind
    mob:addMod(tpz.mod.SLOWRES, 50) -- Resistance to Slow
    mob:addMod(tpz.mod.SILENCERES, 60) -- Resistance to Silence
    mob:addMod(tpz.mod.SLEEPRES, 60) -- Resistance to Sleep
    mob:addMod(tpz.mod.LULLABYRES, 60) -- Resistance to Lullaby
    mob:addMod(tpz.mod.PETRIFYRES, 60) -- Resistance to Pertrify
    mob:addMod(tpz.mod.POISONRES, 60) -- Resistance to Poison	
	mob:addMod(tpz.mod.STR, 130)	
	mob:addMod(tpz.mod.DEX, 130)	
	mob:addMod(tpz.mod.VIT, 130)	
	mob:addMod(tpz.mod.CHR, 130)	
	mob:addMod(tpz.mod.MND, 130)	
	mob:addMod(tpz.mod.INT, 130)	
	mob:addMod(tpz.mod.MATT, 300)	
	mob:addMod(tpz.mod.MDEF, 100)
	mob:addMod(tpz.mod.DEF, 600)
	mob:addMod(tpz.mod.ATT, 900)
	mob:addMod(tpz.mod.MEVA, 250)
	mob:addMod(tpz.mod.MACC, 100)
	mob:addMod(tpz.mod.REGEN, 200)
    mob:addMod(tpz.mod.FASTCAST, 50)
    mob:setMobMod(tpz.mobMod.DUAL_WIELD, 1)
end

function onMobFight(mob, target)
    mob:renameEntity("Dark Pheliont")
end

function onMobDeath(mob, player, isKiller)
    mob:setRespawnTime(20)
end

function onMobDespawn(mob)
    
end

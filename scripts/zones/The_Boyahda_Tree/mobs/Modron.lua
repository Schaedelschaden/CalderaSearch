-----------------------------------
-- Area: The Boyahda Tree
-- Mob: Modron
-- MobID: 17404339, 17404342, 17404345
-- !pos 317.441 8.305 -27.403 153
-- !pos 120.600 8.382 67.299 153
-- !pos -52.767 -19.999 -17.185 153
--
-----------------------------------

function onMobSpawn(mob) -- When mob spawns (either forced or time)
	mob:addMod(tpz.mod.PARALYZERES, 30) -- Resistance to Silence
    mob:addMod(tpz.mod.STUNRES, 100)    -- Resistance to Stun
    mob:addMod(tpz.mod.BINDRES, 30)     -- Resistance to Bind
    mob:addMod(tpz.mod.SLOWRES, 30)     -- Resistance to Slow
    mob:addMod(tpz.mod.SILENCERES, 30)  -- Resistance to Silence
    mob:addMod(tpz.mod.SLEEPRES, 30)    -- Resistance to Sleep
    mob:addMod(tpz.mod.LULLABYRES, 30)  -- Resistance to Lullaby
    mob:addMod(tpz.mod.PETRIFYRES, 30)  -- Resistance to Pertrify
    mob:addMod(tpz.mod.POISONRES, 30)   -- Resistance to Poison
	mob:addMod(tpz.mod.ATT, 500)        -- Attack Stat (Compare to DEF)
	mob:addMod(tpz.mod.MATT, 100)       -- Magic Attack (Compare to MDEF)
	mob:addMod(tpz.mod.EVA, 50)         -- Evasion (Compare to ACC)
	mob:addMod(tpz.mod.DEF, 1000)       -- Defense (Compare to ATT)
	mob:addMod(tpz.mod.MEVA, 200)       -- Magic Evasion (Compare to MACC)
	mob:addMod(tpz.mod.MDEF, 100)       -- Magic Defense (Compare to MATT)
    mob:addMod(tpz.mob.ACC, -150)
	mob:addMod(tpz.mod.STR, 200)
    mob:addMod(tpz.mod.DEX, 200)
    mob:addMod(tpz.mod.AGI, 200)
    mob:addMod(tpz.mod.VIT, 200)
    mob:addMod(tpz.mod.MND, 200)
    mob:addMod(tpz.mod.CHR, 200)
    mob:addMod(tpz.mod.INT, 200)
    -- mob:addMod(tpz.mod.ALL_WSDMG_ALL_HITS, 75)
end

function onMobDeath(mob, player, isKiller)
end

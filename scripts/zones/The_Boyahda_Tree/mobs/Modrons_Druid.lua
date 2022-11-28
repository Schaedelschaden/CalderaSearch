-----------------------------------
-- Area: The Boyada Tree
-- NM: Modron's Druid
-- MobID: 17404340, 17404341, 17404343, 17404344, 17404346, 17404347
-- !pos 317.441 8.305 -27.403 153
-- !pos 120.600 8.382 67.299 153
-- !pos -52.767 -19.999 -17.185 153
-- Adds for Modron
--
-----------------------------------

function onMobSpawn(mob) -- When mob spawns (either forced or time)
    mob:addMod(tpz.mod.SLEEPRES, 100)   -- Resistance to Sleep
    mob:addMod(tpz.mod.LULLABYRES, 100) -- Resistance to Lullaby
	mob:addMod(tpz.mod.ATT, 500)        -- Attack Stat (Compare to DEF)
	mob:addMod(tpz.mod.MATT, 100)       -- Magic Attack (Compare to MDEF)
	mob:addMod(tpz.mod.EVA, 50)         -- Evasion (Compare to ACC)
	mob:addMod(tpz.mod.DEF, 1000)       -- Defense (Compare to ATT)
	mob:addMod(tpz.mod.MEVA, 100)       -- Magic Evasion (Compare to MACC)
	mob:addMod(tpz.mod.MDEF, 100)       -- Magic Defense (Compare to MATT)
    mob:addMod(tpz.mob.ACC, -150)
	mob:addMod(tpz.mod.STR, 100)
    mob:addMod(tpz.mod.DEX, 100)
    mob:addMod(tpz.mod.AGI, 100)
    mob:addMod(tpz.mod.VIT, 100)
    mob:addMod(tpz.mod.MND, 100)
    mob:addMod(tpz.mod.CHR, 100)
    mob:addMod(tpz.mod.INT, 100)
    mob:addMod(tpz.mod.ALL_WSDMG_ALL_HITS, 25)
end

function onMobDeath(mob, player, isKiller)
end

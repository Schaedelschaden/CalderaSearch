-----------------------------------
-- Area: The Sanctuary of Zitah
-- NM: Grwnan
-- MobID: 17273319, 17273320
-- !pos -89.080 -0.211 -315.308 121
-- Adds for Cath Palug
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

-----------------------------------
-- Area: Dynamis - San d'Oria
--  Mob: Wyrmgnasher Bjakdek
-----------------------------------
mixins =
{
    require("scripts/mixins/dynamis_beastmen"),
    require("scripts/mixins/job_special")
}
-----------------------------------

function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
	mob:setMod(tpz.mod.PARALYZERES, 50) -- Resistance to Silence
    mob:setMod(tpz.mod.STUNRES, 50) -- Resistance to Stun
    mob:setMod(tpz.mod.BINDRES, 35) -- Resistance to Bind
    mob:setMod(tpz.mod.SLOWRES, 50) -- Resistance to Slow
	mob:addMod(tpz.mod.ATT, 200) -- Attack Stat (Compare to DEF)
	mob:addMod(tpz.mod.MATT, 120) -- Magic Attack (Compare to MDEF)
    mob:addMod(tpz.mod.ACC, 200) -- Accuracy (compare to EVA)
	mob:addMod(tpz.mod.MACC, 100) -- Magic ACC (Compare to MEVA)
	mob:addMod(tpz.mod.EVA, 150) -- Evasion (Compare to ACC)
	mob:addMod(tpz.mod.DEF, 200) -- Defense (Compart to ATT)
	mob:addMod(tpz.mod.MEVA, 100) -- Magic Evasion (Compare to MACC)
	mob:setMod(tpz.mod.REGAIN, 100)
	mob:setMod(tpz.mod.REGEN, 200)
end

function onMobFight(mob, target)
	mob:setMobMod(tpz.mobMod.NO_MOVE, 0)
end

function onMobDeath(mob, player, isKiller)
end
-----------------------------------
-- Area: Dynamis - Buburimu
--  Mob: Alklha
-- POS: -94 -2 -182
-- MOB ID: 16941365
-----------------------------------
mixins =
{
    require("scripts/mixins/dynamis_beastmen"),
    require("scripts/mixins/job_special"),
    require("scripts/mixins/remove_doom")
}
-----------------------------------

function onMobSpawn(mob)
	mob:addMod(tpz.mod.ATT, 300)
	-- mob:addMod(tpz.mod.ACC, 100)
	-- mob:addMod(tpz.mod.MACC, 100)
	mob:addMod(tpz.mod.MATT, 130)
	mob:addMod(tpz.mod.DEF, 600)
	mob:addMod(tpz.mod.EVA, 100)
	mob:addMod(tpz.mod.MEVA, 80)
	mob:addMod(tpz.mod.VIT, 100)
	mob:addMod(tpz.mod.STR, 60)
	mob:addMod(tpz.mod.DMGPHYS, -50)
	mob:addMod(tpz.mod.DMGMAGIC, 25)
	mob:addMod(tpz.mod.SLEEPRES, 100)
	mob:addMod(tpz.mod.STUNRES, 100)
	mob:addMod(tpz.mod.BINDRES, 100)
	mob:addMod(tpz.mod.SLOWRES, 50)
	mob:addMod(tpz.mod.STORETP, 30)
end

function onMobDeath(mob, player, isKiller)
end
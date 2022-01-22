-----------------------------------
-- Area: Dynamis - Buburimu
--  Mob: Apocalyptic Beast
-- Note: Mega Boss
-- POS: -224 -22 100.5
-- MOBID: 16941057
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

function onMobSpawn(mob)
	mob:addMod(tpz.mod.ATT, 400)
	mob:addMod(tpz.mod.ACC, 100)
	mob:addMod(tpz.mod.MACC, 100)
	mob:addMod(tpz.mod.MATT, 160)
	mob:addMod(tpz.mod.DEF, 800)
	mob:addMod(tpz.mod.EVA, 100)
	mob:addMod(tpz.mod.MEVA, 80)
	mob:addMod(tpz.mod.VIT, 100)
	mob:addMod(tpz.mod.STR, 60)
	mob:addMod(tpz.mod.DMG, 25)
	mob:addMod(tpz.mod.SLEEPRES, 100)
	mob:addMod(tpz.mod.STUNRES, 100)
	mob:addMod(tpz.mod.BINDRES, 100)
	mob:addMod(tpz.mod.SLOWRES, 50)
	mob:addMod(tpz.mod.STORETP, 100)
end

function onMobDeath(mob, player, isKiller)
    dynamis.megaBossOnDeath(mob, player, isKiller)
end

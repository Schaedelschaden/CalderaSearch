-----------------------------------
-- Area: Castle Oztroja
--  Mob: Yagudo's Avatar
-----------------------------------
-- mixins = {require("scripts/mixins/families/avatar")}

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 1)
end

function onMobSpawn(mob)
	mob:setMod(tpz.mod.SLEEPRES, 100)
	mob:setMod(tpz.mod.ATT, 800)
	mob:setMod(tpz.mod.MATT, 100)
    mob:setMod(tpz.mod.ACC, 800)
	mob:setMod(tpz.mod.MACC, 400)
    mob:setMod(tpz.mod.EVA, 500)
	mob:setMod(tpz.mod.DEF, 800)
	mob:setMod(tpz.mod.MEVA, 600)
	mob:setMod(tpz.mod.MDEF, 150)
	mob:setMod(tpz.mod.DOUBLE_ATTACK, 30)
	mob:setMod(tpz.mod.CRITHITRATE, 25)
end

function onMobDeath(mob, player, isKiller)
end
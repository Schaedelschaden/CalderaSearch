-----------------------------------
-- Area: Horlais Peak
--  Mob: Chlevnik
-- KSNM99
-----------------------------------
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobSpawn(mob)
    mob:setMod(tpz.mod.STUNRES, 1000)
	mob:addMod(tpz.mod.ATK, 500)
	mob:addMod(tpz.mod.MATT, 500)
	mob:addMod(tpz.mod.ACC, 500)
	mob:addMod(tpz.mod.MACC, 500)
	mob:addMod(tpz.mod.REGAIN, 300)
	mob:addMod(tpz.mod.REFRESH, 25)
end

function onAdditionalEffect(mob, target, damage)
	params = {}
	params.power = 300
	params.chance = 100
	
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENTHUNDER, params)
end

function onMobDeath(mob, player, isKiller)
end
-----------------------------------
-- Area: Abyssea - La Theine
--   NM: Irrlicht
-----------------------------------

function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
	mob:setMod(tpz.mod.BINDRES, 100)
	mob:setMod(tpz.mod.GRAVITYRES, 100)
	mob:setMod(tpz.mod.SLEEPRES, 100)
	mob:setMod(tpz.mod.REFRESH, 20)
	mob:setMod(tpz.mod.DOUBLE_ATTACK, 20)
end

function onMobFight(mob, target)
	
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.BIND, {chance = 100})
end

function onMobDeath(mob, player, isKiller)
	
end
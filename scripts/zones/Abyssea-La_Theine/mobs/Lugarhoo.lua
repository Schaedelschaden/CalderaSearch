-----------------------------------
-- Area: Abyssea - La Theine
--  Mob: Lugarhoo
-----------------------------------
mixins = {require("scripts/mixins/families/gnole")}
-----------------------------------

function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobFight(mob)
	
end

function onAdditionalEffect(mob, target, damage)
	return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.STUN, {chance = 10})
end

function onMobDeath(mob, player, isKiller)
	
end
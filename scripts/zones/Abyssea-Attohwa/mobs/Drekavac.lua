-----------------------------------
-- Area: Abyssea - Attohwa
--  Mob: Drekavac
-----------------------------------

function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
	mob:setMod(tpz.mod.PARALYZERES, 100)
	mob:setMod(tpz.mod.SILENCERES, 100)
	mob:setMod(tpz.mod.STUNRES, 80)
	mob:setMod(tpz.mod.DOUBLE_ATTACK, 100)
end

function onMobFight(mob, target)
	
end

function onAdditionalEffect(mob, target, damage)
	local hpp = mob:getHPP()

	params = {}
	params.power = 100 + (100 - hpp)
	params.chance = 100
	
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENWATER, params)
end

function onMobDeath(mob, player, isKiller)
	
end
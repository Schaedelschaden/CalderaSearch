-----------------------------------
-- Area: Abyssea-Attohwa
--   NM: Wherwetrice
-----------------------------------

function onMobInitialize(mob)
end

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
    mob:addMod(tpz.mod.BINDRES, 85)
    mob:addMod(tpz.mod.GRAVITYRES, 85)
    mob:addMod(tpz.mod.ACC, 150)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 100)
end

function onMobFight(mob, target)
end

function onAdditionalEffect(mob, target, damage)
	local params = {}
		params.chance = 35

    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.AMNESIA, params)
end

function onMobDespawn(mob)
end

function onMobDeath(mob, player, isKiller)
end

-----------------------------------
-- Area: Waughroon Shrine
--  Mob: Tartaruga Gigante
-----------------------------------

function onAdditionalEffect(mob, target, damage)
	params = {}
	params.power = 150
	params.chance = 100
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENWATER)
end

function onMobSpawn(mob)
	mob:addMod(tpz.mod.ATK, 1300)
	mob:addMod(tpz.mod.MATT, 600)
	mob:addMod(tpz.mod.ACC, 500)
	mob:addMod(tpz.mod.MACC, 500)
	mob:addMod(tpz.mod.REFRESH, 25)
end

function onMobDeath(mob, player, isKiller)
end

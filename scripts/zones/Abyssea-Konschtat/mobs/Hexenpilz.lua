-----------------------------------
-- Area: Abyssea - Konschtat
--  Mob: Hexenpilz
-----------------------------------

function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
	mob:setMod(tpz.mod.BINDRES, 100)
	mob:setMod(tpz.mod.POISONRES, 80)
	mob:setMod(tpz.mod.REGAIN, 150)
end

function onMobFight(mob)

end

function onAdditionalEffect(mob, target, damage)
	local params = {}
		params.chance = 100
		params.power = 75
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENDARK)
end

function onMobDeath(mob, player, isKiller)
	
end
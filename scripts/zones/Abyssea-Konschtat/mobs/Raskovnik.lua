-----------------------------------
-- Area: Abyssea - La Theine
--  Mob: Raskovnik
-----------------------------------

function onMobSpawn(mob)
	mob:setMod(tpz.mod.SILENCERES, 100)
	mob:setMod(tpz.mod.GRAVITYRES, 100)
	mob:setMod(tpz.mod.BINDRES, 100)
	mob:setMod(tpz.mod.MOVE, 100)
end

function onMobFight(mob)

end

function onMobDeath(mob, player, isKiller)
	tpz.abyssea.kiOnMobDeath(mob, player)
end
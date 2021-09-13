-----------------------------------
-- Area: Abyssea - La Theine
--  Mob: Alkonost
-----------------------------------

function onMobSpawn(mob)
	mob:setMod(tpz.mod.REFRESH, 10)
	mob:addMod(tpz.mod.MATT, 100)
end

function onMobFight(mob)

end

function onMobDeath(mob, player, isKiller)
	
end
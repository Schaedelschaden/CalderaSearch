-----------------------------------
-- Area: Abyssea - La Theine
--  Mob: Ashtaerh the Gallvexed
-----------------------------------

function onMobSpawn(mob)
	mob:setMod(tpz.mod.REFRESH, 10)
	mob:addMod(tpz.mod.MATT, 100)
	mob:setDropID(3217)
end

function onMobFight(mob)

end

function onMobDeath(mob, player, isKiller)
	
end
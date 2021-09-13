-----------------------------------
-- Area: Abyssea - La Theine
--  Mob: Mesa Wivre
-----------------------------------

function onMobSpawn(mob)
	mob:setBehaviour(bit.bor(mob:getBehaviour(), tpz.behavior.NO_TURN))
end

function onMobFight(mob)
	
end

function onMobDeath(mob, player, isKiller)
	
end
-----------------------------------
-- Area: Abyssea - Tahrongi
--  Mob: Bhumi
-----------------------------------

function onMobSpawn(mob)
	mob:setMod(tpz.mod.BINDRES, 85)
	mob:setMod(tpz.mod.GRAVITYRES, 85)
	mob:setMod(tpz.mod.POISONRES, 100)
	mob:setMod(tpz.mod.TRIPLE_ATTACK, 50)
end

function onMobFight(mob, target)
	
end

function onMobDeath(mob, player, isKiller)
	tpz.abyssea.kiOnMobDeath(mob, player)
end
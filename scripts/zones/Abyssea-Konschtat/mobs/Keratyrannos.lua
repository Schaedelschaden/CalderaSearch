-----------------------------------
-- Area: Abyssea - Konschtat
--  Mob: Keratyrannos
-----------------------------------

function onMobSpawn(mob)
	mob:setMod(tpz.mod.TRIPLE_ATTACK, 20)
	mob:setBehaviour(bit.bor(mob:getBehaviour(), tpz.behavior.NO_TURN))
end

function onMobFight(mob)
	
end

function onMobDeath(mob, player, isKiller)
	tpz.abyssea.kiOnMobDeath(mob, player)
end
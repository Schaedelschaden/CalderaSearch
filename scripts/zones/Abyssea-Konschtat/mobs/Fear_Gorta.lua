-----------------------------------
-- Area: Abyssea - Konschtat
--  Mob: Fear Gorta
-----------------------------------

function onMobSpawn(mob)
	mob:setMod(tpz.mod.PARALYZERES, 85)
	mob:setMod(tpz.mod.EARTHDEF, 128)
end

function onMobFight(mob)
	
end

function onMobDeath(mob, player, isKiller)
    player:addSpell(944, true, true)	
end
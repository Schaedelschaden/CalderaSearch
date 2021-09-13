-----------------------------------
-- Area: Abyssea - Konschtat
--  Mob: Bloodguzzler
-----------------------------------

function onMobSpawn(mob)
	mob:setMod(tpz.mod.BINDRES, 75)
	mob:setMod(tpz.mod.GRAVITYRES, 75)
	mob:setMod(tpz.mod.SLEEPRES, 75)
end

function onMobFight(mob)

end

function onMobDeath(mob, player, isKiller)
	
end
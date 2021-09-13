-----------------------------------
-- Area: Abyssea - Tahrongi
--  Mob: Tefenet
-----------------------------------

function onMobSpawn(mob)
	
end

function onMobFight(mob, target)
	local hpp = mob:getHPP()
	
	mob:setMod(tpz.mod.REGAIN, utils.clamp((100 - hpp) * 2.5, 10, 200))
end

function onMobDeath(mob, player, isKiller)
	
end
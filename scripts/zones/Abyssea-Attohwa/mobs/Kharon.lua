-----------------------------------
-- Area: Abyssea - Attohwa
--  Mob: Kharon
-----------------------------------

function onMobSpawn(mob)
	mob:setLocalVar("MOBSKILL_INCREASED_POTENCY", 1) -- 05/26/22 - Needs to be set up
	mob:setMod(tpz.mod.SILENCERES, 90)
end

function onMobFight(mob, target)
	
end

function onMobDeath(mob, player, isKiller)
	
end
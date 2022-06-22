-----------------------------------
-- Area: Abyssea - Attohwa
--  Mob: Pallid Percy
-----------------------------------

function onMobSpawn(mob)
	mob:setLocalVar("MOBSKILL_INCREASED_POTENCY", 1) -- 05/26/22 - Needs to be set up
	mob:setMobMod(tpz.mobMod.DRAW_IN, 1)
	mob:setMod(tpz.mod.DMGBREATH, -35)
end

function onMobFight(mob, target)
	
end

function onMobDrawIn(mob, target)
    mob:useMobAbility(2645)
end

function onMobDeath(mob, player, isKiller)
	
end
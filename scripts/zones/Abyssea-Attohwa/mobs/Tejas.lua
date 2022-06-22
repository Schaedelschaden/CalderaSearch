-----------------------------------
-- Area: Abyssea - Attohwa
--  Mob: Tejas
-----------------------------------

function onMobSpawn(mob)
	mob:setLocalVar("MOBSKILL_INCREASED_POTENCY", 1) -- 05/26/22 - Needs to be set up
end

function onMobFight(mob, target)
	if (mob:getHPP() < 50 and mob:getMobMod(tpz.mobMod.SKILL_LIST) == 875) then
		mob:setMobMod(tpz.mobMod.SKILL_LIST, 876)
	end
end

function onMobDeath(mob, player, isKiller)
	
end
-----------------------------------
-- Area: Abyssea - Konschtat
--  Mob: Bombadeel
-----------------------------------

function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.SKILL_LIST, 0)
	mob:setMod(tpz.mod.DOUBLE_ATTACK, 20)
end

function onMobFight(mob)
	local tp = mob:getTP()
	-- Blow, Beatdown, Uppercut
	local mobSkills = {581, 583, 584}
	
	if (tp >= 1000) then
		mob:setTP(0)
		
		mob:useMobAbility(mobSkills[1])
		mob:useMobAbility(mobSkills[2])
		mob:useMobAbility(mobSkills[3])
	end
end

function onMobDeath(mob, player, isKiller)
	
end
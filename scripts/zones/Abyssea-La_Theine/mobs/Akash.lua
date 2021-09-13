-----------------------------------
-- Area: Abyssea - La Theine
--   NM: Akash
-----------------------------------

function onMobSpawn(mob)
	mob:setMod(tpz.mod.BINDRES, 100)
	mob:setMod(tpz.mod.GRAVITYRES, 100)
	mob:setMod(tpz.mod.SLEEPRES, 100)
	mob:setMod(tpz.mod.SDT_LIGHT, -80)
	mob:setMod(tpz.mod.SDT_DARK, -80)
	mob:addMod(tpz.mod.MEVA, 150)
	mob:setLocalVar("has2hrd", 0)
end

function onMobFight(mob, target)
	local hpp = mob:getHPP()
	
	if (hpp <= 25 and mob:getLocalVar("has2hrd") == 0) then
		mob:useMobAbility(919)
		mob:setLocalVar("has2hrd", 1)
	end
end

function onMobDeath(mob, player, isKiller)
	
end
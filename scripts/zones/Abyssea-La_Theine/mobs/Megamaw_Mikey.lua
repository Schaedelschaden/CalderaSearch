-----------------------------------
-- Area: Abyssea - La Theine
--  Mob: Megamaw Mikey
-----------------------------------

function onMobSpawn(mob)
	mob:SetAutoAttackEnabled(false)
	mob:addMod(tpz.mod.SILENCERES, 100)
	mob:addMod(tpz.mod.MDEF, 100)
	mob:addMod(tpz.mod.FASTCAST, 70)
	mob:addMod(tpz.mod.REFRESH, 20)
end

function onMobFight(mob, target)
	if (os.time() - mob:getLocalVar("FullForceBlow") >= 10 and mob:checkDistance(target) <= 7) then
		mob:useMobAbility(424)
		mob:setLocalVar("FullForceBlow", os.time())
	end
end

function onMobDeath(mob, player, isKiller)
	
end
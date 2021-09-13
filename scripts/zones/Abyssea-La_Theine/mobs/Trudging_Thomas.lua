-----------------------------------
-- Area: Abyssea - La Theine
--  Mob: Trudging Thomas
-----------------------------------

function onMobSpawn(mob)
	mob:setMod(tpz.mod.PARALYZERES, 90)
	mob:setMod(tpz.mod.SLOWRES, 90)
	mob:setMod(tpz.mod.BLINDRES, 90)
	mob:setMod(tpz.mod.BINDRES, 100)
	mob:setMod(tpz.mod.GRAVITYRES, 100)
	mob:setMod(tpz.mod.STUNRES, 100)
end

function onMobFight(mob, target)
	if (os.time() - mob:getLocalVar("RAM_CHARGE_TIME") >= 6 and mob:hasStatusEffect(tpz.effect.BERSERK) and mob:checkDistance(target) <= 7) then
		-- Spam Ram Charge
		mob:useMobAbility(266)
		mob:setLocalVar("RAM_CHARGE_TIME", os.time())
	end
end

function onMobDeath(mob, player, isKiller)
	tpz.abyssea.kiOnMobDeath(mob, player)
end
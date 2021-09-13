-----------------------------------
-- Area: Abyssea - La Theine
--  Mob: Baba Yaga
-----------------------------------

function onMobSpawn(mob)
	mob:SetAutoAttackEnabled(false)
	mob:setMod(tpz.mod.REFRESH, 20)
end

function onMobFight(mob)
	if (os.time() - mob:getLocalVar("SpecialAttack") > 7) then
		if (mob:getLocalVar("ZephyrArrowCounter") <= math.random(2, 4)) then
			mob:useMobAbility(2193)
			mob:setLocalVar("SpecialAttack", os.time())
			mob:setLocalVar("ZephyrArrowCounter", mob:getLocalVar("ZephyrArrowCounter") + 1)
		else
			mob:useMobAbility(2194)
			mob:setLocalVar("SpecialAttack", os.time())
			mob:setLocalVar("ZephyrArrowCounter", 0)
		end
	end
end

function onMobDeath(mob, player, isKiller)
	tpz.abyssea.kiOnMobDeath(mob, player)
end
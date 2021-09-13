-----------------------------------
-- Area: Abyssea - La Theine
--  Mob: Adamastor
-----------------------------------

function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.SKILL_LIST, 0)
	mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
	mob:setMod(tpz.mod.GRAVITYRES, 90)
	mob:setMod(tpz.mod.DOUBLE_ATTACK, 20)
	mob:setMod(tpz.mod.SDT_LIGHTNING, -50)
	mob:setMod(tpz.mod.SDT_DARK, -50)
end

function onMobFight(mob)
	local tp = mob:getTP()
	
	if (tp >= 1000) then
		if (mob:getLocalVar("ImpactRoarUsed") == 0) then
			mob:setMod(tpz.mod.DOUBLE_ATTACK, 80)
			mob:useMobAbility(664)
			mob:setLocalVar("ImpactRoarUsed", 1)
			mob:setLocalVar("ImpactRoarUsedTime", os.time())
		elseif (mob:getLocalVar("ImpactRoarUsed") == 1 and os.time() - mob:getLocalVar("ImpactRoarUsedTime") >= 90) then
			mob:setMod(tpz.mod.DOUBLE_ATTACK, 20)
			mob:useMobAbility(665)
			mob:useMobAbility(665)
			mob:useMobAbility(665)
			mob:setLocalVar("ImpactRoarUsed", 0)
		end
	end
end

function onAdditionalEffect(mob, target, damage)
	if (mob:getLocalVar("ImpactRoarUsed") == 1) then
		local params = {}
			params.chance = 100
			params.power = math.random(80, 100)
		return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENAERO, params)
	else
		return 0
	end
end

function onMobDeath(mob, player, isKiller)
	tpz.abyssea.kiOnMobDeath(mob, player)
end
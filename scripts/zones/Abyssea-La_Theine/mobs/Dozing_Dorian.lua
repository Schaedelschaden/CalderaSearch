-----------------------------------
-- Area: Abyssea - La Theine
--   NM: Dozing Dorian
-----------------------------------

function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.SKILL_LIST, 0)
	mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
	mob:setMod(tpz.mod.BINDRES, 100)
	mob:setMod(tpz.mod.GRAVITYRES, 100)
end

function onMobFight(mob, target)
	local tp = mob:getTP()
	local skills = {262, 265, 1837}
	
	if (tp >= 1500) then
		local pickSkill = math.random(#skills)
		mob:setTP(0)
		
		if (pickSkill == 1) then
			local charges = math.random(1, 6)
			
			for i = 1, charges do
				mob:useMobAbility(skills[pickSkill])
			end
		else
			mob:useMobAbility(skills[pickSkill])
		end
	end
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.HASTE, {chance = 10})
end

function onMobDeath(mob, player, isKiller)
	
end
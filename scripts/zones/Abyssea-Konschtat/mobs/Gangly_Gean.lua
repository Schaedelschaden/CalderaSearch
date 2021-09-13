-----------------------------------
-- Area: Abyssea - Konschtat
--  Mob: Gangly Gean
-----------------------------------

function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.SKILL_LIST, 0)
	mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
	mob:setMod(tpz.mod.REGAIN, 100)
	mob:setMod(tpz.mod.REFRESH, 20)
end

function onMobFight(mob)
	local tp = mob:getTP()
	-- Drill Branch, Entangle
	local mobSkills = {328, 332}
	
	if (tp >= 1000) then
		mob:setTP(0)
		local pick = math.random(#mobSkills)
		mob:useMobAbility(mobSkills[pick])
		
		if (pick == 2) then
			mob:setLocalVar("GanglyGean_EndrainTimer", os.time())
		end
	end
end

function onAdditionalEffect(mob, target, damage)
	if (os.time() - mob:getLocalVar("GanglyGean_EndrainTimer") < 60) then
		local params = {}
			params.power = 100
		return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.HP_DRAIN, {chance = 100})
	end
end

function onMobDeath(mob, player, isKiller)
	tpz.abyssea.kiOnMobDeath(mob, player)
end
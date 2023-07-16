-----------------------------------
-- Area: Abyssea - Attohwa
--  Mob: Berstuk
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    local tierAby = 2
    local tierMob = 1

    -- Load default T2 stat increases
    tpz.abyssea.updateBaseStats(mob, tierAby, tierMob)

	mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
	mob:setMod(tpz.mod.SLEEPRES, 100)
	mob:setMod(tpz.mod.FASTCAST, 30)
	mob:setMod(tpz.mod.WATER_ABSORB, 100)
end

function onMobFight(mob, target)
	local allianceList = target:getAlliance()
	local playerName = {}
	local targ

	for i, v in ipairs(allianceList) do
		if (v:isPC()) then
			playerName[i] = v:getName()
			targ = GetPlayerByName(playerName[i])
			-- Aura has a 2y range
			if (mob:checkDistance(v) <= 2.5) then
				targ:addStatusEffectEx(tpz.effect.POISON, tpz.effect.POISON, 50, 0, 30)
				targ:addStatusEffectEx(tpz.effect.SILENCE, tpz.effect.SILENCE, 1, 0, 30)
				targ:addStatusEffectEx(tpz.effect.AMNESIA, tpz.effect.AMNESIA, 1, 0, 30)
			end
		elseif (v:getObjType() == tpz.objType.TRUST) then
			-- Aura has a 2y range
			if (mob:checkDistance(v) <= 2.5) then
				v:addStatusEffectEx(tpz.effect.POISON, tpz.effect.POISON, 50, 0, 30)
				v:addStatusEffectEx(tpz.effect.SILENCE, tpz.effect.SILENCE, 1, 0, 30)
				v:addStatusEffectEx(tpz.effect.AMNESIA, tpz.effect.AMNESIA, 1, 0, 30)
			end
		end
	end
end

function onAdditionalEffect(mob, target, damage)
	params = {}
	params.power = 200
	params.chance = 100
	
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENWATER, params)
end

function onMobDeath(mob, player, isKiller)
end

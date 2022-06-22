-----------------------------------
-- Area: Abyssea - Attohwa
--  Mob: Nightshade
-----------------------------------

function onMobSpawn(mob)
	mob:setLocalVar("MOBSKILL_INCREASED_POTENCY", 1) -- 05/26/22 - Needs to be set up
	mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
	mob:addMod(tpz.mod.TRIPLE_ATTACK, 35)
end

function onMobFight(mob, target)
	
end

function onAdditionalEffect(mob, target, damage)
	local additionalEffect = tpz.mob.ae.HP_DRAIN
	
	local params = {}
		params.chance = 100
		params.power = 75
	
    return tpz.mob.onAddEffect(mob, target, damage, additionalEffect, params)
end

function onMobDeath(mob, player, isKiller)
	
end
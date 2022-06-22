-----------------------------------
-- Area: Abyssea - Attohwa
--  Mob: Maahes
-----------------------------------

function onMobSpawn(mob)
	mob:setLocalVar("MOBSKILL_INCREASED_POTENCY", 1) -- 05/26/22 - Needs to be set up
	mob:setMobMod(tpz.mobMod.AUTO_SPIKES, 1)
	mob:addStatusEffect(tpz.effect.SHOCK_SPIKES, 1, 0, 0)
    mob:getStatusEffect(tpz.effect.SHOCK_SPIKES):setFlag(tpz.effectFlag.DEATH)
	mob:setMod(tpz.mod.DOUBLE_ATTACK, 35)
end

function onMobFight(mob, target)
	
end

function onSpikesDamage(mob, target, damage)
	local dmg = 150

    return tpz.subEffect.SHOCK_SPIKES, tpz.msg.basic.SPIKES_EFFECT_DMG, dmg
end

function onMobDeath(mob, player, isKiller)
	
end
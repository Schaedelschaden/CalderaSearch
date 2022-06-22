-----------------------------------
-- Area: Abyssea - Attohwa
--  Mob: Smok
-----------------------------------

function onMobSpawn(mob)
	mob:setLocalVar("MOBSKILL_INCREASED_POTENCY", 1) -- 05/26/22 - Needs to be set up
	mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
	mob:setMobMod(tpz.mobMod.AUTO_SPIKES, 1)
	mob:addStatusEffect(tpz.effect.BLAZE_SPIKES, 1, 0, 0)
    mob:getStatusEffect(tpz.effect.BLAZE_SPIKES):setFlag(tpz.effectFlag.DEATH)
	mob:addMod(tpz.mod.DOUBLE_ATTACK, 35)
	mob:addMod(tpz.mod.FASTCAST, 50)
end

function onMobFight(mob, target)
	
end

function onSpikesDamage(mob, target, damage)
	local dmg = 150

    return tpz.subEffect.BLAZE_SPIKES, tpz.msg.basic.SPIKES_EFFECT_DMG, dmg
end

function onAdditionalEffect(mob, target, damage)
	local additionalEffect = tpz.mob.ae.ENFIRE
	
	local params = {}
		params.chance = 100
		params.power = 150
	
    return tpz.mob.onAddEffect(mob, target, damage, additionalEffect, params)
end

function onSpellPrecast(mob, spell)
    if (spell:getID() == 286 or spell:getID() == 204) then -- Addle, Flare
        spell:setAoE(tpz.magic.aoe.RADIAL)
        spell:setRadius(15)
	elseif (spell:getID() == 148) then -- Fire V (instant cast)
		spell:castTime(0)
    end
end

function onMobDeath(mob, player, isKiller)
	
end
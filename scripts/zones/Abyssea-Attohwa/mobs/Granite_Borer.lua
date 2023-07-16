-----------------------------------
-- Area: Abyssea - Attohwa
--  Mob: Granite Borer
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

	mob:setMobMod(tpz.mobMod.AUTO_SPIKES, 1)
	mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
	mob:setMod(tpz.mod.GRAVITYRES, 100)

	mob:addStatusEffect(tpz.effect.BLAZE_SPIKES, 1, 0, 0)
    mob:getStatusEffect(tpz.effect.BLAZE_SPIKES):setFlag(tpz.effectFlag.DEATH)
	mob:speed(70)
	
	mob:addListener("WEAPONSKILL_STATE_EXIT", "HEAT_BARRIER_BUFFS", function(mob, skillID)
		if (skillID == 1819) then
			mob:setLocalVar("HeatBarrierBonus", mob:getLocalVar("HeatBarrierBonus") + 10)
		end
    end)
end

function onMobFight(mob, target)
end

function onAdditionalEffect(mob, target, damage)
	params = {}
	params.power = 85
	params.chance = 100
	
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENFIRE, params)
end

function onSpikesDamage(mob, target, damage)
	local dmg = 50 + mob:getLocalVar("HeatBarrierBonus")

    return tpz.subEffect.BLAZE_SPIKES, tpz.msg.basic.SPIKES_EFFECT_DMG, dmg
end

function onMobDeath(mob, player, isKiller)
	mob:removeListener("HEAT_BARRIER_BUFFS")

    tpz.abyssea.kiOnMobDeath(mob, player)
end

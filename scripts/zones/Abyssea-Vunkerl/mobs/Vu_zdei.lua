-----------------------------------
-- Area: Abyssea - Vunkerl
--   NM: Vu'zdei
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEF, math.random(300, 500))
end

function onMobFight(mob, target)
end

function onSpikesDamage(mob, target, damage)
	local dmg = math.random(100, 150)

    return tpz.subEffect.ICE_SPIKES, tpz.msg.basic.SPIKES_EFFECT_DMG, dmg
end

function onMobDeath(mob, player, isKiller)
end

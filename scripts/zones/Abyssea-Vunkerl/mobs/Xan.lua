-----------------------------------
-- Area: Abyssea - Vunkerl
--   NM: Xan
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.EVA, 150)
    mob:addMod(tpz.mod.TRIPLE_ATTACK, 35)
end

function onMobFight(mob, target)
    local isBusy = false
    local act    = mob:getCurrentAction()

    if
        act == tpz.act.WEAPONSKILL_START or
        act == tpz.act.WEAPONSKILL_FINISH or
        act == tpz.act.MOBABILITY_START or
        act == tpz.act.MOBABILITY_USING or
        act == tpz.act.MOBABILITY_FINISH or
        act == tpz.act.MAGIC_START or
        act == tpz.act.MAGIC_CASTING or
        act == tpz.act.MAGIC_FINISH
    then
        isBusy = true
    end

    if isBusy == true then
        mob:setMobMod(tpz.mobMod.AUTO_SPIKES, 1)
        mob:addStatusEffect(tpz.effect.BLAZE_SPIKES, 1, 0, 0)
        mob:getStatusEffect(tpz.effect.BLAZE_SPIKES):setFlag(tpz.effectFlag.DEATH)
    else
        mob:setMobMod(tpz.mobMod.AUTO_SPIKES, 0)
        mob:delStatusEffectSilent(tpz.effect.BLAZE_SPIKES)
    end
end

function onSpikesDamage(mob, target, damage)
	local dmg = math.random(250, 350)

    return tpz.subEffect.BLAZE_SPIKES, tpz.msg.basic.SPIKES_EFFECT_DMG, dmg
end

function onMobDeath(mob, player, isKiller)
end

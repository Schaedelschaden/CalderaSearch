-----------------------------------
-- Area: Abyssea - Vunkerl
--   NM: Hm'zdei
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.MAIN_DMG_RATING, 50)
    mob:addMod(tpz.mod.BINDRES, 85)
    mob:addMod(tpz.mod.SLOWRES, 100)
    mob:addMod(tpz.mod.PARALYZERES, 100)
    mob:addMod(tpz.mod.DEF, 1000)
    mob:addMod(tpz.mod.DOUBLE_ATTACK, 50)
    mob:addMod(tpz.mod.HASTE_ABILITY, 20)
    mob:addMod(tpz.mod.HASTE_GEAR, 20)
end

function onMobFight(mob, target)
end

function onSpikesDamage(mob, target, damage)
	local hpp = mob:getHPP()
	local dmg = 250 * (1 - (hpp / 100))

    if dmg < 100 then
        dmg = 100
    end

    return tpz.subEffect.ICE_SPIKES, tpz.msg.basic.SPIKES_EFFECT_DMG, dmg
end

function onMobDeath(mob, player, isKiller)
end

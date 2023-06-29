-----------------------------------
-- Area: Abyssea-Vunkerl
--   NM: Lord Varney
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)

    mob:addMod(tpz.mod.DMGMAGIC, -75)
    mob:addMod(tpz.mod.MAIN_DMG_RATING, 50)
end

function onMobFight(mob, target)
end

function onAdditionalEffect(mob, target, damage)
    local params = {}
        params.chance = 100
        params.power  = 125

    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENAERO, params)
end

function onSpellPrecast(mob, spell)
	if spell:getID() == 158 or spell:getID() == 187 then -- Aero V, Aeroga IV (instant cast)
		spell:castTime(0)
    end
end

function onMobDespawn(mob)
end

function onMobDeath(mob, player, isKiller)
end

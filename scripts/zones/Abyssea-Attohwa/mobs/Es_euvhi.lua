-----------------------------------
-- Area: Abyssea-Attohwa
--   NM: Es'euvhi
-----------------------------------
mixins = {require("scripts/mixins/families/euvhi")}
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
    mob:addMod(tpz.mod.STUNRES, 100)
    mob:addMod(tpz.mod.PARALYZERES, 100)
    mob:addMod(tpz.mod.SLOWRES, 100)
end

function onMobFight(mob, target)
    local absorbs =
    {
        tpz.mod.FIRE_ABSORB,  tpz.mod.ICE_ABSORB,  tpz.mod.WIND_ABSORB,
        tpz.mod.EARTH_ABSORB, tpz.mod.LTNG_ABSORB, tpz.mod.WATER_ABSORB,
        tpz.mod.LIGHT_ABSORB, tpz.mod.DARK_ABSORB, tpz.mod.PHYS_ABSORB,
    }

    if os.time() > mob:getLocalVar("MOB_FIGHT_DELAY") then
        -- Update mob's spell list depending on "Open" or "Closed" animation
        if mob:AnimationSub() == 1 then
            mob:setSpellList(471) -- Closed = Earth Spells
        elseif mob:AnimationSub() == 2 then
            mob:setSpellList(472) -- Open = Wind Spells
        end

        mob:setLocalVar("MOB_FIGHT_DELAY", os.time() + 3)
    end

    if os.time() > mob:getLocalVar("MOB_FIGHT_DELAY_1") then
        if mob:getLocalVar("CURRENT_ABSORB") == 0 then
            local pickAbsorb = math.random(#absorbs)

            mob:setMod(absorbs[pickAbsorb], 100)
            mob:setLocalVar("CURRENT_ABSORB", pickAbsorb)
        elseif mob:getLocalVar("CURRENT_ABSORB") > 0 then
            local currentAbsorb = mob:getLocalVar("CURRENT_ABSORB")
            local pickAbsorb    = math.random(#absorbs)

            mob:setMod(absorbs[currentAbsorb], 0)
            mob:setMod(absorbs[pickAbsorb], 100)
            mob:setLocalVar("CURRENT_ABSORB", pickAbsorb)
        end

        mob:setLocalVar("MOB_FIGHT_DELAY_1", os.time() + 12)
    end
end

function onAdditionalEffect(mob, target, damage)
    local params = {}
        params.chance = 100
        params.power = 100
    local element = tpz.mob.ae.ENSTONE

    -- "Closed" animation
    if mob:AnimationSub() == 2 then
        element = tpz.mob.ae.ENAERO
    end

    return tpz.mob.onAddEffect(mob, target, damage, element, params)
end

function onMobDespawn(mob)
end

function onMobDeath(mob, player, isKiller)
end

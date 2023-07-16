-----------------------------------
-- Area: Abyssea-Attohwa
--   NM: Lusca
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    local tierAby = 2
    local tierMob = 3

    -- Load default T2 stat increases
    tpz.abyssea.updateBaseStats(mob, tierAby, tierMob)

    mob:addListener("WEAPONSKILL_STATE_EXIT", "MOBSKILL_USED", function(mobArg, skillID)
        if skillID == 1347 then -- Dual Strike
            local currentHPP = mobArg:getHPP()
            local maxUses   = 1
            local abilities = {1348, 1349} -- Siphon Discharge, Mantle Pierce

            if currentHPP <= 75 then
                maxUses = 2
            elseif currentHPP <= 50 then
                maxUses = 3
            elseif currentHPP <= 25 then
                maxUses = 4                
            end

            for i = 1, maxUses do
                local pickAbility = math.random(1, 2)

                mob:useMobAbility(abilities[pickAbility])
            end
        elseif skillID == 1351 then -- Molluscous Mutation
            mobArg:setMod(tpz.mod.MAGIC_ABSORB, 0)
            mobArg:setMod(tpz.mod.PHYS_ABSORB, 100)

            if math.random(1, 100) <= 35 then
                local target = mobArg:getTarget()

                mobArg:resetEnmity(target)
            end
        elseif skillID == 1352 then -- Saline Coat
            mobArg:setMod(tpz.mod.MAGIC_ABSORB, 100)
            mobArg:setMod(tpz.mod.PHYS_ABSORB, 0)

            if math.random(1, 100) <= 35 then
                local target = mobArg:getTarget()

                mobArg:resetEnmity(target)
            end
        end
    end)
end

function onMobFight(mob, target)
end

function onMobDespawn(mob)
    mob:removeListener("MOBSKILL_USED")
end

function onMobDeath(mob, player, isKiller)
    mob:removeListener("MOBSKILL_USED")
end

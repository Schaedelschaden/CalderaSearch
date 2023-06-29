-----------------------------------
-- Area: Abyssea-Misareaux
--   NM: Mi'ghrah
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DMGMAGIC, -10)
    mob:addMod(tpz.mod.FASTCAST, 50)
end

function onMobEngaged(mob, target)
    mob:setLocalVar("CHANGE_TIME", os.time() + 45)
end

function onMobFight(mob, target)
    if os.time() > mob:getLocalVar("MOB_FIGHT_DELAY") then
        if os.time() > mob:getLocalVar("CHANGE_TIME") then
            local oldForm = mob:AnimationSub()
            local newForm = math.random(1, 4) - 1

            -- Remove benefits from the old form
            if mob:getLocalVar("BENEFITS_ACTIVE") == 1 then
                if oldForm == 0 then     -- Ball (BLM)
                    mob:delMod(tpz.mod.QUICK_MAGIC, 25)
                elseif oldForm == 1 then -- Humanoid (PLD)
                    mob:delMod(tpz.mod.DEF, 750)
                elseif oldForm == 2 then -- Spider (WAR)
                    mob:delMod(tpz.mod.DOUBLE_ATTACK, 50)
                    mob:delMod(tpz.mod.HASTE_GEAR, 1000)
                elseif oldForm == 3 then -- Bird (THF)
                    mob:delMod(tpz.mod.TRIPLE_ATTACK, 35)
                    mob:delMod(tpz.mod.HASTE_GEAR, 2500)
                end

                mob:setLocalVar("BENEFITS_ACTIVE", 0)
            end

            -- Change to a new form
            mob:AnimationSub(newForm)

            -- Add benefits to the new form
            if mob:getLocalVar("BENEFITS_ACTIVE") == 0 then
                if newForm == 0 then     -- Ball (BLM)
                    mob:addMod(tpz.mod.QUICK_MAGIC, 25)
                elseif newForm == 1 then -- Humanoid (PLD)
                    mob:addMod(tpz.mod.DEF, 750)
                elseif newForm == 2 then -- Spider (WAR)
                    mob:addMod(tpz.mod.DOUBLE_ATTACK, 50)
                    mob:addMod(tpz.mod.HASTE_GEAR, 1000)
                elseif newForm == 3 then -- Bird (THF)
                    mob:addMod(tpz.mod.TRIPLE_ATTACK, 35)
                    mob:addMod(tpz.mod.HASTE_GEAR, 2500)
                end

                mob:setLocalVar("BENEFITS_ACTIVE", 1)
            end

            mob:setLocalVar("CHANGE_TIME", os.time() + 45)
        end

        mob:setLocalVar("MOB_FIGHT_DELAY", os.time() + 3)
    end
end

function onMobDespawn(mob)
end

function onMobDeath(mob, player, isKiller)
end

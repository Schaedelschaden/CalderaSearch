-----------------------------------
-- Area: Waughroon Shrine
--  Mob: Platoon Scorpion
-- BCNM: Operation Desert Swarm
-----------------------------------

local ID = require("scripts/zones/Waughroon_Shrine/IDs")
require("scripts/globals/status")

local MIMIC_DISTANCE = 10
-- 25% should cover: "sometimes after ... " - https://ffxiclopedia.fandom.com/wiki/Operation_Desert_Swarm
local SELF_BIND_CHANCE = 0.25  -- 25%
local SELF_STUN_CHANCE = 0.25  -- 25%

-- Mobs sync/mimic TP moves.

function onMobInitialize(mob)
	-- -- mob:setMod(tpz.mod.ACC, 400)
    -- -- mob:setMod(tpz.mod.EVA, 200)
	-- mob:setMod(tpz.mod.DOUBLE_ATTACK, 10)
	-- -- mob:setMod(tpz.mod.TRIPLE_ATTACK, 12)
    -- mob:addListener("WEAPONSKILL_STATE_ENTER", "SCORP_MIMIC_START", function(mob, skillID)
        -- local hpp = mob:getHPP()

        -- -- check flag to make sure we aren't infinitely looping through scorps
        -- if mob:getLocalVar('[ODS]mimic') ~= 1 then
            -- local bf = mob:getBattlefield():getArea()
            -- local mob_id = mob:getID() -- prevent self-triggering: eg using wild rage making the user use more wild rage

            -- for _, allyId in ipairs(ID.operationDesertSwarm[bf]) do
                -- local isStunned = mob:hasStatusEffect(tpz.effect.STUN)
                -- local isAsleep  = mob:hasStatusEffect(tpz.effect.SLEEP_I) or mob:getStatusEffect(tpz.effect.SLEEP_II)

                -- -- prevent self-triggering
                -- if
                    -- mob_id ~= allyId and
                    -- not isStunned and
                    -- not isAsleep
                -- then
                    -- local potential_mimic = GetMobByID(allyId)
                    -- local dist = mob:checkDistance(potential_mimic)

                    -- if dist < MIMIC_DISTANCE then
                        -- -- set flag so prevent infinite loops
                        -- potential_mimic:setLocalVar('[ODS]mimic', 1)
                        -- if skillID == 354 then
                            -- potential_mimic:useMobAbility(354)
                        -- elseif skillID == 355 then
                            -- potential_mimic:useMobAbility(355)
                        -- end
                    -- end
                -- end
            -- end
        -- end
    -- end)

    -- mob:addListener("WEAPONSKILL_STATE_EXIT", "SCORP_MIMIC_STOP", function(mob, skillID)
        -- -- reset infinite loop flag
        -- mob:setLocalVar('[ODS]mimic', 0)

        -- -- Sometimes Wild Rage self stuns and sometimes Earth Pounder self binds
        -- -- https://ffxiclopedia.fandom.com/wiki/Operation_Desert_Swarm

        -- local isStunned   = mob:hasStatusEffect(tpz.effect.STUN)
        -- local isAsleep    = mob:hasStatusEffect(tpz.effect.SLEEP_I) or
                            -- mob:hasStatusEffect(tpz.effect.SLEEP_II) or
                            -- mob:hasStatusEffect(tpz.effect.LULLABY)
        -- local isPetrified = mob:hasStatusEffect(tpz.effect.PETRIFICATION)

        -- if
            -- not isStunned and
            -- not isAsleep and
            -- not isPetrified
        -- then
            -- if skillID == 354 and math.random() < SELF_STUN_CHANCE then
                -- -- Wild Rage
                -- mob:showText(mob,ID.text.SCORPION_IS_STUNNED)
                -- mob:addStatusEffect(tpz.effect.STUN,0,0,10)
                -- -- Earth Pounder
            -- elseif skillID == 355 and math.random() < SELF_BIND_CHANCE then
                -- mob:showText(mob,ID.text.SCORPION_IS_BOUND)
                -- mob:addStatusEffect(tpz.effect.BIND,0,0,10)
            -- end
        -- end
    -- end)
end

function onMobSpawn(mob)
    mob:removeListener("SCORP_MIMIC_START")
    mob:removeListener("SCORP_MIMIC_STOP")

	mob:setMod(tpz.mod.DOUBLE_ATTACK, 10)

    mob:addListener("WEAPONSKILL_STATE_ENTER", "SCORP_MIMIC_START", function(mob, skillID)
        local hpp = mob:getHPP()

        -- check flag to make sure we aren't infinitely looping through scorps
        if mob:getLocalVar('[ODS]mimic') ~= 1 then
            local bf = mob:getBattlefield():getArea()
            local mob_id = mob:getID() -- prevent self-triggering: eg using wild rage making the user use more wild rage

            for _, allyId in ipairs(ID.operationDesertSwarm[bf]) do
                -- prevent self-triggering
                if mob_id ~= allyId then
                    local potential_mimic = GetMobByID(allyId)
                    -- local isStunned       = potential_mimic:hasStatusEffect(tpz.effect.STUN)
                    -- local isAsleep        = potential_mimic:hasStatusEffect(tpz.effect.SLEEP_I) or
                                            -- potential_mimic:getStatusEffect(tpz.effect.SLEEP_II) or
                                            -- potential_mimic:hasStatusEffect(tpz.effect.LULLABY)
                    -- local isPetrified     = potential_mimic:hasStatusEffect(tpz.effect.PETRIFICATION)
                    local dist            = mob:checkDistance(potential_mimic)

                    if
                        dist < MIMIC_DISTANCE-- and
                        -- not isStunned and
                        -- not isAsleep and
                        -- not isPetrified
                    then
                        -- set flag so prevent infinite loops
                        potential_mimic:setLocalVar('[ODS]mimic', 1)
                        potential_mimic:addTP(1000)
                        -- if skillID == 354 then
                            -- potential_mimic:useMobAbility(354)
                        -- elseif skillID == 355 then
                            -- potential_mimic:useMobAbility(355)
                        -- end
                    end
                end
            end
        end
    end)

    mob:addListener("WEAPONSKILL_STATE_EXIT", "SCORP_MIMIC_STOP", function(mob, skillID)
        -- reset infinite loop flag
        mob:setLocalVar('[ODS]mimic', 0)

        -- Sometimes Wild Rage self stuns and sometimes Earth Pounder self binds
        -- https://ffxiclopedia.fandom.com/wiki/Operation_Desert_Swarm

        if skillID == 354 and math.random() < SELF_STUN_CHANCE then
            -- Wild Rage
            mob:showText(mob, ID.text.SCORPION_IS_STUNNED)
            mob:addStatusEffect(tpz.effect.STUN, 0, 0, 10)
            -- Earth Pounder
        elseif skillID == 355 and math.random() < SELF_BIND_CHANCE then
            mob:showText(mob, ID.text.SCORPION_IS_BOUND)
            mob:addStatusEffect(tpz.effect.BIND, 0, 0, 10)
        end
    end)
end

function onMobFight(mob)
    if not mob:hasStatusEffect(tpz.effect.BIND) then
        mob:speed(40)
    end
end

function onMobDeath(mob, player, isKiller)
    if isKiller then
        -- This is used to increase the strength of Wild Rage as scorps die
        local bf = mob:getBattlefield()
        -- should not have to verify because Platoon scorps are only ever in a BC
        local num_scorps_dead = bf:getLocalVar("[ODS]NumScorpsDead")
        bf:setLocalVar("[ODS]NumScorpsDead", num_scorps_dead + 1 )
    end
end

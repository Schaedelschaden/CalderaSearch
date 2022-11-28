-----------------------------------
-- Area: Dynamis - San d'Oria
--  Mob: Serjeant Tombstone
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

local tombstoneID = {
                        17535003, 17535004, 17535005,
                        17535113, 17535114, 17535115,
                        17535154, 17535155,
                        17535166, 17535167,
                        17535193, 17535194,
                        17535205, 17535206
                    }

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.LINK_RADIUS, 10)
    mob:setMobMod(tpz.mobMod.SIGHT_RANGE, 10)
    -- dynamis.refillStatueOnSpawn(mob)
    mob:setLocalVar("SPAWNED_MOBS", 0)

    -- Set eye color
    mob:AnimationSub(math.random(1, 3))
end

function onMobEngaged(mob, target)
    local groupLeader
    local pos       = mob:getPos()
    local mobGroups = {}

    if mob:getLocalVar("SPAWNED_MOBS") == 0 then
        if mob:getID() == tombstoneID[1] then
            groupLeader = 17534980

            for i = 0, 6 do
                mobGroups[i + 1] = groupLeader + i
            end
        elseif mob:getID() == tombstoneID[2] then
            groupLeader = 17534987

            for i = 0, 4 do
                mobGroups[i + 1] = groupLeader + i
            end

            for i = 6, 7 do
                mobGroups[i] = groupLeader + i
            end
        elseif mob:getID() == tombstoneID[3] then
            groupLeader = 17534996

            for i = 0, 0 do
                mobGroups[i + 1] = groupLeader + i
            end

            for i = 2, 6 do
                mobGroups[i] = groupLeader + i
            end

            for i = 12, 12 do
                mobGroups[i - 5] = groupLeader + i
            end
        elseif mob:getID() == tombstoneID[4] then
            groupLeader = 17535009

            for i = 0, 1 do
                mobGroups[i + 1] = groupLeader + i
            end

            for i = 3, 5 do
                mobGroups[i] = groupLeader + i
            end

            for i = 7, 8 do
                mobGroups[i - 1] = groupLeader + i
            end
        elseif mob:getID() == tombstoneID[5] then
            groupLeader = 17535018

            for i = 0, 6 do
                mobGroups[i + 1] = groupLeader + i
            end
        elseif mob:getID() == tombstoneID[6] then
            groupLeader = 17535025

            for i = 0, 0 do
                mobGroups[i + 1] = groupLeader + i
            end

            for i = 2, 3 do
                mobGroups[i] = groupLeader + i
            end

            for i = 5, 6 do
                mobGroups[i - 1] = groupLeader + i
            end

            for i = 9, 10 do
                mobGroups[i - 3] = groupLeader + i
            end
        elseif mob:getID() == tombstoneID[7] then
            groupLeader = 17535036

            for i = 0, 6 do
                mobGroups[i + 1] = groupLeader + i
            end
        elseif mob:getID() == tombstoneID[8] then
            groupLeader = 17535045

            for i = 0, 4 do
                mobGroups[i + 1] = groupLeader + i
            end

            for i = 6, 7 do
                mobGroups[i] = groupLeader + i
            end
        elseif mob:getID() == tombstoneID[9] then
            groupLeader = 17535053

            for i = 0, 3 do
                mobGroups[i + 1] = groupLeader + i
            end

            for i = 5, 7 do
                mobGroups[i] = groupLeader + i
            end
        elseif mob:getID() == tombstoneID[10] then
            groupLeader = 17535061

            for i = 0, 5 do
                mobGroups[i + 1] = groupLeader + i
            end

            for i = 7, 7 do
                mobGroups[i] = groupLeader + i
            end
        elseif mob:getID() == tombstoneID[11] then
            groupLeader = 17535069

            for i = 0, 3 do
                mobGroups[i + 1] = groupLeader + i
            end

            for i = 5, 5 do
                mobGroups[i] = groupLeader + i
            end

            for i = 7, 7 do
                mobGroups[i - 1] = groupLeader + i
            end

            for i = 9, 9 do
                mobGroups[i - 2] = groupLeader + i
            end
        elseif mob:getID() == tombstoneID[12] then
            groupLeader = 17535079

            for i = 0, 6 do
                mobGroups[i + 1] = groupLeader + i
            end
        elseif mob:getID() == tombstoneID[13] then
            groupLeader = 17535086

            for i = 0, 6 do
                mobGroups[i + 1] = groupLeader + i
            end
        elseif mob:getID() == tombstoneID[14] then
            groupLeader = 17535093

            for i = 0, 1 do
                mobGroups[i + 1] = groupLeader + i
            end

            for i = 3, 3 do
                mobGroups[i] = groupLeader + i
            end

            for i = 5, 8 do
                mobGroups[i - 1] = groupLeader + i
            end
        end
    end

    local mobSpawns = 2
    local groupSize

    if target:isPC() then
        groupSize = target:getAlliance()
    elseif target:isPet() or target:getObjType() == tpz.objType.TRUST then
        local master = target:getMaster()

        if master ~= nil and master:isPC() then
            groupSize = master:getAlliance()
        end
    end

    if groupSize == 0 or groupSize == nil then
        groupSize = 1
    end

    if #groupSize >= 2 and #groupSize <= 5 then
        mobSpawns = mobSpawns + (#groupSize - 1)
    elseif #groupSize >= 6 then
        mobSpawns = 7
    end

    for i = 1, mobSpawns do
        local orc     = GetMobByID(mobGroups[i])
        local xOffset = math.random(-6, 6)
        local zOffset = math.random(-6, 6)

        SpawnMob(mobGroups[i]):updateEnmity(target)
        orc:setPos(pos.x + xOffset, pos.y, pos.z + zOffset)
        orc:setSpawn(pos.x + xOffset, pos.y, pos.z + zOffset, 0)
        orc:setMobMod(tpz.mobMod.IDLE_DESPAWN, 180)
    end

    mob:setLocalVar("SPAWNED_MOBS", 1)
end

function onMobDeath(mob, player, isKiller)
    -- dynamis.refillStatueOnDeath(mob, player, isKiller)
end
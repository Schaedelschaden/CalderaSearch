-----------------------------------
-- Area: Dynamis - Jeuno
--  Mob: Goblin Replica
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

local replicaID = {
                    17547295, 17547296, 17547297,
                    17547391, 17547392, 17547393,
                    17547421, 17547422, 17547423,
                    17547456, 17547457, 17547458,
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
        if mob:getID() == replicaID[1] then
            groupLeader = 17547266

            for i = 0, 2 do
                mobGroups[i + 1] = groupLeader + i
            end

            for i = 4, 6 do
                mobGroups[i] = groupLeader + i
            end

            for i = 8, 8 do
                mobGroups[i - 1] = groupLeader + i
            end
        elseif mob:getID() == replicaID[2] then
            groupLeader = 17547275

            for i = 0, 1 do
                mobGroups[i + 1] = groupLeader + i
            end

            for i = 3, 7 do
                mobGroups[i] = groupLeader + i
            end
        elseif mob:getID() == replicaID[3] then
            groupLeader = 17547284

            for i = 0, 2 do
                mobGroups[i + 1] = groupLeader + i
            end

            for i = 4, 6 do
                mobGroups[i] = groupLeader + i
            end

            for i = 8, 8 do
                mobGroups[i - 1] = groupLeader + i
            end
        elseif mob:getID() == replicaID[4] then
            groupLeader = 17547293

            for i = 0, 0 do
                mobGroups[i + 1] = groupLeader + i
            end

            for i = 11, 16 do
                mobGroups[i - 9] = groupLeader + i
            end
        elseif mob:getID() == replicaID[5] then
            groupLeader = 17547310

            for i = 0, 0 do
                mobGroups[i + 1] = groupLeader + i
            end

            for i = 4, 7 do
                mobGroups[i - 2] = groupLeader + i
            end

            for i = 9, 10 do
                mobGroups[i - 3] = groupLeader + i
            end
        elseif mob:getID() == replicaID[6] then
            groupLeader = 17547321

            for i = 0, 0 do
                mobGroups[i + 1] = groupLeader + i
            end

            for i = 4, 6 do
                mobGroups[i - 2] = groupLeader + i
            end

            for i = 9, 11 do
                mobGroups[i - 4] = groupLeader + i
            end
        elseif mob:getID() == replicaID[7] then
            groupLeader = 17547334

            for i = 0, 2 do
                mobGroups[i + 1] = groupLeader + i
            end

            for i = 5, 7 do
                mobGroups[i - 1] = groupLeader + i
            end

            for i = 9, 9 do
                mobGroups[i - 2] = groupLeader + i
            end
        elseif mob:getID() == replicaID[8] then
            groupLeader = 17547344

            for i = 0, 4 do
                mobGroups[i + 1] = groupLeader + i
            end

            for i = 6, 7 do
                mobGroups[i] = groupLeader + i
            end
        elseif mob:getID() == replicaID[9] then
            groupLeader = 17547352

            for i = 0, 2 do
                mobGroups[i + 1] = groupLeader + i
            end

            for i = 5, 8 do
                mobGroups[i - 1] = groupLeader + i
            end
        elseif mob:getID() == replicaID[10] then
            groupLeader = 17547361

            for i = 0, 4 do
                mobGroups[i + 1] = groupLeader + i
            end

            for i = 6, 7 do
                mobGroups[i] = groupLeader + i
            end
        elseif mob:getID() == replicaID[11] then
            groupLeader = 17547369

            for i = 0, 0 do
                mobGroups[i + 1] = groupLeader + i
            end

            for i = 2, 4 do
                mobGroups[i] = groupLeader + i
            end

            for i = 6, 7 do
                mobGroups[i - 1] = groupLeader + i
            end

            for i = 10, 10 do
                mobGroups[i - 3] = groupLeader + i
            end
        elseif mob:getID() == replicaID[12] then
            groupLeader = 17547380

            for i = 0, 0 do
                mobGroups[i + 1] = groupLeader + i
            end

            for i = 3, 6 do
                mobGroups[i - 1] = groupLeader + i
            end

            for i = 18, 19 do
                mobGroups[i - 12] = groupLeader + i
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
        local goblin  = GetMobByID(mobGroups[i])
        local xOffset = math.random(-6, 6)
        local zOffset = math.random(-6, 6)

        SpawnMob(mobGroups[i]):updateEnmity(target)
        goblin:setPos(pos.x + xOffset, pos.y, pos.z + zOffset)
        goblin:setSpawn(pos.x + xOffset, pos.y, pos.z + zOffset, 0)
        goblin:setMobMod(tpz.mobMod.IDLE_DESPAWN, 180)
    end

    mob:setLocalVar("SPAWNED_MOBS", 1)
end

function onMobDeath(mob, player, isKiller)
    -- dynamis.refillStatueOnDeath(mob, player, isKiller)
end
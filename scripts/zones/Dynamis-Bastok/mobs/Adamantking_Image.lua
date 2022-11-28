-----------------------------------
-- Area: Dynamis - Bastok
--  Mob: Adamantking Image
-- Notes: Provide Time Extensions
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

local imageID = {17539142, 17539148, 17539149, 17539253, 17539306}

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.LINK_RADIUS, 10)
    mob:setMobMod(tpz.mobMod.SIGHT_RANGE, 10)
    mob:setLocalVar("SPAWNED_MOBS", 0)
end

function onMobEngaged(mob, target)
    local groupLeader
    local pos = mob:getPos()
    local mobGroups = {}

    if mob:getLocalVar("SPAWNED_MOBS") == 0 then
        if mob:getID() == imageID[1] then
            groupLeader = 17539255

            for i = 0, 5 do
                mobGroups[i + 1] = groupLeader + i
            end
        elseif mob:getID() == imageID[2] then
            groupLeader = 17539261

            for i = 0, 4 do
                mobGroups[i + 1] = groupLeader + i
            end

            for i = 7, 7 do
                mobGroups[i - 1] = groupLeader + i
            end
        elseif mob:getID() == imageID[3] then
            groupLeader = 17539269

            for i = 0, 3 do
                mobGroups[i + 1] = groupLeader + i
            end

            for i = 7, 8 do
                mobGroups[i - 2] = groupLeader + i
            end
        elseif mob:getID() == imageID[4] then
            groupLeader = 17539278

            for i = 0, 5 do
                mobGroups[i + 1] = groupLeader + i
            end
        elseif mob:getID() == imageID[5] then
            groupLeader = 17539284

            for i = 0, 0 do
                mobGroups[i + 1] = groupLeader + i
            end

            for i = 4, 7 do
                mobGroups[i - 2] = groupLeader + i
            end

            for i = 11, 11 do
                mobGroups[i - 5] = groupLeader + i
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

    if #groupSize >= 2 and #groupSize <= 4 then
        mobSpawns = mobSpawns + (#groupSize - 1)
    elseif #groupSize >= 5 then
        mobSpawns = 6
    end

    for i = 1, mobSpawns do
        local quadav  = GetMobByID(mobGroups[i])
        local xOffset = math.random(-6, 6)
        local zOffset = math.random(-6, 6)

        SpawnMob(mobGroups[i]):updateEnmity(target)
        quadav:setPos(pos.x + xOffset, pos.y, pos.z + zOffset)
        quadav:setSpawn(pos.x + xOffset, pos.y, pos.z + zOffset, 0)
        quadav:setMobMod(tpz.mobMod.IDLE_DESPAWN, 180)
    end

    mob:setLocalVar("SPAWNED_MOBS", 1)
end

function onMobDeath(mob, player, isKiller)
    -- dynamis.timeExtensionOnDeath(mob, player, isKiller)
end
-----------------------------------
-- Area: Dynamis - Bastok
--  Mob: Adamantking Effigy
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

local effigyID = {
                    17539118, 17539119, 17539120,
                    17539161, 17539162, 17539163,
                    17539171, 17539172, 17539173,
                    17539227, 17539228, 17539229,
                    17539234, 17539235, 17539236,
                    17539266, 17539267,
                    17539274, 17539275,
                    17539286, 17539287,
                    17539293, 17539294
                 }

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.LINK_RADIUS, 10)
    mob:setMobMod(tpz.mobMod.SIGHT_RANGE, 10)
    mob:setMobMod(tpz.mobMod.SOUND_RANGE, 10)
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
        if mob:getID() == effigyID[1] then
            groupLeader = 17539074

            for i = 0, 2 do
                mobGroups[i + 1] = groupLeader + i
            end

            for i = 4, 6 do
                mobGroups[i] = groupLeader + i
            end
        elseif mob:getID() == effigyID[2] then
            groupLeader = 17539081

            for i = 0, 5 do
                mobGroups[i + 1] = groupLeader + i
            end
        elseif mob:getID() == effigyID[3] then
            groupLeader = 17539087

            for i = 0, 1 do
                mobGroups[i + 1] = groupLeader + i
            end

            for i = 3, 6 do
                mobGroups[i] = groupLeader + i
            end
        elseif mob:getID() == effigyID[4] then
            groupLeader = 17539094

            for i = 0, 4 do
                mobGroups[i + 1] = groupLeader + i
            end

            for i = 6, 6 do
                mobGroups[i] = groupLeader + i
            end
        elseif mob:getID() == effigyID[5] then
            groupLeader = 17539101

            for i = 0, 4 do
                mobGroups[i + 1] = groupLeader + i
            end

            for i = 6, 6 do
                mobGroups[i] = groupLeader + i
            end
        elseif mob:getID() == effigyID[6] then
            groupLeader = 17539108

            for i = 0, 2 do
                mobGroups[i + 1] = groupLeader + i
            end

            for i = 4, 4 do
                mobGroups[i] = groupLeader + i
            end

            for i = 6, 7 do
                mobGroups[i - 1] = groupLeader + i
            end
        elseif mob:getID() == effigyID[7] then
            groupLeader = 17539116

            for i = 0, 1 do
                mobGroups[i + 1] = groupLeader + i
            end

            for i = 5, 8 do
                mobGroups[i - 2] = groupLeader + i
            end
        elseif mob:getID() == effigyID[8] then
            groupLeader = 17539125

            for i = 0, 5 do
                mobGroups[i + 1] = groupLeader + i
            end
        elseif mob:getID() == effigyID[9] then
            groupLeader = 17539131

            for i = 0, 5 do
                mobGroups[i + 1] = groupLeader + i
            end
        elseif mob:getID() == effigyID[10] then
            groupLeader = 17539137

            for i = 0, 4 do
                mobGroups[i + 1] = groupLeader + i
            end

            for i = 8, 8 do
                mobGroups[i - 2] = groupLeader + i
            end
        elseif mob:getID() == effigyID[11] then
            groupLeader = 17539146

            for i = 0, 0 do
                mobGroups[i + 1] = groupLeader + i
            end

            for i = 4, 8 do
                mobGroups[i - 2] = groupLeader + i
            end
        elseif mob:getID() == effigyID[12] then
            groupLeader = 17539155

            for i = 0, 5 do
                mobGroups[i + 1] = groupLeader + i
            end
        elseif mob:getID() == effigyID[13] then
            groupLeader = 17539164

            for i = 0, 0 do
                mobGroups[i + 1] = groupLeader + i
            end

            for i = 2, 2 do
                mobGroups[i] = groupLeader + i
            end

            for i = 4, 6 do
                mobGroups[i - 1] = groupLeader + i
            end

            for i = 10, 10 do
                mobGroups[i - 4] = groupLeader + i
            end
        elseif mob:getID() == effigyID[14] then
            groupLeader = 17539175

            for i = 0, 2 do
                mobGroups[i + 1] = groupLeader + i
            end

            for i = 4, 6 do
                mobGroups[i] = groupLeader + i
            end
        elseif mob:getID() == effigyID[15] then
            groupLeader = 17539182

            for i = 0, 5 do
                mobGroups[i + 1] = groupLeader + i
            end
        elseif mob:getID() == effigyID[16] then
            groupLeader = 17539189

            for i = 0, 0 do
                mobGroups[i + 1] = groupLeader + i
            end

            for i = 2, 6 do
                mobGroups[i] = groupLeader + i
            end
        elseif mob:getID() == effigyID[17] then
            groupLeader = 17539196

            for i = 0, 1 do
                mobGroups[i + 1] = groupLeader + i
            end

            for i = 3, 3 do
                mobGroups[i] = groupLeader + i
            end

            for i = 5, 7 do
                mobGroups[i - 1] = groupLeader + i
            end
        elseif mob:getID() == effigyID[18] then
            groupLeader = 17539204

            for i = 0, 5 do
                mobGroups[i + 1] = groupLeader + i
            end
        elseif mob:getID() == effigyID[19] then
            groupLeader = 17539211

            for i = 0, 0 do
                mobGroups[i + 1] = groupLeader + i
            end

            for i = 2, 2 do
                mobGroups[i] = groupLeader + i
            end

            for i = 4, 7 do
                mobGroups[i - 1] = groupLeader + i
            end
        elseif mob:getID() == effigyID[20] then
            groupLeader = 17539219

            for i = 0, 3 do
                mobGroups[i + 1] = groupLeader + i
            end

            for i = 5, 6 do
                mobGroups[i] = groupLeader + i
            end
        elseif mob:getID() == effigyID[21] then
            groupLeader = 17539226

            for i = 0, 0 do
                mobGroups[i + 1] = groupLeader + i
            end

            for i = 4, 7 do
                mobGroups[i - 2] = groupLeader + i
            end

            for i = 11, 11 do
                mobGroups[i - 5] = groupLeader + i
            end
        elseif mob:getID() == effigyID[22] then
            groupLeader = 17539239

            for i = 0, 0 do
                mobGroups[i + 1] = groupLeader + i
            end

            for i = 2, 6 do
                mobGroups[i] = groupLeader + i
            end
        elseif mob:getID() == effigyID[23] then
            groupLeader = 17539246

            for i = 0, 1 do
                mobGroups[i + 1] = groupLeader + i
            end

            for i = 3, 3 do
                mobGroups[i] = groupLeader + i
            end

            for i = 5, 6 do
                mobGroups[i - 1] = groupLeader + i
            end

            for i = 8, 8 do
                mobGroups[i - 2] = groupLeader + i
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
    -- dynamis.refillStatueOnDeath(mob, player, isKiller)
end
-----------------------------------
-- Area: Dynamis - San d'Oria
--  Mob: Warchief Tombstone
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

local tombstoneID = {17535026, 17535057, 17535128, 17535131, 17535139}

function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.LINK_RADIUS, 10)
	mob:setMobMod(tpz.mobMod.SIGHT_RANGE, 10)
	mob:setLocalVar("SPAWNED_MOBS", 0)
end

function onMobEngaged(mob, target)
	local groupLeader
	local pos = mob:getPos()
	local mobGroups = {}

	if (mob:getLocalVar("SPAWNED_MOBS") == 0) then
		if (mob:getID() == tombstoneID[1]) then
			groupLeader = 17535102
			
			for i = 0, 6 do
				mobGroups[i + 1] = groupLeader + i
			end
		elseif (mob:getID() == tombstoneID[2]) then
			groupLeader = 17535109
			
			for i = 0, 1 do
				mobGroups[i + 1] = groupLeader + i
			end
			
			for i = 3, 3 do
				mobGroups[i] = groupLeader + i
			end
			
			for i = 7, 10 do
				mobGroups[i - 3] = groupLeader + i
			end
		elseif (mob:getID() == tombstoneID[3]) then
			groupLeader = 17535120
			
			for i = 0, 6 do
				mobGroups[i + 1] = groupLeader + i
			end
		elseif (mob:getID() == tombstoneID[4]) then
			groupLeader = 17535127
			
			for i = 0, 0 do
				mobGroups[i + 1] = groupLeader + i
			end
			
			for i = 2, 3 do
				mobGroups[i] = groupLeader + i
			end
			
			for i = 5, 8 do
				mobGroups[i - 1] = groupLeader + i
			end
		elseif (mob:getID() == tombstoneID[5]) then
			groupLeader = 17535136
			
			for i = 0, 2 do
				mobGroups[i + 1] = groupLeader + i
			end
			
			for i = 4, 7 do
				mobGroups[i] = groupLeader + i
			end
		end
	end
	
	local mobSpawns = 2
	local groupSize
	
	if (target:isPC()) then
		groupSize = target:getAlliance()
	elseif (target:isPet()) then
		local master = target:getMaster()
		
		if (master ~= nil and master:isPC()) then
			groupSize = master:getAlliance()
		end
	end
	
	if (#groupSize >= 2 and #groupSize <= 5) then
		mobSpawns = mobSpawns + (#groupSize - 1)
	elseif (#groupSize >= 6) then
		mobSpawns = 7
	end
	
	for i = 1, mobSpawns do
		local orc = GetMobByID(mobGroups[i])
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
    -- dynamis.timeExtensionOnDeath(mob, player, isKiller)
end
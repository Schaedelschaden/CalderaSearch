-----------------------------------
-- Area: Dynamis - Jeuno
--  Mob: Goblin Statue
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

local statueID = {17547301, 17547302, 17547303, 17547389, 17547390, 17547420, 17547467}

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
		if (mob:getID() == statueID[1]) then
			groupLeader = 17547400
			
			for i = 0, 1 do
				mobGroups[i + 1] = groupLeader + i
			end
			
			for i = 3, 6 do
				mobGroups[i] = groupLeader + i
			end
			
			for i = 8, 8 do
				mobGroups[i - 1] = groupLeader + i
			end
		elseif (mob:getID() == statueID[2]) then
			groupLeader = 17547409
			
			for i = 0, 6 do
				mobGroups[i + 1] = groupLeader + i
			end
		elseif (mob:getID() == statueID[3]) then
			groupLeader = 17547416
			
			for i = 0, 3 do
				mobGroups[i + 1] = groupLeader + i
			end
			
			for i = 9, 10 do
				mobGroups[i - 4] = groupLeader + i
			end
			
			for i = 12, 12 do
				mobGroups[i - 5] = groupLeader + i
			end
		elseif (mob:getID() == statueID[4]) then
			groupLeader = 17547430
			
			for i = 0, 6 do
				mobGroups[i + 1] = groupLeader + i
			end
		elseif (mob:getID() == statueID[5]) then
			groupLeader = 17547441
			
			for i = 0, 2 do
				mobGroups[i + 1] = groupLeader + i
			end
			
			for i = 4, 7 do
				mobGroups[i] = groupLeader + i
			end
		elseif (mob:getID() == statueID[6]) then
			groupLeader = 17547449
			
			for i = 0, 1 do
				mobGroups[i + 1] = groupLeader + i
			end
			
			for i = 3, 3 do
				mobGroups[i] = groupLeader + i
			end
			
			for i = 10, 13 do
				mobGroups[i - 6] = groupLeader + i
			end
		elseif (mob:getID() == statueID[7]) then
			groupLeader = 17547463
			
			for i = 0, 3 do
				mobGroups[i + 1] = groupLeader + i
			end
			
			for i = 6, 8 do
				mobGroups[i - 1] = groupLeader + i
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
	
	if (groupSize == 0 or groupSize == nil) then
		groupSize = 1
	end
	
	if (#groupSize >= 2 and #groupSize <= 5) then
		mobSpawns = mobSpawns + (#groupSize - 1)
	elseif (#groupSize >= 6) then
		mobSpawns = 7
	end
	
	for i = 1, mobSpawns do
		local goblin = GetMobByID(mobGroups[i])
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
    --dynamis.timeExtensionOnDeath(mob, player, isKiller)
end
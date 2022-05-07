-----------------------------------
-- Area: Dynamis - Windurst
--  Mob: Avatar Idol
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

local idolID = {17543258, 17543259, 17543342, 17543372, 17543446}

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
		if (mob:getID() == idolID[1]) then
			groupLeader = 17543323
			
			for i = 0, 6 do
				mobGroups[i + 1] = groupLeader + i
			end
		elseif (mob:getID() == idolID[2]) then
			groupLeader = 17543330
			
			for i = 0, 2 do
				mobGroups[i + 1] = groupLeader + i
			end
			
			for i = 4, 7 do
				mobGroups[i] = groupLeader + i
			end
		elseif (mob:getID() == idolID[3]) then
			groupLeader = 17543339
			
			for i = 0, 0 do
				mobGroups[i + 1] = groupLeader + i
			end
			
			for i = 2, 2 do
				mobGroups[i] = groupLeader + i
			end
			
			for i = 4, 5 do
				mobGroups[i - 1] = groupLeader + i
			end
			
			for i = 7, 9 do
				mobGroups[i - 2] = groupLeader + i
			end
		elseif (mob:getID() == idolID[4]) then
			groupLeader = 17543349
			
			for i = 0, 2 do
				mobGroups[i + 1] = groupLeader + i
			end
			
			for i = 6, 7 do
				mobGroups[i - 2] = groupLeader + i
			end
			
			for i = 9, 10 do
				mobGroups[i - 3] = groupLeader + i
			end
		elseif (mob:getID() == idolID[5]) then
			groupLeader = 17543360
			
			for i = 0, 0 do
				mobGroups[i + 1] = groupLeader + i
			end
			
			for i = 4, 7 do
				mobGroups[i - 2] = groupLeader + i
			end
			
			for i = 9, 10 do
				mobGroups[i - 3] = groupLeader + i
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
		local yagudo = GetMobByID(mobGroups[i])
		local xOffset = math.random(-6, 6)
		local zOffset = math.random(-6, 6)
		
		SpawnMob(mobGroups[i]):updateEnmity(target)
		yagudo:setPos(pos.x + xOffset, pos.y, pos.z + zOffset)
		yagudo:setSpawn(pos.x + xOffset, pos.y, pos.z + zOffset, 0)
		yagudo:setMobMod(tpz.mobMod.IDLE_DESPAWN, 180)
	end
	
	mob:setLocalVar("SPAWNED_MOBS", 1)
end

function onMobDeath(mob, player, isKiller)
    -- dynamis.timeExtensionOnDeath(mob, player, isKiller)
end
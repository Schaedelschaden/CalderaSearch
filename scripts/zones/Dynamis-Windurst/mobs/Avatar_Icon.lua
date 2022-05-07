-----------------------------------
-- Area: Dynamis - Windurst
--  Mob: Avatar Icon
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

local iconID = {17543268, 17543269,
				17543305, 17543306,
				17543353, 17543354,
				17543362, 17543363,
				17543392, 17543393,
				17543409, 17543410,
				17543419, 17543420, 17543421,
				17543461, 17543462, 17543463
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
	local pos = mob:getPos()
	local mobGroups = {}

	if (mob:getLocalVar("SPAWNED_MOBS") == 0) then
		if (mob:getID() == iconID[1]) then
			groupLeader = 17543172
			
			for i = 0, 4 do
				mobGroups[i + 1] = groupLeader + i
			end
			
			for i = 6, 7 do
				 mobGroups[i] = groupLeader + i
			end
		elseif (mob:getID() == iconID[2]) then
			groupLeader = 17543179
			
			for i = 0, 6 do
				mobGroups[i + 1] = groupLeader + i
			end
		elseif (mob:getID() == iconID[3]) then
			groupLeader = 17543186
			
			for i = 0, 0 do
				mobGroups[i + 1] = groupLeader + i
			end
			
			for i = 2, 6 do
				mobGroups[i] = groupLeader + i
			end
			
			for i = 8, 8 do
				mobGroups[i - 1] = groupLeader + i
			end
		elseif (mob:getID() == iconID[4]) then
			groupLeader = 17543195
			
			for i = 0, 1 do
				mobGroups[i + 1] = groupLeader + i
			end
			
			for i = 3, 7 do
				mobGroups[i] = groupLeader + i
			end
		elseif (mob:getID() == iconID[5]) then
			groupLeader = 17543203
			
			for i = 0, 0 do
				mobGroups[i + 1] = groupLeader + i
			end
			
			for i = 2, 7 do
				mobGroups[i] = groupLeader + i
			end
		elseif (mob:getID() == iconID[6]) then
			groupLeader = 17543211
			
			for i = 0, 5 do
				mobGroups[i + 1] = groupLeader + i
			end
			
			for i = 7, 7 do
				mobGroups[i] = groupLeader + i
			end
		elseif (mob:getID() == iconID[7]) then
			groupLeader = 17543219
			
			for i = 0, 6 do
				mobGroups[i + 1] = groupLeader + i
			end
		elseif (mob:getID() == iconID[8]) then
			groupLeader = 17543226
			
			for i = 0, 3 do
				mobGroups[i + 1] = groupLeader + i
			end
			
			for i = 5, 7 do
				mobGroups[i] = groupLeader + i
			end
		elseif (mob:getID() == iconID[9]) then
			groupLeader = 17543234
			
			for i = 0, 1 do
				mobGroups[i + 1] = groupLeader + i
			end
			
			for i = 3, 3 do
				mobGroups[i] = groupLeader + i
			end
			
			for i = 5, 5 do
				mobGroups[i - 1] = groupLeader + i
			end
			
			for i = 7, 7 do
				mobGroups[i - 2] = groupLeader + i
			end
			
			for i = 9, 10 do
				mobGroups[i - 3] = groupLeader + i
			end
		elseif (mob:getID() == iconID[10]) then
			groupLeader = 17543245
			
			for i = 0, 6 do
				mobGroups[i + 1] = groupLeader + i
			end
		elseif (mob:getID() == iconID[11]) then
			groupLeader = 17543252
			
			for i = 0, 4 do
				mobGroups[i + 1] = groupLeader + i
			end
			
			for i = 8, 9 do
				mobGroups[i - 2] = groupLeader + i
			end
		elseif (mob:getID() == iconID[12]) then
			groupLeader = 17543262
			
			for i = 0, 4 do
				mobGroups[i + 1] = groupLeader + i
			end
			
			for i = 8, 9 do
				mobGroups[i - 2] = groupLeader + i
			end
		elseif (mob:getID() == iconID[13]) then
			groupLeader = 17543272
			
			for i = 0, 0 do
				mobGroups[i + 1] = groupLeader + i
			end
			
			for i = 2, 2 do
				mobGroups[i] = groupLeader + i
			end
			
			for i = 4, 8 do
				mobGroups[i - 1] = groupLeader + i
			end
		elseif (mob:getID() == iconID[14]) then
			groupLeader = 17543281
			
			for i = 0, 5 do
				mobGroups[i + 1] = groupLeader + i
			end
			
			for i = 7, 7 do
				mobGroups[i] = groupLeader + i
			end
		elseif (mob:getID() == iconID[15]) then
			groupLeader = 17543289
			
			for i = 0, 4 do
				mobGroups[i + 1] = groupLeader + i
			end
			
			for i = 7, 8 do
				mobGroups[i - 1] = groupLeader + i
			end
		elseif (mob:getID() == iconID[16]) then
			groupLeader = 17543298
			
			for i = 0, 1 do
				mobGroups[i + 1] = groupLeader + i
			end
			
			for i = 3, 6 do
				mobGroups[i] = groupLeader + i
			end
			
			for i = 9, 9 do
				mobGroups[i - 2] = groupLeader + i
			end
		elseif (mob:getID() == iconID[17]) then
			groupLeader = 17543308
			
			for i = 0, 2 do
				mobGroups[i + 1] = groupLeader + i
			end
			
			for i = 4, 7 do
				mobGroups[i] = groupLeader + i
			end
		elseif (mob:getID() == iconID[18]) then
			groupLeader = 17543316
			
			for i = 0, 6 do
				mobGroups[i + 1] = groupLeader + i
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
    -- dynamis.refillStatueOnDeath(mob, player, isKiller)
end
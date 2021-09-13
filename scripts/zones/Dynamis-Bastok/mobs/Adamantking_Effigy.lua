-----------------------------------
-- Area: Dynamis - Bastok
--  Mob: Adamantking Effigy
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

local effigyID = {17539118, 17539119, 17539120,
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
	mob:setMobMod(tpz.mobMod.LINK_RADIUS, 6)
	mob:setMobMod(tpz.mobMod.SOUND_RANGE, 6)
    -- dynamis.refillStatueOnSpawn(mob)
	mob:setLocalVar("SPAWNED_MOBS", 0)
end

function onMobEngaged(mob, target)
	local groupLeader
	local pos = mob:getPos()
	local mobGroups = {}

	if (mob:getLocalVar("SPAWNED_MOBS") == 0) then
		if (mob:getID() == effigyID[1]) then
			groupLeader = 17539074
			
			for i = 0, 7 do
				mobGroups[i + 1] = groupLeader + i
			end
		elseif (mob:getID() == effigyID[2]) then
			groupLeader = 17539083
			
			for i = 0, 7 do
				mobGroups[i + 1] = groupLeader + i
			end
		elseif (mob:getID() == effigyID[3]) then
			groupLeader = 17539092
			
			for i = 0, 7 do
				mobGroups[i + 1] = groupLeader + i
			end
		elseif (mob:getID() == effigyID[4]) then
			groupLeader = 17539101
			
			for i = 0, 7 do
				mobGroups[i + 1] = groupLeader + i
			end
		elseif (mob:getID() == effigyID[5]) then
			groupLeader = 17539110
			
			-- mobGroups 1-6
			for i = 0, 5 do
				mobGroups[i + 1] = groupLeader + i
			end
			--mobGroups 7-8
			for i = 0, 1 do
				mobGroups[i + 7] = groupLeader + i + 11
			end
		elseif (mob:getID() == effigyID[6]) then
			groupLeader = 17539123
			
			for i = 0, 7 do
				mobGroups[i + 1] = groupLeader + i
			end
		-- elseif (mob:getID() == effigyID[7]) then
			-- groupLeader = 
			
			-- for i = 0, 7 do
				-- mobGroups[i + 1] = groupLeader + i
			-- end
		-- elseif (mob:getID() == effigyID[8]) then
			-- groupLeader = 
			
			-- for i = 0, 7 do
				-- mobGroups[i + 1] = groupLeader + i
			-- end
		-- elseif (mob:getID() == effigyID[9]) then
			-- groupLeader = 
			
			-- for i = 0, 7 do
				-- mobGroups[i + 1] = groupLeader + i
			-- end
		-- elseif (mob:getID() == effigyID[10]) then
			-- groupLeader = 
			
			-- for i = 0, 7 do
				-- mobGroups[i + 1] = groupLeader + i
			-- end
		-- elseif (mob:getID() == effigyID[11]) then
			-- groupLeader = 
			
			-- for i = 0, 7 do
				-- mobGroups[i + 1] = groupLeader + i
			-- end
		-- elseif (mob:getID() == effigyID[12]) then
			-- groupLeader = 
			
			-- for i = 0, 7 do
				-- mobGroups[i + 1] = groupLeader + i
			-- end
		-- elseif (mob:getID() == effigyID[13]) then
			-- groupLeader = 
			
			-- for i = 0, 7 do
				-- mobGroups[i + 1] = groupLeader + i
			-- end
		-- elseif (mob:getID() == effigyID[14]) then
			-- groupLeader = 
			
			-- for i = 0, 7 do
				-- mobGroups[i + 1] = groupLeader + i
			-- end
		-- elseif (mob:getID() == effigyID[15]) then
			-- groupLeader = 
			
			-- for i = 0, 7 do
				-- mobGroups[i + 1] = groupLeader + i
			-- end
		-- elseif (mob:getID() == effigyID[16]) then
			-- groupLeader = 
			
			-- for i = 0, 7 do
				-- mobGroups[i + 1] = groupLeader + i
			-- end
		-- elseif (mob:getID() == effigyID[17]) then
			-- groupLeader = 
			
			-- for i = 0, 7 do
				-- mobGroups[i + 1] = groupLeader + i
			-- end
		-- elseif (mob:getID() == effigyID[18]) then
			-- groupLeader = 
			
			-- for i = 0, 7 do
				-- mobGroups[i + 1] = groupLeader + i
			-- end
		-- elseif (mob:getID() == effigyID[19]) then
			-- groupLeader = 
			
			-- for i = 0, 7 do
				-- mobGroups[i + 1] = groupLeader + i
			-- end
		-- elseif (mob:getID() == effigyID[20]) then
			-- groupLeader = 
			
			-- for i = 0, 7 do
				-- mobGroups[i + 1] = groupLeader + i
			-- end
		-- elseif (mob:getID() == effigyID[21]) then
			-- groupLeader = 
			
			-- for i = 0, 7 do
				-- mobGroups[i + 1] = groupLeader + i
			-- end
		-- elseif (mob:getID() == effigyID[22]) then
			-- groupLeader = 
			
			-- for i = 0, 7 do
				-- mobGroups[i + 1] = groupLeader + i
			-- end
		-- elseif (mob:getID() == effigyID[23]) then
			-- groupLeader = 
			
			-- for i = 0, 7 do
				-- mobGroups[i + 1] = groupLeader + i
			-- end
		end
	end
	
	for i = 1, #mobGroups do
		local quadav = GetMobByID(mobGroups[i])
		local xOffset = math.random(-6, 6)
		local zOffset = math.random(-6, 6)
		
		SpawnMob(mobGroups[i]):updateEnmity(target)
		quadav:setPos(pos.x + xOffset, pos.y, pos.z + zOffset)
		quadav:setSpawn(pos.x + xOffset, pos.y, pos.z + zOffset, 0)
	end
end

function onMobDeath(mob, player, isKiller)
    dynamis.refillStatueOnDeath(mob, player, isKiller)
end
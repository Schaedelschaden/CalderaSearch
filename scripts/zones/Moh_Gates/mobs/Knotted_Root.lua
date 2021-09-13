-----------------------------------
-- Area: Moh Gates
--  Mob: Knotted Root
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

local i7KnottedRoot = 17879165
local g8KnottedRoot = 17879174
local i7Vines = 17879396
local g8Vines = 17879394 -- Might be Wall?
local i7Wall = 17879397
local g8Wall = 17879395 -- Might be Vines?

function onMobSpawn(mob)
	if (mob:getID() == i7KnottedRoot or mob:getID() == i7KnottedRoot + 1 or mob:getID() == i7KnottedRoot + 2) then
		for i = i7KnottedRoot, i7KnottedRoot + 2 do
			if (GetMobByID(i):isDead()) then
				SpawnMob(i)
			end
		end
		
		GetNPCByID(i7Vines):setAnimation(tpz.anim.CLOSE_DOOR)
	end
	
	if (mob:getID() == g8KnottedRoot or mob:getID() == g8KnottedRoot + 1 or mob:getID() == g8KnottedRoot + 2) then
		for i = g8KnottedRoot, g8KnottedRoot + 2 do
			if (GetMobByID(i):isDead()) then
				SpawnMob(i)
			end
		end
		
		GetNPCByID(g8Vines):setAnimation(tpz.anim.CLOSE_DOOR)
	end
end

function onMobDeath(mob, player, isKiller)
	local g8Counter = 0
	local i7Counter = 0

	if (mob:getID() == i7KnottedRoot or mob:getID() == i7KnottedRoot + 1 or mob:getID() == i7KnottedRoot + 2) then
		for i = i7KnottedRoot, i7KnottedRoot + 2 do
			if (GetMobByID(i):isDead()) then
				i7Counter = i7Counter + 1
			end
		end
		
		if (i7Counter == 3) then
			GetNPCByID(i7Vines):setAnimation(tpz.anim.OPEN_DOOR)
			GetNPCByID(i7Wall):openDoor(120)
		end
	end
	
	if (mob:getID() == g8KnottedRoot or mob:getID() == g8KnottedRoot + 1 or mob:getID() == g8KnottedRoot + 2) then
		for i = g8KnottedRoot, g8KnottedRoot + 2 do
			if (GetMobByID(i):isDead()) then
				g8Counter = g8Counter + 1
			end
		end
		
		if (g8Counter == 3) then
			GetNPCByID(g8Vines):setAnimation(tpz.anim.OPEN_DOOR)
			GetNPCByID(g8Wall):openDoor(120)
		end
	end
end
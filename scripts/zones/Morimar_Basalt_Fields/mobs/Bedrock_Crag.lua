-----------------------------------
-- Area: Morimar Basalt Fields
--  Mob: Bedrock Crag
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

local f6BedrockCrag = 17863268
local f9RightBedrockCrag = 17863250
local f9LeftBedrockCrag = 17863259
local g11BedrockCrag = 17863241
local h8BedrockCrag = 17863223
local h10BedrockCrag = 17863232
local i8BedrockCrag = 17863214
local f6Rocks = 17863375
local f9RightRocks = 17863383
local f9LeftRocks = 17863381
local g11Rocks = 17863387
local h8Rocks = 17863377
local h10Rocks = 17863385
local i8Rocks = 17863379
local f6Wall = 17863376
local f9RightWall = 17863384
local f9LeftWall = 17863382
local g11Wall = 17863389
local h8Wall = 17863378
local h10Wall = 17863386
local i8Wall = 17863380


function onMobSpawn(mob)
	if (mob:getID() == f6BedrockCrag or mob:getID() == f6BedrockCrag + 1 or mob:getID() == f6BedrockCrag + 2) then
		for i = f6BedrockCrag, f6BedrockCrag + 2 do
			if (GetMobByID(i):isDead()) then
				SpawnMob(i)
			end
		end
		
		GetNPCByID(f6Rocks):setAnimation(tpz.anim.CLOSE_DOOR)
		GetNPCByID(f6Wall):setAnimation(tpz.anim.CLOSE_DOOR)
	end
	
	if (mob:getID() == f9RightBedrockCrag or mob:getID() == f9RightBedrockCrag + 1 or mob:getID() == f9RightBedrockCrag + 2) then
		for i = f9RightBedrockCrag, f9RightBedrockCrag + 2 do
			if (GetMobByID(i):isDead()) then
				SpawnMob(i)
			end
		end
		
		GetNPCByID(f9RightRocks):setAnimation(tpz.anim.CLOSE_DOOR)
		GetNPCByID(f9RightWall):setAnimation(tpz.anim.CLOSE_DOOR)
	end
	
	if (mob:getID() == f9LeftBedrockCrag or mob:getID() == f9LeftBedrockCrag + 1 or mob:getID() == f9LeftBedrockCrag + 2) then
		for i = f9LeftBedrockCrag, f9LeftBedrockCrag + 2 do
			if (GetMobByID(i):isDead()) then
				SpawnMob(i)
			end
		end
		
		GetNPCByID(f9LeftRocks):setAnimation(tpz.anim.CLOSE_DOOR)
		GetNPCByID(f9LeftWall):setAnimation(tpz.anim.CLOSE_DOOR)
	end
	
	if (mob:getID() == g11BedrockCrag or mob:getID() == g11BedrockCrag + 1 or mob:getID() == g11BedrockCrag + 2) then
		for i = g11BedrockCrag, g11BedrockCrag + 2 do
			if (GetMobByID(i):isDead()) then
				SpawnMob(i)
			end
		end
		
		GetNPCByID(g11Rocks):setAnimation(tpz.anim.CLOSE_DOOR)
		GetNPCByID(g11Wall):setAnimation(tpz.anim.CLOSE_DOOR)
	end
	
	if (mob:getID() == h8BedrockCrag or mob:getID() == h8BedrockCrag + 1 or mob:getID() == h8BedrockCrag + 2) then
		for i = h8BedrockCrag, h8BedrockCrag + 2 do
			if (GetMobByID(i):isDead()) then
				SpawnMob(i)
			end
		end
		
		GetNPCByID(h8Rocks):setAnimation(tpz.anim.CLOSE_DOOR)
		GetNPCByID(h8Wall):setAnimation(tpz.anim.CLOSE_DOOR)
	end
	
	if (mob:getID() == h10BedrockCrag or mob:getID() == h10BedrockCrag + 1 or mob:getID() == h10BedrockCrag + 2) then
		for i = h10BedrockCrag, h10BedrockCrag + 2 do
			if (GetMobByID(i):isDead()) then
				SpawnMob(i)
			end
		end
		
		GetNPCByID(h10Rocks):setAnimation(tpz.anim.CLOSE_DOOR)
		GetNPCByID(h10Wall):setAnimation(tpz.anim.CLOSE_DOOR)
	end
	
	if (mob:getID() == i8BedrockCrag or mob:getID() == i8BedrockCrag + 1 or mob:getID() == i8BedrockCrag + 2) then
		for i = i8BedrockCrag, i8BedrockCrag + 2 do
			if (GetMobByID(i):isDead()) then
				SpawnMob(i)
			end
		end
		
		GetNPCByID(i8Rocks):setAnimation(tpz.anim.CLOSE_DOOR)
		GetNPCByID(i8Wall):setAnimation(tpz.anim.CLOSE_DOOR)
	end
end

function onMobDeath(mob, player, isKiller)
	local f6Counter = 0
	local f9RightCounter = 0
	local f9LeftCounter = 0
	local g11Counter = 0
	local h8Counter = 0
	local h10Counter = 0
	local i8Counter = 0

	if (mob:getID() == f6BedrockCrag or mob:getID() == f6BedrockCrag + 1 or mob:getID() == f6BedrockCrag + 2) then
		for i = f6BedrockCrag, f6BedrockCrag + 2 do
			if (GetMobByID(i):isDead()) then
				f6Counter = f6Counter + 1
			end
		end
		
		if (f6Counter == 3) then
			GetNPCByID(f6Rocks):setAnimation(tpz.anim.OPEN_DOOR)
			GetNPCByID(f6Rocks):openDoor(120)
			GetNPCByID(f6Wall):setAnimation(tpz.anim.OPEN_DOOR)
			GetNPCByID(f6Wall):openDoor(120)
		end
	end
	
	if (mob:getID() == f9RightBedrockCrag or mob:getID() == f9RightBedrockCrag + 1 or mob:getID() == f9RightBedrockCrag + 2) then
		for i = f9RightBedrockCrag, f9RightBedrockCrag + 2 do
			if (GetMobByID(i):isDead()) then
				f9RightCounter = f9RightCounter + 1
			end
		end
		
		if (f9RightCounter == 3) then
			GetNPCByID(f9RightRocks):setAnimation(tpz.anim.OPEN_DOOR)
			GetNPCByID(f9RightRocks):openDoor(120)
			GetNPCByID(f9RightWall):setAnimation(tpz.anim.OPEN_DOOR)
			GetNPCByID(f9RightWall):openDoor(120)
		end
	end
	
	if (mob:getID() == f9LeftBedrockCrag or mob:getID() == f9LeftBedrockCrag + 1 or mob:getID() == f9LeftBedrockCrag + 2) then
		for i = f9LeftBedrockCrag, f9LeftBedrockCrag + 2 do
			if (GetMobByID(i):isDead()) then
				f9LeftCounter = f9LeftCounter + 1
			end
		end
		
		if (f9LeftCounter == 3) then
			GetNPCByID(f9LeftRocks):setAnimation(tpz.anim.OPEN_DOOR)
			GetNPCByID(f9LeftRocks):openDoor(120)
			GetNPCByID(f9LeftWall):setAnimation(tpz.anim.OPEN_DOOR)
			GetNPCByID(f9LeftWall):openDoor(120)
		end
	end
	
	if (mob:getID() == g11BedrockCrag or mob:getID() == g11BedrockCrag + 1 or mob:getID() == g11BedrockCrag + 2) then
		for i = g11BedrockCrag, g11BedrockCrag + 2 do
			if (GetMobByID(i):isDead()) then
				h8Counter = g11Counter + 1
			end
		end
		
		if (g11Counter == 3) then
			GetNPCByID(g11Rocks):setAnimation(tpz.anim.OPEN_DOOR)
			GetNPCByID(g11Rocks):openDoor(120)
			GetNPCByID(g11Wall):setAnimation(tpz.anim.OPEN_DOOR)
			GetNPCByID(g11Wall):openDoor(120)
		end
	end
	
	if (mob:getID() == h8BedrockCrag or mob:getID() == h8BedrockCrag + 1 or mob:getID() == h8BedrockCrag + 2) then
		for i = h8BedrockCrag, h8BedrockCrag + 2 do
			if (GetMobByID(i):isDead()) then
				h8Counter = h8Counter + 1
			end
		end
		
		if (h8Counter == 3) then
			GetNPCByID(h8Rocks):setAnimation(tpz.anim.OPEN_DOOR)
			GetNPCByID(h8Rocks):openDoor(120)
			GetNPCByID(h8Wall):setAnimation(tpz.anim.OPEN_DOOR)
			GetNPCByID(h8Wall):openDoor(120)
		end
	end
	
	if (mob:getID() == h10BedrockCrag or mob:getID() == h10BedrockCrag + 1 or mob:getID() == h10BedrockCrag + 2) then
		for i = h10BedrockCrag, h10BedrockCrag + 2 do
			if (GetMobByID(i):isDead()) then
				h10Counter = h10Counter + 1
			end
		end
		
		if (h10Counter == 3) then
			GetNPCByID(h10Rocks):setAnimation(tpz.anim.OPEN_DOOR)
			GetNPCByID(h10Rocks):openDoor(120)
			GetNPCByID(h10Wall):setAnimation(tpz.anim.OPEN_DOOR)
			GetNPCByID(h10Wall):openDoor(120)
		end
	end
	
	if (mob:getID() == i8BedrockCrag or mob:getID() == i8BedrockCrag + 1 or mob:getID() == i8BedrockCrag + 2) then
		for i = i8BedrockCrag, i8BedrockCrag + 2 do
			if (GetMobByID(i):isDead()) then
				i8Counter = i8Counter + 1
			end
		end
		
		if (i8Counter == 3) then
			GetNPCByID(i8Rocks):setAnimation(tpz.anim.OPEN_DOOR)
			GetNPCByID(i8Rocks):openDoor(120)
			GetNPCByID(i8Wall):setAnimation(tpz.anim.OPEN_DOOR)
			GetNPCByID(i8Wall):openDoor(120)
		end
	end
end
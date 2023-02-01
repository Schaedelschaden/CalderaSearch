-----------------------------------
-- Area: Abyssea - Konschtat
--  Mob: Arimaspi
-----------------------------------

function onMobSpawn(mob)
	mob:setMod(tpz.mod.GRAVITYRES, 100)
	mob:setMod(tpz.mod.SILENCERES, 100)
end

function onMobEngaged(mob, target)
	for LesserArimaspi = mob:getID() + 1, mob:getID() + 3 do
        local pet = GetMobByID(LesserArimaspi)

		if pet:getCurrentAction() == tpz.act.ROAMING then
            pet:updateEnmity(target)
        end
	end
end

function onMobFight(mob, target)
	if mob:getHPP() > 80 and mob:getHPP() <= 90 and mob:getLocalVar("PetsSpawned") == 0 then
		for LesserArimaspi = mob:getID() + 1, mob:getID() + math.random(1, 3) do
			if not GetMobByID(LesserArimaspi):isSpawned() then
				SpawnMob(LesserArimaspi, 300):updateEnmity(target)
			end
		end
		
		mob:setLocalVar("PetsSpawned", 1)
	elseif mob:getHPP() <= 70 and mob:getLocalVar("PetsSpawned") == 1 then
		for LesserArimaspi = mob:getID() + 1, mob:getID() + math.random(1, 3) do
			if not GetMobByID(LesserArimaspi):isSpawned() then
				SpawnMob(LesserArimaspi, 300):updateEnmity(target)
			end
		end
		
		mob:setLocalVar("PetsSpawned", 2)
	elseif mob:getHPP() <= 50 and mob:getLocalVar("PetsSpawned") == 2 then
		for LesserArimaspi = mob:getID() + 1, mob:getID() + math.random(1, 3) do
			if not GetMobByID(LesserArimaspi):isSpawned() then
				SpawnMob(LesserArimaspi, 300):updateEnmity(target)
			end
		end
		
		mob:setLocalVar("PetsSpawned", 3)
	elseif mob:getHPP() <= 30 and mob:getLocalVar("PetsSpawned") == 3 then
		for LesserArimaspi = mob:getID() + 1, mob:getID() + math.random(1, 3) do
			if not GetMobByID(LesserArimaspi):isSpawned() then
				SpawnMob(LesserArimaspi, 300):updateEnmity(target)
			end
		end
		
		mob:setLocalVar("PetsSpawned", 4)
	elseif mob:getHPP() <= 10 and mob:getLocalVar("PetsSpawned") == 4 then
		for LesserArimaspi = mob:getID() + 1, mob:getID() + math.random(1, 3) do
			if not GetMobByID(LesserArimaspi):isSpawned() then
				SpawnMob(LesserArimaspi, 300):updateEnmity(target)
			end
		end
		
		mob:setLocalVar("PetsSpawned", 5)
	end
end

function onMobDeath(mob, player, isKiller)
	for LesserArimaspi = mob:getID() + 1, mob:getID() + 3 do
		if GetMobByID(LesserArimaspi):isSpawned() then
			DespawnMob(LesserArimaspi)
		end
	end

	tpz.abyssea.kiOnMobDeath(mob, player)
end
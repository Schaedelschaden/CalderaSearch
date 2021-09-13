-----------------------------------
-- Area: Abyssea - La Theine
--  Mob: Grandgousier
-----------------------------------

function onMobSpawn(mob)
	mob:setMod(tpz.mod.BLINDRES, 90)
	mob:setMod(tpz.mod.SLOWRES, 50)
	mob:setMod(tpz.mod.PARALYZERES, 50)
end

function onMobFight(mob)
	local accCounter = mob:getLocalVar("ACC_Counter")
	local hpp = mob:getHPP()
	
	if (hpp <= 90 and accCounter == 0) then
		mob:addMod(tpz.mod.ACC, 15)
		mob:addMod(tpz.mod.RACC, 15)
		mob:setLocalVar("ACC_Counter", 1)
	elseif (hpp <= 80 and accCounter == 1) then
		mob:addMod(tpz.mod.ACC, 15)
		mob:addMod(tpz.mod.RACC, 15)
		mob:setLocalVar("ACC_Counter", 2)
	elseif (hpp <= 70 and accCounter == 2) then
		mob:addMod(tpz.mod.ACC, 15)
		mob:addMod(tpz.mod.RACC, 15)
		mob:setLocalVar("ACC_Counter", 3)
	elseif (hpp <= 60 and accCounter == 3) then
		mob:addMod(tpz.mod.ACC, 15)
		mob:addMod(tpz.mod.RACC, 15)
		mob:setLocalVar("ACC_Counter", 4)
	elseif (hpp <= 50 and accCounter == 4) then
		mob:addMod(tpz.mod.ACC, 15)
		mob:addMod(tpz.mod.RACC, 15)
		mob:setLocalVar("ACC_Counter", 5)
	elseif (hpp <= 40 and accCounter == 5) then
		mob:addMod(tpz.mod.ACC, 15)
		mob:addMod(tpz.mod.RACC, 15)
		mob:setLocalVar("ACC_Counter", 6)
	elseif (hpp <= 30 and accCounter == 6) then
		mob:addMod(tpz.mod.ACC, 15)
		mob:addMod(tpz.mod.RACC, 15)
		mob:setLocalVar("ACC_Counter", 7)
	elseif (hpp <= 20 and accCounter == 7) then
		mob:addMod(tpz.mod.ACC, 15)
		mob:addMod(tpz.mod.RACC, 15)
		mob:setLocalVar("ACC_Counter", 8)
	elseif (hpp <= 10 and accCounter == 8) then
		mob:addMod(tpz.mod.ACC, 15)
		mob:addMod(tpz.mod.RACC, 15)
	end
end

function onMobDeath(mob, player, isKiller)
	tpz.abyssea.kiOnMobDeath(mob, player)
end
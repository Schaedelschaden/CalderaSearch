-----------------------------------
-- Area: West Ronfaure
--  Mob: Wild Rabbit
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobSpawn(mob)
	-- Provides an unkillable mob as a practice dummy
	-- Positioned outside the West Ronfaure > Southern San d'Oria gate
	if (mob:getID() == 17186822) then
		mob:setPos(-156.499, -60.000, 278.243)
		mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
		-- mob:speed(0)
		-- mob:setMod(tpz.mod.REGEN, 10000)
		-- mob:setMod(tpz.mod.UDMGPHYS, -100)
		-- mob:setMod(tpz.mod.UDMGBREATH, -100)
		-- mob:setMod(tpz.mod.UDMGMAGIC, -100)
		-- mob:setMod(tpz.mod.UDMGRANGE, -100)
		mob:setMod(tpz.mod.CHARMRES, 100)
		mob:setRespawnTime(10)
	end
end

function onMobFight(mob, target)
	if (mob:getID() == 17186822) then
		-- mob:setMod(tpz.mod.DEF, 1500)
		mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
        mob:setMod(tpz.mod.FIRE_ABSORB, 0)
        mob:setMod(tpz.mod.ICE_ABSORB, 100)
        mob:setMod(tpz.mod.WIND_ABSORB, 0)
        mob:setMod(tpz.mod.EARTH_ABSORB, 0)
        mob:setMod(tpz.mod.LTNG_ABSORB, 0)
        mob:setMod(tpz.mod.WATER_ABSORB, 0)
        mob:setMod(tpz.mod.LIGHT_ABSORB, 0)
        mob:setMod(tpz.mod.DARK_ABSORB, 0)
		-- mob:speed(0)
		-- mob:setMod(tpz.mod.REGEN, 10000)
		-- mob:setMod(tpz.mod.CHARMRES, 100)
		-- mob:setMod(tpz.mod.MEVA, 816)
		-- mob:setMod(tpz.mod.MAIN_DMG_RATING, 1000)
		
		mob:setTP(0)

		if (mob:checkDistance(target) >= 25) then
			mob:disengage()
		end
		
		local mainLevel = target:getMainLvl()
		
		if (target:isPC()) then
			mainLevel = mainLevel + target:getItemLevel()
		end
		
		if (mainLevel > mob:getMainLvl()) then
			mob:setMobLevel(mainLevel)
		end
		
		mob:setMod(tpz.mod.UDMGPHYS, 0)
		mob:setMod(tpz.mod.UDMGBREATH, 0)
		mob:setMod(tpz.mod.UDMGMAGIC, 0)
		mob:setMod(tpz.mod.UDMGRANGE, 0)
		
		if (mob:getHPP() <= 25) then
			mob:setHP(1000000)
		end
		-- if (mainLevel >= 1 and mainLevel <= 20) then
			-- mob:setMobLevel(mainLevel)
			-- mob:setMod(tpz.mod.ATT, 50)
			-- mob:setMod(tpz.mod.DEF, 50)
			-- mob:setMod(tpz.mod.ACC, 50)
			-- mob:setMod(tpz.mod.EVA, 50)
		-- elseif (mainLevel >= 21 and mainLevel <= 40) then
			-- mob:setMobLevel(mainLevel)
			-- mob:setMod(tpz.mod.ATT, 150)
			-- mob:setMod(tpz.mod.DEF, 150)
			-- mob:setMod(tpz.mod.ACC, 150)
			-- mob:setMod(tpz.mod.EVA, 150)
		-- elseif (mainLevel >= 41 and mainLevel <= 60) then
			-- mob:setMobLevel(mainLevel)
			-- mob:setMod(tpz.mod.ATT, 300)
			-- mob:setMod(tpz.mod.DEF, 300)
			-- mob:setMod(tpz.mod.ACC, 300)
			-- mob:setMod(tpz.mod.EVA, 300)
		-- elseif (mainLevel >= 61 and mainLevel <= 75) then
			-- mob:setMobLevel(mainLevel)
			-- mob:setMod(tpz.mod.ATT, 600)
			-- mob:setMod(tpz.mod.DEF, 500)
			-- mob:setMod(tpz.mod.ACC, 600)
			-- mob:setMod(tpz.mod.EVA, 350)
		-- elseif (mainLevel >= 76 and mainLevel <= 99) then
			-- mob:setMobLevel(mainLevel)
			-- mob:setMod(tpz.mod.ATT, 800)
			-- mob:setMod(tpz.mod.DEF, 600)
			-- mob:setMod(tpz.mod.ACC, 700)
			-- mob:setMod(tpz.mod.EVA, 450)
		-- elseif (mainLevel > 99) then
			-- mob:setMobLevel(mainLevel)
			-- mob:setMod(tpz.mod.ATT, 1000)
			-- mob:setMod(tpz.mod.DEF, 750)
			-- mob:setMod(tpz.mod.ACC, 850)
			-- mob:setMod(tpz.mod.EVA, 750)
		-- end
	end
end

function onMobDisengage(mob)
	mob:setPos(-156.400, -60, 278.243, 125)
	mob:setMobLevel(1)
	mob:setHP(1000000)
	mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
	-- mob:speed(0)
	-- mob:setMod(tpz.mod.UDMGPHYS, -100)
	-- mob:setMod(tpz.mod.UDMGBREATH, -100)
	-- mob:setMod(tpz.mod.UDMGMAGIC, -100)
	-- mob:setMod(tpz.mod.UDMGRANGE, -100)
end

function onMobDeath(mob, player, isKiller)
    
end
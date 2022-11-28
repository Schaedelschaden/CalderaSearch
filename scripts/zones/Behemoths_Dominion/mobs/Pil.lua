-----------------------------------
-- Area: Behemoth's Dominion
--  VWNM: Pil
-- ID1: 17297452 !pos -210 -20.3 70 127
-- ID2: 17297453 !pos -4 -4.3 -33.3 127
-- ID3: 17297454 !pos 144.7 4.3 -123 127
-----------------------------------
local ID = require("scripts/zones/Behemoths_Dominion/IDs")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/titles")
require("scripts/globals/magic")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.DRAW_IN, 1)
	mob:setLocalVar("[rage]timer", 10800) -- 3 hours
	mob:setMobMod(tpz.mobMod.MAGIC_COOL, 10)
	mob:addMod(tpz.mod.PARALYZERES, 30) -- Resistance to Paralyze
    mob:addMod(tpz.mod.STUNRES, 25) -- Resistance to Stun
    mob:addMod(tpz.mod.GRAVITYRES, 100) -- Resistance to Gravity
    mob:addMod(tpz.mod.SILENCERES, 30) -- Resistance to Silence
	mob:addMod(tpz.mod.STR, 75)
	mob:addMod(tpz.mod.DEX, 30)
	mob:addMod(tpz.mod.AGL, 15)
	mob:addMod(tpz.mod.VIT, 80)	
	mob:addMod(tpz.mod.MEVA, 40)	
	mob:addMod(tpz.mod.DEF, 800)
	mob:addMod(tpz.mod.EVA, 80)
	mob:addMod(tpz.mod.MATT, 80)	
	mob:addMod(tpz.mod.REFRESH, 200)
	mob:addMod(tpz.mod.DARK_ABSORB, 100)
	mob:addMod(tpz.mod.EARTH_ABSORB, 100)
	mob:addMod(tpz.mod.WATER_ABSORB, 100)
	mob:addMod(tpz.mod.ICE_ABSORB, 100)
	mob:addMod(tpz.mod.FASTCAST, 50)
	mob:setLocalVar("TabbiyaaGambit", 0)	
	mob:setLocalVar("ShahMat", 0)
	mob:setLocalVar("FlankAura", 0)
	mob:setLocalVar("ShahMatTime", 0)
end

function onMobFight(mob, target)
	local changeHP = mob:getLocalVar("changeHP")
	
	if (mob:getLocalVar("TabbiyaaGambit") > 0) then
		if (mob:getHP() <= changeHP - 20000) then
			mob:setLocalVar("TabbiyaaGambit", 0)
		end
	end

	if (mob:getLocalVar("TabbiyaaGambit") == 0) then -- all damage
		    mob:setMod(tpz.mod.HTHRES, 1000)
            mob:setMod(tpz.mod.SLASHRES, 1000)
            mob:setMod(tpz.mod.PIERCERES, 1000)
            mob:setMod(tpz.mod.IMPACTRES, 1000)
			mob:setMod(tpz.mod.UDMGMAGIC, 0)
			mob:setMod(tpz.mod.UDMGRANGE, 0)
	elseif (mob:getLocalVar("TabbiyaaGambit") == 1) then -- blunt damage
            mob:setMod(tpz.mod.SLASHRES, 0)
            mob:setMod(tpz.mod.PIERCERES, 0)
			mob:setMod(tpz.mod.UDMGMAGIC, -100)
			mob:setMod(tpz.mod.UDMGRANGE, -100)
	elseif (mob:getLocalVar("TabbiyaaGambit") == 2) then -- slash damage
		    mob:setMod(tpz.mod.HTHRES, 0)
            mob:setMod(tpz.mod.PIERCERES, 0)
            mob:setMod(tpz.mod.IMPACTRES, 0)
			mob:setMod(tpz.mod.UDMGMAGIC, -100)
			mob:setMod(tpz.mod.UDMGRANGE, -100)
	elseif (mob:getLocalVar("TabbiyaaGambit") == 3) then -- pierce damage
		    mob:setMod(tpz.mod.HTHRES, 0)
            mob:setMod(tpz.mod.SLASHRES, 0)
            mob:setMod(tpz.mod.IMPACTRES, 0)
			mob:setMod(tpz.mod.UDMGMAGIC, -100)
	elseif (mob:getLocalVar("TabbiyaaGambit") == 4) then -- magic damage
		    mob:setMod(tpz.mod.HTHRES, 0)
            mob:setMod(tpz.mod.SLASHRES, 0)
            mob:setMod(tpz.mod.PIERCERES, 0)
            mob:setMod(tpz.mod.IMPACTRES, 0)
			mob:setMod(tpz.mod.UDMGRANGE, -100)
	end

	if ((mob:getLocalVar("ShahMat") == 1) and os.time() - mob:getLocalVar("ShahMatTime") > 30) then -- 30 second duration
		mob:setLocalVar("ShahMat", 0)
	elseif (mob:getLocalVar("ShahMat") == 1 and os.time() - mob:getLocalVar("ShahMatTime") >= 3 and os.time() - mob:getLocalVar("ShahMatTime") <= 30 and
			target:isFacing(mob) and target:isInfront(mob, 90)) then -- 3 Seconds to turn around
		-- printf("Pil.lua onMobFight  SHAH MAT TRIGGER")
		target:addStatusEffectEx(tpz.effect.TERROR, tpz.effect.TERROR, 1, 0, 5)
		target:addStatusEffectEx(tpz.effect.DOOM, tpz.effect.DOOM, 1, 0, 60)
	end
	
	if (mob:getLocalVar("FlankAura") == 1) then
	else
	end
end

function onMobDeath(mob, player, isKiller)
	local playerName = player:getName()
	local mobName = mob:getName()
	local fixedMobName = string.gsub(mobName, "_", " ")
	local KillCounter = player:getCharVar("KillCounter_"..mobName)
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_"..mobName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", fixedMobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
end

function onMobDespawn(mob)
	
end
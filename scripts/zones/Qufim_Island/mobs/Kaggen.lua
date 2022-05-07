-----------------------------------
-- Area: Qufim Island
--  VWNM: Kaggen
-- ID1: 17293648 !pos 115 -20.5 150 126
-- ID2: 17293649 !pos -119 -20 375 126
-- ID3: 17293650 !pos 73 -20 244 126
-----------------------------------
local ID = require("scripts/zones/Qufim_Island/IDs")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/titles")
require("scripts/globals/magic")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
	mob:setLocalVar("[rage]timer", 10800) -- 3 hours
    mob:setMobMod(tpz.mobMod.MAGIC_COOL, 45)
	mob:addMod(tpz.mod.PARALYZERES, 30) -- Resistance to Paralyze
    mob:addMod(tpz.mod.STUNRES, 25) -- Resistance to Stun
    mob:addMod(tpz.mod.GRAVITYRES, 100) -- Resistance to Gravity
    mob:addMod(tpz.mod.SILENCERES, 30) -- Resistance to Silence
	mob:addMod(tpz.mod.MEVA, 40)
	mob:addMod(tpz.mod.STR, 75)
	mob:addMod(tpz.mod.DEX, 30)
	mob:addMod(tpz.mod.AGL, 15)
	mob:addMod(tpz.mod.VIT, 80)
	mob:addMod(tpz.mod.MDEF, 50)
	mob:addMod(tpz.mod.DEF, 1400)
	mob:addMod(tpz.mod.EVA, 130)
	mob:addMod(tpz.mod.ATT, 600)
	mob:addMod(tpz.mod.MATT, 100)
	mob:addMod(tpz.mod.REGEN, 500)
	mob:addMod(tpz.mod.REFRESH, 10)
	mob:addMod(tpz.mod.WIND_ABSORB, 100)
	mob:addMod(tpz.mod.TRIPLE_ATTACK, 7)	
	mob:setLocalVar("DeathProphet", 0)
end

function onMobFight(mob)
    if (mob:getLocalVar("DeathProphet") == 0) then
		mob:setSpellList(459)
	elseif (mob:getLocalVar("DeathProphet") == 1) then
		mob:setSpellList(0)
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
-----------------------------------
-- Area: Lower Delkfutt's Tower
--  Mob: Akvan
-- 17531126 !pos 414 16 -24 184
-- 17531127 !pos 388 -17 121 184
-- 17531128 !pos 505 -33 95 184
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
	mob:addMod(tpz.mod.PARALYZERES, 30) -- Resistance to Paralyze
    mob:addMod(tpz.mod.STUNRES, 25) -- Resistance to Stun
    mob:addMod(tpz.mod.GRAVITYRES, 100) -- Resistance to Gravity
    mob:addMod(tpz.mod.SILENCERES, 70) -- Resistance to Silence
	mob:addMod(tpz.mod.MEVA, 40)
	mob:addMod(tpz.mod.STR, 75)
	mob:addMod(tpz.mod.DEX, 30)
	mob:addMod(tpz.mod.AGL, 35)
	mob:addMod(tpz.mod.VIT, 40)
	mob:addMod(tpz.mod.MDEF, 50)
	mob:addMod(tpz.mod.DEF, 900)
	mob:addMod(tpz.mod.EVA, 50)
	mob:addMod(tpz.mod.ATT, 400)
	mob:addMod(tpz.mod.MATT, 150)
	mob:addMod(tpz.mod.REGEN, 500)
	mob:addMod(tpz.mod.REFRESH, 200)
	mob:addMod(tpz.mod.DARK_ABSORB, 100)
	mob:addMod(tpz.mod.FASTCAST, 50)
	mob:setMobMod(tpz.mobMod.SKILL_LIST, 1179)	
end

function onMobFight(mob, target)
	
end

function onMobDeath(mob, player, isKiller)
	local agathosKills    = player:getCharVar("KillCounter_Agathos")
    local cherufeKills    = player:getCharVar("KillCounter_Cherufe")
    local gojiKills       = player:getCharVar("KillCounter_Goji")
    local gugalannaKills  = player:getCharVar("KillCounter_Gugalanna")
    local taweretKills    = player:getCharVar("KillCounter_Taweret")
    local yatagarasuKills = player:getCharVar("KillCounter_Yatagarasu")

    if agathosKills > 0 and cherufeKills > 0 and gojiKills > 0 and gugalannaKills > 0 and taweretKills > 0 and yatagarasuKills > 0 then
        local playerName   = player:getName()
        local mobName      = mob:getName()
        local fixedMobName = string.gsub(mobName, "_", " ")
        local KillCounter  = player:getCharVar("KillCounter_"..mobName)
        
        KillCounter = KillCounter + 1
        
        player:setCharVar("KillCounter_"..mobName, KillCounter)
        player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", fixedMobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
    elseif agathosKills == 0 or cherufeKills == 0 or gojiKills == 0 or gugalannaKills == 0 or taweretKills == 0 or yatagarasuKills == 0 then
        player:PrintToPlayer(string.format("You are missing previous progression kills and will not receive credit for this kill."), tpz.msg.channel.NS_LINKSHELL3)
        player:PrintToPlayer(string.format("Required kills:"), tpz.msg.channel.NS_LINKSHELL3)
        player:PrintToPlayer(string.format("Agathos: [%i]  Cherufe: [%i]  Goji: [%i]", agathosKills, cherufeKills, gojiKills), tpz.msg.channel.NS_LINKSHELL3)
        player:PrintToPlayer(string.format("Gugalanna: [%i]  Taweret: [%i]  Yatagarasu: [%i]", gugalannaKills, taweretKills, yatagarasuKills), tpz.msg.channel.NS_LINKSHELL3)
    end
end

function onMobDespawn(mob)
	
end
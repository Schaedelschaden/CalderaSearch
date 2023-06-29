-----------------------------------
-- Area: Dangruf's Wadi
--  HNM: Celaeno
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------

function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.MAGIC_COOL, 45)
	mob:addMod(tpz.mod.PARALYZERES, 50)
    mob:addMod(tpz.mod.STUNRES, 40)
    mob:addMod(tpz.mod.BINDRES, 50)
    mob:addMod(tpz.mod.SLOWRES, 50)
    mob:addMod(tpz.mod.SILENCERES, 80)
    mob:addMod(tpz.mod.SLEEPRES, 100)
    mob:addMod(tpz.mod.LULLABYRES, 100)
    mob:addMod(tpz.mod.PETRIFYRES, 80)
    mob:addMod(tpz.mod.POISONRES, 30)
	-- mob:addMod(tpz.mod.ATT, 700)
	mob:addMod(tpz.mod.MATT, 140)
	mob:addMod(tpz.mod.EVA, 150)
	mob:addMod(tpz.mod.DOUBLE_ATTACK, 10)
	mob:addMod(tpz.mod.REGEN, 200)
	mob:addMod(tpz.mod.REFRESH, 50)
end

function onMobFight(mob, target)
	
end

function onMobDespawn(mob)
	
end

function onMobDeath(mob, player, isKiller)
    local kirinKills = player:getCharVar("KillCounter_Kirin")
    local jolKills   = player:getCharVar("KillCounter_JailOfLove")

    if kirinKills > 0 and jolKills > 0 then
        local playerName  = player:getName()
        local mobName     = mob:getName()
        local KillCounter = player:getCharVar("KillCounter_"..mobName)
        
        KillCounter = KillCounter + 1
        
        player:setCharVar("KillCounter_"..mobName, KillCounter)
        player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
    elseif kirinKills == 0 or jolKills == 0 then
        player:PrintToPlayer(string.format("You are missing previous progression kills and will not receive credit for this kill."), tpz.msg.channel.NS_LINKSHELL3)
        player:PrintToPlayer(string.format("Required kills:"), tpz.msg.channel.NS_LINKSHELL3)
        player:PrintToPlayer(string.format("Kirin: [%i]  Jailer of Love: [%i]", kirinKills, jolKills), tpz.msg.channel.NS_LINKSHELL3)
    end
end

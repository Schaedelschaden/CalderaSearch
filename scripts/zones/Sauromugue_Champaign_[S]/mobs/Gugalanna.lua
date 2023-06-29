-----------------------------------
-- Area: Sauromugue Champaign [S]
--  Mob: Gugalanna
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/titles")
-----------------------------------

function onMobInitialize(mob)
end

function onMobSpawn(mob)
	mob:setMod(tpz.mod.SILENCERES, 35)
    mob:setMod(tpz.mod.STUNRES, 100)
    mob:setMod(tpz.mod.BINDRES, 35)
    mob:setMod(tpz.mod.SLOWRES, 50)
	mob:setMod(tpz.mod.PETRIFYRES, 100)
	mob:addMod(tpz.mod.ATT, 200)
	mob:addMod(tpz.mod.MATT, 100)
    mob:addMod(tpz.mod.ACC, 190)
	mob:addMod(tpz.mod.MACC, 100)
    mob:addMod(tpz.mod.EVA, 167)
	mob:addMod(tpz.mod.MACC, 200)
	mob:addMod(tpz.mod.DEF, 600)
	mob:addMod(tpz.mod.VIT, 90)
	mob:addMod(tpz.mod.MDEF, 100)
	mob:setMod(tpz.mod.TRIPLE_ATTACK, 8)
end


function onMobEngaged(mob, target)

end

function onMobFight(mob, target)

end

function onMobDeath(mob, player, isKiller)
	local celaenoKills     = player:getCharVar("KillCounter_Celaeno")
    local hahavaKills      = player:getCharVar("KillCounter_Hahava")
    local voidwroughtKills = player:getCharVar("KillCounter_Voidwrought")

    if celaenoKills > 0 and hahavaKills > 0 and voidwroughtKills > 0 then
        local playerName  = player:getName()
        local mobName     = mob:getName()
        local KillCounter = player:getCharVar("KillCounter_"..mobName)
        
        KillCounter = KillCounter + 1
        
        player:setCharVar("KillCounter_"..mobName, KillCounter)
        player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
    elseif celaenoKills == 0 or hahavaKills == 0 or voidwroughtKills == 0 then
        player:PrintToPlayer(string.format("You are missing previous progression kills and will not receive credit for this kill."), tpz.msg.channel.NS_LINKSHELL3)
        player:PrintToPlayer(string.format("Required kills:"), tpz.msg.channel.NS_LINKSHELL3)
        player:PrintToPlayer(string.format("Celaeno: [%i]  Hahava: [%i]  Voidwrought: [%i]", celaenoKills, hahavaKills, voidwroughtKills), tpz.msg.channel.NS_LINKSHELL3)
    end
end

function onMobDespawn(mob)

end
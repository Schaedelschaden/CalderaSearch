-----------------------------------
-- Area: Batallia Downs [S]
--   NM: Taweret
-----------------------------------
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
end

function onMobSpawn(mob)
	mob:setMod(tpz.mod.SILENCERES, 35)
    mob:setMod(tpz.mod.STUNRES, 100)
    mob:setMod(tpz.mod.BINDRES, 35)
    mob:setMod(tpz.mod.SLOWRES, 50)
	mob:setMod(tpz.mod.PETRIFYRES, 100)
	mob:addMod(tpz.mod.ATT, 400)
	mob:addMod(tpz.mod.MATT, 60)
	mob:addMod(tpz.mod.MACC, 200)
    mob:addMod(tpz.mod.ACC, 190)
	mob:addMod(tpz.mod.MACC, 100)
    mob:addMod(tpz.mod.EVA, 147)
	mob:addMod(tpz.mod.DEF, 600)
	mob:addMod(tpz.mod.VIT, 120)
	-- mob:addMod(tpz.mod.STR, 150)
	mob:addMod(tpz.mod.REGEN, 300)
	-- mob:setMod(tpz.mod.COUNTER, 15)
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
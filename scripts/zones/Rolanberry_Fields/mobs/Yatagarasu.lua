-----------------------------------
-- Area: Rolanberry Fields (110)
--  VWNM: Yatagarasu
-----------------------------------
mixins = {require("scripts/mixins/rage")}
require("scripts/globals/titles")
-----------------------------------

function onMobSpawn(mob)
	mob:setMod(tpz.mod.PARALYZERES, 100) -- Resistance to Silence
    -- mob:setMod(tpz.mod.STUNRES, 20) -- Resistance to Stun
    -- mob:setMod(tpz.mod.BINDRES, 100) -- Resistance to Bind
    -- mob:setMod(tpz.mod.SLOWRES, 100) -- Resistance to Slow
    mob:setMod(tpz.mod.SILENCERES, 100) -- Resistance to Silence
    mob:setMod(tpz.mod.SLEEPRES, 100) -- Resistance to Sleep
    mob:setMod(tpz.mod.LULLABYRES, 100) -- Resistance to Lullaby
    -- mob:setMod(tpz.mod.PETRIFYRES, 100) -- Resistance to Pertrify
    mob:setMod(tpz.mod.POISONRES, 100) -- Resistance to Poison
	mob:addMod(tpz.mod.ATT, 200) -- Attack Stat (Compare to DEF)
	mob:addMod(tpz.mod.MATT, 100) -- Magic Attack (Compare to MDEF)
    mob:addMod(tpz.mod.ACC, 200) -- Accuracy (compare to EVA)
	mob:addMod(tpz.mod.MACC, 100) -- Magic ACC (Compare to MEVA)
	mob:addMod(tpz.mod.EVA, 200) -- Evasion (Compare to ACC)
	mob:addMod(tpz.mod.DEF, 500) -- Defense (Compart to ATT)
	mob:addMod(tpz.mod.MEVA, 170) -- Magic Evasion (Compare to MACC)
	-- mob:addMod(tpz.mod.MDEF, 200) -- Magic Defense (Compare to MATT)
	mob:setMod(tpz.mod.TRIPLE_ATTACK, 10) -- Triple Attack
	mob:setMod(tpz.mod.DMGPHYS, -30) -- PDT
	mob:setLocalVar("[rage]timer", 1800) -- 30 minutes
end

function onMobengaged (mob)
end

function onMobDeath(mob, player, isKiller)
    local playerName = player:getName()
	local mobName = mob:getName()
	local KillCounter = player:getCharVar("KillCounter_"..mobName)
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_"..mobName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
end

function onMobDespawn(mob)
   
end
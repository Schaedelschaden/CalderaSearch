-----------------------------------
-- Area: Valley of Sorrows
--  HNM: Aspidochelone
-- MobID: 17301538
-----------------------------------
local ID = require("scripts/zones/Valley_of_Sorrows/IDs")
mixins = {require("scripts/mixins/rage")}
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------

function onMobSpawn(mob)
    -- if LandKingSystem_NQ > 0 or LandKingSystem_HQ > 0 then
        -- GetNPCByID(ID.npc.ADAMANTOISE_QM):setStatus(tpz.status.DISAPPEAR)
    -- end

	mob:setLocalVar("[rage]timer", 1200) -- 20 minutes	
	mob:addMod(tpz.mod.PARALYZERES, 30) -- Resistance to Silence
    mob:addMod(tpz.mod.STUNRES, 100) -- Resistance to Stun
    mob:addMod(tpz.mod.BINDRES, 100) -- Resistance to Bind
    mob:addMod(tpz.mod.SLOWRES, 30) -- Resistance to Slow
    mob:addMod(tpz.mod.SILENCERES, 100) -- Resistance to Silence
    mob:addMod(tpz.mod.SLEEPRES, 30) -- Resistance to Sleep
    mob:addMod(tpz.mod.LULLABYRES, 30) -- Resistance to Lullaby
    mob:addMod(tpz.mod.PETRIFYRES, 30) -- Resistance to Pertrify
    mob:addMod(tpz.mod.POISONRES, 30) -- Resistance to Poison	
	-- mob:addMod(tpz.mod.ATT, 700)	
	mob:addMod(tpz.mod.DEF, 1000)
	mob:addMod(tpz.mod.EVA, 80)
	mob:addMod(tpz.mod.MATT, 15)
	-- mob:addMod(tpz.mod.MACC, 100)
	mob:addMod(tpz.mod.REGEN, 300)
	mob:addMod(tpz.mod.REFRESH, 50)
	mob:addMod(tpz.mod.REGAIN, 20)
	mob:addMod(tpz.mod.DOUBLE_ATTACK, 30)
	mob:addMod(tpz.mod.DMGPHYS, -30)	
	mob:addMod(tpz.mod.FASTCAST, 30)
	
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.ASPIDOCHELONE_SINKER)
	
	local playerName = player:getName()
	local mobName = mob:getName()
	local KillCounter = player:getCharVar("KillCounter_"..mobName)
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_"..mobName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
end

function onMobDespawn(mob)
    -- -- Set Aspidochelone's Window Open Time
    -- if LandKingSystem_HQ ~= 1 then
        -- local wait = 21.5 * 3600
        -- SetServerVariable("[POP]Aspidochelone", os.time() + wait) -- 3 days
        -- if LandKingSystem_HQ == 0 then -- Is time spawn only
            -- DisallowRespawn(mob:getID(), true)
        -- end
    -- end

    -- -- Set Adamantoise's spawnpoint and respawn time (21-24 hours)
    -- if LandKingSystem_NQ ~= 1 then
        -- SetServerVariable("[PH]Aspidochelone", 0)
        -- DisallowRespawn(ID.mob.ADAMANTOISE, false)
        -- UpdateNMSpawnPoint(ID.mob.ADAMANTOISE)
        -- GetMobByID(ID.mob.ADAMANTOISE):setRespawnTime(28800 + math.random(0, 8) * 1800) -- 8-12 hours with half hour windows
    -- end
end
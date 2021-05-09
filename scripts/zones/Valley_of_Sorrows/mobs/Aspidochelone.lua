-----------------------------------
-- Area: Valley of Sorrows
--  HNM: Aspidochelone
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

    mob:setLocalVar("[rage]timer", 3600) -- 60 minutes
	
	mob:addMod(tpz.mod.DEF, 700)
	mob:addMod(tpz.mod.EVA, 800)
	mob:addMod(tpz.mod.MACC, 900)
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.ASPIDOCHELONE_SINKER)
end

function onMobDespawn(mob)
    -- Set Aspidochelone's Window Open Time
    if LandKingSystem_HQ ~= 1 then
        local wait = 72 * 3600
        SetServerVariable("[POP]Aspidochelone", os.time() + wait) -- 3 days
        if LandKingSystem_HQ == 0 then -- Is time spawn only
            DisallowRespawn(mob:getID(), true)
        end
    end

    -- Set Adamantoise's spawnpoint and respawn time (21-24 hours)
    if LandKingSystem_NQ ~= 1 then
        SetServerVariable("[PH]Aspidochelone", 0)
        DisallowRespawn(ID.mob.ADAMANTOISE, false)
        UpdateNMSpawnPoint(ID.mob.ADAMANTOISE)
        GetMobByID(ID.mob.ADAMANTOISE):setRespawnTime(28800 + math.random(0, 8) * 1800) -- 8-12 hours with half hour windows
    end
end
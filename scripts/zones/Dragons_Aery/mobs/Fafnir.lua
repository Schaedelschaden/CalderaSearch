-----------------------------------
-- Area: Dragons Aery
--  HNM: Fafnir
-----------------------------------
local ID = require("scripts/zones/Dragons_Aery/IDs")
mixins = {require("scripts/mixins/rage")}
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------

function onMobSpawn(mob)
    -- if LandKingSystem_NQ > 0 or LandKingSystem_HQ > 0 then
        -- GetNPCByID(ID.npc.FAFNIR_QM):setStatus(tpz.status.DISAPPEAR)
    -- end
    if LandKingSystem_HQ == 0 then
        SetDropRate(918, 3340, 0) -- do not drop cup_of_sweet_tea
    end

    mob:setLocalVar("[rage]timer", 1200) -- 20 minutes
	
	mob:addMod(tpz.mod.DEF, 600)
	mob:addMod(tpz.mod.EVA, 400)
	mob:addMod(tpz.mod.MACC, 800)
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.FAFNIR_SLAYER)
	
	local playerName = player:getName()
	local mobName = mob:getName()
	local KillCounter = player:getCharVar("KillCounter_"..mobName)
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_"..mobName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
end

function onMobDespawn(mob)
    local ToD = GetServerVariable("[POP]Nidhogg")
    local kills = GetServerVariable("[PH]Nidhogg")
    local popNow = (math.random(1, 5) == 3 or kills > 6)

    if LandKingSystem_HQ ~= 1 and ToD <= os.time() and popNow then
        -- 0 = timed spawn, 1 = force pop only, 2 = BOTH
        if LandKingSystem_NQ == 0 then
            DisallowRespawn(ID.mob.FAFNIR, true)
        end

        DisallowRespawn(ID.mob.NIDHOGG, false)
        UpdateNMSpawnPoint(ID.mob.NIDHOGG)
        GetMobByID(ID.mob.NIDHOGG):setRespawnTime(28800 + math.random(0, 8) * 1800) -- 8-12 hours with half hour windows
    else
        if LandKingSystem_NQ ~= 1 then
            UpdateNMSpawnPoint(ID.mob.FAFNIR)
            GetMobByID(ID.mob.FAFNIR):setRespawnTime(28800 + math.random(0, 8) * 1800) -- 8-12 hours with half hour windows
            SetServerVariable("[PH]Nidhogg", kills + 1)
        end
    end
end
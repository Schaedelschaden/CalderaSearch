-----------------------------------
-- Area: The Shrine of Ru'Avitau
--  Mob: Olla Pequena
-- Force spawned using Ro'Maeve Water (ID: 1195)
-----------------------------------
local ID = require("scripts/zones/The_Shrine_of_RuAvitau/IDs")
require("scripts/globals/settings")

function onMobSpawn(mob)
	mob:setMod(tpz.mod.REFRESH, 10)
	mob:setMod(tpz.mod.REGAIN, 300)
end

function onMobDeath(mob, player, isKiller)
    if (isKiller) then
        SpawnMob(mob:getID() + 1):updateClaim(player)
    end
end

function onMobDespawn(mob)
    if (not GetMobByID(mob:getID() + 1):isSpawned()) then -- if this Pequena despawns and Media is not alive, it would be because it despawned outside of being killed.
        GetNPCByID(ID.npc.OLLAS_QM):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME)
    end
end
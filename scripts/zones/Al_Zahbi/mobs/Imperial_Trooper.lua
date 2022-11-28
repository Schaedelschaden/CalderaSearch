-----------------------------------
-- Area: Al Zahbi
--   NM: Imperial Trooper
-----------------------------------
-- Requires are other scripts that this LUA will reference to satisfy values
local ID = require("scripts/zones/Al_Zahbi/IDs")
require("scripts/globals/status") -- required for LUA status adjustments
-----------------------------------

local npcID = ID.npc.RUGHADJEEN

function onMobSpawn(mob) -- When mob spawns (either forced or time)
end

function onMobRoam(mob)
    tpz.besieged.onMobRoamCaldera(mob, npcID)
end

function onMobEngaged(mob, target) -- When mob aggro's
end

function onMobFight(mob, target) -- When mob is engaged
end

function onMobDespawn(mob)
    tpz.besieged.onMobDespawnCaldera(mob, npcID)
end

function onMobDeath(mob, player, isKiller) -- When mob is killed
    tpz.besieged.onMobDeathCaldera(mob, player, isKiller, npcID)
end

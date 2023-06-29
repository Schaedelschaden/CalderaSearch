-----------------------------------
--  Mob: Sewer Slime
-----------------------------------
local ID = require("scripts/zones/Bostaunieux_Oubliette/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)

end

function onAdditionalEffect(mob, target, damage)

end

function onMobDeath(mob, player, isKiller)
    player:setCharVar("MonberauxLvl", 2)
end

function onMobDespawn(mob)

end

-----------------------------------
-- Area: Labyrinth of Onzozo
--  Mob: Flying Manta
-- Note: PH for Lord of Onzozo and Peg Powler
-----------------------------------
local ID = require("scripts/zones/Labyrinth_of_Onzozo/IDs")
require("scripts/globals/regimes")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 774, 1, tpz.regime.type.GROUNDS)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.LORD_OF_ONZOZO_PH, 4, math.random(14400, 28800)) -- 4 to 8 hours
    tpz.mob.phOnDespawn(mob, ID.mob.PEG_POWLER_PH, 4, math.random(7200, 57600)) -- 2 to 16 hours
end
-----------------------------------
-- Area: Apollyon SE
--  Mob: Sirin
-----------------------------------
require("scripts/globals/pathfind")
local ID = require("scripts/zones/Apollyon/IDs")


function onMobSpawn(mob)
    mob:setMod(tpz.mod.SLASHRES, 750)
    mob:setMod(tpz.mod.PIERCERES, 1250)
	mob:addMod(tpz.mod.EVA, 200) -- Evasion (Compare to ACC)
	mob:addMod(tpz.mod.DEF, 400) -- Defense (Compart to ATT)
	mob:addMod(tpz.mod.BINDRES, 100) -- Resistance to Bind
	mob:addMod(tpz.mod.SLEEPRES, 100)
end

function onMobDeath(mob, player, isKiller, noKiller)

end

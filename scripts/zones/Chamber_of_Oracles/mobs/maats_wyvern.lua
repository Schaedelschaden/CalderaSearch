-----------------------------------
--  Mob: Maats Wyvern
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobLevel(119)
    mob:setMod(tpz.mod.UDMGPHYS, -95)
    mob:setMod(tpz.mod.UDMGBREATH, -95)
    mob:setMod(tpz.mod.UDMGMAGIC, -95)
    mob:setMod(tpz.mod.UDMGRANGE, -95)

end

function onMobDeath(mob, player, isKiller)
    
end

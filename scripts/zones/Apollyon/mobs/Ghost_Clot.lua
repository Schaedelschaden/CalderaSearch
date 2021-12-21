-----------------------------------
-- Area: Apollyon SE
--  Mob: Ghost Clot
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Apollyon/IDs")

function onMobSpawn(mob)
    mob:setMod(tpz.mod.SLASHRES, 1500)
    mob:setMod(tpz.mod.HTHRES, 0)
    mob:setMod(tpz.mod.IMPACTRES, 0)
    mob:addMod(tpz.mod.BINDRES, 100) -- Resistance to Bind
	mob:addMod(tpz.mod.STR, 180) -- Attack Stat (Compare to DEF)
	mob:addMod(tpz.mod.INT, 50) -- Attack Stat (Compare to DEF)
	mob:addMod(tpz.mod.MATT, 100) -- Magic Attack (Compare to MDEF)
    mob:addMod(tpz.mod.ACC, 160) -- Accuracy (compare to EVA)
	mob:addMod(tpz.mod.MACC, 100) -- Magic ACC (Compare to MEVA)
	mob:addMod(tpz.mod.EVA, 200) -- Evasion (Compare to ACC)
	mob:addMod(tpz.mod.DEF, 400) -- Defense (Compart to ATT)
	mob:addMod(tpz.mod.MEVA, 100) -- Magic Evasion (Compare to MACC)
	mob:addMod(tpz.mod.MDEF, 150) -- Magic Defense (Compare to MATT)
end

function onMobDeath(mob, player, isKiller, noKiller)
    if isKiller or noKiller then
        tpz.limbus.handleDoors(player:getBattlefield(), true, ID.npc.APOLLYON_SE_PORTAL[1])
    end
end
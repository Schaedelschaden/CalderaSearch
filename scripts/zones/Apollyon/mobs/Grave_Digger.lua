-----------------------------------
-- Area: Apollyon SE
--  Mob: Grave Digger
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Apollyon/IDs")

function onMobSpawn(mob)
    mob:setMod(tpz.mod.HTHRES, 1500)
    mob:setMod(tpz.mod.IMPACTRES, 1500)
    mob:setMod(tpz.mod.PIERCERES, 0)
	mob:addMod(tpz.mod.BINDRES, 100) -- Resistance to Bind
	mob:addMod(tpz.mod.ATT, 100) -- Attack Stat (Compare to DEF)
	mob:addMod(tpz.mod.MATT, 100) -- Magic Attack (Compare to MDEF)
    mob:addMod(tpz.mod.ACC, 160) -- Accuracy (compare to EVA)
	mob:addMod(tpz.mod.MACC, 100) -- Magic ACC (Compare to MEVA)
	mob:addMod(tpz.mod.EVA, 160) -- Evasion (Compare to ACC)
	mob:addMod(tpz.mod.DEF, 400) -- Defense (Compart to ATT)
	mob:addMod(tpz.mod.MEVA, 600) -- Magic Evasion (Compare to MACC)
	mob:addMod(tpz.mod.MDEF, 75) -- Magic Defense (Compare to MATT)
	mob:addMod(tpz.mod.FASTCAST, 50)
end

function onMobDeath(mob, player, isKiller, noKiller, noKiller)
    if isKiller or noKiller then
        tpz.limbus.handleDoors(mob:getBattlefield(), true, ID.npc.APOLLYON_SE_PORTAL[3])
    end
end
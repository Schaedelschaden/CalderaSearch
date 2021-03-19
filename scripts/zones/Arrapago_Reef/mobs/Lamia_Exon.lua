-----------------------------------
-- Area: Arrapago Reef
--  Mob: Lamia Exon
-----------------------------------
local ID = require("scripts/zones/Arrapago_Reef/IDs")
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/titles")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)

	mob:setMod(tpz.mod.ATT, 900)
	mob:setMod(tpz.mod.MATT, 250)
    mob:setMod(tpz.mod.ACC, 500)
	mob:setMod(tpz.mod.RACC, 500)
	mob:setMod(tpz.mod.MACC, 500)
    mob:setMod(tpz.mod.EVA, 100)
	mob:setMod(tpz.mod.DEF, 500)
	mob:setMod(tpz.mod.MEVA, 100)
	mob:setMod(tpz.mod.MDEF, 100)
	mob:setMod(tpz.mod.DOUBLE_ATTACK, 30)
	mob:setMod(tpz.mod.TRIPLE_SHOT_RATE, 25)
end

function onMobDeath(mob, player, isKiller)
end

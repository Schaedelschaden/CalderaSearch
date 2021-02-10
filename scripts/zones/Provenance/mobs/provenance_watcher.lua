-----------------------------------
-- Area: Provenance
--   NM: Provenance Watcher
-----------------------------------
local ID = require("scripts/zones/Provenance/IDs")
-- mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/titles")
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize( mob )
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 180)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobSpawn(mob)
	mob:setMod(tpz.mod.WINDRES, -64)
    mob:setMod(tpz.mod.SILENCERES, 35)
    mob:setMod(tpz.mod.STUNRES, 35)
    mob:setMod(tpz.mod.BINDRES, 35)
    mob:setMod(tpz.mod.GRAVITYRES, 35)
    mob:setMod(tpz.mod.HPP, 300)
	mob:setMod(tpz.mod.DMGPHYS, -99)
	mob:setMod(tpz.mod.DMGRANGE, -99)
	mob:setMod(tpz.mod.DMGMAGIC, -99)
	mob:addMod(tpz.mod.ACC, 300)
	mob:addMod(tpz.mod.MACC, 300)
	mob:addMod(tpz.mod.MEVA, 500)
	mob:addMod(tpz.mod.MDEF, 15)
	mob:addMod(tpz.mod.EARTHATT, 500)
	mob:addMod(tpz.mod.EARTHACC, 1000)
	mob:addMod(tpz.mod.MATT, 500)
	mob:addStatusEffect(tpz.effect.REGEN, 500, 3, 0)
	
	mob:setHP(999999999)
end

function onMobFight( mob, target )

end

function onAdditionalEffect(mob, target, damage)

end

function onMobDeath(mob, player, isKiller)

end

function onMobDespawn( mob )

end
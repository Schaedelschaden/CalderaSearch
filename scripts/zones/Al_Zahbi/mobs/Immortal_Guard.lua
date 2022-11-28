-----------------------------------
-- Area: Al Zahbi
--   NM: General Gadalar
-----------------------------------
-- Requires are other scripts that this LUA will reference to satisfy values
local ID = require("scripts/zones/Al_Zahbi/IDs")
mixins = {require("scripts/mixins/job_special")} -- Required for inherant job traits
require("scripts/globals/status") -- required for LUA status adjustments
-----------------------------------

local npcID = ID.npc.RUGHADJEEN

function onMobSpawn(mob) -- When mob spawns (either forced or time)
	mob:addMod(tpz.mod.PARALYZERES, 30) -- Resistance to Silence
    mob:addMod(tpz.mod.STUNRES, 30) -- Resistance to Stun
    mob:addMod(tpz.mod.BINDRES, 30) -- Resistance to Bind
    mob:addMod(tpz.mod.SLOWRES, 30) -- Resistance to Slow
    mob:addMod(tpz.mod.SILENCERES, 100) -- Resistance to Silence
    mob:addMod(tpz.mod.SLEEPRES, 100) -- Resistance to Sleep
    mob:addMod(tpz.mod.LULLABYRES, 100) -- Resistance to Lullaby
    mob:addMod(tpz.mod.PETRIFYRES, 100) -- Resistance to Pertrify
    mob:addMod(tpz.mod.POISONRES, 30) -- Resistance to Poison
	mob:addMod(tpz.mod.ATT, 500) -- Attack Stat (Compare to DEF)
	mob:addMod(tpz.mod.MATT, 100) -- Magic Attack (Compare to MDEF)
    mob:addMod(tpz.mod.ACC, 100) -- Accuracy (compare to EVA)
	mob:addMod(tpz.mod.MACC, 100) -- Magic ACC (Compare to MEVA)
	mob:addMod(tpz.mod.EVA, 100) -- Evasion (Compare to ACC)
	mob:addMod(tpz.mod.MEVA, 100) -- Magic Evasion (Compare to MACC)
	mob:addMod(tpz.mod.MDEF, 50) -- Magic Defense (Compare to MATT)
	mob:addMod(tpz.mod.TRIPLE_ATTACK, 3)
	mob:addMod(tpz.mod.STR, 80)
	mob:addMod(tpz.mod.DEX, 80)
	mob:addMod(tpz.mod.VIT, 80)
	mob:addMod(tpz.mod.AGI, 80)
	mob:addMod(tpz.mod.MND, 80)
	mob:addMod(tpz.mod.INT, 80)
	mob:addMod(tpz.mod.CHR, 80)
	mob:setLocalVar("GeneralSC", 0)
	mob:setLocalVar("GeneralSCTime", 0)
end

function onMobRoam(mob)
    tpz.besieged.onMobRoamCaldera(mob, npcID)
end

function onMobEngaged(Mob, Target) -- When mob aggro's
end

function onMobFight(mob, target) -- When mob is engaged
	if mob:getLocalVar("GeneralSC") == 1 and os.time() - mob:getLocalVar("GeneralSC") > 3 then -- 3 second duration
		mob:setLocalVar("GeneralSC", 0)
	end
end

function onMobDespawn(mob)
    tpz.besieged.onMobDespawnCaldera(mob, npcID)
end

function onMobDeath(mob, player, isKiller) -- When mob is killed
    tpz.besieged.onMobDeathCaldera(mob, player, isKiller, npcID)
end

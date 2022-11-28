-----------------------------------
-- Area: Al Zahbi
--   NM: Scalding Fafool Ja
-----------------------------------
-- Requires are other scripts that this LUA will reference to satisfy values
local ID = require("scripts/zones/Al_Zahbi/IDs")
mixins = {require("scripts/mixins/job_special")} -- Required for inherant job traits
require("scripts/globals/status") -- required for LUA status adjustments
-----------------------------------

local npcID = ID.npc.GADALAR

function onMobSpawn(mob) -- When mob spawns (either forced or time)
    -- tpz.mix.jobSpecial.config(mob, {
        -- specials =
        -- {
            -- {id = 689, hpp = 75}, -- uses specified mob skill at HP%
        -- },
    -- })
	-- mob:addMod(tpz.mod.PARALYZERES, 30) -- Resistance to Silence
    -- mob:addMod(tpz.mod.STUNRES, 30) -- Resistance to Stun
    -- mob:addMod(tpz.mod.BINDRES, 30) -- Resistance to Bind
    -- mob:addMod(tpz.mod.SLOWRES, 30) -- Resistance to Slow
    -- mob:addMod(tpz.mod.SILENCERES, 100) -- Resistance to Silence
    -- mob:addMod(tpz.mod.SLEEPRES, 100) -- Resistance to Sleep
    -- mob:addMod(tpz.mod.LULLABYRES, 100) -- Resistance to Lullaby
    -- mob:addMod(tpz.mod.PETRIFYRES, 100) -- Resistance to Pertrify
    -- mob:addMod(tpz.mod.POISONRES, 30) -- Resistance to Poison
	-- mob:addMod(tpz.mod.ATT, 500) -- Attack Stat (Compare to DEF)
	-- mob:addMod(tpz.mod.MATT, 100) -- Magic Attack (Compare to MDEF)
    -- mob:addMod(tpz.mod.ACC, 100) -- Accuracy (compare to EVA)
	-- mob:addMod(tpz.mod.MACC, 100) -- Magic ACC (Compare to MEVA)
	-- mob:addMod(tpz.mod.EVA, 100) -- Evasion (Compare to ACC)
	-- mob:addMod(tpz.mod.DEF, 100) -- Defense (Compart to ATT)
	-- mob:addMod(tpz.mod.MEVA, 100) -- Magic Evasion (Compare to MACC)
	-- mob:addMod(tpz.mod.MDEF, 50) -- Magic Defense (Compare to MATT)
	-- mob:addMod(tpz.mod.QUADRUPLE_ATTACK, 8)
	-- mob:addMod(tpz.mod.STR, 120)
	-- mob:addMod(tpz.mod.DEX, 120)
	-- mob:addMod(tpz.mod.VIT, 120)
	-- mob:addMod(tpz.mod.AGI, 120)
	-- mob:addMod(tpz.mod.MND, 120)
	-- mob:addMod(tpz.mod.INT, 120)
	-- mob:addMod(tpz.mod.CHR, 120)
end

function onMobRoam(mob)
    tpz.besieged.onMobRoamCaldera(mob, npcID)
end

function onMobEngaged(mob, target) -- When mob aggro's
end

function onMobFight(mob, target) -- When mob is engaged
    local startNPC = GetNPCByID(npcID)
	local buddy1   = GetMobByID(ID.mob.SAGELORD_MOLAAL_JA)
	local buddy2   = GetMobByID(ID.mob.PANURGIC_RYUBOOL_JA)

	if (buddy1:isAlive() and buddy2:isAlive()) and os.time() > mob:getLocalVar("BuddyCheck") then
        mob:setLocalVar("BuddyCheck", os.time() + 3)
	elseif buddy1:isAlive() or buddy2:isAlive() and os.time() > mob:getLocalVar("BuddyCheck") then
        mob:setLocalVar("BuddyCheck", os.time() + 3)
	elseif (buddy1:isDead() and buddy2:isDead()) and os.time() > mob:getLocalVar("BuddyCheck") then
        mob:setLocalVar("BuddyCheck", startNPC:getLocalVar("Besieged_End_Time"))
	end
end

function onMobDespawn(mob)
    tpz.besieged.onMobDespawnCaldera(mob, npcID)
end

function onMobDeath(mob, player, isKiller) -- When mob is killed
    tpz.besieged.onMobDeathCaldera(mob, player, isKiller, npcID)
end

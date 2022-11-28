-----------------------------------
-- Area: Al Zahbi
--   NM: Lamia No 2
-----------------------------------
-- Requires are other scripts that this LUA will reference to satisfy values
local ID = require("scripts/zones/Al_Zahbi/IDs")
require("scripts/globals/status") -- required for LUA status adjustments
-----------------------------------

local npcID = ID.npc.MIHLI_ALIAPOH

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
    mob:addMod(tpz.mod.RATT, 500) -- Accuracy (compare to EVA)
	mob:addMod(tpz.mod.MACC, 100) -- Magic ACC (Compare to MEVA)
	mob:addMod(tpz.mod.STR, 95)
	mob:addMod(tpz.mod.DEX, 95)
	mob:addMod(tpz.mod.VIT, 95)
	mob:addMod(tpz.mod.AGI, 95)
	mob:addMod(tpz.mod.MND, 95)
	mob:addMod(tpz.mod.INT, 95)
	mob:addMod(tpz.mod.CHR, 95)
end

function onMobRoam(mob)
    tpz.besieged.onMobRoamCaldera(mob, npcID)
end

function onMobEngaged(mob, target) -- When mob aggro's
end

function onMobFight(mob, target) -- When mob is engaged
    local startNPC = GetNPCByID(npcID)
	local buddy1   = GetMobByID(ID.mob.LAMIA_NO_9)
	local buddy2   = GetMobByID(ID.mob.LAMIA_NO_15)

	if (buddy1:isAlive() and buddy2:isAlive()) and os.time() > mob:getLocalVar("BuddyCheck") then
        -- printf("Lamia_No2.lua onMobFight  BOTH ALIVE")
		mob:setMod(tpz.mod.MEVA, 1100)
		mob:setMod(tpz.mod.DEF, 2400)
		mob:setMod(tpz.mod.REGEN, 1000)
        mob:setLocalVar("BuddyCheck", os.time() + 3)
	elseif (buddy1:isAlive() or buddy2:isAlive()) and os.time() > mob:getLocalVar("BuddyCheck") then
        -- printf("Lamia_No2.lua onMobFight  EITHER ALIVE")
		mob:setMod(tpz.mod.MEVA, 1000)
		mob:setMod(tpz.mod.DEF, 1900)
		mob:setMod(tpz.mod.REGEN, 500)
        mob:setLocalVar("BuddyCheck", os.time() + 3)
	elseif (buddy1:isDead() and buddy2:isDead()) and os.time() > mob:getLocalVar("BuddyCheck") then
        -- printf("Lamia_No2.lua onMobFight  NONE ALIVE")
		mob:setMod(tpz.mod.MEVA, 890)
		mob:setMod(tpz.mod.DEF, 1400)
		mob:setMod(tpz.mod.REGEN, 250)
        mob:setLocalVar("BuddyCheck", startNPC:getLocalVar("Besieged_End_Time"))
	end
end

function onMobDespawn(mob)
    tpz.besieged.onMobDespawnCaldera(mob, npcID)
end

function onMobDeath(mob, player, isKiller) -- When mob is killed
    tpz.besieged.onMobDeathCaldera(mob, player, isKiller, npcID)
end

-----------------------------------
-- Area: Al Zahbi
-- NM: General Rughadjeen
-- ID: 16974135
-----------------------------------
-- Requires are other scripts that this LUA will reference to satisfy values
local ID = require("scripts/zones/Al_Zahbi/IDs")
mixins = {require("scripts/mixins/job_special")} -- Required for inherant job traits
require("scripts/globals/status") -- required for LUA status adjustments
-----------------------------------

local npcID    = ID.npc.RUGHADJEEN
local startNPC = GetNPCByID(npcID)

function onMobSpawn(mob) -- When mob spawns (either forced or time)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = 694, hpp = 25}, -- uses specified mob skill at HP%
        },
    })
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
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
	mob:addMod(tpz.mod.TRIPLE_ATTACK, 16)
	mob:addMod(tpz.mod.STR, 120)
	mob:addMod(tpz.mod.DEX, 120)
	mob:addMod(tpz.mod.VIT, 120)
	mob:addMod(tpz.mod.AGI, 120)
	mob:addMod(tpz.mod.MND, 120)
	mob:addMod(tpz.mod.INT, 120)
	mob:addMod(tpz.mod.CHR, 120)
    mob:addMod(tpz.mod.MAIN_DMG_RATING, 75)
    -- mob:addMod(tpz.mod.SKILLCHAINDMG, 100)
    mob:addMod(tpz.mod.ALL_WSDMG_ALL_HITS, -25)

    mob:addListener("WEAPONSKILL_STATE_EXIT", "WEAPONSKILL_FINISHED", function(mobArg, skillid)
        if mobArg:getLocalVar("ALLOW_SKILLCHAIN") == 0 then
            mobArg:setLocalVar("ALLOW_SKILLCHAIN", 1)

            mobArg:timer(2500, function(mobTimerArg1)
                mobTimerArg1:setTP(3000)

                mobArg:timer(5000, function(mobTimerArg2)
                    mobTimerArg2:setLocalVar("ALLOW_SKILLCHAIN", 0)
                end)
            end)
        end
    end)

    tpz.besieged.setMobDropsCaldera(mob, npcID)
end

function onMobRoam(mob)
    tpz.besieged.onMobRoamCaldera(mob, npcID)
end

function onMobEngaged(mob, target) -- When mob aggro's
end

function onAdditionalEffect(mob, target, damage)
    local dmg = 300

    if GetMobByID(ID.mob.IMMORTAL_GUARD_RUGHA_1):isAlive() and GetMobByID(ID.mob.IMMORTAL_GUARD_RUGHA_2):isAlive() then
        dmg = 600
    elseif GetMobByID(ID.mob.IMMORTAL_GUARD_RUGHA_1):isAlive() or GetMobByID(ID.mob.IMMORTAL_GUARD_RUGHA_2):isAlive() then
        dmg = 450
    end

    return tpz.mob.onAddEffect(mob, target, dmg, tpz.mob.ae.ENFIRE)
end

function onMobFight(mob, target) -- When mob is engaged
    if mob:getLocalVar("DERP") == 0 then
        mob:setLocalVar("DERP", 1)

        mob:addListener("WEAPONSKILL_STATE_EXIT", "WEAPONSKILL_FINISHED", function(mobArg, skillid)
            if mobArg:getLocalVar("ALLOW_SKILLCHAIN") == 0 then
                mobArg:setLocalVar("ALLOW_SKILLCHAIN", 1)

                mobArg:timer(2500, function(mobTimerArg1)
                    mobTimerArg1:setTP(3000)

                    mobArg:timer(5000, function(mobTimerArg2)
                        mobTimerArg2:setLocalVar("ALLOW_SKILLCHAIN", 0)
                    end)
                end)
            end
        end)
    end
    
    local buddy1   = GetMobByID(ID.mob.IMMORTAL_GUARD_RUGHA_1)
	local buddy2   = GetMobByID(ID.mob.IMMORTAL_GUARD_RUGHA_2)

    if os.time() > mob:getLocalVar("MOB_FIGHT_DELAY") then
        if mob:getTP() > 1000 then -- and buddy1:getLocalVar("GeneralSC") == 1 or buddy2:getLocalVar("GeneralSC") == 1 then
            local rnd = math.random()
        
            if rnd < 0.5 then
                mob:useMobAbility(2088) -- Victory Beacon
            else
                mob:useMobAbility(981) -- Ground Strike
            end
        end

        if (buddy1:isAlive() and buddy2:isAlive()) and os.time() > mob:getLocalVar("BuddyCheck") then
            mob:setMod(tpz.mod.DMG, 60)
            mob:setMod(tpz.mod.DEF, 2500)
            mob:setMod(tpz.mod.REGEN, 1250)
            mob:setLocalVar("BuddyCheck", os.time() + 3)
        elseif (buddy1:isAlive() or buddy2:isAlive()) and os.time() > mob:getLocalVar("BuddyCheck") then
            mob:setMod(tpz.mod.DMG, 40)
            mob:setMod(tpz.mod.DEF, 2150)
            mob:setMod(tpz.mod.REGEN, 750)
            mob:setLocalVar("BuddyCheck", os.time() + 3)
        elseif (buddy1:isDead() and buddy2:isDead()) and os.time() > mob:getLocalVar("BuddyCheck") then
            mob:setMod(tpz.mod.DMG, 20)
            mob:setMod(tpz.mod.DEF, 1900)
            mob:setMod(tpz.mod.REGEN, 250)
            mob:setLocalVar("BuddyCheck", startNPC:getLocalVar("Besieged_End_Time"))
        end

        mob:setLocalVar("MOB_FIGHT_DELAY", os.time() + 3)
    end
end

function onMobDespawn(mob)
    tpz.besieged.onMobDespawnCaldera(mob, npcID)
end

function onMobDeath(mob, player, isKiller) -- When mob is killed
    mob:removeListener("WEAPONSKILL_FINISHED")
    tpz.besieged.onMobDeathCaldera(mob, player, isKiller, npcID)
end

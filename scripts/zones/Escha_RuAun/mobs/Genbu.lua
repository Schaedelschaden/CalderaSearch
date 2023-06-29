-----------------------------------
-- Area: Ru'Aun Gardens
--   NM: Genbu
-- ???'s located at:
-- !pos 107 -40 -432  (Portal 1 - Main island)
-- !pos -291 -42 -401 (Portal 2 - SW AA island)
-- !pos -471 42 153   (Portal 5 - NW AA island)
-----------------------------------
local ID = require("scripts/zones/RuAun_Gardens/IDs")
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/mobs")
require("scripts/globals/keyitems")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobSpawn(mob)
    mob:setLocalVar("BLOCK_HPMP_CHANGE_ON_LEVEL", 1)
    mob:setMobLevel(141)
    mob:addMod(tpz.mod.PARALYZERES, 30)
    mob:addMod(tpz.mod.STUNRES, 30)
    mob:addMod(tpz.mod.BINDRES, 30)
    mob:addMod(tpz.mod.SLOWRES, 30)
    mob:addMod(tpz.mod.SILENCERES, 30)
    mob:addMod(tpz.mod.SLEEPRES, 30)
    mob:addMod(tpz.mod.LULLABYRES, 30)
    mob:addMod(tpz.mod.PETRIFYRES, 30)
    mob:addMod(tpz.mod.POISONRES, 30)
	mob:addMod(tpz.mod.ATT, 350)
    mob:addMod(tpz.mod.MATT, 200)
	mob:addMod(tpz.mod.EVA, 75)
	mob:addMod(tpz.mod.DEF, 575)
	mob:addMod(tpz.mod.MEVA, 200)
	mob:addMod(tpz.mod.MDEF, 50)
	mob:addMod(tpz.mod.STR, 110)
    mob:addMod(tpz.mod.DEX, 110)
    mob:addMod(tpz.mod.AGI, 110)
    mob:addMod(tpz.mod.VIT, 160)
    mob:addMod(tpz.mod.MND, 110)
    mob:addMod(tpz.mod.CHR, 110)
    mob:addMod(tpz.mod.INT, 110)
    mob:setMod(tpz.mod.WATER_ABSORB, 100)
    mob:setLocalVar("INVIN_DELAY", os.time() + 30)

    mob:addListener("SKILLCHAIN_TAKE", "SKILLCHAIN_TAKEN", function(defender, attacker, element, chainLevel, chainCount) -- , resistance, damage)
        if
            defender:getMainLvl() > 130 and
            (element == 13 or element == 15)
        then
            defender:timer(5000, function(mobArg)
                mobArg:setMobLevel(mobArg:getMainLvl() - 1)
                mobArg:injectActionPacket(4, 509)
            end)
        end
    end)

    mob:addListener("WEAPONSKILL_STATE_EXIT", "MOBSKILL_USED", function(mobArg, skillID)
        if skillID == 694 and mobArg:getMainLvl() < 160 then -- Invincible
            mobArg:setMobLevel(mobArg:getMainLvl() + 1)
            mobArg:injectActionPacket(4, 510)
        end
    end)

end

function onMobFight(mob, target)
    local isBusy = false
    local act    = mob:getCurrentAction()

    if
        act == tpz.act.MOBABILITY_START or
        act == tpz.act.MOBABILITY_USING or
        act == tpz.act.MOBABILITY_FINISH or
        act == tpz.act.MAGIC_START or
        act == tpz.act.MAGIC_CASTING or
        act == tpz.act.MAGIC_START
    then
        isBusy = true
    end

    
    if os.time() > mob:getLocalVar("INVIN_DELAY") and isBusy == false then
        mob:useMobAbility(694) -- Invincible
        mob:setLocalVar("INVIN_DELAY", os.time() + math.random(60, 120))
    end
    
    mob:setMod(tpz.mod.MAIN_DMG_RATING, mob:getMainLvl() + 80)
    mob:setMod(tpz.mod.WSDMG_ALL_HITS, 100)
end  

function onMobDespawn(mob)
    mob:removeListener("SKILLCHAIN_TAKEN")
    mob:removeListener("MOBSKILL_USED")
end


function onAdditionalEffect(mob, target, damage)
	local damage = 1400

    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENWATER)
end

function onMobDeath(mob, player, isKiller)
	local KillCounter = player:getCharVar("KillCounter_EschaGenbu")
	local playerName = player:getName()
	local mobName = mob:getName()
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_EschaGenbu", KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
end

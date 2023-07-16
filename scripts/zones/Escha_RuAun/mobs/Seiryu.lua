-----------------------------------
-- Area: Ru'Aun Gardens
--   NM: Seiryu
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
	mob:addMod(tpz.mod.ATT, 250)
    mob:addMod(tpz.mod.MATT, 200)
	mob:addMod(tpz.mod.EVA, 175)
	mob:addMod(tpz.mod.DEF, 275)
	mob:addMod(tpz.mod.MEVA, 200)
	mob:addMod(tpz.mod.MDEF, 50)
	mob:addMod(tpz.mod.STR, 110)
    mob:addMod(tpz.mod.DEX, 110)
    mob:addMod(tpz.mod.AGI, 110)
    mob:addMod(tpz.mod.VIT, 110)
    mob:addMod(tpz.mod.MND, 110)
    mob:addMod(tpz.mod.CHR, 110)
    mob:addMod(tpz.mod.INT, 110)
    mob:setMod(tpz.mod.WIND_ABSORB, 100)
    
    mob:setLocalVar("HUNDRED_FISTS_HP", 90)
    mob:setLocalVar("DWIND_DELAY", os.time() + 30)
    
    mob:timer(1000, function(mobArg)
        mobArg:setLocalVar("ATT",  mobArg:getMod(tpz.mod.ATT))
        mobArg:setLocalVar("MATT", mobArg:getMod(tpz.mod.MATT))
        mobArg:setLocalVar("EVA",  mobArg:getMod(tpz.mod.EVA))
        mobArg:setLocalVar("DEF",  mobArg:getMod(tpz.mod.DEF))
        mobArg:setLocalVar("MEVA", mobArg:getMod(tpz.mod.MEVA))
        mobArg:setLocalVar("MDEF", mobArg:getMod(tpz.mod.MDEF))
        mobArg:setLocalVar("STR",  mobArg:getMod(tpz.mod.STR))
        mobArg:setLocalVar("DEX",  mobArg:getMod(tpz.mod.DEX))
        mobArg:setLocalVar("AGI",  mobArg:getMod(tpz.mod.AGI))
        mobArg:setLocalVar("VIT",  mobArg:getMod(tpz.mod.VIT))
        mobArg:setLocalVar("MND",  mobArg:getMod(tpz.mod.MND))
        mobArg:setLocalVar("CHR",  mobArg:getMod(tpz.mod.CHR))
        mobArg:setLocalVar("INT",  mobArg:getMod(tpz.mod.INT))
    end)

    mob:addListener("SKILLCHAIN_TAKE", "SKILLCHAIN_TAKEN", function(defender, attacker, element, chainLevel, chainCount) -- , resistance, damage)
        if
            defender:getMainLvl() > 130 and
            (element == 14 or element == 16)
        then
            defender:timer(5000, function(mobArg)
                mobArg:setMobLevel(mobArg:getMainLvl() - 1)
                mobArg:injectActionPacket(4, 509)
                mobArg:setLocalVar("ATT",  mobArg:getMod(tpz.mod.ATT))
                mobArg:setLocalVar("MATT", mobArg:getMod(tpz.mod.MATT))
                mobArg:setLocalVar("EVA",  mobArg:getMod(tpz.mod.EVA))
                mobArg:setLocalVar("DEF",  mobArg:getMod(tpz.mod.DEF))
                mobArg:setLocalVar("MEVA", mobArg:getMod(tpz.mod.MEVA))
                mobArg:setLocalVar("MDEF", mobArg:getMod(tpz.mod.MDEF))
                mobArg:setLocalVar("STR",  mobArg:getMod(tpz.mod.STR))
                mobArg:setLocalVar("DEX",  mobArg:getMod(tpz.mod.DEX))
                mobArg:setLocalVar("AGI",  mobArg:getMod(tpz.mod.AGI))
                mobArg:setLocalVar("VIT",  mobArg:getMod(tpz.mod.VIT))
                mobArg:setLocalVar("MND",  mobArg:getMod(tpz.mod.MND))
                mobArg:setLocalVar("CHR",  mobArg:getMod(tpz.mod.CHR))
                mobArg:setLocalVar("INT",  mobArg:getMod(tpz.mod.INT))
            end)
        end
    end)

    mob:addListener("WEAPONSKILL_STATE_EXIT", "MOBSKILL_USED", function(mobArg, skillID)
        if skillID == 813 and mobArg:getMainLvl() < 160 then -- Dispelling wind
            mobArg:setMobLevel(mobArg:getMainLvl() + 1)
            mobArg:injectActionPacket(4, 510)
            mobArg:setLocalVar("ATT",  mobArg:getMod(tpz.mod.ATT))
            mobArg:setLocalVar("MATT", mobArg:getMod(tpz.mod.MATT))
            mobArg:setLocalVar("EVA",  mobArg:getMod(tpz.mod.EVA))
            mobArg:setLocalVar("DEF",  mobArg:getMod(tpz.mod.DEF))
            mobArg:setLocalVar("MEVA", mobArg:getMod(tpz.mod.MEVA))
            mobArg:setLocalVar("MDEF", mobArg:getMod(tpz.mod.MDEF))
            mobArg:setLocalVar("STR",  mobArg:getMod(tpz.mod.STR))
            mobArg:setLocalVar("DEX",  mobArg:getMod(tpz.mod.DEX))
            mobArg:setLocalVar("AGI",  mobArg:getMod(tpz.mod.AGI))
            mobArg:setLocalVar("VIT",  mobArg:getMod(tpz.mod.VIT))
            mobArg:setLocalVar("MND",  mobArg:getMod(tpz.mod.MND))
            mobArg:setLocalVar("CHR",  mobArg:getMod(tpz.mod.CHR))
            mobArg:setLocalVar("INT",  mobArg:getMod(tpz.mod.INT))
        end
    end)
end

function onMobFight(mob, target)
    mob:setMod(tpz.mod.ATT, mob:getLocalVar("ATT") + 250)
    mob:setMod(tpz.mod.MATT, mob:getLocalVar("MATT") +  200)
	mob:setMod(tpz.mod.EVA, mob:getLocalVar("EVA") + 175)
	mob:setMod(tpz.mod.DEF, mob:getLocalVar("DEF") + 275)
	mob:setMod(tpz.mod.MEVA, mob:getLocalVar("MEVA") + 200)
	mob:setMod(tpz.mod.MDEF, mob:getLocalVar("MDEF") + 50)
	mob:setMod(tpz.mod.STR, mob:getLocalVar("STR") + 110)
    mob:setMod(tpz.mod.DEX, mob:getLocalVar("DEX") + 110)
    mob:setMod(tpz.mod.AGI, mob:getLocalVar("AGI") + 110)
    mob:setMod(tpz.mod.VIT, mob:getLocalVar("VIT") + 110)
    mob:setMod(tpz.mod.MND, mob:getLocalVar("MND") + 110)
    mob:setMod(tpz.mod.CHR, mob:getLocalVar("CHR") + 110)
    mob:setMod(tpz.mod.INT, mob:getLocalVar("INT") + 110)

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

    if os.time() > mob:getLocalVar("MOB_FIGHT_DELAY") then
        local hFists = mob:getLocalVar("HUNDRED_FISTS_HP")

        if
            mob:getHPP() > 10 and
            mob:getHPP() <= hFists and
            mob:hasStatusEffect(tpz.effect.HUNDRED_FISTS) == false
        then
            mob:useMobAbility(690)
            mob:setLocalVar("HUNDRED_FISTS_HP", mob:getHPP() - math.random(5, 15))
        end

        mob:setLocalVar("MOB_FIGHT_DELAY", os.time() + 3)
    end
    
    if os.time() > mob:getLocalVar("DWIND_DELAY") and isBusy == false then
        mob:useMobAbility(813) -- Dispelling Wind
        mob:setLocalVar("DWIND_DELAY", os.time() + math.random(25, 125))
    end
    
    mob:setMod(tpz.mod.MAIN_DMG_RATING, mob:getMainLvl() + 80)
    mob:setMod(tpz.mod.WSDMG_ALL_HITS, 100)
end  

function onMobDespawn(mob)
    mob:removeListener("SKILLCHAIN_TAKEN")
    mob:removeListener("MOBSKILL_USED")
end


function onMonsterMagicPrepare(mob, target)
    if not mob:hasStatusEffect(tpz.effect.HUNDRED_FISTS, 0) then
        local rnd = math.random()
        if rnd < 0.5 then
            return 186 -- aeroga 3
        elseif rnd < 0.7 then
            return 157 -- aero 4
        elseif rnd < 0.9 then
            return 208 -- tornado
        else
            return 237 -- choke
        end
    end
    return 0 -- Still need a return, so use 0 when not casting
end

function onAdditionalEffect(mob, target, damage)
	local damage = 1400

    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENAERO)
end

function onMobDeath(mob, player, isKiller)
	local KillCounter = player:getCharVar("KillCounter_EschaSeiryu")
	local playerName = player:getName()
	local mobName = mob:getName()
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_EschaSeiryu", KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)

end
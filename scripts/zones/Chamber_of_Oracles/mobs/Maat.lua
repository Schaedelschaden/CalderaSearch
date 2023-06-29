-----------------------------------
-- Area: Chamber of Oracles
--  Mob: Maat
-- Genkai 5 Fight
-----------------------------------
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/ability")


function onMobSpawn(mob)  
    mob:setModelId(3037)
    mob:setMobLevel(119)
    mob:setMod(tpz.mod.UDMGPHYS, -100)
    mob:setMod(tpz.mod.UDMGBREATH, -100)
    mob:setMod(tpz.mod.UDMGMAGIC, -100)
    mob:setMod(tpz.mod.UDMGRANGE, -100)
    mob:addMod(tpz.mod.HASTE_MAGIC, 1500)   
    mib:addMod(tpz.mod.DOUBLE_ATTACK, 25)    
end

function onMobFight(mob, target)
    local target = mob:getTarget()
    local job    = target:getMainJob()
    local model  = mob:getModelId()
    
    local pSTR = target:getStat(tpz.mod.STR)
    local pDEX = target:getStat(tpz.mod.DEX)
    local pVIT = target:getStat(tpz.mod.VIT)
    local pAGI = target:getStat(tpz.mod.AGI)
    local pINT = target:getStat(tpz.mod.INT)
    local pMND = target:getStat(tpz.mod.MND)
    local pCHR = target:getStat(tpz.mod.CHR)
    local pATT = target:getMod(tpz.mod.ATT)
    local pDEF = target:getMod(tpz.mod.DEF)
    local pACC = target:getMod(tpz.mod.ACC)
    local pEVA = target:getMod(tpz.mod.EVA)
    local pMAT = target:getMod(tpz.mod.MATT)
    local pMVA = target:getMod(tpz.mod.MEVA)
    
    mob:setMod(tpz.mod.STR, pSTR)
    mob:setMod(tpz.mod.DEX, pDEX)
    mob:setMod(tpz.mod.VIT, pVIT)
    mob:setMod(tpz.mod.AGI, pAGI)
    mob:setMod(tpz.mod.MND, pMND)
    mob:setMod(tpz.mod.INT, pINT)
    mob:setMod(tpz.mod.CHR, pCHR)
    mob:setMod(tpz.mod.ATT, pATT)
    mob:setMod(tpz.mod.DEF, pDEF)
    mob:setMod(tpz.mod.ACC, pACC)
    mob:setMod(tpz.mod.EVA, pEVA)
    mob:setMod(tpz.mod.MATT, pMAT)
    mob:setMod(tpz.mod.MEVA, pMVA)
    
    mob:setMod(tpz.mod.UDMGPHYS, -95)
    mob:setMod(tpz.mod.UDMGBREATH, -95)
    mob:setMod(tpz.mod.UDMGMAGIC, -95)
    mob:setMod(tpz.mod.UDMGRANGE, -95)

    pet = target:getPet()

    if job == tpz.job.DRG and mob:getLocalVar("lock") == 0 then
        mob:setModelId(3019)
        mob:setMobMod(tpz.mobMod.SKILL_LIST, 0)
        target:setMod(tpz.mod.UDMGPHYS, -90)
        target:setMod(tpz.mod.UDMGBREATH, -90)
        target:setMod(tpz.mod.UDMGMAGIC, -90)
        target:setMod(tpz.mod.UDMGRANGE, -90)
        target:setMod(tpz.mod.CURE_POTENCY_RCVD, -25)
        target:setMod(tpz.mod.WALTZ_POTENCY_RCVD, -20)
        target:setMod(tpz.mod.SHIELD_BASH, -95)  
        pet:setMod(tpz.mod.UDMGPHYS, -90)
        pet:setMod(tpz.mod.UDMGBREATH, -90)
        pet:setMod(tpz.mod.UDMGMAGIC, -90)
        pet:setMod(tpz.mod.UDMGRANGE, -90)
        pet:setMod(tpz.mod.CURE_POTENCY_RCVD, -25)
        pet:setMod(tpz.mod.WALTZ_POTENCY_RCVD, -20)
        pet:setMod(tpz.mod.SHIELD_BASH, -95)       
        mob:setLocalVar("lock", 1)
    elseif job == tpz.job.NIN and mob:getLocalVar("lock") == 0 then
        mob:setModelId(3121)
        mob:setMobMod(tpz.mobMod.SKILL_LIST, 0)
        target:setMod(tpz.mod.UDMGPHYS, -98)
        target:setMod(tpz.mod.UDMGBREATH, -90)
        target:setMod(tpz.mod.UDMGMAGIC, -90)
        target:setMod(tpz.mod.UDMGRANGE, -90)
        target:setMod(tpz.mod.CURE_POTENCY_RCVD, -25)
        target:setMod(tpz.mod.WALTZ_POTENCY_RCVD, -20)
        target:setMod(tpz.mod.SHIELD_BASH, -95)       
        mob:setLocalVar("lock", 1)
    elseif job == tpz.job.SAM and mob:getLocalVar("lock") == 0 then
        mob:setModelId(3042)
        mob:setMobMod(tpz.mobMod.SKILL_LIST, 0)
        target:setMod(tpz.mod.UDMGPHYS, -98)
        target:setMod(tpz.mod.UDMGBREATH, -90)
        target:setMod(tpz.mod.UDMGMAGIC, -90)
        target:setMod(tpz.mod.UDMGRANGE, -90)
        target:setMod(tpz.mod.CURE_POTENCY_RCVD, -25)
        target:setMod(tpz.mod.WALTZ_POTENCY_RCVD, -20)
        target:setMod(tpz.mod.SHIELD_BASH, -95)               
        mob:setLocalVar("lock", 1)
    end
    
    mob:useJobAbility(tpz.jobAbility.JUMP, target) 
    
    if os.time() > mob:getLocalVar("WS_DELAY") then
        if model == 3042 then
            mob:useWeaponskill(150, target)
            mob:timer(5000, function(mobArg)
                mobArg:useWeaponskill(151, target)
            end)
            mob:timer(10000, function(mobArg2)       
                mobArg2:useWeaponskill(152, target)
            end)
            mob:timer(15000, function(mobArg3)       
                mobArg3:useWeaponskill(156, target)
            end)
            mob:setLocalVar("WS_DELAY", os.time() + 45)
        end
        
        if model == 3121 then
            mob:useWeaponskill(137, target)
            mob:timer(5000, function(mobArg4)
                mobArg4:useWeaponskill(141, target)
            end) 
            mob:timer(10000, function(mobArg5)
                mobArg5:castSpell(334, target)
            end)  
            mob:setLocalVar("WS_DELAY", os.time() + 30)
        end
    
        if model == 3019 then
            mob:useWeaponskill(122, target)
            mob:timer(10000, function(mobArg6)
                mobArg6:useWeaponskill(124, target)
            end)
            mob:timer(5000, function(mobArg7)       
                mobArg7:useWeaponskill(124, target)
            end)
            mob:setLocalVar("WS_DELAY", os.time() + 60)            
        end
    end      
    
    if model == 3019 then
        if os.time() > mob:getLocalVar("DRGSKILL") then
           mob:useJobAbility(66, target)            
           mob:setLocalVar("DRGSKILL", os.time() + 30)
        end   
    elseif model == 3042 then    
        local SAMrand = math.random(1, 2)
        if os.time() > mob:getLocalVar("SAMSKILL") then
            if SAMrand == 1 then
                mob:useJobAbility(63, target)
            elseif SAMrand == 2 then
                mob:useJobAbility(173, target)
            end
            mob:setLocalVar("SAMSKILL", os.time() + 60)
        end   
    elseif model == 3121 then    
        if os.time() > mob:getLocalVar("NINSKILL") then
            if not mob:hasStatusEffect(tpz.effect.COPY_IMAGE) then
                mob:castSpell(339, mob)
            end
            mob:setLocalVar("NINSKILL", os.time() + 60)
        end   
    end   
end

function onMobDeath(mob, player, isKiller)
end

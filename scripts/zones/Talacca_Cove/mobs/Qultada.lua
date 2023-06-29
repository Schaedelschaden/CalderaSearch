-----------------------------------
-- Area: Talacca Cove
--  Mob: Qultada
-----------------------------------
local ID = require("scripts/zones/Talacca_Cove/IDs")
require("scripts/globals/status")


function onMobSpawn(mob)
    mob:addMod(tpz.mod.PARALYZERES, 50)
    mob:addMod(tpz.mod.STUNRES, 50)
    mob:addMod(tpz.mod.BINDRES, 50)
    mob:addMod(tpz.mod.SLOWRES, 50)
    mob:addMod(tpz.mod.SILENCERES, 50)
    mob:addMod(tpz.mod.SLEEPRES, 100)
    mob:addMod(tpz.mod.LULLABYRES, 100)
    mob:addMod(tpz.mod.PETRIFYRES, 50)
    mob:addMod(tpz.mod.POISONRES, 50)
    mob:addMod(tpz.mod.STR, 100)
    mob:addMod(tpz.mod.ACC, 300)
    mob:addMod(tpz.mod.DEX, 100)
    mob:addMod(tpz.mod.VIT, 200)
    mob:addMod(tpz.mod.AGI, 100)
    mob:addMod(tpz.mod.MND, 100)
    mob:addMod(tpz.mod.INT, 100)
    mob:addMod(tpz.mod.CHR, 100)
    mob:addMod(tpz.mod.DEF, 1000)
    mob:addMod(tpz.mod.EVA, 150)
    mob:addMod(tpz.mod.PARRY_RATE_BONUS, 25)
end

function onMobFight(mob, target)
    if os.time() > mob:getLocalVar("COMBAT_DELAY") then
        local isBusy = false
        local act    = mob:getCurrentAction()

        if
            act == tpz.act.WEAPONSKILL_START or
            act == tpz.act.WEAPONSKILL_FINISH or
            act == tpz.act.MOBABILITY_START or
            act == tpz.act.MOBABILITY_USING or
            act == tpz.act.MOBABILITY_FINISH or
            act == tpz.act.MAGIC_START or
            act == tpz.act.MAGIC_CASTING or
            act == tpz.act.MAGIC_START
        then
            isBusy = true
        end
        
        if isBusy == false and mob:actionQueueEmpty() == true then

            local target  = mob:getTarget()
            local regen   = (mob:getMaxHP() - mob:getHP()) / 200
            local power   = math.random(50, 119)
            local element = math.random(123, 130)
            if os.time() > mob:getLocalVar("shots") then
                mob:injectActionPacket(6, element)
                if element == 123 then     --Light
                    mob:addStatusEffect(tpz.effect.REGEN, regen, 0, 30)
                elseif element == 124 then --Dark
                    target:dispelStatusEffect()
                elseif element == 125 then --Fire
                    mob:addStatusEffect(tpz.effect.BLAZE_SPIKES, power, 0, 30)
                    target:addStatusEffect(tpz.effect.BURN, power / 4, 0, 30)
                elseif element == 126 then --Ice
                    mob:addStatusEffect(tpz.effect.ICE_SPIKES, power, 0, 30)
                    target:addStatusEffect(tpz.effect.FROST, power / 4, 0, 30)
                elseif element == 127 then --Wind
                    mob:addStatusEffect(tpz.effect.BLINK, 10, 0, 60)
                    target:addStatusEffect(tpz.effect.CHOKE, power / 4, 0, 30)
                elseif element == 128 then --Earth
                    mob:addStatusEffect(tpz.effect.STONESKIN, 1500, 0, 60)
                    target:addStatusEffect(tpz.effect.RASP, power / 4, 0, 30)
                elseif element == 129 then --Lightning
                    mob:addStatusEffect(tpz.effect.SHOCK_SPIKES, power, 0, 30)
                    target:addStatusEffect(tpz.effect.SHOCK, power / 4, 0, 30)
                elseif element == 130 then --Water
                    mob:eraseStatusEffect()
                    mob:eraseStatusEffect()
                    mob:eraseStatusEffect()
                    target:addStatusEffect(tpz.effect.DROWN, power / 4, 0, 30)
                end
                mob:setLocalVar("shots", os.time() + 30)
            end
            
            if os.time() > mob:getLocalVar("WS_CD") then
                local mobskill = math.random(1, 3)
                if mob:getTP() >= 1500 then
                    if mobskill == 1 then
                        mob:useMobAbility(42)
                    elseif mobskill == 2 then
                        mob:useMobAbility(38)
                    elseif mobskill == 3 then
                        mob:useMobAbility(40)
                    end    
                end 
                mob:setLocalVar("WS_CD", os.time() + 10)
            end   
            
            local WCCD = mob:getLocalVar("WC_CD")
            if mob:getHPP() <= 80 and WCCD == 0 then
                mob:injectActionPacket(6, 132)
                mob:addStatusEffect(tpz.effect.MIGHTY_STRIKES, 1, 0, 30)
                target:addStatusEffect(tpz.effect.STUN, 1, 0, 10)
                mob:resetEnmity(target)
                mob:setLocalVar("WC_CD", 1)
            end
            
            if mob:getHPP() <= 60 and WCCD == 1 then
                mob:injectActionPacket(6, 132)
                mob:addStatusEffect(tpz.effect.HUNDRED_FISTS, 1, 0, 30)
                target:addStatusEffect(tpz.effect.STUN, 1, 0, 10)        
                mob:setLocalVar("WC_CD", 2)
            end
            
            if mob:getHPP() <= 40 and WCCD == 2 then
                mob:injectActionPacket(6, 132)
                mob:addStatusEffect(tpz.effect.PERFECT_DODGE, 1, 0, 30)
                mob:setLocalVar("WC_CD", 3)
            end

            if mob:getHPP() <= 20 and WCCD == 3 then
                mob:injectActionPacket(6, 132)
                mob:addStatusEffect(tpz.effect.INVINCIBLE, 1, 0, 30)
                target:addStatusEffect(tpz.effect.STUN, 1, 0, 10)        
                mob:setLocalVar("WC_CD", 4)
            end
            
            if mob:getHPP() <= 10 and WCCD == 4 then
                mob:injectActionPacket(6, 132)
                mob:timer(5000, function(mobArg)
                    mobArg:injectActionPacket(6, 35)
                    mobArg:setHP(300000)
                end)
                mob:addStatusEffect(tpz.effect.HASTE, 3000, 0, 0)
                target:addStatusEffect(tpz.effect.STUN, 1, 0, 10)  
                mob:timer(20000, function(mobArg2)        
                    mobArg2:setLocalVar("WC_CD", 5)
                end)
            end

            
            if mob:getHPP() <= 10 and WCCD == 5 then
                mob:injectActionPacket(6, 132)
                mob:addStatusEffect(tpz.effect.BLOOD_WEAPON, 1, 0, 30)
                target:addStatusEffect(tpz.effect.STUN, 1, 0, 10)        
                mob:resetEnmity(target)
                mob:setLocalVar("WC_CD", 6)
            end
        end
        mob:setLocalVar("COMBAT_DELAY", os.time() + 1)
    end       
end

function onMobDeath(mob, player, isKiller)
    player:addSpell(967, true, true)    
end

-----------------------------------
-- Area: Sacrificial Chamber
--  Mob: Shantotto
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.PARALYZERES, 30) -- Resistance to Silence
    mob:addMod(tpz.mod.STUNRES, 30) -- Resistance to Stun
    mob:addMod(tpz.mod.BINDRES, 30) -- Resistance to Bind
    mob:addMod(tpz.mod.SLOWRES, 30) -- Resistance to Slow
    mob:addMod(tpz.mod.SILENCERES, 50) -- Resistance to Silence
    mob:addMod(tpz.mod.SLEEPRES, 30) -- Resistance to Sleep
    mob:addMod(tpz.mod.LULLABYRES, 30) -- Resistance to Lullaby
    mob:addMod(tpz.mod.PETRIFYRES, 30) -- Resistance to Pertrify
    mob:addMod(tpz.mod.POISONRES, 30) -- Resistance to Poison
    mob:addMod(tpz.mod.ATT, 500) -- Attack Stat (Compare to DEF)
    mob:addMod(tpz.mod.MATT, 80) -- Magic Attack (Compare to MDEF)
    mob:addMod(tpz.mod.EVA, 150) -- Evasion (Compare to ACC)
    mob:addMod(tpz.mod.DEF, 700) -- Defense (Compart to ATT)
    mob:addMod(tpz.mod.MEVA, 200) -- Magic Evasion (Compare to MACC)
    mob:addMod(tpz.mod.MDEF, 100) -- Magic Defense (Compare to MATT)
    mob:addMod(tpz.mod.STR, 130)
    mob:addMod(tpz.mod.DEX, 130)
    mob:addMod(tpz.mod.AGI, 130)
    mob:addMod(tpz.mod.VIT, 130)
    mob:addMod(tpz.mod.MND, 130)
    mob:addMod(tpz.mod.CHR, 130)
    mob:addMod(tpz.mod.INT, 130)
    mob:setLocalVar("PHASE", 0)
    mob:setSpellList(2) 
end

function onMobFight(mob, target)
    if mob:getLocalVar("PHASE") == 0 and mob:getHPP() <= 66 then
        shantPhase(mob, target, 2490)
        mob:setModelId(3038)
        mob:setSpellList(0) 
        mob:setMod(tpz.mod.UDMGPHYS, -90)
        mob:setLocalVar("PHASE", 1)
        mob:setMod(tpz.mod.ALL_WSDMG_ALL_HITS, -66)
    elseif mob:getLocalVar("PHASE") == 1 and mob:getHPP() <= 33 then -- does she have a TP move
        shantPhase(mob, target, 2490)
        mob:setModelId(3110)
        mob:setSpellList(428) 
        mob:setMod(tpz.mod.UDMGPHYS, 0)        
        mob:setMod(tpz.mod.UDMGMAGIC, -90) 
        mob:setLocalVar("PHASE", 2)
        mob:setMod(tpz.mod.MATT, 115)
    end
    
    if mob:getLocalVar("PHASE") == 1 and mob:getTP() >= 3000 then
        if os.time() > mob:getLocalVar("Guillotine") then
            mob:useWeaponskill(102, target)
            mob:useWeaponskill(102, target)            
            mob:addStatusEffect(tpz.effect.BLOOD_WEAPON, 1, 0, 30)
            mob:addStatusEffect(tpz.effect.DREAD_SPIKES, 1, 0, 30)
            mob:setLocalVar("Guillotine", os.time() + 3)
        end
    end
    
    if mob:getLocalVar("PHASE") == 2 then
        mob:setMod(tpz.mod.MAGIC_DAMAGE, 250)
        mob:addStatusEffect(tpz.effect.CHAINSPELL, 1, 0, 0)
        mob:getStatusEffect(tpz.effect.CHAINSPELL):setFlag(tpz.effectFlag.DEATH)
    end  
    
    if mob:hasStatusEffect(tpz.effect.SILENCE) then
        mob:setMod(tpz.mod.REGEN, 5000)
    else
        mob:setMod(tpz.mod.REGEN, 0)
    end
end

function shantPhase(mob, target, animation)
    local party = target:getParty()

    for _, member in ipairs(party) do
        if member:getObjType() == tpz.objType.PC then
            member:injectActionPacket(11, 2490, 0, 0, 0)
            member:PrintToPlayer("Shantotto: Let's try something different!", tpz.msg.channel.NS_SAY)   
            member:PrintToPlayer("Shantotto has changed Forms.", tpz.msg.channel.SYSTEM_3)  

        elseif
            member:getObjType() == tpz.objType.TRUST or
            member:getObjType() == tpz.objType.PET
        then
            local master = member:getMaster()

            master:injectActionPacket(11, 2499, 0, 0, 0)
            master:PrintToPlayer("Shantotto: Let's try something different!", tpz.msg.channel.NS_SAY)                
            master:PrintToPlayer("Shantotto has changed Forms.", tpz.msg.channel.SYSTEM_3)       
        end
    end
end


function onMobDeath(mob, player, isKiller)
    mob:setModelId(1095)
end

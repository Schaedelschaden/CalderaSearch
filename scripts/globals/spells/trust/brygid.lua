-----------------------------------------
-- Trust: Brygid
-----------------------------------------
require("scripts/globals/trust")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return tpz.trust.canCast(caster, spell)
end

function onSpellCast(caster, target, spell)
    return tpz.trust.spawn(caster, spell)
end

function onMobSpawn(mob)
    mob:SetAutoAttackEnabled(false)
    mob:addMod(tpz.mod.REGAIN, 125)
    mob:setLocalVar("DPS", 0)
    mob:setLocalVar("PHASE_SHIFT", 0)
    mob:setModelId(16)
end

function onMobFight(mob)


    if os.time() > mob:getLocalVar("ODIN") then
        if mob:getLocalVar("dead") == 1 then
            mob:setHP(0)
        end
        if mob:getLocalVar("PD_DELAY") == 2 then
            mob:setLocalVar("PD_DELAY", 0)
        end
        mob:setLocalVar("ODIN", os.time() + 20)
    end

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
            local form = mob:getModelId()
            local party = mob:getMaster():getPartyWithTrusts()
            for _, member in pairs(party) do
                if member:getHPP() <= 50 and mob:getLocalVar("PHASE_SHIFT") == 0 and mob:getLocalVar("PD_DELAY") == 0 and mob:getLocalVar("dead") == 0 then
                    mob:setModelId(16) -- Carby
                    mob:setLocalVar("PHASE_SHIFT", 1)
                end
                
                if member:getHPP() <= 20 and mob:getLocalVar("ALEXANDER") == 0 then
                    mob:setModelId(27) -- Alex
                    mob:setLocalVar("PHASE_SHIFT", 1)
                    mob:setLocalVar("ALEXANDER", 1)
                    mob:setLocalVar("PD_DELAY", 1)
                end
                
                if member:hasStatusEffect(tpz.effect.DOOM) == true then
                    local master = mob:getMaster()
                    master:delStatusEffect(tpz.effect.DOOM)
                    mob:setModelId(26) -- ODIN
                    mob:setLocalVar("PHASE_SHIFT", 1)
                    mob:setLocalVar("ALEXANDER", 1)              
                end    
            end
            
            
            if (mob:getLocalVar("PHASE_SHIFT") == 0 and mob:getTP() >= 500 and form ~= 26 and mob:getLocalVar("PD_DELAY") == 0) then
                if mob:getLocalVar("dead") == 1 then
                    mob:setHP(0)
                elseif mob:hasStatusEffect(tpz.effect.BLINK) == false then
                    mob:setModelId(21) -- Garuda
                elseif mob:hasStatusEffect(tpz.effect.STONESKIN) == false then
                    mob:setModelId(19) -- TITAN
                elseif mob:hasStatusEffect(tpz.effect.ICE_SPIKES) == false then
                    mob:setModelId(22) -- Shiva
                elseif mob:hasStatusEffect(tpz.effect.ENTHUNDER) == false then
                    mob:setModelId(23) -- Ramuh
                elseif mob:hasStatusEffect(tpz.effect.PHALANX) == false then
                    mob:setModelId(25) -- Diabolos
                elseif mob:getLocalVar("DPS") == 1 then 
                    mob:setModelId(17) -- fenrir
                elseif mob:getLocalVar("DPS") == 2 then
                    mob:setModelId(18) -- ifrit
                elseif mob:getLocalVar("DPS") == 3 then
                    mob:setModelId(20) -- leviathan
                end
                mob:setLocalVar("PHASE_SHIFT", 1)
            end

            if (mob:getLocalVar("PHASE_SHIFT") == 1 and mob:getTP() >= 1125) then 
                if form == 16 then
                    mob:useMobAbility(911) -- healing ruby II    
                elseif form == 21 then
                    mob:useMobAbility(871) -- Aerial Armor
                elseif form == 19 then
                    mob:useMobAbility(853) -- Earthen Ward
                elseif form == 22 then
                    mob:useMobAbility(878) -- Frost Armor
                elseif form == 23 then
                    mob:useMobAbility(887) -- rolling thunder
                elseif form == 25 then
                    mob:useMobAbility(546) -- Noctoshield
                elseif form == 17 then
                    mob:useMobAbility(836) -- Eclipse Bite
                elseif form == 18 then
                    mob:useMobAbility(846) -- Flaming Crush
                elseif form == 20 then
                    mob:useMobAbility(858) -- Barracuda Dive
                elseif form == 27 then
                    mob:useMobAbility(2143) -- Perfect Defense
                    mob:setMP(0)
                    mob:setHP(1)
                    mob:setLocalVar("PD_DELAY", 2)
                    mob:setLocalVar("ODIN", os.time() + 20)
                elseif form == 26 then
                    mob:useMobAbility(2126) -- Zantetsuken    
                    mob:setLocalVar("dead", 1)
                end
                mob:setLocalVar("PHASE_SHIFT", 0)
                mob:setLocalVar("DPS", math.random(1, 3)) 
            end
        end
        mob:setLocalVar("COMBAT_DELAY", os.time() + 1)
    end
end

function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
end
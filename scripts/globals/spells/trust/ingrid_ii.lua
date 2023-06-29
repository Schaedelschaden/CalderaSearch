-----------------------------------------
-- Trust: Ingrid II
-----------------------------------------
require("scripts/globals/ability")
require("scripts/globals/gambits")
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/trust")
require("scripts/globals/utils")
require("scripts/globals/weaponskillids")
require("scripts/globals/monstertpmoves")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return tpz.trust.canCast(caster, spell)
end

function onSpellCast(caster, target, spell)
    return tpz.trust.spawn(caster, spell)
end

function onMobSpawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.SPAWN)
    mob:setMobMod(tpz.mobMod.SPELL_LIST, 393)

    mob:addMod(tpz.mod.CURE_POTENCY, 50)
	mob:addMod(tpz.mod.FASTCAST, 100)
	mob:addMod(tpz.mod.REGEN, 10)
	mob:addMod(tpz.mod.REFRESH, 10)
	mob:addMod(tpz.mod.REGAIN, 75)
	mob:addMod(tpz.mod.REGEN_DURATION, 200)
	mob:addMod(tpz.mod.CURE2MP_PERCENT, 1)
    mob:SetAutoAttackEnabled(false)
    
    mob:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 75, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.CURE)
    -- mob:addSimpleGambit(ai.t.PARTY, ai.c.MPP_LT, 20, ai.r.JA, ai.s.SPECIFIC, tpz.ja.DEVOTION)
    
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.SLEEP_I, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.CURAGA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.SLEEP_II, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.CURAGA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.NOT_STATUS, tpz.effect.PROTECT, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.PROTECTRA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.NOT_STATUS, tpz.effect.SHELL, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.SHELLRA)
    mob:addSimpleGambit(ai.t.MELEE, ai.c.NOT_STATUS, tpz.effect.HASTE, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.HASTE)
    
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.DOOM, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.CURSNA)    
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.ACCESSION, ai.r.JA, ai.s.SPECIFIC, tpz.ja.ACCESSION)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.STONESKIN, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STONESKIN)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.BLINK, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.BLINK)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.AFFLATUS_SOLACE, ai.r.JA, ai.s.SPECIFIC, tpz.ja.AFFLATUS_SOLACE)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.POISON, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.POISONA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.PARALYSIS, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.PARALYNA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.BLINDNESS, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.BLINDNA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.SILENCE, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.SILENA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.PETRIFICATION, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STONA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.DISEASE, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.VIRUNA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.CURSE_I, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.CURSNA)
    mob:addSimpleGambit(ai.t.SELF, ai.c.STATUS_FLAG, tpz.effectFlag.ERASABLE, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.ERASE)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS_FLAG, tpz.effectFlag.ERASABLE, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.ERASE)
end

function onMobFight(mob, target)
    if os.time() > mob:getLocalVar("MOB_FIGHT_DELAY") then
        
        if not mob:hasStatusEffect(tpz.effect.SUBLIMATION_ACTIVATED) then
            mob:useJobAbility(tpz.jobAbility.SUBLIMATION, mob)
        end   
        
        if target:hasStatusEffect(tpz.effect.MANAFONT) or target:hasStatusEffect(tpz.effect.ASTRAL_FLOW) or target:hasStatusEffect(tpz.effect.CHAINSPELL) then
            mob:useJobAbility(271, mob)
        end
        
        if os.time() > mob:getLocalVar("SUBLIMATION_CD") then
            if mob:hasStatusEffect(tpz.effect.SUBLIMATION_ACTIVATED) or mob:hasStatusEffect(tpz.effect.SUBLIMATION_COMPLETE) then 
                if mob:getMP() < (mob:getMaxMP() * 0.50) and mob:getTP() < 1000 then
                    mob:useJobAbility(tpz.jobAbility.SUBLIMATION, mob)
                    mob:setLocalVar("SUBLIMATION_CD", os.time() + 120)
                end
            end
        end  
 
        local master = mob:getMaster()
        local party  = master:getPartyWithTrusts()
        local mLvl   = mob:getMainLvl()
        if os.time() > mob:getLocalVar("COMBAT_TICK_PAUSE_TIME") then
            for _, member in pairs(party) do
                local mobMPP    = (mob:getMP() / mob:getMaxMP()) * 100
                local memberMPP = (member:getMP() / member:getMaxMP()) * 100

                if member:getHPP() <= 50 and mobMPP <= 10 then
                    --printf("ingrid_ii.lua  MARTYR  Member HPP: [%1.2f]  Mob MPP: [%1.2f]", member:getHPP(), mobMPP)
                    mob:useJobAbility(tpz.jobAbility.MARTYR, member)
                end

                if memberMPP <= 20 and mob:getHPP() >= 20 then
                    --printf("ingrid_ii.lua  DEVOTION  Member MPP: [%1.2f]  Mob HPP: [%1.2f]", memberMPP, mob:getHPP())
                    mob:useJobAbility(tpz.jobAbility.DEVOTION, member)
                end

                if os.time() > mob:getLocalVar("BUFFS") then               
                    if member:hasStatusEffect(tpz.effect.REGEN) == false then
                        if mLvl >= 21 and mLvl < 44 then
                            mob:castSpell(108, v)
                        elseif mLvl >= 44 and mLvl < 66 then
                            mob:castSpell(110, v)
                        elseif mLvl >= 66 and mLvl < 86 then
                            mob:castSpell(111, v)
                        elseif mLvl >= 86 then
                            mob:castSpell(477, v)
                        end
                        mob:setLocalVar("BUFFS", os.time() + 15)
                    end
                end
            end
            mob:setLocalVar("COMBAT_TICK_PAUSE_TIME", os.time() + 3)            
        end
        mob:setLocalVar("MOB_FIGHT_DELAY", os.time() + 1)
        
        if mob:getTP() >= 1000 then
            if mob:getMP() <= mob:getMaxMP() * 0.75 then
                mob:useWeaponskill(173, mob)
            end
        end
    end
end


function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
end


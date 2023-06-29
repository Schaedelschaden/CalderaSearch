-----------------------------------------
-- Trust: D Shantotto
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
    tpz.trust.message(mob, tpz.trust.message_offset.SPAWN)
    
    mob:addMod(tpz.mod.MAIN_DMG_RATING, mob:getMainLvl())
    mob:addMod(tpz.mod.WSACC, 40)
    mob:addMod(tpz.mod.ENHANCES_ABSORB_TP, 25)
    mob:addMod(tpz.mod.ABSORB_DURATION, 100)
    mob:addMod(tpz.mod.ENHANCES_NETHER_VOID, 100)
    mob:addMod(tpz.mod.SOULEATER_EFFECT_POTENCY, 25)

    -- Stun all the things!
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_WS, 0, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STUN)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_MS, 0, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STUN)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_JA, 0, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STUN)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.CASTING_MA, 0, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STUN)

    -- Non-stun things
    mob:addSimpleGambit(ai.t.SELF, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.SOULEATER)
    mob:addSimpleGambit(ai.t.SELF, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.LAST_RESORT)
    mob:addSimpleGambit(ai.t.SELF, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.NETHER_VOID)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.BERSERK, ai.r.JA, ai.s.SPECIFIC, tpz.ja.BERSERK)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.ENDARK, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.ENDARK)
    mob:addSimpleGambit(ai.t.SELF, ai.c.HAS_TOP_ENMITY, 0, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.DREAD_SPIKES)
    mob:addSimpleGambit(ai.t.SELF, ai.c.STATUS, tpz.effect.DREAD_SPIKES, ai.r.JA, ai.s.SPECIFIC, tpz.ja.SCARLET_DELIRIUM)
    
    mob:addSimpleGambit(ai.t.TARGET, ai.c.MB_AVAILABLE, 0, ai.r.MA, ai.s.MB_ELEMENT, tpz.magic.spellFamily.NONE, 5)
    
end

function onMobFight(mob)
    local target = mob:getTarget()
    local shuffle = math.random(1, 3)
    
    if os.time() > mob:getLocalVar("DRAIN_CD") then
        if mob:hasStatusEffect(tpz.effect.NETHER_VOID) then
            mob:castSpell(tpz.magic.spell.DRAIN_II, target)
        elseif mob:getHP() <= mob:getMaxHP() * 0.66 then
            mob:castSpell(tpz.magic.spell.DRAIN, target)
        elseif mob:getMP() <= mob:getMaxMP() * 0.66 then
            mob:castSpell(tpz.magic.spell.ASPIR, target)
        elseif mob:getMP() <= mob:getMaxMP() * 0.50 then
            mob:castSpell(tpz.magic.spell.ASPIR_II, target)
        elseif mob:hasStatusEffect(tpz.effect.ACCURACY_BOOST) == false then
            mob:castSpell(tpz.magic.spell.ABSORB_ACC, target)
        elseif mob:hasStatusEffect(tpz.effect.STR_BOOST) == false then
            mob:castSpell(tpz.magic.spell.ABSORB_STR, target)
        elseif target:getTP() >= 1000 then
            mob:castSpell(tpz.magic.spell.ABSORB_TP, target)
        elseif target:getStatusEffect(tpz.effect.NONE) == false then    
            mob:castSpell(tpz.magic.spell.ABSORB_ATTRI, target)
        end        
        mob:setLocalVar("DRAIN_CD", os.time() + 10) 
    end
    
    if os.time() > mob:getLocalVar("SKILL_ROTATE") then
        if mob:getTP() >= 1000 then
            if mob:getMP() >= mob:getMaxMP() * 0.50 then
                mob:useJobAbility(tpz.jobAbility.CONSUME_MANA, mob)
            end
            
            if mob:getHPP() <= 66 then
                mob:useWeaponskill(105, target)
            elseif mob:getMP() <= mob:getMaxMP() * 0.50 then
                mob:useWeaponskill(109, target)
            elseif shuffle == 1 then
                mob:useWeaponskill(103, target)
            elseif shuffle == 2 then
                mob:useWeaponskill(106, target)
            elseif shuffle == 3 then
                mob:useWeaponskill(108, target)    
            end
        elseif mob:getTP() < 1000 and mob:hasStatusEffect(tpz.effect.SOUL_ENSLAVEMENT) == false then
            mob:useJobAbility(330, mob)
        end
        mob:setLocalVar("SKILL_ROTATE", os.time() + 5)        
    end    

    
    
    
end

function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
end

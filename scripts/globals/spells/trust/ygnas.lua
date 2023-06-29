-----------------------------------------
-- Trust: Ygnas
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

    mob:addMod(tpz.mod.CURE_POTENCY, 50)
	mob:addMod(tpz.mod.FASTCAST, 100)
	mob:addMod(tpz.mod.REGEN, 10)
	mob:addMod(tpz.mod.REFRESH, 10)
	mob:addMod(tpz.mod.CURE2MP_PERCENT, 5)
    mob:SetAutoAttackEnabled(false)
    mob:addStatusEffect(tpz.effect.MAX_HP_BOOST, 25, 0, 0)
    mob:addStatusEffect(tpz.effect.MAX_MP_BOOST, 25, 0, 0)
    mob:setHP(mob:getMaxHP())
    mob:setMP(mob:getMaxMP())
    
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.SLEEP_I, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.CURAGA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.SLEEP_II, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.CURAGA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.NOT_STATUS, tpz.effect.PROTECT, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.PROTECTRA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.NOT_STATUS, tpz.effect.SHELL, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.SHELLRA)
    mob:addSimpleGambit(ai.t.MELEE, ai.c.NOT_STATUS, tpz.effect.HASTE, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.HASTE)
    
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.DOOM, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.CURSNA)    
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.STONESKIN, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STONESKIN)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.BLINK, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.BLINK)
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
    local master = mob:getMaster()
    local party  = master:getPartyWithTrusts()
    local mLvl   = mob:getMainLvl()
    if os.time() > mob:getLocalVar("COMBAT_TICK_PAUSE_TIME") then
        for _, member in pairs(party) do
            if member:getHPP() < 100 and member:getHPP() > 90 then
                mob:castSpell(1, member)
            elseif member:getHPP() < 90 and member:getHPP() > 80 then
                mob:castSpell(2, member)
            elseif member:getHPP() < 80 and member:getHPP() > 70 then
                mob:castSpell(3, member)
            elseif member:getHPP() < 70 and member:getHPP() > 60 then
                mob:castSpell(4, member)
            elseif member:getHPP() < 60 and member:getHPP() > 50 then
                mob:castSpell(5, member)
            elseif member:getHPP() < 50 then
                mob:castSpell(6, member)
            elseif mLvl < 99 then
                mob:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 75, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.CURE)
            end    
        end
        mob:setLocalVar("COMBAT_TICK_PAUSE_TIME", os.time() + 3)            
    end
end

function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
end

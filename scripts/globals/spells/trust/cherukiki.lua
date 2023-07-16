-----------------------------------------
-- Trust: Cherukiki
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
	mob:addMod(tpz.mod.FASTCAST, 50)
    mob:addMod(tpz.mod.REGEN, 5)
    mob:addMod(tpz.mod.REFRESH, 10)
    mob:addMod(tpz.mod.LIGHT_ARTS_REGEN, 5)
    mob:addMod(tpz.mod.REGEN_MULTIPLIER, 1)
    mob:addMod(tpz.mod.REGEN_BASE, 1)
    
    -- Does not attack
	mob:SetAutoAttackEnabled(false)
    
    mob:addSimpleGambit(ai.t.MASTER, ai.c.NOT_STATUS, tpz.effect.REGEN, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.REGEN)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 65, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.CURE)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.NOT_STATUS, tpz.effect.REGEN, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.REGEN)

    mob:addSimpleGambit(ai.t.MASTER, ai.c.NOT_STATUS, tpz.effect.PROTECT, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.PROTECTRA)
    mob:addSimpleGambit(ai.t.MASTER, ai.c.NOT_STATUS, tpz.effect.SHELL, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.SHELLRA)

    mob:addSimpleGambit(ai.t.MELEE, ai.c.NOT_STATUS, tpz.effect.HASTE, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.HASTE)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.HASTE, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.HASTE)
    mob:addSimpleGambit(ai.t.MASTER, ai.c.NOT_STATUS, tpz.effect.HASTE, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.HASTE)
    
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, tpz.effect.PARALYSIS, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.PARALYZE)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, tpz.effect.SLOW, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.SLOW)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.CASTING_MA, 0, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.SILENCE) 
end

function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
end
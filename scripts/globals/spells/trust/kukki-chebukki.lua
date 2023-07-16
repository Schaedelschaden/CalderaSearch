-----------------------------------------
-- Trust: Kukki-Chebukki
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
    mob:addStatusEffect(tpz.effect.MAX_MP_BOOST, 30, 0, 0) --If this doesnt work, try HPP (HP %)
    mob:setMP(mob:getMaxMP())
    mob:addMod(tpz.mod.REFRESH, 3)
    
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, tpz.effect.BURN, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.BURN)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, tpz.effect.CHOKE, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.CHOKE)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, tpz.effect.SHOCK, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.SHOCK)
    
    mob:addSimpleGambit(ai.t.SELF, ai.c.HAS_TOP_ENMITY, 0, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spellFamily.SLEEPGA)

    mob:addSimpleGambit(ai.t.TARGET, ai.c.MB_AVAILABLE, 0, ai.r.MA, ai.s.MB_ELEMENT, tpz.magic.spellFamily.NONE, 5)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_SC_AVAILABLE, 0, ai.r.MA, ai.s.RANDOM, tpz.magic.spellFamily.NONE, 45)
end

function onMobDespawn(mob)
end

function onMobDeath(mob)
end

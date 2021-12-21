-----------------------------------------
-- Trust: Rahal
-----------------------------------------
require("scripts/globals/ability")
require("scripts/globals/gambits")
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/trust")
require("scripts/globals/weaponskillids")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return tpz.trust.canCast(caster, spell)
end

function onSpellCast(caster, target, spell)
    return tpz.trust.spawn(caster, spell)
end

function onMobSpawn(mob)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_HAS_TOP_ENMITY, 0,
                        ai.r.JA, ai.s.SPECIFIC, tpz.ja.PROVOKE)
						
	mob:addSimpleGambit(ai.t.SELF, ai.c.HPP_LT, 33,
                        ai.r.JA, ai.s.SPECIFIC, tpz.ja.SENTINEL)
						
	mob:addSimpleGambit(ai.t.TARGET, ai.c.CASTING_MA, 0,
                        ai.r.JA, ai.s.SPECIFIC, tpz.ja.SHIELD_BASH)

    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, tpz.effect.FLASH,
                        ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.FLASH)

    mob:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 33,
                        ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.CURE)
						
	mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.ENLIGHT,
                        ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.ENLIGHT)
end

function onMobDespawn(mob)
    
end

function onMobDeath(mob)
    
end
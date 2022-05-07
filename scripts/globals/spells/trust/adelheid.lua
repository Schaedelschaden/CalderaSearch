-----------------------------------------
-- Trust: Adelheid
-----------------------------------------
require("scripts/globals/ability")
require("scripts/globals/gambits")
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/roe")
require("scripts/globals/trust")
require("scripts/globals/weaponskillids")
-----------------------------------------

local message_page_offset = 77

function onMagicCastingCheck(caster, target, spell)
    return tpz.trust.canCast(caster, spell)
end

function onSpellCast(caster, target, spell)

    -- Records of Eminence: Alter Ego: Adelheid
    if caster:getEminenceProgress(936) then
        tpz.roe.onRecordTrigger(caster, 936)
    end

    return tpz.trust.spawn(caster, spell)
end

function onMobSpawn(mob)
    tpz.trust.message(mob, message_page_offset, tpz.trust.message_offset.SPAWN)

    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_WS, 0, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STUN)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_MS, 0, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STUN)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_JA, 0, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STUN)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.CASTING_MA, 0, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STUN)

    -- TODO: Storms
	mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.FIRESTORM, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.FIRESTORM)
	mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.HAILSTORM, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.HAILSTORM)
	mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.WINDSTORM, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.WINDSTORM)
	mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.SANDSTORM, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.SANDSTORM)
	mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.THUNDERSTORM, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.THUNDERSTORM)
	mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.RAINSTORM, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.RAINSTORM)
	mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.AURORASTORM, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.AURORASTORM)
	mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.VOIDSTORM, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.VOIDSTORM)

    -- TODO: Helices
	mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, tpz.effect.HELIX, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.PYROHELIX)
	mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, tpz.effect.HELIX, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.CRYOHELIX)
	mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, tpz.effect.HELIX, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.ANEMOHELIX)
	mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, tpz.effect.HELIX, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.GEOHELIX)
	mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, tpz.effect.HELIX, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.IONOHELIX)
	mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, tpz.effect.HELIX, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.HYDROHELIX)
	mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, tpz.effect.HELIX, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.LUMINOHELIX)
	mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, tpz.effect.HELIX, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.NOCTOHELIX)

    mob:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 75, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.CURE)

    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_SC_AVAILABLE, 0, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.NONE, 75)
end

function onMobDespawn(mob)
    tpz.trust.message(mob, message_page_offset, tpz.trust.message_offset.DESPAWN)
end

function onMobDeath(mob)
    tpz.trust.message(mob, message_page_offset, tpz.trust.message_offset.DEATH)
end
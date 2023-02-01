-----------------------------------
-- Trust: Apururu UC
-----------------------------------
require("scripts/globals/ability")
require("scripts/globals/gambits")
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/roe")
require("scripts/globals/trust")
require("scripts/globals/weaponskillids")
-----------------------------------

function onMagicCastingCheck(caster, target, spell)
    return tpz.trust.canCast(caster, spell)
end

function onSpellCast(caster, target, spell)
    return tpz.trust.spawn(caster, spell)
end


function onMobSpawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.SPAWN)
    -- Unity ranking high : tpz.trust.message(mob, tpz.trust.message_offset.TEAMWORK_1)

    -- TODO: Nott weaponskill needs implemented and logic added here for Apururu to use at 50% MP at level 50.
    -- TODO: UC trusts are supposed to get bonuses depending on unity ranking. Needs research.
    -- TODO: Custom spawn messages if Unity ranking is higher.

    mob:addListener("COMBAT_TICK", "APURURU_UC_CTICK", function(mobArg)
        if os.time() > mobArg:getLocalVar("COMBAT_TICK_PAUSE_TIME") then
            local party = mobArg:getMaster():getPartyWithTrusts()

            for _, member in pairs(party) do
                local mobMPP    = (mobArg:getMP() / mobArg:getMaxMP()) * 100
                local memberMPP = (member:getMP() / member:getMaxMP()) * 100

                if member:getHPP() <= 50 and mobMPP <= 10 then
-- printf("apururu_uc.lua COMBAT_TICK LISTENER  MARTYR  Member HPP: [%1.2f]  Mob MPP: [%1.2f]", member:getHPP(), mobMPP)
                    mobArg:useJobAbility(tpz.jobAbility.MARTYR, member)
                end

                if memberMPP <= 20 and mobArg:getHPP() >= 20 then
-- printf("apururu_uc.lua COMBAT_TICK LISTENER  DEVOTION  Member MPP: [%1.2f]  Mob HPP: [%1.2f]", memberMPP, mobArg:getHPP())
                    mobArg:useJobAbility(tpz.jobAbility.DEVOTION, member)
                end
            end

            mobArg:setLocalVar("COMBAT_TICK_PAUSE_TIME", os.time() + 3)
        end
    end)

    mob:addSimpleGambit(ai.t.SELF, ai.c.MPP_LT, 5, ai.r.JA, ai.s.SPECIFIC, tpz.ja.CONVERT)

    mob:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 25, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.CURE)

    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.SLEEP_I, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.CURAGA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.SLEEP_II, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.CURAGA)

    mob:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 75, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.CURE)

    mob:addSimpleGambit(ai.t.PARTY, ai.c.NOT_STATUS, tpz.effect.PROTECT, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.PROTECTRA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.NOT_STATUS, tpz.effect.SHELL, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.SHELLRA)

    mob:addSimpleGambit(ai.t.MELEE, ai.c.NOT_STATUS, tpz.effect.HASTE, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.HASTE)

    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.POISON, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.POISONA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.PARALYSIS, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.PARALYNA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.BLINDNESS, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.BLINDNA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.SILENCE, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.SILENA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.PETRIFICATION, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STONA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.DISEASE, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.VIRUNA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.CURSE_I, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.CURSNA)

    mob:addSimpleGambit(ai.t.SELF, ai.c.STATUS_FLAG, tpz.effectFlag.ERASABLE, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.ERASE)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS_FLAG, tpz.effectFlag.ERASABLE, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.ERASE)

    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.STONESKIN, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STONESKIN)

    -- BGwiki states 75/tick regain.  Only used for Nott WS.
    mob:addMod(tpz.mod.REGAIN, 75)
    mob:addMod(tpz.mod.CURE_POTENCY, 25)

    mob:SetAutoAttackEnabled(false)
end

function onMobDespawn(mob)
    mob:removeListener("APURURU_UC_CTICK")
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
end

function onMobDeath(mob)
    mob:removeListener("APURURU_UC_CTICK")
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
end

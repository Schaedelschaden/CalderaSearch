-----------------------------------
-- Trust: Mumor
-----------------------------------
require("scripts/globals/trust")
-----------------------------------

-- Define the main jobs with access to primary healing used to toggle Samba type
local healingJobs =
{
    tpz.job.WHM,
    tpz.job.RDM,
    tpz.job.SCH,
    tpz.job.PLD,
}

function onMagicCastingCheck(caster, target, spell)
    return tpz.trust.canCast(caster, spell, 1015)
end

function onSpellCast(caster, target, spell)
    return tpz.trust.spawn(caster, spell)
end

function onMobSpawn(mob)
    tpz.trust.teamworkMessage(mob, {
        [tpz.magic.spell.UKA_TOTLIHN] = tpz.trust.message_offset.TEAMWORK_1,
        [tpz.magic.spell.ULLEGORE   ] = tpz.trust.message_offset.TEAMWORK_2,
    })

    -- Dynamic modifier that checks party member list on tick to apply
    mob:addListener("COMBAT_TICK", "MUMOR_CTICK", function(mobArg)
        local sambaDurationBoost = 0
        local party = mobArg:getMaster():getPartyWithTrusts()
        for _, member in pairs(party) do
            if member:getObjType() == tpz.objType.TRUST then
                if
                    member:getTrustID() == tpz.magic.spell.UKA_TOTLIHN
                then
                    sambaDurationBoost = 10
                end
            end
        end
    end)
    -- Sets stance
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.SABER_DANCE, ai.r.JA, ai.s.SPECIFIC, tpz.ja.SABER_DANCE)

    -- Step usage: -DEF debuff and stuns
    -- mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, tpz.effect.WEAKENED_DAZE_5, ai.r.JA, ai.s.SPECIFIC, tpz.ja.STUTTER_STEP)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_WS, ai.r.JA, ai.s.SPECIFIC, tpz.ja.VIOLENT_FLOURISH)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_MS, ai.r.JA, ai.s.SPECIFIC, tpz.ja.VIOLENT_FLOURISH)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_JA, ai.r.JA, ai.s.SPECIFIC, tpz.ja.VIOLENT_FLOURISH)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.CASTING_MA, ai.r.JA, ai.s.SPECIFIC, tpz.ja.VIOLENT_FLOURISH)
end

function onMobFight(mob, target)
    if os.time() > mob:getLocalVar("CD") then
        local target = mob:getTarget()
        if not target:hasStatusEffect(tpz.effect.WEAKENED_DAZE_1) and mob:getTP() >= 100 then
            mob:useJobAbility(tpz.ja.STUTTER_STEP, target)
        end
        
        if target:getStatusEffect(tpz.effect.WEAKENED_DAZE_1):getTier() < 5 then
            mob:useJobAbility(tpz.ja.STUTTER_STEP, target)
        end
        
        if not mob:hasStatusEffect(tpz.effect.DRAIN_SAMBA) then
            mob:useJobAbility(tpz.ja.DRAIN_SAMBA, mob)
            mob:getMaster():addStatusEffect(tpz.effect.DRAIN_SAMBA, 3, 0, 300)
            mob:setMod(tpz.mod.ENSPELL, 19)
            mob:setMod(ypz.mod.ENSPELL_DMG, 2)
        end
        mob:setLocalVar("CD", os.time() + 5)
    end
end


function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
    mob:removeListener("MUMOR_CTICK")
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
    mob:removeListener("MUMOR_CTICK")
end



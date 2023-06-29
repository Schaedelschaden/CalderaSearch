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
        -- Always set the boost, even if Uka wasn't found.
        -- This accounts for her being in the party and giving the boost
        -- and also if she dies and the boost goes away.
        mobArg:setMod(tpz.mod.SAMBA_DURATION, sambaDurationBoost)
        local target = mobArg:getTarget()
        local family = target:getSystem()
        if family == tpz.eco.UNDEAD then
            if mobArg:getStatusEffect(tpz.effect.HASTE_SAMBA) == false then
                mobArg:useJobAbility(tpz.ja.HASTE_SAMBA, mobArg)
            end
        else 
            if mobArg:getStatusEffect(tpz.effect.DRAIN_SAMBA) == false then
                mobArg:useJobAbility(tpz.ja.DRAIN_SAMBA, mobArg)
            end
        end
        
        
        if target:getStatusEffect(tpz.effect.WEAKENED_DAZE_5) == false then
            mobArg:useJobAbility(tpz.ja.STUTTER_STEP, target)
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

    -- Samba logic
    -- Checks masters job, adjusts samba type if master has a healer main job.

    -- Adds ecosystem to adjust samba to haste if target is undead
    -- mob:addSimpleGambit(ai.t.TARGET, ai.c.IS_ECOSYSTEM, tpz.ecosystem.UNDEAD, ai.r.JA, ai.s.SPECIFIC, tpz.ja.HASTE_SAMBA)
    -- Else picks highest drain spell available
    -- mob:addSimpleGambit(ai.t.SELF, ai.c.NO_SAMBA, ai.r.JA, ai.s.BEST_SAMBA, tpz.ja.DRAIN_SAMBA)
end


function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
    mob:removeListener("MUMOR_CTICK")
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
    mob:removeListener("MUMOR_CTICK")
end



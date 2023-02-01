-----------------------------------------
-- Trust: Najelith
-----------------------------------------
require("scripts/globals/ability")
require("scripts/globals/gambits")
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/roe")
require("scripts/globals/trust")
require("scripts/globals/weaponskillids")
-----------------------------------------
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return tpz.trust.canCast(caster, spell)
end

function onSpellCast(caster, target, spell)
    return tpz.trust.spawn(caster, spell)
end

function onMobSpawn(mob)
    tpz.trust.teamworkMessage(mob, {
        [tpz.magic.spell.RUGHADJEEN]    = tpz.trust.message_offset.TEAMWORK_1,
        [tpz.magic.spell.GADALAR]       = tpz.trust.message_offset.TEAMWORK_2,
        [tpz.magic.spell.MIHLI_ALIAPOH] = tpz.trust.message_offset.TEAMWORK_3,
        [tpz.magic.spell.ZAZARG]        = tpz.trust.message_offset.TEAMWORK_4,
    })

    -- this section is the tick to check for dynamic synergy, if RUGHADJEEN dies, synergy dies.
    mob:addListener("COMBAT_TICK", "NAJELITH_CTICK", function(mobArg, target, wsid, tp, action)
        local synergy  = 0
        local master   = mobArg:getMaster()
        local party    = mobArg:getMaster():getPartyWithTrusts()
        local raccbase = mobArg:getMod(tpz.mod.RACC)
        local barrbase = mobArg:getMod(tpz.mod.BARRAGE_ACC)
        local najLock  = master:getLocalVar("najLock")

        for _, member in pairs(party) do
            if member:getObjType() == tpz.objType.TRUST then
                if
                    member:getTrustID() == tpz.magic.spell.RUGHADJEEN
                then
                    synergy = 1
                else
                    synergy = 0
                end
            end
        end

        if synergy == 1 and najLock == 0 then
            mobArg:setMod(tpz.mod.RACC, raccbase + 40)
            mobArg:setMod(tpz.mod.BARRAGE_ACC, barrbase + 40)
            master:setLocalVar("najLock", 1)
        elseif synergy == 0 and najLock == 1 then
            mobArg:setMod(tpz.mod.RACC, raccbase)
            mobArg:setMod(tpz.mod.BARRAGE_ACC, barrbase)
            master:setLocalVar("najLock", 0)
        end
    end)

    mob:addMod(tpz.mod.CRITHITRATE, 20)

    --Abilities
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.BARRAGE, ai.r.JA, ai.s.SPECIFIC, tpz.ja.BARRAGE)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.DOUBLE_SHOT, ai.r.JA, ai.s.SPECIFIC, tpz.ja.DOUBLE_SHOT)
    mob:setTrustTPSkillSettings(ai.tp.CLOSER, ai.s.HIGHEST)
end

function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
    mob:removeListener("NAJELITH_CTICK")
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
    mob:removeListener("NAJELITH_CTICK")
end

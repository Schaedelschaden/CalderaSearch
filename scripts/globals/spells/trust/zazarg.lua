-----------------------------------------
-- Trust: Zazarg
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
        [tpz.magic.spell.NAJELITH]      = tpz.trust.message_offset.TEAMWORK_3,
        [tpz.magic.spell.MIHLI_ALIAPOH] = tpz.trust.message_offset.TEAMWORK_4,
    })

    -- this section is the tick to check for dynamic synergy, if RUGHADJEEN dies, synergy dies.
    mob:addListener("COMBAT_TICK", "ZAZARG_CTICK", function(mobArg, target, wsid, tp, action)
        local synergy = 0
        local master  = mobArg:getMaster()
        local party   = mobArg:getMaster():getPartyWithTrusts()
        local attbase = mobArg:getMod(tpz.mod.ATTP)
        local zarLock  = master:getLocalVar("zarLock")

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

        if synergy == 1 and zarLock == 0 then
            mobArg:setMod(tpz.mod.ATTP, attbase + 15)
            master:setLocalVar("zarLock", 1)
        elseif synergy == 0 and zarLock == 1 then
            mobArg:setMod(tpz.mod.ATTP, attbase)
            master:setLocalVar("zarLock", 1)
        end
    end)

    --Modifiers
    mob:addMod(tpz.mod.KICK_ATTACK_RATE, 14)
    mob:addMod(tpz.mod.COUNTER, 12)


    --Abilities
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.FOCUS, ai.r.JA, ai.s.SPECIFIC, tpz.ja.FOCUS) -- Supposed to use Focus ONLY if his Accuracy is lower than Targets Evasion

end

function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
    mob:removeListener("ZAZARG_CTICK")
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
    mob:removeListener("ZAZARG_CTICK")
end

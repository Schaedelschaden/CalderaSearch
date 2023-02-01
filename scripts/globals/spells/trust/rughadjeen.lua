-----------------------------------------
-- Trust: Rughadjeen
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
        [tpz.magic.spell.MIHLI_ALIAPOH] = tpz.trust.message_offset.TEAMWORK_1,
        [tpz.magic.spell.GADALAR]       = tpz.trust.message_offset.TEAMWORK_2,
        [tpz.magic.spell.NAJELITH]      = tpz.trust.message_offset.TEAMWORK_3,
        [tpz.magic.spell.ZAZARG]        = tpz.trust.message_offset.TEAMWORK_4,
    })

    --this feeds synergy back to Rughadjeen after another general is summoned.
    mob:addListener("COMBAT_TICK", "RUGHADJEEN_CTICK", function(mobArg, target, wsid, tp, action)
        local master  = mobArg:getMaster()
        local synergy = 0
        local party   = mobArg:getMaster():getPartyWithTrusts()
        local dtbase  = mobArg:getMod(tpz.mod.DMG)
        local rugLock = master:getLocalVar("rugLock")

        for _, member in pairs(party) do
            if member:getObjType() == tpz.objType.TRUST then
                if member:getTrustID() == tpz.magic.spell.MIHLI_ALIAPOH or
                    member:getTrustID() == tpz.magic.spell.GALADAR or
                    member:getTrustID() == tpz.magic.spell.NAJELITH or
                    member:getTrustID() == tpz.magic.spell.ZAZARG
                then
                    synergy = 1
                else
                    synergy = 0
                end
            end
        end

        if synergy == 1 and rugLock == 0 then
            mobArg:setMod(tpz.mod.DMG, dtbase - 29)
            master:setLocalVar("rugLock", 1)
        elseif synergy == 0 and rugLock == 1 then
            mobArg:setMod(tpz.mod.DMG, dtbase - 5)
            master:setLocalVar("rugLock", 0)
        end
    end)

    --Modifiers
    local power = mob:getMainLvl()
    mob:addMod(tpz.mod.FASTCAST, 30)
    mob:addMod(tpz.mod.CURE_POTENCY, 30)
    mob:addStatusEffect(tpz.effect.MAX_HP_BOOST, 20, 0, 0) --If this doesnt work, try HPP (HP %)
    mob:addStatusEffect(tpz.effect.MAX_MP_BOOST, 50, 0, 0) --If this doesnt work, try HPP (HP %)
    mob:addMod(tpz.mod.TRIPLE_ATTACK, 3)
    mob:addStatusEffect(tpz.effect.ENFIRE, power, 0, 0)
    mob:setHP(mob:getMaxHP())
    mob:setMP(mob:getMaxMP())


    --Abilities
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.SENTINEL, ai.r.JA, ai.s.SPECIFIC, tpz.ja.SENTINEL)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.DIVINE_EMBLEM, ai.r.JA, ai.s.SPECIFIC, tpz.ja.DIVINE_EMBLEM)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, tpz.effect.FLASH, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.FLASH) --Placed under Divine Emblem to hopefully force boosted Flash
    mob:addSimpleGambit(ai.t.TARGET, ai.c.SC_AVAILABLE, 0, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.HOLY) --Placed above Chivalry just to use it.
    mob:addSimpleGambit(ai.t.SELF, ai.c.MPP_LT, 50, ai.r.JA, ai.s.SPECIFIC, tpz.ja.CHIVALRY)

    --Special Features
    mob:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 75, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.CURE)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.SLEEP_I, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.CURE)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.SLEEP_II, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.CURE)

end

function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
    mob:removeListener("RUGHADJEEN_CTICK")
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
    mob:removeListener("RUGHADJEEN_CTICK")
end

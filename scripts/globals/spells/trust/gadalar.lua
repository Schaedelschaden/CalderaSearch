-----------------------------------
-- Trust: Gadalar
-----------------------------------
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
    tpz.trust.message(mob, tpz.trust.message_offset.SPAWN)

    tpz.trust.teamworkMessage(mob, {
        [tpz.magic.spell.RUGHADJEEN]    = tpz.trust.message_offset.TEAMWORK_1,
        [tpz.magic.spell.MIHLI_ALIAPOH] = tpz.trust.message_offset.TEAMWORK_2,
        [tpz.magic.spell.NAJELITH]      = tpz.trust.message_offset.TEAMWORK_3,
        [tpz.magic.spell.ZAZARG]        = tpz.trust.message_offset.TEAMWORK_4,
    })

    -- this section is the tick to check for dynamic synergy, if RUGHADJEEN dies, synergy dies.
    mob:addListener("COMBAT_TICK", "GADALAR_CTICK", function(mobArg, target, wsid, tp, action)
        local synergy  = 0
        local master   = mobArg:getMaster()
        local party    = mobArg:getMaster():getPartyWithTrusts()
        local mattbase = mobArg:getMod(tpz.mod.MATT)
        local maccbase = mobArg:getMod(tpz.mod.MACC)
        local gadLock  = master:getLocalVar("gadLock")

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

        if synergy == 1 and gadLock == 0 then
            local power = mobArg:getMainLvl() / 1.25
            mobArg:setMod(tpz.mod.MATT, mattbase + 64)
            mobArg:setMod(tpz.mod.MACC, maccbase + power)
            master:setLocalVar("gadLock", 1)
        elseif synergy == 0 and gadLock == 1 then
            mobArg:setMod(tpz.mod.MATT, mattbase - 64)
            mobArg:setMod(tpz.mod.MACC, maccbase - power)
            master:setLocalVar("gadLock", 0)
        end
        
        if os.time() > mobArg:getLocalVar("magicCooldown") then
            local mLvl   = mobArg:getMainLvl()
            if mLvl >= 86 then
                local target = mobArg:getTarget()
                mobArg:castSpell(148, target)
            elseif mLvl >= 73 and mLvl < 86 then
                local target = mobArg:getTarget()
                mobArg:castSpell(147, target)
            elseif mLvl >= 62 and mLvl < 73 then
                local target = mobArg:getTarget()
                mobArg:castSpell(146, target)
            elseif mLvl >= 38 and mLvl < 62 then
                local target = mobArg:getTarget()
                mobArg:castSpell(145, target)
            elseif mLvl >= 13 and mLvl < 38 then
                local target = mobArg:getTarget()
                mobArg:castSpell(144, target)
            end
            mobArg:setLocalVar("magicCooldown", os.time() + 30)
        end
    end)

    --Modifiers
    mob:addStatusEffect(tpz.effect.MAX_MP_BOOST, 20, 0, 0) --If this doesnt work, try MPP (MP %)
    mob:addMod(tpz.mod.ABSORB_DMG_TO_MP, 20) --Adjust value as needed.
    mob:setMP(mob:getMaxMP())
    mob:setMod(tpz.mod.FASTCAST, 50)

    --Spells
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.BLAZE_SPIKES, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.BLAZE_SPIKES)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.MB_AVAILABLE, 0, ai.r.MA, ai.s.MB_ELEMENT, tpz.magic.spellFamily.FIRE)
    -- mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_SC_AVAILABLE, 0, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.FIRAGA, 30) -- without a cooldown, he just AOE nukes until his mp is gone.
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_WS, 0, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STUN)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_MS, 0, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STUN)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_JA, 0, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STUN)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.CASTING_MA, 0, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STUN)
end


function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
    mob:removeListener("GADALAR_CTICK")
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
    mob:removeListener("GADALAR_CTICK")
end

-----------------------------------------
-- Trust: AATT
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
	tpz.trust.message(mob, tpz.trust.message_offset.SPAWN)

    mob:addListener("COMBAT_TICK", "AATT_CTICK", function(mobArg, target, wsid, tp, action) -- synergy
        local synergy = 0
        local master  = mobArg:getMaster()
        local party   = mobArg:getMaster():getPartyWithTrusts()
        local base    = mobArg:getMod(tpz.mob.MEVA)
        local ttLock  = master:getLocalVar("ttLock")

        for _, member in pairs(party) do
            if member:getObjType() == tpz.objType.TRUST then
                if
                    member:getTrustID() == tpz.magic.spell.AAHM or
                    member:getTrustID() == tpz.magic.spell.AAEV or
                    member:getTrustID() == tpz.magic.spell.AAMR or
                    member:getTrustID() == tpz.magic.spell.AAGK
                then
                    synergy = synergy + 1
                else
                    synergy = 0
                end
            end
        end

        if synergy == 1 and evLock == 0 then
            mobArg:setMod(tpz.mod.MEVA, base + 60)
            master:getLocalVar("ttLock", 1)
        elseif synergy == 2 and evLock == 0 then
            mobArg:setMod(tpz.mod.MEVA, base + 120)
            master:getLocalVar("ttLock", 2)
        elseif synergy == 3 and evLock == 0 then
            mobArg:setMod(tpz.mod.MEVA, base + 180)
            master:getLocalVar("ttLock", 3)
        elseif synergy == 4 and evLock == 0 then
            mobArg:setMod(tpz.mod.MEVA, base + 240) 
            master:getLocalVar("ttLock", 4)
        elseif synergy == 3 and evLock == 4 then
            mobArg:setMod(tpz.mod.MEVA, base - 60)
            master:getLocalVar("ttLock", 3)
        elseif synergy == 2 and evLock == 3 then
            mobArg:setMod(tpz.mod.MEVA, base - 60)
            master:getLocalVar("ttLock", 2)
        elseif synergy == 1 and evLock == 2 then
            mobArg:setMod(tpz.mod.MEVA, base - 60)
            master:getLocalVar("ttLock", 1)        
        end
    end)


	--Modifiers (All build Magic Damage Taken)

    mob:addStatusEffect(tpz.effect.MAX_HP_BOOST, 20, 0, 0) --If this doesnt work, try HPP (HP %)
    mob:addStatusEffect(tpz.effect.MAX_MP_BOOST, 50, 0, 0) --If this doesnt work, try HPP (HP %)
	mob:setHP(mob:getMaxHP())
    mob:setMP(mob:getMaxMP())
    mob:setMod(tpz.mod.TRUST_GENERIC_SPELL_RECAST, 38000)
    
    
	--Spells
    -- mob:addSimpleGambit(ai.t.SELF, ai.c.HAS_TOP_ENMITY, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.ELEMENTAL_SEAL)
    -- mob:addSimpleGambit(ai.t.SELF, ai.c.HAS_TOP_ENMITY, 0, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.SLEEPGA)
    --mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, tpz.effect.POISON, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.POISON)
    --mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, tpz.effect.BIO, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.BIO)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_WS, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STUN)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_MS, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STUN)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_JA, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STUN)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.CASTING_MA, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STUN)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.ALWAYS, 0, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.ASPIR)

	--Abilities
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.LAST_RESORT, ai.r.JA, ai.s.SPECIFIC, tpz.ja.LAST_RESORT)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.SOULEATER, ai.r.JA, ai.s.SPECIFIC, tpz.ja.SOULEATER)
    
    mob:addSimpleGambit(ai.t.TARGET, ai.c.MB_AVAILABLE, 0, ai.r.MA, ai.s.MB_ELEMENT, tpz.magic.spellFamily.NONE)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_SC_AVAILABLE, 0, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.NONE)


end

function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
    mob:removeListener("AATT_CTICK")
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
    mob:removeListener("AATT_CTICK")
end

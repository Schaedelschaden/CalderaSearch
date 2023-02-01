-----------------------------------------
-- Trust: AAEV
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

    -- Handle synergy bonuses from other AA's
    mob:addListener("COMBAT_TICK", "AAEV_CTICK", function(mobArg, target, wsid, tp, action)
        local synergy = 0
        local master  = mobArg:getMaster()
        local party   = mobArg:getMaster():getPartyWithTrusts()
        local base    = mobArg:getMod(tpz.mob.MEVA)
        local evLock  = master:getLocalVar("evLock")

        for _, member in pairs(party) do
            if member:getObjType() == tpz.objType.TRUST then
                if member:getTrustID() == tpz.magic.spell.AAHM or 
                    member:getTrustID() == tpz.magic.spell.AAGK or 
                    member:getTrustID() == tpz.magic.spell.AAMR or 
                    member:getTrustID() == tpz.magic.spell.AATT 
                then
                    synergy = synergy + 1
                else
                    synergy = 0
                end
            end
        end

        if synergy == 1 and evLock == 0 then
            mobArg:setMod(tpz.mod.MEVA, base + 60)
            master:getLocalVar("evLock", 1)
        elseif synergy == 2 and evLock == 0 then
            mobArg:setMod(tpz.mod.MEVA, base + 120)
            master:getLocalVar("evLock", 2)
        elseif synergy == 3 and evLock == 0 then
            mobArg:setMod(tpz.mod.MEVA, base + 180)
            master:getLocalVar("evLock", 3)
        elseif synergy == 4 and evLock == 0 then
            mobArg:setMod(tpz.mod.MEVA, base + 240) 
            master:getLocalVar("evLock", 4)
        elseif synergy == 3 and evLock == 4 then
            mobArg:setMod(tpz.mod.MEVA, base - 60)
            master:getLocalVar("evLock", 3)
        elseif synergy == 2 and evLock == 3 then
            mobArg:setMod(tpz.mod.MEVA, base - 60)
            master:getLocalVar("evLock", 2)
        elseif synergy == 1 and evLock == 2 then
            mobArg:setMod(tpz.mod.MEVA, base - 60)
            master:getLocalVar("evLock", 1)        
        end
    end)

    -- Add trust bonuses
    mob:addStatusEffect(tpz.effect.MAX_HP_BOOST, 20, 0, 0) --If this doesnt work, try HPP (HP %)
    mob:addStatusEffect(tpz.effect.MAX_MP_BOOST, 50, 0, 0) --If this doesnt work, try HPP (HP %)
    mob:setHP(mob:getMaxHP())
    mob:setMP(mob:getMaxMP())

    mob:addMod(tpz.mod.REGEN, 3)
    mob:addMod(tpz.mod.REFRESH, 3)
    mob:addMod(tpz.mod.FASTCAST, 50)
    mob:addMod(tpz.mod.CURE_POTENCY, 50)
    mob:addMod(tpz.mod.DMG, -10)
    mob:addMod(tpz.mod.MDEF, 22)
    mob:addMod(tpz.mod.ABSORB_DMG_TO_MP, 5)
    mob:addMod(tpz.mod.ENMITY, 50)

    mob:setMobMod(tpz.mobMod.MOBMOD_CAN_SHIELD_BLOCK, 1)
    mob:setMod(tpz.mod.SHIELDBLOCKRATE, 45)

	--Abilities
    --Lacks Provoke, Maintains enmity with Divine Emblem Flashes and Sentinel
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.SENTINEL, ai.r.JA, ai.s.SPECIFIC, tpz.ja.SENTINEL)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.DIVINE_EMBLEM, ai.r.JA, ai.s.SPECIFIC, tpz.ja.DIVINE_EMBLEM)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, tpz.effect.FLASH, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.FLASH)
    --Uses Palisade or Reprisal (IF DONE CORRECTLY - AAEV SHOULD alternate between Palisade and Reprisal, not use both)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.PALISADE, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.REPRISAL)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.REPRISAL, ai.r.JA, ai.s.SPECIFIC, tpz.ja.PALISADE)
    --Uses Rampart if enemy is under the effect of Chainspell, Manafont, or Astral Flow
    mob:addSimpleGambit(ai.t.TARGET, ai.c.STATUS, tpz.effect.CHAINSPELL, ai.r.JA, ai.s.SPECIFIC, tpz.ja.RAMPART)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.STATUS, tpz.effect.MANAFONT, ai.r.JA, ai.s.SPECIFIC, tpz.ja.RAMPART)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.STATUS, tpz.effect.ASTRAL_FLOW, ai.r.JA, ai.s.SPECIFIC, tpz.ja.RAMPART)
    --Uses Chivalry at MP<50%
    mob:addSimpleGambit(ai.t.SELF, ai.c.MPP_LT, 50, ai.r.JA, ai.s.SPECIFIC, tpz.ja.CHIVALRY)

    --Spells (Not marked above)
    --Uses Phalanx
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.PHALANX, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.PHALANX)
    --Uses Enlight
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.ENLIGHT, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.ENLIGHT)
    --Uses Cure spells
    mob:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 75, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.CURE)

end

function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
    mob:removeListener("AAEV_CTICK")
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
    mob:removeListener("AAEV_CTICK")
end

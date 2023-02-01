-----------------------------------------
-- Trust: AAGK
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

    mob:addListener("COMBAT_TICK", "AAGK_CTICK", function(mobArg, target, wsid, tp, action) -- synergy
        local synergy = 0
        local master  = mobArg:getMaster()
        local party   = mobArg:getMaster():getPartyWithTrusts()
        local base    = mobArg:getMod(tpz.mob.MEVA)
        local gkLock  = master:getLocalVar("gkLock")

        for _, member in pairs(party) do
            if member:getObjType() == tpz.objType.TRUST then
                if member:getTrustID() == tpz.magic.spell.AAHM or 
                    member:getTrustID() == tpz.magic.spell.AAEV or 
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
            master:getLocalVar("gkLock", 1)
        elseif synergy == 2 and evLock == 0 then
            mobArg:setMod(tpz.mod.MEVA, base + 120)
            master:getLocalVar("gkLock", 2)
        elseif synergy == 3 and evLock == 0 then
            mobArg:setMod(tpz.mod.MEVA, base + 180)
            master:getLocalVar("gkLock", 3)
        elseif synergy == 4 and evLock == 0 then
            mobArg:setMod(tpz.mod.MEVA, base + 240) 
            master:getLocalVar("gkLock", 4)
        elseif synergy == 3 and evLock == 4 then
            mobArg:setMod(tpz.mod.MEVA, base - 60)
            master:getLocalVar("gkLock", 3)
        elseif synergy == 2 and evLock == 3 then
            mobArg:setMod(tpz.mod.MEVA, base - 60)
            master:getLocalVar("gkLock", 2)
        elseif synergy == 1 and evLock == 2 then
            mobArg:setMod(tpz.mod.MEVA, base - 60)
            master:getLocalVar("gkLock", 1)        
        end
    end)

    --Modifiers
    mob:addStatusEffect(tpz.effect.MAX_HP_BOOST, 20, 0, 0) --supposed to be 20% may need to switch to HPP
	mob:setHP(mob:getMaxHP())

    --Occasionally triggers Fotia set SAVETP effect
    mob:addMod(tpz.mod.WS_NO_DEPLETE, 15) --15% Chance weapon skill consumes no TP (May need adjusted down)

    --Jump High TP Return Mod
    mob:addMod(tpz.mod.JUMP_TP_BONUS, 790) --TP Returned on Jumps (May need to be lowered or raised to meet the original 790 TP return)
	--Abilities
    --Enmity Shed
    mob:addSimpleGambit(ai.t.SELF, ai.c.HAS_TOP_ENMITY, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.HIGH_JUMP)
    --Hasso
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.HASSO, ai.r.JA, ai.s.SPECIFIC, tpz.ja.HASSO)
    --TP Gains
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.MEDITATE, ai.r.JA, ai.s.SPECIFIC, tpz.ja.MEDITATE)
    mob:addSimpleGambit(ai.t.SELF, ai.c.TP_LT, 1000, ai.r.JA, ai.s.SPECIFIC, tpz.ja.JUMP)
	--Pre Weapon Skill
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.HAGAKURE, ai.r.JA, ai.s.SPECIFIC, tpz.ja.HAGAKURE)
    mob:addSimpleGambit(ai.t.SELF, ai.c.TP_GTE, 2000, ai.r.JA, ai.s.SPECIFIC, tpz.ja.SEKKANOKI)

    mob:setTrustTPSkillSettings(ai.tp.CLOSER, ai.s.HIGHEST)
end

function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
    mob:removeListener("AAGK_CTICK")
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
    mob:removeListener("AAGK_CTICK")
end

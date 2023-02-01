-----------------------------------------
-- Trust: AAHM
-----------------------------------------
require("scripts/globals/ability")
require("scripts/globals/gambits")
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/roe")
require("scripts/globals/trust")
require("scripts/globals/weaponskillids")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return tpz.trust.canCast(caster, spell)
end

function onSpellCast(caster, target, spell)
    return tpz.trust.spawn(caster, spell)
end

function onMobSpawn(mob)
	tpz.trust.message(mob, tpz.trust.message_offset.SPAWN)

    mob:addListener("COMBAT_TICK", "AAHM_CTICK", function(mobArg, target, wsid, tp, action) -- synergy
        local synergy = 0
        local master  = mobArg:getMaster()
        local party   = mobArg:getMaster():getPartyWithTrusts()
        local base    = mobArg:getMod(tpz.mob.MEVA)
        local hmLock  = master:getLocalVar("hmLock")

        for _, member in pairs(party) do
            if member:getObjType() == tpz.objType.TRUST then
                if member:getTrustID() == tpz.magic.spell.AAEV or 
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
            master:getLocalVar("hmLock", 1)
        elseif synergy == 2 and evLock == 0 then
            mobArg:setMod(tpz.mod.MEVA, base + 120)
            master:getLocalVar("hmLock", 2)
        elseif synergy == 3 and evLock == 0 then
            mobArg:setMod(tpz.mod.MEVA, base + 180)
            master:getLocalVar("hmLock", 3)
        elseif synergy == 4 and evLock == 0 then
            mobArg:setMod(tpz.mod.MEVA, base + 240) 
            master:getLocalVar("hmLock", 4)
        elseif synergy == 3 and evLock == 4 then
            mobArg:setMod(tpz.mod.MEVA, base - 60)
            master:getLocalVar("hmLock", 3)
        elseif synergy == 2 and evLock == 3 then
            mobArg:setMod(tpz.mod.MEVA, base - 60)
            master:getLocalVar("hmLock", 2)
        elseif synergy == 1 and evLock == 2 then
            mobArg:setMod(tpz.mod.MEVA, base - 60)
            master:getLocalVar("hmLock", 1)        
        end
        
        local mlvl   = mobArg:getMainLvl()
        local target = mobArg:getTarget()
        
        --UTSUSEMI
        if not mobArg:hasStatusEffect(tpz.effect.COPY_IMAGE) and mlvl > 11 and mlvl < 37 then
            mobArg:castSpell(338, mobArg)
        elseif not mobArg:hasStatusEffect(tpz.effect.COPY_IMAGE) and mlvl > 36 then
            mobArg:castSpell(339, mobArg)
        end
    end)


	--Modifiers

    mob:addStatusEffect(tpz.effect.MAX_HP_BOOST, 20, 0, 0) --supposed to be 20% may need to switch to HPP
    mob:setHP(mob:getMaxHP())
    mob:addMod(tpz.mod.UTSUSEMI_BONUS, 1) --Gives one additional Shadow (should)

	--Spells
    --mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.COPY_IMAGE, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.UTSUSEMI)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.MIGAWARI, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.MIGAWARI_ICHI)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_HAS_TOP_ENMITY, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.HOJO, 60)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_HAS_TOP_ENMITY, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.KURAYAMI, 60)

	--Abilities
		--Tank Stance
    mob:addSimpleGambit(ai.t.SELF, ai.c.HAS_TOP_ENMITY, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.YONIN)
    mob:addSimpleGambit(ai.t.SELF, ai.c.HAS_TOP_ENMITY, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.WARCRY)
		--Damage Stance
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_HAS_TOP_ENMITY, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.INNIN)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_HAS_TOP_ENMITY, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.BERSERK)
		--Provokes regularly to remain Off-Tank
    mob:addSimpleGambit(ai.t.TARGET, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.PROVOKE)
end

function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
    mob:removeListener("AAHM_CTICK")
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
    mob:removeListener("AAHM_CTICK")
end

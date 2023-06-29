-----------------------------------------
-- Trust: Ovjang
-----------------------------------------
require("scripts/globals/trust")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return tpz.trust.canCast(caster, spell)
end

function onSpellCast(caster, target, spell)
    return tpz.trust.spawn(caster, spell)
end

function onMobSpawn(mob)

    mob:addListener("COMBAT_TICK", "OVJANG_CTICK", function(mobArg)
        local enmity = 0
        local mDmg   = 0
        local party  = mobArg:getMaster():getPartyWithTrusts()
        local power  = 0
        for _, member in pairs(party) do
            if member:getObjType() == tpz.objType.TRUST then
                if
                    member:getTrustID() == tpz.magic.spell.NASHMEIRA
                then
                    power  = mobArg:getMainLvl()
                    enmity = -10
                end
            end
        end
        mobArg:setMod(tpz.mod.MAGIC_DAMAGE, power)
        mobArg:setMod(tpz.mod.ENMITY, enmity)
    end)


    mob:addStatusEffect(tpz.effect.MAX_MP_BOOST, 20, 0, 0)
    mob:setMP(mob:getMaxMP())

    mob:addSimpleGambit(ai.t.TARGET, ai.c.STATUS_FLAG, tpz.effectFlag.DISPELABLE, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.DISPEL)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.CASTING_MA, 0, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.SILENCE) --Not sure if the 0 is needed here
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_WS, 0, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STUN) --Not sure if the 0 is needed here
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_MS, 0, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STUN) --Not sure if the 0 is needed here
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_JA, 0, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STUN) --Not sure if the 0 is needed here
    
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, tpz.effect.SLOW, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.SLOW, 60)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, tpz.effect.PARALYSIS, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.PARALYZE, 60)
    
    mob:addSimpleGambit(ai.t.TARGET, ai.c.MB_AVAILABLE, 0, ai.r.MA, ai.s.MB_ELEMENT, tpz.magic.spellFamily.NONE, 5)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_SC_AVAILABLE, 0, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.NONE, 45)
    
    mob:setMobMod(tpz.mobMod.MAGIC_COOL, 20)

end

function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
    mob:removeListener("OVJANG_CTICK")
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
    mob:removeListener("OVJANG_CTICK")
end

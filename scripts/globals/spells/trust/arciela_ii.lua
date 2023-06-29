-----------------------------------------
-- Trust: Arciela II
-----------------------------------------
require("scripts/globals/trust")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return tpz.trust.canCast(caster, spell, 965)
end

function onSpellCast(caster, target, spell)
    return tpz.trust.spawn(caster, spell)
end

function onMobSpawn(mob)
    mob:addStatusEffect(tpz.effect.MAX_HP_BOOST, 10, 0, 0)
    mob:addStatusEffect(tpz.effect.MAX_MP_BOOST, 25, 0, 0)
    mob:setHP(mob:getMaxHP())
    mob:setMP(mob:getMaxMP())
    mob:addMod(tpz.mod.REFRESH, 10)
    mob:addMod(tpz.mod.FASTCAST, 100)
    mob:addMod(tpz.mod.ENH_MAGIC_DURATION, 25)
    mob:SetMobSkillAttack(1235) 
    mob:setSpellList(426)
    mob:addMod(tpz.mod.MAIN_DMG_RATING, mob:getMainLvl() / 2)
    
    mob:addSimpleGambit(ai.t.TARGET, ai.c.MB_AVAILABLE, 0, ai.r.MA, ai.s.MB_ELEMENT, tpz.magic.spellFamily.NONE, 5)
    mob:addSimpleGambit(ai.t.SELF, ai.c.MPP_LT, 5, ai.r.JA, ai.s.SPECIFIC, tpz.ja.CONVERT)

    mob:addSimpleGambit(ai.t.PARTY, ai.c.NOT_STATUS, tpz.effect.HASTE, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.HASTE)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.NOT_STATUS, tpz.effect.REFRESH, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.REFRESH)
    mob:addSimpleGambit(ai.t.RANGED, ai.c.NOT_STATUS, tpz.effect.FLURRY, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.FLURRY)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.NOT_STATUS, tpz.effect.PHALANX, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.PHALANX)

    mob:addSimpleGambit(ai.t.TARGET, ai.c.STATUS_FLAG, tpz.effectFlag.DISPELABLE, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.DISPEL)

    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, tpz.effect.SLOW, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.SLOW, 60)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, tpz.effect.ADDLE, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.ADDLE, 60)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, tpz.effect.PARALYSIS, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.PARALYZE, 60)
    
    mob:addSimpleGambit(ai.t.PARTY, ai.c.NOT_STATUS, tpz.effect.PROTECT, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.PROTECT)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.NOT_STATUS, tpz.effect.SHELL, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.SHELL)

end

function onMobFight(mob)
    
    if os.time() > mob:getLocalVar("Arciela") then
        if mob:getTP() >= 1000 then
            mob:useMobAbility(math.random(3580, 3584))
        end
        mob:setLocalVar("Arciela", os.time() + 10)
    end         

    if os.time() > mob:getLocalVar("NakuulsVengeance") and mob:getHPP() <= 50 then
        mob:useMobAbility(3585)
        mob:setHP(mob:getMaxHP())
        mob:setMP(mob:getMaxMP())
        mob:setLocalVar("NakuulsVengeance", os.time() + 300)
    end
    
    if os.time() > mob:getLocalVar("ArcielaNuke") then            
        mob:castSpell(math.random(144, 173))
        mob:setLocalVar("ArcielaNuke", os.time() + 5)
    end
end

function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
end
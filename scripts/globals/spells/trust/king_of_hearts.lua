-----------------------------------------
-- Trust: King of Hearts
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
    tpz.trust.message(mob, tpz.trust.message_offset.SPAWN)
    
    mob:addStatusEffect(tpz.effect.COMPOSURE, 1, 0, 0)
    mob:setMod(tpz.mod.AUGMENT_COMPOSURE, 90)
    mob:setMod(tpz.mod.FASTCAST, 50)
    mob:addStatusEffect(tpz.effect.MAX_MP_BOOST, 80, 0, 0) 
    mob:setMP(mob:getMaxMP())
    
    -- mob:addSimpleGambit(ai.t.TARGET, ai.c.MB_AVAILABLE, 0, ai.r.MA, ai.s.MB_ELEMENT, tpz.magic.spellFamily.FIRAGA, 5)
    
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.DOOM, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.CURSNA) 
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.POISON, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.POISONA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.PARALYSIS, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.PARALYNA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.BLINDNESS, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.BLINDNA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.SILENCE, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.SILENA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.PETRIFICATION, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STONA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.DISEASE, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.VIRUNA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.CURSE_I, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.CURSNA)
    mob:addSimpleGambit(ai.t.SELF, ai.c.STATUS_FLAG, tpz.effectFlag.ERASABLE, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.ERASE)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS_FLAG, tpz.effectFlag.ERASABLE, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.ERASE)
      
    mob:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 50, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.CURE)

    mob:addSimpleGambit(ai.t.MASTER, ai.c.NOT_STATUS, tpz.effect.HASTE, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.HASTE)
    mob:addSimpleGambit(ai.t.MASTER, ai.c.NOT_STATUS, tpz.effect.REFRESH, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.REFRESH)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.HASTE, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.HASTE)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.REFRESH, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.REFRESH)
    mob:addSimpleGambit(ai.t.RANGED, ai.c.NOT_STATUS, tpz.effect.FLURRY, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.FLURRY)
    mob:addSimpleGambit(ai.t.MASTER, ai.c.NOT_STATUS, tpz.effect.PHALANX, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.PHALANX)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.MULTI_STRIKES, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.TEMPER)

    mob:addSimpleGambit(ai.t.TARGET, ai.c.STATUS_FLAG, tpz.effectFlag.DISPELABLE, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.DISPEL)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, tpz.effect.DIA, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.DIA, 60)

    mob:addSimpleGambit(ai.t.PARTY, ai.c.NOT_STATUS, tpz.effect.PROTECT, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.PROTECT)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.NOT_STATUS, tpz.effect.SHELL, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.SHELL)
end

function onMobFight(mob, target)
    if os.time() > mob:getLocalVar("ONMOBFIGHT_PAUSE_TIME") then
        if mob:getTP() >= 1000 then
            if target:hasStatusEffectByFlag(tpz.effectFlag.DISPELABLE) then
                mob:useMobAbility(330)
            else
                local WS = { 333, 684, 683 }
                mob:useMobAbility(WS[math.random(1, 3)])
            end
        end
        mob:setLocalVar("ONMOBFIGHT_PAUSE_TIME", os.time() + 3)
    end
    
    if os.time() > mob:getLocalVar("MAGICBURST") then
        local MB = target:getStatusEffect(tpz.effect.SKILLCHAIN)
        if MB ~= nil and MB:getTier() > 0 then
            mob:timer(3000, function(mobArg)
                local target = mobArg:getTarget()
                local lvl    = mobArg:getMainLvl()
                if lvl >= 28 and lvl < 53 then
                    mobArg:castSpell(174, target) -- FIRAGA
                elseif lvl >= 53 and lvl < 69 then
                    mobArg:castSpell(175, target) -- FIRAGA II
                elseif lvl >= 69 and lvl < 99 then
                    mobArg:castSpell(176, target) -- FIRAGA III
                elseif lvl >= 99 then
                    mobArg:castSpell(177, target) -- FIRAGA IV
                end
                mobArg:setLocalVar("MAGICBURST", os.time() + 1)
            end)
        end
    end
end


function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
end
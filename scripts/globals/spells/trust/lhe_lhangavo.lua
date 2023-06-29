-----------------------------------------
-- Trust: Lhe Lhangavo
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
    mob:addMod(tpz.mod.MAIN_DMG_RATING, mob:getMainLvl() / 2.75)
    mob:addMod(tpz.mod.WSACC, 40)
    mob:addMod(tpz.mod.CHAKRA_MULT, mob:getMainLvl() / 3)
    mob:setMod(tpz.mod.COUNTER, 30)
    local ctrDmg = mob:getMainLvl() / 1.5
    mob:setMod(tpz.mod.COUNTER_DMG, ctrDmg)

    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.BERSERK, ai.r.JA, ai.s.SPECIFIC, tpz.ja.BERSERK)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.WARCRY, ai.r.JA, ai.s.SPECIFIC, tpz.ja.WARCRY)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.FOCUS, ai.r.JA, ai.s.SPECIFIC, tpz.ja.FOCUS)
    mob:addSimpleGambit(ai.t.SELF, ai.c.HAS_TOP_ENMITY, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.DODGE)
    mob:addSimpleGambit(ai.t.SELF, ai.c.STATUS, tpz.effect.DODGE, ai.r.JA, ai.s.SPECIFIC, tpz.ja.COUNTERSTANCE)
    mob:addSimpleGambit(ai.t.SELF, ai.c.HPP_LT, 66, ai.r.JA, ai.s.SPECIFIC, tpz.ja.CHAKRA)
    mob:addSimpleGambit(ai.t.SELF, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.CHI_BLAST)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.MAX_HP_BOOST, ai.r.JA, ai.s.SPECIFIC, tpz.ja.MANTRA)
    mob:addSimpleGambit(ai.t.SELF, ai.c.STATUS, tpz.effect.MAX_HP_BOOST, ai.r.JA, ai.s.SPECIFIC, tpz.ja.CHAKRA)
    mob:addMod(tpz.mod.DOUBLE_ATTACK, 100)
    mob:setHP(mob:getMaxHP())
end

function onMobFight(mob)
    local target = mob:getTarget()
    local shuffle = math.random(1, 5)
    
    if os.time() > mob:getLocalVar("SKILL_ROTATE") then
        if mob:getTP() >= 1000 then
            if shuffle == 1 then
                mob:useWeaponskill(15, target)
            elseif shuffle == 2 then
                mob:useWeaponskill(14, target)
            elseif shuffle == 3 then
                mob:useWeaponskill(13, target)
            elseif shuffle == 4 then
                mob:useWeaponskill(9, target)
            elseif shuffle == 5 then
                mob:useWeaponskill(7, target)    
            end
        end
        mob:setLocalVar("SKILL_ROTATE", os.time() + 5)        
    end    
    
    local target = mob:getTarget()
    local family = target:getSystem()
    if family == tpz.eco.AMORPH then
        mob:useJobAbility(tpz.ja.FORMLESS_STRIKES, mob)
    end 
end

function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
end
-----------------------------------------
-- Trust: Invincible Shield UC
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
    mob:addMod(tpz.mod.MAIN_DMG_RATING, mob:getMainLvl())
    mob:addMod(tpz.mod.WSACC, 40)
    mob:addMod(tpz.mod.STORE_TP, 100)
    mob:addMod(tpz.mod.VIT, mob:getMainLvl() * 2)

    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.BERSERK, ai.r.JA, ai.s.SPECIFIC, tpz.ja.BERSERK)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.WARCRY, ai.r.JA, ai.s.SPECIFIC, tpz.ja.WARCRY)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.HASSO, ai.r.JA, ai.s.SPECIFIC, tpz.ja.HASSO)
    mob:addSimpleGambit(ai.t.SELF, ai.c.HAS_TOP_ENMITY, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.THIRD_EYE)
    mob:addSimpleGambit(ai.t.SELF, ai.c.STATUS, tpz.effect.THIRD_EYE, ai.r.JA, ai.s.SPECIFIC, tpz.ja.SEIGAN)
    mob:addSimpleGambit(ai.t.SELF, ai.c.STATUS, tpz.effect.SEIGAN, ai.r.JA, ai.s.SPECIFIC, tpz.ja.RETALIATION)
    mob:addSimpleGambit(ai.t.SELF, ai.c.HPP_LT, 66, ai.r.JA, ai.s.SPECIFIC, tpz.ja.DEFENDER)
    mob:addSimpleGambit(ai.t.SELF, ai.c.TP_LT, 1000, ai.r.JA, ai.s.SPECIFIC, tpz.ja.MEDITATE)
    
    -- Stun all the things!
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_WS, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.WEAPON_BASH)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_MS, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.WEAPON_BASH)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_JA, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.WEAPON_BASH)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.CASTING_MA, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.WEAPON_BASH)

    mob:addMod(tpz.mod.DOUBLE_ATTACK, 50)
    mob:setHP(mob:getMaxHP())
end

function onMobFight(mob)
    local target = mob:getTarget()
    
    if os.time() > mob:getLocalVar("SKILL_ROTATE") then
        if mob:getTP() >= 1000 then
            if os.time() > mob:getLocalVar("fullbreak") then
                mob:useWeaponskill(87, target)
                mob:setLocalVar("fullbreak", os.time() + 180)
            elseif os.time() > mob:getLocalVar("shieldbreak") then
                mob:useWeaponskill(80, target)
                mob:setLocalVar("shieldbreak", os.time() + 180)
            elseif os.time() > mob:getLocalVar("weaponbreak") then
                mob:useWeaponskill(85, target)
                mob:setLocalVar("weaponbreak", os.time() + 180)
            elseif os.time() > mob:getLocalVar("armorbreak") then
                mob:useWeaponskill(80, target)
                mob:setLocalVar("armorbreak", os.time() + 180)
            else   
                mob:useWeaponskill(93, target)
            end
        end
        mob:setLocalVar("SKILL_ROTATE", os.time() + 1)        
    end    
    
    -- local target = mob:getTarget()
    -- local family = target:getSystem()
    -- if family == tpz.eco.AMORPH then
        -- mob:useJobAbility(tpz.ja.TOMAHAWK, mob)
    -- end 
end

function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
end
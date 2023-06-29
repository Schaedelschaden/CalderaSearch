---------------------------------------------
-- Daybreak
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if mob:getLocalVar("DAYBREAK") == 0 then
        return 0
    else
        return 1
    end
end

function onMobWeaponSkill(target, mob, skill)
    mob:eraseStatusEffect()
    local hpheal = mob:getMaxHP() * 0.25
    local mpheal = mob:getMaxMP() * 0.20
    local base = mob:getMainLvl()
    local dmg = base + (base * 2) 
    
    if mob:getObjType() == tpz.objType.MOB then
        hpheal = mob:getMaxHP() * 0.05
        mpheal = mob:getMaxMP() * 0.10
        base = mob:getMainLvl()
        dmg = base + (base * 3) 
        mob:addStatusEffect(tpz.effect.STR_BOOST, 100, 0, 90)
        mob:addStatusEffect(tpz.effect.DEX_BOOST, 100, 0, 90)
        mob:addStatusEffect(tpz.effect.VIT_BOOST, 100, 0, 90)
        mob:addStatusEffect(tpz.effect.AGI_BOOST, 100, 0, 90)
        mob:addStatusEffect(tpz.effect.INT_BOOST, 100, 0, 90)
        mob:addStatusEffect(tpz.effect.MND_BOOST, 100, 0, 90)
        mob:addStatusEffect(tpz.effect.CHR_BOOST, 100, 0, 90)
        mob:addStatusEffect(tpz.effect.REGEN, 500, 0, 90)
        mob:addStatusEffect(tpz.effect.REFRESH, 500, 0, 90)
        mob:addStatusEffect(tpz.effect.REGAIN, 200, 0, 45)
        mob:setHP(mob:getHP() + hpheal)
        mob:setMP(mob:getMP() + mpheal)
        mob:setMod(tpz.mod.DMG, -25)
    else
        mob:addStatusEffect(tpz.effect.STR_BOOST, 100, 0, 90)
        mob:addStatusEffect(tpz.effect.DEX_BOOST, 100, 0, 90)
        mob:addStatusEffect(tpz.effect.VIT_BOOST, 100, 0, 90)
        mob:addStatusEffect(tpz.effect.AGI_BOOST, 100, 0, 90)
        mob:addStatusEffect(tpz.effect.INT_BOOST, 100, 0, 90)
        mob:addStatusEffect(tpz.effect.MND_BOOST, 100, 0, 90)
        mob:addStatusEffect(tpz.effect.CHR_BOOST, 100, 0, 90)
        mob:addStatusEffect(tpz.effect.REGEN, (base / 10), 0, 90)
        mob:addStatusEffect(tpz.effect.REFRESH, (base / 10), 0, 90)
        mob:addStatusEffect(tpz.effect.REGAIN, (base / 10), 0, 90)
        mob:setHP(mob:getHP() + hpheal)
        mob:setMP(mob:getMP() + mpheal)
        mob:setMod(tpz.mod.DMG, -50)
    end
    
    skill:setMsg(tpz.msg.basic.USES)
    return dmg
end

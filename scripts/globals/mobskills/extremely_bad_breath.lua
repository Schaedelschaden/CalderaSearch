---------------------------------------------
--  Extremely Bad Breath
--
--  Description: A horrific case of halitosis instantly K.O.'s any players in a fan-shaped area of effect.
--  Type: Magical (Earth)
--
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    if target:hasStatusEffect(tpz.effect.MAGIC_SHIELD) or math.random(0, 99) < target:getMod(tpz.mod.DEATHRES) then
        skill:setMsg(tpz.msg.basic.SKILL_NO_EFFECT)
        return 0
    end

    skill:setMsg(tpz.msg.basic.FALL_TO_GROUND)
    target:setHP(0)

    return 0
end
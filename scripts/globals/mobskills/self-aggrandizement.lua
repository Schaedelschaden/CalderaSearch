---------------------------------------------
-- Self-aggrandizement
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)

    skill:setMsg(tpz.msg.basic.SELF_HEAL)
    mob:addStatusEffect(tpz.effect.REGEN, 500, 0, 90)

    return MobHealMove(mob, mob:getMaxHP() / 25)
end

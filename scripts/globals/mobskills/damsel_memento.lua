---------------------------------------------
-- Damsel Memento
--
-- Description: Restores HP.
--
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
    local heal = MobHealMove(mob, mob:getMaxHP() * (math.random(4, 5) / 100))

    mob:eraseAllStatusEffect()

    skill:setMsg(tpz.msg.basic.SELF_HEAL)

    return heal
end

----------------------------------
-- Eternal vana illusion
--
-- Description: Grants a Magic Shield effect for a time.
-- Type: Enhancing
--
-- Range: Self
-----------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onMobSkillCheck(target, mob, skill)

    return 0
end

function onMobWeaponSkill(target, mob, skill)
    mob:addStatusEffect(tpz.effect.MAGIC_SHIELD, 0, 1, 3, 30)
    skill:setMsg(tpz.msg.basic.SKILL_GAIN_EFFECT)
    return tpz.effect.MAGIC_SHIELD
end



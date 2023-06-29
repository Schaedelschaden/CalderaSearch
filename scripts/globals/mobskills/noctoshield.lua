---------------------------------------------
-- Noctoshield (Diabolos Blood Pact)
---------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)

    target:addStatusEffect(tpz.effect.PHALANX, 13, 0, 320)
    skill:setMsg(tpz.msg.basic.SKILL_GAIN_EFFECT)
    
    return tpz.effect.PHALANX
end
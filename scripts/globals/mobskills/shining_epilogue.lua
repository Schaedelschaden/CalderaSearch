-----------------------------------
-- Shining Epilogue
-----------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------


function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)

    mob:eraseAllStatusEffect()
    local typeEffect = tpz.effect.REGEN

    skill:setMsg(tpz.mobskills.mobBuffMove(mob, typeEffect, 10, 3, 180))
    return typeEffect
end

---------------------------------------------
-- Dryads kiss
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.HASTE
    local power      = 1000

    if mob:isNM() then
        power = 2000
    end

    skill:setMsg(MobBuffMove(mob, typeEffect, power, 0, 300))

    return typeEffect
end

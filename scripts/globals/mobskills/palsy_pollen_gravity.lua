---------------------------------------------
-- Palsy Pollen
-- Conal paralyze and super gravity
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Melee?
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect1 = tpz.effect.PARALYSIS
    local typeEffect2 = tpz.effect.GRAVITY

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect1, 30, 0, 60))
    MobStatusEffectMove(mob, target, typeEffect2, 75, 0, 60)

    mob:resetEnmity(target)

    return typeEffect
end

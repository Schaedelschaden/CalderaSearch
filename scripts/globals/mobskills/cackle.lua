---------------------------------------------
-- Cackle
--
-- Description: Reduces magical attack, accuracy, and defense of targets in an area of effect.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Unknown radial
-- Notes:
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect1 = tpz.effect.MAGIC_ATK_DOWN
    local typeEffect2 = tpz.effect.MAGIC_ACC_DOWN
    local typeEffect3 = tpz.effect.MAGIC_DEF_DOWN

    local countEffects = 0
    local status = 
    {
        MobStatusEffectMove(mob, target, typeEffect1, 50, 0, 90),
        MobStatusEffectMove(mob, target, typeEffect2, 100, 0, 90),
        MobStatusEffectMove(mob, target, typeEffect3, 25, 0, 90),
    }

    for i = 1, 3 do
        -- Effect landed
        if status[i] == tpz.msg.basic.SKILL_ENFEEB_IS then
            countEffects = countEffects + 1
        end
    end

    if countEffects > 0 then
        skill:setMsg(tpz.msg.basic.MULTIPLE_ENFEEBLE)
    else
        skill:setMsg(tpz.msg.basic.SKILL_NO_EFFECT)
    end

    return countEffects
end

---------------------------------------------
-- Lithic Ray
--
-- Description: Inflicts Dia and Petrification in a conal area gaze attack.
-- Type: Gaze
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect1 = tpz.effect.PETRIFICATION
    local typeEffect2 = tpz.effect.DIA

    skill:setMsg(MobGazeMove(mob, target, typeEffect1, 1, 0, 30))

    if skill:getMsg() ~= tpz.msg.basic.SKILL_MISS then
        target:addStatusEffect(typeEffect2, 50, 0, 30, 0, 20, 3)
    end

    return typeEffect
end

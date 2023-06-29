---------------------------------------------
-- Awful Eye
-- 15' Reduces STR of players in area of effect.
-- Additional Effect: Resets enmity if Petrification lands
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.STR_DOWN

    if skill:setMsg(MobGazeMove(mob, target, typeEffect, 33, 3, 120)) then
        mob:resetEnmity(target)
    end

    return typeEffect
end

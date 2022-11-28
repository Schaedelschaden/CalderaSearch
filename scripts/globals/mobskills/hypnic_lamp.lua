---------------------------------------------
-- Hypnic Lamp
--
-- Description: Inflicts Charm in a conal sight AoE.
-- Type: Magical
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.SLEEP_I

    if (target:isFacing(mob)) then
        skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 1, 0, 60))
    end

    return typeEffect
end

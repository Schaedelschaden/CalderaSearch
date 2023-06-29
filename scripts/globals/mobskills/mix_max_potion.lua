---------------------------------------------
-- Mix Max Potion
--
-- Description: Restores 700 HP.
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
    local heal = 700
    if heal >= (target:getMaxHP() - target:getHP()) then
        heal = target:getMaxHP() - target:getHP() --cap it
    end
    target:addHP(heal)

    skill:setMsg(tpz.msg.basic.RECOVERS_HP)

    return heal
end

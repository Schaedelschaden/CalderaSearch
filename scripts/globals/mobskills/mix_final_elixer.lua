---------------------------------------------
-- Mix Final Elixer
--
-- Description: Restores 150 MP.
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
    local MP = target:getMaxMP() - target:getMP()
    local heal = target:getMaxHP() - target:getHP() 
    target:addHP(heal)
    target:addMP(MP)

    skill:setMsg(tpz.msg.basic.NONE)

    return heal
end

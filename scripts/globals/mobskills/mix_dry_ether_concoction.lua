---------------------------------------------
-- Mix Dry Ether Concoction
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
    local heal = 160
    if heal >= (target:getMaxMP() - target:getMP()) then
        heal = target:getMaxMP() - target:getMP() --cap it
    end
    target:addMP(heal)

    skill:setMsg(tpz.msg.basic.RECOVERS_MP)

    return heal
end

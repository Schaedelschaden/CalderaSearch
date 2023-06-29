-----------------------------------
-- Lovely miracle waltz
-- Description: Restores HP
-----------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------


function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local heal = mob:getMaxHP() * 0.05

    skill:setMsg(tpz.msg.basic.SELF_HEAL)

    target:addHP(heal)

    return heal
end



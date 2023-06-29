-----------------------------------
-- neo crystal jig
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
    local dmg = math.random(250, 500)


    skill:setMsg(tpz.msg.basic.DAMAGE)
    target:takeDamage(dmg)
    return dmg
end



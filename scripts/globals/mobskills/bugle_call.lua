-----------------------------------
-- Bugle Call
-----------------------------------
require("scripts/globals/mobskills")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    --empty lua, can have something added if you want to make things spicey.

    skill:setMsg(tpz.msg.basic.NONE)

    return
end

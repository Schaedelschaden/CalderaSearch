---------------------------------------------
-- Provoke
---------------------------------------------
require("scripts/globals/msg")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local ce = target:getCE(mob)
    local ve = target:getVE(mob)
	target:setCE(mob, ce + 900)
	target:setVE(mob, ve + 2700)
    skill:setMsg(tpz.msg.basic.USES)
end

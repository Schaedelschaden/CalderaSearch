---------------------------------------------
-- Flashbulb
-- Description: Blinds the target
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	--printf("flashbulb.cpp onMobSkillCheck\n")
    return 0
end

function onMobWeaponSkill(target, mob, skill)
	--printf("flashbulb.cpp onMobWeaponSkill\n")
	target:addStatusEffect(tpz.effect.FLASH, 200, 0, 12)
    local ce = target:getCE(mob)
    local ve = target:getVE(mob)
    if mob:getObjType() == tpz.objType.TRUST then
    	target:setCE(mob, ce + 2800)
	    target:setVE(mob, ve + 8400)
    else
	    target:setCE(mob, ce + 1800)
	    target:setVE(mob, ve + 5400)
    end
    skill:setMsg(tpz.msg.basic.USES)
    return 0
end
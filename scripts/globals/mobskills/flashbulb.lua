---------------------------------------------
-- Flashbulb
-- Description: Blinds the target
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	printf("flashbulb.cpp onMobSkillCheck\n")
    return 0
end

function onMobWeaponSkill(target, mob, skill)
	printf("flashbulb.cpp onMobWeaponSkill\n")
	target:addStatusEffect(tpz.effect.FLASH, 200, 0, 12)
	target:setCE(mob, getCE(mob) + 1800)
	target:setVE(mob, getVE(mob) + 5400)

    return 0
end
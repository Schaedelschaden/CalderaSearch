---------------------------------------------
--  Eradicator
--
--  Description: 
--  Type: Magical
--  Utsusemi/Blink absorb:
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    if (mob:getHPP() < 50) then 
        return 0
	else
		return 1
    end
end

function onMobWeaponSkill(target, mob, skill)
	local typeEffect1 = tpz.effect.WEAKNESS

    local numhits = 1
    local accmod = 1
    local dmgmod = 6
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT, info.hitslanded)
	
	MobStatusEffectMove(mob, target, typeEffect1, 1, 0, 60)
	
    return dmg
end
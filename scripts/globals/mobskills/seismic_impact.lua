---------------------------------------------
--  Seismic Impact
--
--  Description: 
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes 3 shadows
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------
function onMobSkillCheck(target, mob, skill)
		return 0
end

function onMobWeaponSkill(target, mob, skill)
	local typeEffect1 = tpz.effect.SLOW
	local typeEffect2 = tpz.effect.TERROR

	MobStatusEffectMove(mob, target, typeEffect1, 300, 0, 60)
	MobStatusEffectMove(mob, target, typeEffect2, 1, 0, 5)


    local numhits = 1
    local accmod = 1
    local dmgmod = 5
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT, MOBPARAM_IGNORE_SHADOWS)
	mob:resetEnmity(target)
	
    return dmg
end
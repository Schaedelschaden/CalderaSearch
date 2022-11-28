---------------------------------------------
-- Typhoean Rage
-- Deals heavy physical damage in an area of effect. Additional effect: Encumbrance and Muddle
-- Type: Physical
-- Range: Melee
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 3
	
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, MOBPARAM_WIPE_SHADOWS)

    local typeEffect = tpz.effect.MUDDLE

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 10, 3, 60)
	
	local typeEffect = tpz.effect.ENCUMBRANCE

	MobStatusEffectMove(mob, target, typeEffect, 65535, 0, 10)

    return dmg
end

---------------------------------------------
-- Warped Wail
--
-- Description: Emits a distorted scream, dealing damage and reducing max HP and MP.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Wipes shadows
-- Range: 20' AoE
-- Notes:
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect1 = tpz.effect.MAX_HP_DOWN
	local typeEffect2 = tpz.effect.MAX_MP_DOWN
	
	local numhits = 1
    local accmod = 1
    local dmgmod = 1
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.H2H, MOBPARAM_WIPE_SHADOWS)

    MobStatusEffectMove(mob, target, typeEffect1, 30, 0, 120)
	MobStatusEffectMove(mob, target, typeEffect2, 30, 0, 120)

    return dmg
end
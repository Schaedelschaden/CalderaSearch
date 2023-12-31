---------------------------------------------
-- Calamitous Wind
--
-- Description: Destructive winds deal Wind damage to players in range. Additional effect: Knockback + full dispel
-- Type: Magical
-- Utsusemi/Blink absorb: Wipes shadows
-- Range: Unknown cone
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
	local dmgmod = 1
    local info   = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 3.5, tpz.magic.ele.WIND, dmgmod, TP_NO_EFFECT)
    local dmg    = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WIND, MOBPARAM_WIPE_SHADOWS)

	target:dispelAllStatusEffect()

    return dmg
end

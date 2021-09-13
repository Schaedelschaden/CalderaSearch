---------------------------------------------
--  Arbor Storm
--
--  Description: AoE damage + knockback. Gains Stoneskin after use. Can be blocked by 3 shadows. Additional effect: Weight
--  Type: Magical Wind
--
--
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
	local typeEffect = tpz.effect.WEIGHT
	
	MobStatusEffectMove(mob, target, typeEffect, 50, 0, 60)
	mob:addStatusEffect(tpz.effect.STONESKIN, 1000, 0, 600, 0, 0, 4)

    local dmgmod = 1
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*4, tpz.magic.ele.WIND, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WIND, MOBPARAM_3_SHADOW)
	
    return dmg
end

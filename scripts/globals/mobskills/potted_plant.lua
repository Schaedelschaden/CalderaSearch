---------------------------------------------
-- Potted Plant
-- 
-- Type: Deals earth damage to enemies within range. Additional effect: Bind and Slow.
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
	local typeEffect1 = tpz.effect.SLOW
	local typeEffect2 = tpz.effect.BIND

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect1, 1250, 0, 60)
	MobStatusEffectMove(mob, target, typeEffect2, 1, 0, 60)

    local numhits = 1
    local accmod = 1
    local dmgmod = 3
	
	local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.EARTH, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.EARTH, MOBPARAM_WIPE_SHADOWS)

    return dmg
end
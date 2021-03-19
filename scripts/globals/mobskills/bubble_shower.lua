---------------------------------------------------
-- Bubble Shower
-- Deals Water damage in an area of effect. Additional effect: STR Down
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
	local master = mob:getMaster()
    local typeEffect = tpz.effect.STR_DOWN

    MobStatusEffectMove(mob, target, typeEffect, 10, 3, 120)
	
	local dmg = 200
	
	if (master ~= nil) then
		dmg = dmg * (mob:getMainLvl() / 20)
	end
	
    local dmgmod = MobBreathMove(mob, target, 0.15, 5, tpz.magic.ele.WATER, dmg)

    dmg = MobFinalAdjustments(dmgmod, mob, skill, target, tpz.attackType.BREATH, tpz.damageType.WATER, MOBPARAM_IGNORE_SHADOWS)
    return dmg
end
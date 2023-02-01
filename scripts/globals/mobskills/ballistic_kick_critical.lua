---------------------------------------------------
-- Ballistic Kick (Critical damage)
-- Deals Fire damage in an area of effect.
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if (mob:getHPP() < 50) then 
        return 0
	else
		return 1
    end
end

function onMobWeaponSkill(target, mob, skill)
	local typeEffect1 = tpz.effect.ENCUMBRANCE

	MobStatusEffectMove(mob, target, typeEffect1, 65535, 0, 5)

    local damage = target:getMaxHP() * 0.95
    local dmg    = MobFinalAdjustments(damage, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT, MOBPARAM_IGNORE_SHADOWS)

	mob:resetEnmity(target)	

    return dmg
end

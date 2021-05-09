---------------------------------------------
--  Blink of Peril
--
--  Description: Unleashes a devastating gaze attack on a single target that sharply reduces HP and resets enmity.
--  Type: Gaze
--  Utsusemi/Blink absorb: No
--  Range: Single Target
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
require("scripts/globals/magic")

---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local currentHP = target:getHP()
    -- remove all by 5%
    local damage = 0

	if (target:isFacing(mob)) then
        damage = currentHP * .85
		mob:resetEnmity(target)
    end
	
    local dmg = MobFinalAdjustments(damage, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.PIERCING, MOBPARAM_IGNORE_SHADOWS)
	
    return dmg
end
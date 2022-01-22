---------------------------------------------
--  Aqua Breath
--
--  Description: Deals Water damage to enemies within a fan-shaped area.
--  Type: Breath
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Unknown cone
--  Notes:
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
	local cap = 600 * (1 + (mob:getMod(tpz.mod.PET_BREATH) / 100))

    local dmgmod = MobBreathMove(mob, target, 0.25, 1.5, tpz.magic.ele.WATER, cap)
	
				-- Adjust Aspidochelone
	if (mob:getID() == 17301538) then
		MobBreathMove(mob, target, 0.25, 1.5, tpz.magic.ele.WATER, 1500)
	end
	
    local dmg = MobFinalAdjustments(dmgmod, mob, skill, target, tpz.attackType.BREATH, tpz.damageType.WATER, MOBPARAM_IGNORE_SHADOWS)
    return dmg
end

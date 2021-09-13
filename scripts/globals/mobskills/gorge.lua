---------------------------------------------
--  Gorge
--
--  Description: Drains HP from all targets within range.
--  Type: Magical (Dark)
--
--
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
	local baseDMG = mob:getLocalVar("GORGE_BASE_DMG")
	
	if (baseDMG < 1000) then
		baseDMG = 1000
	end

    local absorb = baseDMG / skill:getTotalTargets()

    local dmg = MobFinalAdjustments(absorb, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.DARK, MOBPARAM_WIPE_SHADOWS)
	
	mob:setLocalVar("SANDWORM_GORGE", dmg)
	
	skill:setMsg(tpz.msg.basic.SKILL_DRAIN_HP)
    
    return dmg
end
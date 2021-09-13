---------------------------------------------
--  Disgorge
--
--  Description: Deals conal Earth based magic damage.
--  Type: Magical (Earth)
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
    local damage = (3000 + mob:getLocalVar("SANDWORM_GORGE")) / skill:getTotalTargets()

    local dmg = MobFinalAdjustments(damage, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.EARTH, MOBPARAM_WIPE_SHADOWS)
	
	mob:setLocalVar("SANDWORM_GORGE", 0)
    
    return dmg
end
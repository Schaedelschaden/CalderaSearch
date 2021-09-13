---------------------------------------------------
-- Trebuchet
-- Tosses a large boulder at a single target, dealing heavy damage in an area of effect. Resets enmity of targets hit.
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 2.5

    local info = MobRangedMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.RANGED, tpz.damageType.PIERCING, MOBPARAM_IGNORE_SHADOWS)
	
	mob:resetEnmity(target)

    if (dmg > 0) then
       target:addTP(50)
       mob:addTP(80)
    end

    return dmg
end
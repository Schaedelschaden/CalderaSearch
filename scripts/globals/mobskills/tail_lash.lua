---------------------------------------------
-- Tail Lash
--
-- Description: Deals backwards arc damage to targets behind the Amphiptere.
-- Type: Physical
-- Utsusemi/Blink absorb: Wipes shadows
-- Range: Unknown cone, backwards
-- Notes:  Only used when the target with enmity is behind the amphiptere.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if (target:isBehind(mob, 48) == false) then
        return 1
    end
	
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 1.5
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.H2H, MOBPARAM_WIPE_SHADOWS)

    return dmg
end
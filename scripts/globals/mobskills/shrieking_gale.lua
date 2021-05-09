---------------------------------------------
-- Shrieking Gale
-- Damages all targets in range. Additional effect: Dispels 3 effects
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    target:dispelStatusEffect(tpz.effectFlag.DISPELABLE)
    target:dispelStatusEffect(tpz.effectFlag.DISPELABLE)
    target:dispelStatusEffect(tpz.effectFlag.DISPELABLE)
	
	local numhits = 1
    local accmod = 1
    local dmgmod = 1
	
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, MOBPARAM_WIPE_SHADOWS)
	
    return dmg
end

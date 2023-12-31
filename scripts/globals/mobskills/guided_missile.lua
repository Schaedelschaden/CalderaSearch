---------------------------------------------
--  Guided_Missile
--
--  Description: Targeted 10'(?) AoE ~400-750 physical damage, absorbed by Utsusemi
--  Type: Physical
--  Wipes Shadows
--  Range: 5 yalms
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    if mob:AnimationSub() <= 1 then -- omega four leg form
        return 0
    end

    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod = 8
    local dmgmod = 4.5

    if mob:getMainLvl() >= 135 then
		local dmgmod = 2.7
	end

	if target:isPet() then
		dmgmod = 7
	end

    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, MOBPARAM_2_SHADOW)

    return dmg
end

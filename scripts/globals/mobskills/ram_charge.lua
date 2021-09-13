---------------------------------------------
--  Ram Charge
--
--  Description: Damage varies with TP.
--  Type: Physical (Blunt)
--
--
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 2.3
	
	if (mob:getID() == 17318435) then
		accmod = 1.5
		dmgmod = 1
	end
	
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_DMG_VARIES, 1, 2, 3)
	local shadows = info.hitslanded
	
	-- Trudging Thomas' Ram Charges ignore shadows
	if (mob:getID() == 17318435) then
		shadows = MOBPARAM_IGNORE_SHADOWS
	end
	
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT, shadows)
    return dmg
end
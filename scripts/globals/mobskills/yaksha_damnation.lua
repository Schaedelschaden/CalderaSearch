---------------------------------------------
--  Raksha: Vengeance
--
--  Description: 
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes 3 shadows
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    if mob:AnimationSub() == 1 and mob:getLocalVar("Stance") ~= 1 then
        mob:setLocalVar("Stance", 0)

        return 0
	else
		return 1
    end
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 1.5
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_DMG_VARIES, 1, 2, 3)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, MOBPARAM_3_SHADOW)
	
    return dmg
end
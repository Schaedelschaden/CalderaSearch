---------------------------------------------
--  Touchdown
--
--  Description: Deals magical damage to enemies in an area of effect upon landing.
--  Further Notes:
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------
function onMobSkillCheck(target, mob, skill)
	if (mob:checkDistance(target) <= 10) then
		return 1
	else
		return 0
	end
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 3.5
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*4, tpz.magic.ele.NONE, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.NONE, MOBPARAM_WIPE_SHADOWS)
    
	mob:delStatusEffect(tpz.effect.TOO_HIGH)
    mob:SetMobSkillAttack(0)
    mob:AnimationSub(2)
	
    return dmg
end
---------------------------------------------
--  Leafstorm
--
--  Description: Deals wind damage within area of effect.
--  Type: Magical Wind
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
    local dmgmod = 1
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*math.random(4, 5), tpz.magic.ele.WIND, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WIND, MOBPARAM_WIPE_SHADOWS)
	
	if (mob:getLocalVar("ENHANCED_TP_MOVES") ~= 0) then
		target:dispelAllStatusEffect(bit.bor(tpz.effectFlag.DISPELABLE, tpz.effectFlag.FOOD))
		MobStatusEffectMove(mob, target, tpz.effect.SLOW, 3000, 3, 60)
	end
	
	if (mob:getID() == 16937051) then
		mob:resetEnmity(target)
	end
	
    return dmg
end
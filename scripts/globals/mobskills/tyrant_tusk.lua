---------------------------------------------------
-- Tyrant Tusk
-- Deals dark elemental damage and inflicted BIO. If target HPP < 50% Target instantly KO.
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 2
	
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 4, tpz.magic.ele.DARK, dmgmod, TP_MAB_BONUS, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.DARKNESS, MOBPARAM_IGNORE_SHADOWS)
    
	target:addStatusEffect(tpz.effect.BIO, 20, 0, 90)
	
	if (target:getHPP() <=50) then
        target:setHP(0)
    end
	
	return dmg
	
end

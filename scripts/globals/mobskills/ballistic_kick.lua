---------------------------------------------------
-- Ballistic Kick
-- Deals Fire damage in an area of effect.
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if (mob:getHPP() < 50) then 
        return 0
	else
		return 1
    end
end

function onMobWeaponSkill(target, mob, skill)
	local typeEffect1 = tpz.effect.ENCUMBERANCE
	
	MobStatusEffectMove(mob, target, typeEffect1, 1, 0, 5)
	
	local numhits = 1
    local accmod = 2
    local dmgmod = 1
	
	local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT, 1, 2, 3)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT, MOBPARAM_IGNORE_SHADOWS)
	
	mob:resetEnmity(target)	
	
    return dmg
end
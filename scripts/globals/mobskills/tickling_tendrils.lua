---------------------------------------------------
-- Tickling Tendrils
-- Delivers a fivefold attack. Additional effect: Stun. Damage varies with TP. 
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.STUN
	local numhits = 5
    local accmod = 1
    local dmgmod = 0.5
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_DMG_VARIES, 0.6, 0.7, 0.85)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT, info.hitslanded)
	
	MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1, 0, 5)
	
    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT)
	
    return dmg
end
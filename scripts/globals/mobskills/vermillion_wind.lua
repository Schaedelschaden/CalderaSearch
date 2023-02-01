---------------------------------------------
-- Vermillion Wind
--
-- Description: Destructive winds deal Wind damage to players in range. Additional effect: Lowers all 7 attributes
-- Type: Magical
-- Utsusemi/Blink absorb: Wipes shadows
-- Range: Unknown cone
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
	local typeEffect1 = tpz.effect.STR_DOWN
	local typeEffect2 = tpz.effect.DEX_DOWN
	local typeEffect3 = tpz.effect.VIT_DOWN
	local typeEffect4 = tpz.effect.AGI_DOWN
	local typeEffect5 = tpz.effect.MND_DOWN
	local typeEffect6 = tpz.effect.INT_DOWN
	local typeEffect7 = tpz.effect.CHR_DOWN

	local dmgmod = 2.4
    local info   = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 3.5, tpz.magic.ele.WIND, dmgmod, TP_NO_EFFECT)
    local dmg    = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WIND, MOBPARAM_WIPE_SHADOWS)
	
	MobStatusEffectMove(mob, target, typeEffect1, 110, 0, 60)
	MobStatusEffectMove(mob, target, typeEffect2, 110, 0, 60) 
	MobStatusEffectMove(mob, target, typeEffect3, 110, 0, 60)
	MobStatusEffectMove(mob, target, typeEffect4, 110, 0, 60)	
	MobStatusEffectMove(mob, target, typeEffect5, 110, 0, 60)
	MobStatusEffectMove(mob, target, typeEffect6, 110, 0, 60)
	MobStatusEffectMove(mob, target, typeEffect7, 110, 0, 60)

    return dmg
end

---------------------------------------------
--  Raksha: Judgement
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
    if (mob:AnimationSub() == 2 and mob:getLocalVar("Stance") ~= 1) then
        return 0
	else
		return 1
    end
end

function onMobWeaponSkill(target, mob, skill)
	local typeEffect1 = tpz.effect.SILENCE
	local typeEffect2 = tpz.effect.AMNESIA
	local typeEffect3 = tpz.effect.BLINDNESS

	MobStatusEffectMove(mob, target, typeEffect1, 1, 0, 60)
	MobStatusEffectMove(mob, target, typeEffect2, 1, 0, 10)
	MobStatusEffectMove(mob, target, typeEffect3, 100, 0, 60)

    local dmgmod = 1
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*5, tpz.magic.ele.NONE, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.ELEMENTAL, MOBPARAM_3_SHADOW)
	mob:setLocalVar("Stance", 0)
	
    return dmg
end
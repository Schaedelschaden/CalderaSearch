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
    if mob:AnimationSub() == 2 and mob:getHPP() < 50 and mob:getLocalVar("Stance") == 0 then 
        mob:setLocalVar("Stance", 1)

        return 0
	else
		return 1
    end
end

function onMobWeaponSkill(target, mob, skill)
	local typeEffect1 = tpz.effect.WEAKNESS
	local typeEffect2 = tpz.effect.MUDDLE

    local dmgmod = 2.10
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*5, tpz.magic.ele.NONE, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.ELEMENTAL, MOBPARAM_3_SHADOW)	
	
	MobStatusEffectMove(mob, target, typeEffect1, 1, 0, 60)
	MobStatusEffectMove(mob, target, typeEffect2, 1, 0, 30)
	
	return dmg
end
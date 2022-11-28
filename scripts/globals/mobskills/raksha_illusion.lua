---------------------------------------------
--  Raksha: Illusion
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
    if mob:AnimationSub() == 2 and mob:getLocalVar("Stance") ~= 1 then
        mob:setLocalVar("Stance", 0)

        return 0
	else
		return 1
    end
end

function onMobWeaponSkill(target, mob, skill)
	local typeEffect1 = tpz.effect.PARALYZE
	local typeEffect2 = tpz.effect.CURSE_I
    local dmgmod      = 1.5
    local info        = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*5, tpz.magic.ele.NONE, dmgmod, TP_NO_EFFECT)
    local dmg         = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.ELEMENTAL, MOBPARAM_3_SHADOW)

    MobStatusEffectMove(mob, target, typeEffect1, 50, 0, 60)
	MobStatusEffectMove(mob, target, typeEffect2, 50, 0, 60)
	
    return dmg
end
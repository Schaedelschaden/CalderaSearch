---------------------------------------------
--  Phlegm Expulsion
--
--  Description: AoE Slow, Silence, Amnesia
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: Less than or equal to 10.0
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if (mob:getLocalVar("DeathProphet") == 1) then
        return 1
	else
		return 0
    end
    -- return 0
end

function onMobWeaponSkill(target, mob, skill)
    local duration = 180

    MobStatusEffectMove(mob, target, tpz.effect.SILENCE, 1, 3, 120)
    MobStatusEffectMove(mob, target, tpz.effect.SLOW, 256, 3, 120)
    MobStatusEffectMove(mob, target, tpz.effect.AMNESIA, 1, 3, 30)

    local dmgmod = 1
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 4, tpz.magic.ele.WIND, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WIND, MOBPARAM_WIPE_SHADOWS)
    
	return dmg
end

---------------------------------------------
--  Macerating Bile
--
--  Description: AoE, all stats down, Bio
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadows
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
	local typeEffect1 = tpz.effect.STR_DOWN
	local typeEffect2 = tpz.effect.DEX_DOWN
	local typeEffect3 = tpz.effect.VIT_DOWN
	local typeEffect4 = tpz.effect.AGI_DOWN
	local typeEffect5 = tpz.effect.MND_DOWN
	local typeEffect6 = tpz.effect.INT_DOWN
	local typeEffect7 = tpz.effect.CHR_DOWN
	local typeEffect8 = tpz.effect.BIO
	
	MobStatusEffectMove(mob, target, typeEffect1, 80, 0, 60)
	MobStatusEffectMove(mob, target, typeEffect2, 80, 0, 60) 
	MobStatusEffectMove(mob, target, typeEffect3, 80, 0, 60)
	MobStatusEffectMove(mob, target, typeEffect4, 80, 0, 60)	
	MobStatusEffectMove(mob, target, typeEffect5, 80, 0, 60)
	MobStatusEffectMove(mob, target, typeEffect6, 80, 0, 60)
	MobStatusEffectMove(mob, target, typeEffect7, 80, 0, 60)
	MobStatusEffectMove(mob, target, typeEffect8, 1, 50, 60)
	
    local dmgmod = 2
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 4, tpz.magic.ele.WIND, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WIND, MOBPARAM_WIPE_SHADOWS)
	
    return dmg
end
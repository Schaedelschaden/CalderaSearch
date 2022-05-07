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
    if (mob:AnimationSub() == 1 and mob:getHPP() < 50 and mob:getLocalVar("Stance") == 0) then
        return 0
	else
		return 1
    end
end

function onMobWeaponSkill(target, mob, skill)
	local typeEffect1 = tpz.effect.STR_DOWN
	local typeEffect2 = tpz.effect.DEX_DOWN
	local typeEffect3 = tpz.effect.VIT_DOWN
	local typeEffect4 = tpz.effect.AGI_DOWN
	local typeEffect5 = tpz.effect.MND_DOWN
	local typeEffect6 = tpz.effect.INT_DOWN
	local typeEffect7 = tpz.effect.CHR_DOWN
	
	MobStatusEffectMove(mob, target, typeEffect1, 110, 0, 60)
	MobStatusEffectMove(mob, target, typeEffect2, 110, 0, 60) 
	MobStatusEffectMove(mob, target, typeEffect3, 110, 0, 60)
	MobStatusEffectMove(mob, target, typeEffect4, 110, 0, 60)	
	MobStatusEffectMove(mob, target, typeEffect5, 110, 0, 60)
	MobStatusEffectMove(mob, target, typeEffect6, 110, 0, 60)
	MobStatusEffectMove(mob, target, typeEffect7, 110, 0, 60)
	
    local numhits = 1
    local accmod = 3
    local dmgmod = 4
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_DMG_VARIES, 1, 2, 3)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, MOBPARAM_3_SHADOW)
	mob:setLocalVar("Stance", 1)
	
    return dmg
end
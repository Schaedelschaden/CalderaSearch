---------------------------------------------
--  Root of the Problem
--
--  Description: Absorbs 1000 TP and a buff from a target. Additional Effect: All stats down
--  Type: Debuff
--
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/utils")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    MobStatusEffectMove(mob, target, tpz.effect.STR_DOWN, 50, 3, 60)
    MobStatusEffectMove(mob, target, tpz.effect.VIT_DOWN, 50, 3, 60)
    MobStatusEffectMove(mob, target, tpz.effect.DEX_DOWN, 50, 3, 60)
    MobStatusEffectMove(mob, target, tpz.effect.AGI_DOWN, 50, 3, 60)
    MobStatusEffectMove(mob, target, tpz.effect.MND_DOWN, 50, 3, 60)
    MobStatusEffectMove(mob, target, tpz.effect.INT_DOWN, 50, 3, 60)
    MobStatusEffectMove(mob, target, tpz.effect.CHR_DOWN, 50, 3, 60)

	mob:stealStatusEffect(target, tpz.effectFlag.DISPELABLE)
	
	local drain = utils.clamp(target:getTP(), 0, 1000)
	
	skill:setMsg(MobPhysicalDrainMove(mob, target, skill, MOBDRAIN_TP, drain))

    return drain
end
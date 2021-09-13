---------------------------------------------------
-- Agaricus
-- Fires a mushroom cap, dealing damage to a single target. Additional effect: Potent Plague and Slow
-- Range: 15 yalms
-- Piercing damage Ranged Attack
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if (mob:getMobMod(tpz.mobMod.VAR) == 2) then
        return 0
    end
    return 1
end

function onMobWeaponSkill(target, mob, skill)
	mob:setMobMod(tpz.mobMod.VAR, 3)
    local numhits = 1
    local accmod = 1
    local dmgmod = 1
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_DMG_VARIES, 1, 2, 3)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.PIERCING, MOBPARAM_IGNORE_SHADOWS)

    local typeEffect1 = tpz.effect.PLAGUE
	local typeEffect2 = tpz.effect.SLOW

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect1, 50, 0, 60)
	MobPhysicalStatusEffectMove(mob, target, skill, typeEffect2, 3000, 0, 180)
	
	mob:resetEnmity(target)

    return dmg
end
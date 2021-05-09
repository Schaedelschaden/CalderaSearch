---------------------------------------------------
-- Volcanic Wrath
-- Deals fire damage to enemies within range. Additional Effect: "Burn" "Max HP down" 
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect1 = tpz.effect.BURN
	local typeEffect2 = tpz.effect.MAX_HP_DOWN

    MobStatusEffectMove(mob, target, typeEffect1, 30, 0, 30)
    MobStatusEffectMove(mob, target, typeEffect2, 30, 0, 60)

    local dmgmod = 1
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.FIRE, dmgmod, TP_MAB_BONUS, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.FIRE, MOBPARAM_WIPE_SHADOWS)
    return dmg
end

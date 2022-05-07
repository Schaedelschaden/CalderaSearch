---------------------------------------------------
-- Slicing Sickle
-- Deals frontal AoE damage. Additional effect: knockback and defense down
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if (mob:getLocalVar("DeathProphet") == 1) then
        return 1
	else
		return 0
    end
    -- return 0
end

function onMobWeaponSkill(target, mob, skill)

    local numhits = 1
    local accmod = 1
    local dmgmod = 6.9
	
	
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, info.hitslanded)

    local typeEffect = tpz.effect.DEFENSE_DOWN

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 30, 0, 60)

    return dmg
end

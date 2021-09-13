---------------------------------------------
--  Feral Peck
--
--  Description: Deals extreme damage to a single target.
--  Type: Physical
--  Utsusemi/Blink absorb: No
--  Range: Single Target
--  Notes: Deals a set amount of heavy damage (~90% of target's current HP) to a single target.
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
require("scripts/globals/magic")

---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)

    local currentHP = target:getHP()
    local damage = 0

    -- if have more hp then 30%, then reduce to 10%
    if (currentHP / target:getMaxHP() > 0.2) then
        damage = currentHP * .90
    else
        -- else you die
        damage = currentHP
    end
	
    local dmg = MobFinalAdjustments(damage, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.PIERCING, MOBPARAM_IGNORE_SHADOWS)

    return dmg
end
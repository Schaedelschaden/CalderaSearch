---------------------------------------------
--  Hell Scissors
--
--  Description: Deals extreme damage to a single target. Additional Effect: Hate Reset
--  Type: Physical
--  Utsusemi/Blink absorb: No
--  Range: Single Target
--  Notes: Very short range, easily evaded by walking away from it.
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
    local maxHP     = target:getMaxHP()

    -- Remove all by 5%
    local damage = 0

    -- If have more hp then 30%, then reduce to 5%
    if (currentHP / maxHP) > 0.3 then
        damage = currentHP * .95
    -- Death Resistance prevents dying but reduces target to 1 HP
    elseif (currentHP / maxHP) <= 0.2 and math.random(1, 100) > target:getMod(tpz.mod.DEATHRES) then
        damage = currentHP - 1
    else
        -- Else you die
        damage = currentHP
    end

    target:takeDamage(damage, mob, tpz.attackType.PHYSICAL, tpz.damageType.PIERCING)

    mob:resetEnmity(target)

    return damage
end

---------------------------------------------
-- Critical Bite
--
-- Description: Deals extreme damage to a single target.
-- Type: Physical
-- Utsusemi/Blink absorb: 1 shadow
-- Range: Melee, used by Nightmare Scorpions, KV, Serket
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
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

    return damage
end

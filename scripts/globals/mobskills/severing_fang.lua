-----------------------------------
--  Severing Fang
--
--  Description: Bites at all targets in front. Additional effect: Defense Down
--  Type: Physical
--  Utsusemi/Blink absorb: 2 shadows
--  Range: Front arc (cone)
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
-----------------------------------

function onMobSkillCheck(target, mob, skill)
    -- Do not use this weapon skill on targets behind. Sub-Zero Smash
    -- should trigger in this case.
    if target:isBehind(mob) then
        return 1
    end

    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 2
    local accmod  = 1
    local dmgmod  = 1.5
    local info    = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg     = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.PIERCING, info.hitslanded)

    MobPhysicalStatusEffectMove(mob, target, skill, tpz.effect.DEFENSE_DOWN, 30, 0, 120)

    return dmg
end

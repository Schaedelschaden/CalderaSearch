---------------------------------------------
-- Hydro Blast
--
-- Description: Fires a blast of Water, dealing damage in a fan-shaped area.
-- Additional Effect: Magic Shield on self
-- Type: Magical
-- Utsusemi/Blink absorb: Wipes shadows
-- Range: Unknown Conal
-- Notes: Absorbs magical damage inflicted but does not block enfeebling spells or songs.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 1
    local info   = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 7, tpz.magic.ele.WATER, dmgmod, TP_MAB_BONUS, 1)
    local dmg    = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WATER, MOBPARAM_WIPE_SHADOWS)

    local typeEffect = tpz.effect.MAGIC_SHIELD
    local power      = 2 -- -100% UDMGMAGIC
    local duration   = 90

    skill:setMsg(MobBuffMove(mob, typeEffect, power, 0, duration))

    mob:timer(2500, function(mobArg)
        -- This will need to be reset to 0 using a mob listener when the effect wears off
        -- See Sedna's mob LUA
        mobArg:AnimationSub(2)
    end)

    return dmg
end

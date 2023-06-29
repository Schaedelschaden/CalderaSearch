---------------------------------------------
-- Immortal Shield
--
-- Description: Grants a Magic Shield to the user.
-- Type: Enhancing
-- Utsusemi/Blink absorb: N/A
-- Range: Self
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
    local typeEffect = tpz.effect.MAGIC_SHIELD
    local power      = mob:getHP() / 20 -- Amount of magical damage absorbed
    local duration   = 300

    skill:setMsg(MobBuffMove(mob, typeEffect, power, 0, duration))

    mob:timer(2500, function(mobArg)
        -- This will need to be reset to 0 using a mob listener when the effect wears off
        -- See Kadraeth the Hatespawn's mob LUA
        mobArg:AnimationSub(1)
    end)

    return typeEffect
end

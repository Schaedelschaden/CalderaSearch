---------------------------------------------------
-- Gnash
--
-- Description: Single-target physical damage. Deals damage equal to 1/2 of target's current HP.
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmg = target:getHP() / 2

    target:setHP(dmg)

    return dmg
end

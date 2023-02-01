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
    if
        mob:isNM() and -- NM's replace this with Deathgnash below 50% HP
        mob:getHPP() > 50
    then
        return 0
    elseif not mob:isNM() then
        return 0
    end

    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local dmg = target:getHP() / 2

    target:setHP(dmg)

    return dmg
end

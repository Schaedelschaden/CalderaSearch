---------------------------------------------------
-- Deathgnash
--
-- Description: Reduces target HP to 1 and resets hate. Only used by certain Notorious Monsters.
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if
        mob:isNM() and -- NM's replace Gnash with Deathgnash below 50% HP
        mob:getHPP() <= 50
    then
        return 0
    end

    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local dmg = target:getHP() - 1

    target:setHP(1)
    mob:resetEnmity(target)

	return dmg
end

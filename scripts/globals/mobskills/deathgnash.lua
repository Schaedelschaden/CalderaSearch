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

end

function onMobWeaponSkill(target, mob, skill)
    local dmg = target:getHP() - 1

    target:setHP(1)
    mob:resetEnmity(target)

	return dmg
end

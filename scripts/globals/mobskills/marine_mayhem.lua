---------------------------------------------------
-- Marine Mayhem
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmg  = target:getHP() - 1
    if mob:checkDistance(target) > 5 then
        dmg = target:getHP()
    end
    target:takeDamage(dmg)

	return dmg
end

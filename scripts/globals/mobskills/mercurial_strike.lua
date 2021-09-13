---------------------------------------------------
-- Mercurial Strike
-- Swings at an enemy dealing fixed damage in an area attack.
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 1
end

function onMobWeaponSkill(target, mob, skill)
	local nextDmg = mob:getLocalVar("MercStrikeCounter") + 1
	local dmg = 111 * nextDmg
	
	mob:setLocalVar("MercStrikeCounter", nextDmg)
	
	if (nextDmg >= 10) then
		dmg = 1111
		mob:setLocalVar("MercStrikeCounter", 0)
	end

    return dmg
end
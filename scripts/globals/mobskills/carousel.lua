---------------------------------------------------
-- Carousel
-- Becomes a merry-go-round of pain that damages players in range.
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if (mob:isMobType(MOBTYPE_NOTORIOUS)) then
        return 0
    end
	
    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 2.5
	
	-- Yearner uses Carousel as its standard attack
	if (mob:getID() == 16961910) then
		dmgmod = 1.5
	end
	
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, MOBPARAM_3_SHADOW)
	
    return dmg
end
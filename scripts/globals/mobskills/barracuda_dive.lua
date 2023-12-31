---------------------------------------------------
-- Barracuda Dive
-- Leviathan delivers a single-hit attack on target.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod = 2
    local dmgmod = 2
	
	-- Adjust Trial Water Leviathan's damage
	if (mob:getID() == 17641473) then
		dmgmod = 3
	end
	
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT, 1, 2, 3)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, info.hitslanded)
    
	if mob:getObjType() == tpz.objType.TRUST then
        dmg = dmg * mob:getMainLvl() / 3
    end
    
    return dmg
end
---------------------------------------------------
-- Eclipse Bite
-- Delivers a threefold attack.
---------------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    
    local numhits = 3
    local accmod = 1
    local dmgmod = 1
	
	if (mob:getID() == 17473537) then
		accmod = 3
		dmgmod = 3
	end

    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT, 1, 2, 3)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, info.hitslanded)
    
    if mob:getObjType() == tpz.objType.TRUST then
        dmg = dmg * mob:getMainLvl() / 3
    end
    
    return dmg

end

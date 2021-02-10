---------------------------------------------------
--  Infected Leech
--  Family: Mosquito
--  Description: Absorbs HP from enemies in a fan-shaped area originating from pet. Additional effect duration varies with TP.
--  Additional effects: Plague (-50 TP/tic).
--  Type: Magical
--  Range: Conal
--  Notes:
---------------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 0.5
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 3, tpz.magic.ele.DARK, dmgmod, TP_MAB_BONUS, 1)
--	printf("infected_leech.cpp onMobWeaponSkill BASE DMG: [%i]", info.dmg);
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.DARK, MOBPARAM_1_SHADOW)
--	printf("infected_leech.cpp onMobWeaponSkill FINAL DMG: [%i]\n", dmg);
    
	skill:setMsg(MobPhysicalDrainMove(mob, target, skill, MOBDRAIN_HP, dmg))
	
    return dmg
end
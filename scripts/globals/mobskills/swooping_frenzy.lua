---------------------------------------------------
--  Swooping Frenzy
--  Family: Tulfaire
--  Description: Deals physical damage to enemies within a fan-shaped area. Duration of effect varies with TP.
--  Additional effects: -25% Defense & -25 MDB.
--  Type: Physical
--  Range: Conal
--  Notes:
---------------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
	local typeEffect1 = tpz.effect.DEFENSE_DOWN
	local typeEffect2 = tpz.effect.MAGIC_DEF_DOWN
	local duration = 120
	local master = mob:getMaster()
	local tp = mob:getTP()
	
	if (master ~= nil and tp > 1000 and tp <= 2000) then
		duration = 150
	elseif (master ~= nil and tp > 2000 and tp <= 3000) then
		duration = 180
	end
	
	MobStatusEffectMove(mob, target, typeEffect1, 25, 0, duration)
    MobStatusEffectMove(mob, target, typeEffect2, 25, 0, duration)
	
	local numhits = 1
    local accmod = 1
    local dmgmod = 2.5
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.PIERCING, info.hitslanded)
	
    return dmg
end
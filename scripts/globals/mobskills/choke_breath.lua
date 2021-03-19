---------------------------------------------
--  Choke Breath
--
--  Deals physical damage to enemies within a fan-shaped area. Additional effect: Paralysis & Silence. Duration of effect varies with TP.
--  Type: Physical
--
--
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect1 = tpz.effect.PARALYSIS
	local typeEffect2 = tpz.effect.SILENCE
	local duration = 60
	local master = mob:getMaster()
	local tp = mob:getTP()
	
	if (master ~= nil and tp > 1000 and tp <= 2000) then
		duration = 90
	elseif (master ~= nil and tp > 2000 and tp <= 3000) then
		duration = 120
	end
	
    MobStatusEffectMove(mob, target, typeEffect1, 20, 0, duration)
	MobStatusEffectMove(mob, target, typeEffect2, 1, 0, duration)

    local dmgmod = MobBreathMove(mob, target, 0.2, 0.75, tpz.magic.ele.NONE, 600)
    local dmg = MobFinalAdjustments(dmgmod, mob, skill, target, tpz.attackType.BREATH, tpz.damageType.NONE, MOBPARAM_IGNORE_SHADOWS)
	
    return dmg
end
---------------------------------------------
--  Leeching Current
--
--  Description: Steals HP with a water current from targets in an area of effect.
--  Type: Magical (Water)
--
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local base = 1000 / skill:getTotalTargets()

	if mob:getMainLvl() >= 130 then
		base = 10000 / skill:getTotalTargets()
	end

    local dmg = MobFinalAdjustments(base, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WATER, MOBPARAM_WIPE_SHADOWS)

    skill:setMsg(MobPhysicalDrainMove(mob, target, skill, MOBDRAIN_HP, dmg))

    return dmg
end

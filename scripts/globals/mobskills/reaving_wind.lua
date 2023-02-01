---------------------------------------------
-- Reaving Wind
--
-- Description: Area of effect Enmity and TP reset.
-- Type: Magical
-- Notes: Puts up a shield around the amphiptere which will cause constant Knockback.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local tpReduced = 0

    target:setTP(tpReduced)
	mob:resetEnmity(target)

	mob:setMod(tpz.mod.WIND_ABSORB, 100)
	mob:AnimationSub(2)
	mob:setLocalVar("Amphiptere_ReavingWind", os.time())

    skill:setMsg(tpz.msg.basic.TP_REDUCED)

    return tpReduced
end

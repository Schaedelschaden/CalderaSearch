---------------------------------------------
-- Boiling Blood
--
-- Description: Increases attack speed and goes berserk.
-- Type: Enhancing
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local power = 25
	local duration = 60
    local typeEffect1 = tpz.effect.BERSERK
	local typeEffect2 = tpz.effect.HASTE

	MobBuffMove(mob, typeEffect1, power, 0, duration)
	MobBuffMove(mob, typeEffect2, power, 0, duration)

    return typeEffect2
end
---------------------------------------------
-- Petalback Spin
--
-- Description: Inflicts Poison, Paralyze, Silence, Plague, Blind, and Amnesia to everyone in range.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Radial
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect1 = tpz.effect.POISON
	local typeEffect2 = tpz.effect.PARALYSIS
	local typeEffect3 = tpz.effect.BLINDNESS
	local typeEffect4 = tpz.effect.PLAGUE
	local typeEffect5 = tpz.effect.SILENCE
	local typeEffect6 = tpz.effect.AMNESIA

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect1, 40, 0, 120))
	MobStatusEffectMove(mob, target, typeEffect2, 30, 0, 60)
	MobStatusEffectMove(mob, target, typeEffect3, 100, 0, 120)
	MobStatusEffectMove(mob, target, typeEffect4, 5, 0, 60)
	MobStatusEffectMove(mob, target, typeEffect5, 1, 0, 120)
	MobStatusEffectMove(mob, target, typeEffect6, 1, 0, 30)

    return typeEffect1
end
---------------------------------------------------
--  Mucilaginous Ooze
--  Family: Slugs
--  Description: A gummy slime inflicts encumberance and slow.
--  Type: Magical
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: AoE
--  Notes:
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect1 = tpz.effect.SLOW
	local typeEffect2 = tpz.effect.ENCUMBRANCE
    local duration = math.random(60, 90)

	skill:setMsg(MobStatusEffectMove(mob, target, typeEffect1, 50, 0, duration))
	MobStatusEffectMove(mob, target, typeEffect2, 65535, 0, duration)
	
    return typeEffect1
end
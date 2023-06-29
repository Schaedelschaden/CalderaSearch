---------------------------------------------
-- Feeble Bleat
-- Emits a unnerving bleat that paralyzes players in range.
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
    local typeEffect = tpz.effect.PARALYSIS

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 25, 0, 120))

	-- Dozing Dorian gains a Gravity and Defense Down aura after using Feeble Bleat
	if mob:getID() == 17318434 then
		local duration    = 60
        local visibleAura = 0

		mob:addStatusEffectEx(tpz.effect.GEO_DEFENSE_DOWN, tpz.effect.GEO_DEFENSE_DOWN, visibleAura, 3, duration, tpz.effect.DEFENSE_DOWN, 15, tpz.auraTarget.ENEMIES, tpz.effectFlag.AURA)
		mob:addStatusEffectEx(tpz.effect.GEO_WEIGHT, tpz.effect.GEO_WEIGHT, visibleAura, 3, duration, tpz.effect.WEIGHT, 26, tpz.auraTarget.ENEMIES, tpz.effectFlag.AURA)
	end

    return typeEffect
end

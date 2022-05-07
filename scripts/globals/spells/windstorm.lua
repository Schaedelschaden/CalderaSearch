--------------------------------------
-- Spell: Windstorm
--     Changes the weather around target party member to "windy."
--------------------------------------
require("scripts/globals/magic")
require("scripts/globals/status")
--------------------------------------

function onMagicCastingCheck(caster, target, spell)
    if (caster:getObjType() == tpz.objType.TRUST and caster:getTrustID() == 968) then -- Adelheid
		local player = caster:getMaster()
		local mob = player:getCursorTarget()
	
		local weakestElement = checkWeakestElement(caster, mob, spell)
		
		if (weakestElement == 3
			and not target:hasStatusEffect(tpz.effect.FIRESTORM) and not target:hasStatusEffect(tpz.effect.HAILSTORM)
			and not target:hasStatusEffect(tpz.effect.WINDSTORM) and not target:hasStatusEffect(tpz.effect.THUNDERSTORM)
			and not target:hasStatusEffect(tpz.effect.SANDSTORM) and not target:hasStatusEffect(tpz.effect.RAINSTORM)
			and not target:hasStatusEffect(tpz.effect.AURORASTORM) and not target:hasStatusEffect(tpz.effect.VOIDSTORM)) then
			return 0
		else
			return 1
		end
	else
		return 0
	end
end

function onSpellCast(caster, target, spell)
    target:delStatusEffectSilent(tpz.effect.FIRESTORM)
    target:delStatusEffectSilent(tpz.effect.SANDSTORM)
    target:delStatusEffectSilent(tpz.effect.RAINSTORM)
    target:delStatusEffectSilent(tpz.effect.WINDSTORM)
    target:delStatusEffectSilent(tpz.effect.HAILSTORM)
    target:delStatusEffectSilent(tpz.effect.THUNDERSTORM)
    target:delStatusEffectSilent(tpz.effect.AURORASTORM)
    target:delStatusEffectSilent(tpz.effect.VOIDSTORM)

    local duration = calculateDuration(180, caster, target, spell)
    duration = calculateDurationForLvl(duration, 47, target:getMainLvl())

    local merit = caster:getMerit(tpz.merit.STORMSURGE)
    local power = 0
    if merit > 0 then
        power = merit + caster:getMod(tpz.mod.STORMSURGE_EFFECT) + 2
    end

    target:addStatusEffect(tpz.effect.WINDSTORM, power, 0, duration)

    return tpz.effect.WINDSTORM
end
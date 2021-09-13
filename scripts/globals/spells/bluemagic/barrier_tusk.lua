-----------------------------------------
-- Spell: Barrier Tusk
-- Reduces the amount of damage you take.
-- Spell cost: 41 MP
-- Monster Type: Beasts
-- Spell Type: Magical (Earth)
-- Blue Magic Points: 3
-- Stat Bonus: HP+15 MP-15 VIT+3
-- Level: 91
-- Casting Time: 6 seconds
-- Recast Time: 60 seconds
-- Duration: 3 minutes
-- Combos: Max HP Boost
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
	local duration = 180
	
	if (caster:hasStatusEffect(tpz.effect.DIFFUSION)) then
        local diffMerit = caster:getMerit(tpz.merit.DIFFUSION)

        if (diffMerit > 0) then
            duration = (duration + (duration * (diffMerit / 100)))
        end

        caster:delStatusEffect(tpz.effect.DIFFUSION)
    end
	
	if target:addStatusEffect(tpz.effect.PHALANX, 0, 0, duration, 0, 1, 0) then
		spell:setMsg(tpz.msg.basic.MAGIC_GAIN_EFFECT)
    else
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
    end

    return tpz.effect.PHALANX
end
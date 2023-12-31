-----------------------------------------
-- Spell: Metallic Body
-- Absorbs an certain amount of damage from physical and magical attacks
-- Spell cost: 19 MP
-- Monster Type: Aquans
-- Spell Type: Magical (Earth)
-- Blue Magic Points: 1
-- Stat Bonus: None
-- Level: 8
-- Casting Time: 7 seconds
-- Recast Time: 60 seconds
-- Duration: 5 minutes
-- Combos: Max MP Boost
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local typeEffect = tpz.effect.STONESKIN
    local blueSkill = caster:getSkillLevel(tpz.skill.BLUE_MAGIC)
	local blueMerits = caster:getMerit(tpz.merit.BLUE)
	local blueGear = caster:getMod(tpz.mod.BLUE)
	local magicSkill = (blueSkill + blueMerits + blueGear)
    local power = (magicSkill / 3) + (caster:getMainLvl() / 3) + 10
    local duration = 300

    if (power > 200) then
        power = 200
    end

    if (caster:hasStatusEffect(tpz.effect.DIFFUSION)) then
        local diffMerit = caster:getMerit(tpz.merit.DIFFUSION)

        if (diffMerit > 0) then
            duration = (duration + (duration * (diffMerit / 100)))
        end

        caster:delStatusEffect(tpz.effect.DIFFUSION)
    end

    if not target:addStatusEffect(typeEffect, power, 0, duration, 0, 0, 2) then
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
    end

    return typeEffect
end
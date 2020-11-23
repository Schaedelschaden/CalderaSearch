-----------------------------------------
-- Spell: Filamented Hold
-- Reduces the attack speed of enemies within a fan-shaped area originating from the caster.
-- Spell cost: 38 MP
-- Monster Type: Vermin
-- Spell Type: Magical (Earth)
-- Blue Magic Points: 3
-- Stat Bonus: VIT+1
-- Level: 52
-- Casting Time: 2 seconds
-- Recast Time: 20 seconds
-- Magic Bursts on: Scission, Gravitation, and Darkness
-- Combos: Clear Mind
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local power = 2500
	local duration = 90
	local params = {}
		params.diff = caster:getStat(tpz.mod.MND) - target:getStat(tpz.mod.MND)
		params.attribute = tpz.mod.INT
		params.skillType = tpz.skill.BLUE_MAGIC
		params.effect = tpz.effect.SLOW
		
    local resist = applyResistanceEffect(caster, target, spell, params)
    duration = duration * resist

    if resist > 0.5 then -- Do it!
        if target:addStatusEffect(tpz.effect.SLOW, power, 0, duration) then
            spell:setMsg(tpz.msg.basic.MAGIC_ENFEEB_IS)
        else
            spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
        end
    else
        spell:setMsg(tpz.msg.basic.MAGIC_RESIST)
    end

    return tpz.effect.SLOW
end
-----------------------------------------
-- Spell: Infrasonics
-- Lowers the evasion of enemies within a fan-shaped area originating from the caster.
-- Spell cost: 42 MP
-- Monster Type: Lizards
-- Spell Type: Magical (Ice)
-- Blue Magic Points: 4
-- Stat Bonus: INT+1
-- Level: 65
-- Casting Time: 5 seconds
-- Recast Time: 120 seconds
-- Magic Bursts on: Induration, Distortion, Darkness
-- Combos: None
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster,target,spell)
    local duration = 60
	local params = {}
		params.attribute = tpz.mod.INT
		params.skillType = tpz.skill.BLUE_MAGIC
    
	local resist = applyResistance(caster, target, spell, params)
    duration = duration * resist

    if (resist > 0.5) then
        if (target:addStatusEffect(tpz.effect.EVASION_DOWN, 20, 0, duration)) then
            spell:setMsg(tpz.msg.basic.MAGIC_ENFEEB_IS)
        else
            spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
        end
    else
        spell:setMsg(tpz.msg.basic.MAGIC_RESIST)
    end

    return tpz.effect.EVASION_DOWN
end
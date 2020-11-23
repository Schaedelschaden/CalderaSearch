-----------------------------------------
-- Spell: Demoralizing Roar
-- Weakens the attack of enemies within range.
-- Spell cost: 46 MP
-- Monster Type: Lizards
-- Spell Type: Magical (Water)
-- Blue Magic Points: 4
-- Stat Bonus: STR-2 VIT+3
-- Level: 80
-- Casting Time: 2.75 seconds
-- Recast Time: 20 seconds
-- Magic Bursts on: Reverbration, Distortion, Darkness
-- Combos: Double Attack / Triple Attack
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    local params = {}
		params.attribute = tpz.mod.INT
		params.skillType = tpz.skill.BLUE_MAGIC
		params.effect = tpz.effect.ATTACK_DOWN
    local duration = 30
    local power = 20

	if (target:addStatusEffect(params.effect,power,0,duration)) then
		spell:setMsg(tpz.msg.basic.MAGIC_ENFEEB_IS)
	else
		spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
	end

    return params.effect
end
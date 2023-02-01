-----------------------------------------
-- Spell: Cruel Joke
-- Inflicts doom on enemies within range.
-- Spell cost: 187 MP
-- Monster Type: Undead
-- Spell Type: Magical (Dark)
-- Blue Magic Points: 0 (Unbridled Learning/Wisdom)
-- Stat Bonus: 
-- Level: 99
-- Casting Time: 3 seconds
-- Recast Time: 30 seconds
-- Duration: 60 seconds (does not affect NM's)
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
	local params = {}
		params.diff        = caster:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT)
		params.skillType   = tpz.skill.BLUE_MAGIC
		params.effect      = tpz.effect.DOOM
		params.spellFamily = tpz.ecosystem.DRAGON

	if target:hasStatusEffect(tpz.effect.NEGATE_DOOM) or target:isNM() then
		spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
	else
		target:addStatusEffect(tpz.effect.DOOM, 1, 3, 60)
		spell:setMsg(tpz.msg.basic.MAGIC_ENFEEB_IS)
	end

    target:updateEnmity(caster)

	caster:delStatusEffect(tpz.effect.UNBRIDLED_LEARNING)

    return tpz.effect.DOOM
end

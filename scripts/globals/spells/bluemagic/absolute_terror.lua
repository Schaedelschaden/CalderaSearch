-----------------------------------------
-- Spell: Absolute Terror
-- Freezes target in fear.
-- Spell cost: 29 MP
-- Monster Type: Dragon
-- Spell Type: Magical (Dark)
-- Blue Magic Points: 0 (Unbridled Learning/Wisdom)
-- Stat Bonus: 
-- Level: 96
-- Casting Time: 0.5 seconds
-- Recast Time: 30 seconds
-- Duration: 15 seconds (subject to resists)
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
	local chance = math.random(1,100)
	local params = {}
		params.diff = caster:getStat(tpz.mod.CHR) - target:getStat(tpz.mod.CHR)
		params.skillType = tpz.skill.BLUE_MAGIC
		params.effect = tpz.effect.TERROR
		params.spellFamily = tpz.ecosystem.DRAGON
		
	local resist = applyResistance(caster, target, spell, params)
	
--	printf("Absolute Terror onSpellCast RESIST: [%1.2f]  NM CHANCE: [%i]\n", resist, chance)
	
	local duration = 15 * resist
	
	if (target:hasStatusEffect(tpz.effect.NEGATE_TERROR)) then
		spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
	elseif (target:isNM() and chance < 70) then
		duration = 5 * resist
		target:addStatusEffect(tpz.effect.TERROR, 1, 0, duration)
		spell:setMsg(tpz.msg.basic.MAGIC_ENFEEB_IS)
	else
		target:addStatusEffect(tpz.effect.TERROR, 1, 0, duration)
		spell:setMsg(tpz.msg.basic.MAGIC_ENFEEB_IS)
	end
	
	caster:delStatusEffect(tpz.effect.UNBRIDLED_LEARNING)

    return tpz.effect.TERROR
end
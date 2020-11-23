-----------------------------------------
-- Spell: Mortal Ray
-- Inflicts Doom upon an enemy.
-- Spell cost: 267 MP
-- Monster Type: Demons
-- Spell Type: Magical (Dark)
-- Blue Magic Points: 4
-- Stat Bonus: STR+2 MND+2
-- Level: 91
-- Casting Time: 8 seconds
-- Recast Time: 150 seconds
-- Magic Bursts on: Compression, Gravitation, Darkness
-- Combos: Dual Wield
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local params = {}
		params.diff = caster:getStat(tpz.mod.MND) - target:getStat(tpz.mod.MND)
		params.skillType = tpz.skill.BLUE_MAGIC
		params.effect = tpz.effect.DOOM
		params.spellFamily = tpz.ecosystem.DEMON
		
	local resist = applyResistance(caster, target, spell, params)
	local doomChance = math.random(1,10)
	
--	printf("Mortal Ray onSpellCast RESIST: [%f]  DOOM CHANCE: [%i]\n", resist, doomChance)

	if (resist >= 0.9 and doomChance <= 5 and target:hasStatusEffect(params.effect) == false and not target:isNM()) then
		spell:setMsg(tpz.msg.basic.MAGIC_ENFEEB_IS)
		target:addStatusEffect(params.effect, 10, 0, 63)
	elseif (resist < 0.9 or doomChance > 5 or target:hasStatusEffect(params.effect) == true) then
		spell:setMsg(tpz.msg.basic.NARROWLY_ESCAPE)
	else
		spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
	end

    return params.effect
end
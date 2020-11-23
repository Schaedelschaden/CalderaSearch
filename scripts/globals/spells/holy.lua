-----------------------------------------
-- Spell: Holy
-- Deals light damage to an enemy.
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    -- doDivineNuke(V,M,caster,spell,target,hasMultipleTargetReduction,resistBonus)
	local bonus = 1 + (caster:getSkillLevel(tpz.skill.DIVINE_MAGIC) / 100)
	local params = {}
	
    if caster:hasStatusEffect(tpz.effect.DIVINE_EMBLEM) then
		params.dmg = math.floor(125 * bonus)
	else
		params.dmg = 125
	end
	
    params.multiplier = 1
    params.hasMultipleTargetReduction = false
    params.resistBonus = 0
	
	dmg = doDivineBanishNuke(caster, target, spell, params)
	
	caster:delStatusEffect(tpz.effect.DIVINE_EMBLEM)

    return dmg
end

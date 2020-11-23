-----------------------------------------
-- Spell: Holy II
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
	local duration = 0
	local params = {}
	
    if caster:hasStatusEffect(tpz.effect.DIVINE_EMBLEM) then
		params.dmg = math.floor(250 * bonus)
		if target:isUndead() then -- Undead
			duration = math.random(20, 25)
			target:addStatusEffect(tpz.effect.AMNESIA,1,0,duration)
		end
	else
		params.dmg = 250
	end
	
    params.multiplier = 2
    params.hasMultipleTargetReduction = false
    params.resistBonus = 0
	
	caster:delStatusEffect(tpz.effect.DIVINE_EMBLEM)
	
	dmg = doDivineBanishNuke(caster, target, spell, params)
    
	return dmg
end
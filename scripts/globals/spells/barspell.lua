-----------------------------------------
-- Implementation of Bar-spells
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/status")

function calculateBarspellPower(caster, enhanceSkill)
    local meritBonus = caster:getMerit(tpz.merit.BAR_SPELL_EFFECT)
    local equipBonus = caster:getMod(tpz.mod.BARSPELL_AMOUNT)

    if (enhanceSkill == nil or enhanceSkill < 0) then
        enhanceSkill = 0
    end

    local power = 0
    if (enhanceSkill > 500) then
        power = 150
    elseif (enhanceSkill > 300) then
        power = 25 + math.floor(enhanceSkill * 0.25)
    else
        power = 40 + math.floor(enhanceSkill * 0.2)
    end
    return power + meritBonus + equipBonus
end

function calculateBarspellDuration(caster, enhanceSkill)
    -- Function call to allow configuration conditional for old duration formulas.
    return 480
end

function applyBarspell(effectType, caster, target, spell)
    local enhanceSkill = caster:getSkillLevel(tpz.skill.ENHANCING_MAGIC)
    local mdefBonus = caster:getMerit(tpz.merit.BAR_SPELL_EFFECT) + caster:getMod(tpz.mod.BARSPELL_MDEF_BONUS)
    local tier = 0
	
	if (caster:hasStatusEffect(tpz.effect.AFFLATUS_SOLACE)) then
		mdefBonus = mdefBonus + caster:getMod(tpz.mod.ENH_AFFLATUS_SOLACE)
	end

    local power = calculateBarspellPower(caster, enhanceSkill)
    local duration = calculateBarspellDuration(caster, enhanceSkill)
	
    duration = calculateDuration(duration, caster, target, spell)
	
	if target:hasStatusEffect(tpz.effect.COMPOSURE) and target == caster then
		duration = duration * 3
	end
    
    -- Set the tier to the WHM Empyrean Armor Set Effect Power
    if caster:getMod(tpz.mod.BAR_ELEMENT_NULL_CHANCE) > 0 then
        tier = caster:getMod(tpz.mod.BAR_ELEMENT_NULL_CHANCE)
    end
	
	if (target:hasStatusEffect(tpz.effect.EMBOLDEN)) then
		power = power * 1.5
		target:delStatusEffect(tpz.effect.EMBOLDEN)
	end

    target:addStatusEffect(effectType, power, 0, duration, 0, mdefBonus, tier)
	
    return effectType
end
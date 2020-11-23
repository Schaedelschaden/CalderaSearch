-----------------------------------------
-- Spell: Osmosis
-- Steals an enemy's HP and one beneficial status effect. Ineffective against undead.
-- Spell cost: 47 MP
-- Monster Type: Vorageans
-- Spell Type: Magical (Dark)
-- Blue Magic Points: 5
-- Stat Bonus: MND+3 CHR-2
-- Level: 84
-- Casting Time: 4 seconds
-- Recast Time: 120 seconds
-- Magic Bursts on: Compression, Gravitation, Darkness
-- Combos: Magic Defense Bonus
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local blueSkill = caster:getSkillLevel(tpz.skill.BLUE_MAGIC)
	local blueMerits = caster:getMerit(tpz.merit.BLUE)
	local blueGear = caster:getMod(tpz.mod.BLUE)
	local skill = (blueSkill + blueMerits + blueGear) -- Skill + Merits + Equipment bonuses
	
	local dmg = 1 + ((0.11 * skill) * 7)
    local params = {}
		params.diff = caster:getStat(tpz.mod.MND) - target:getStat(tpz.mod.MND)
		params.attribute = tpz.mod.MND
		params.damageType = tpz.damageType.DARK
		params.spellFamily = tpz.ecosystem.VORAGEAN
		params.skillType = tpz.skill.BLUE_MAGIC
		
    local resist = applyResistance(caster, target, spell, params)
	
    dmg = dmg * resist
    dmg = addBonuses(caster, spell, target, dmg)
    dmg = adjustForTarget(target, dmg, spell:getElement())

    if (dmg < 0) then
        dmg = 0
    end

	local ecoBonus = checkEcosystem(caster, target, params)
	dmg = dmg * ecoBonus

    if (target:isUndead()) then
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
        return dmg
    end

    if (target:getHP() < dmg) then
        dmg = target:getHP()
    end
	
    dmg = BlueFinalAdjustments(caster, target, spell, dmg, params)
    caster:addHP(dmg)
	
	local dispel = target:dispelStatusEffect()
	caster:addStatusEffect(dispel, 1, 0, 60)

    return dmg
end
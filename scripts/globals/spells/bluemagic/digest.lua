-----------------------------------------
-- Spell: Digest
-- Steals an enemy's HP. Ineffective against undead.
-- Spell cost: 20 MP
-- Monster Type: Amorphs
-- Spell Type: Magical (Dark)
-- Blue Magic Points: 2
-- Stat Bonus: HP-5, MP+5
-- Level: 36
-- Casting Time: 4 seconds
-- Recast Time: 90 seconds
-- Magic Bursts on: Compression, Gravitation, Darkness
-- Combos: None
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
	local blueSkill = caster:getSkillLevel(tpz.skill.BLUE_MAGIC)
	local blueMerits = caster:getMerit(tpz.merit.BLUE)
	local blueGear = caster:getMod(tpz.mod.BLUE)
	local skill = (blueSkill + blueMerits + blueGear)	
	
    local dmg = 5 + (0.575 * skill)
	
    local params = {}
		params.diff = caster:getStat(tpz.mod.MND) - target:getStat(tpz.mod.MND)
		params.attribute = tpz.mod.MND
		params.damageType = tpz.damageType.DARK
		params.spellFamily = tpz.ecosystem.BIRD
		params.skillType = tpz.skill.BLUE_MAGIC
		
    local resist = applyResistance(caster, target, spell, params)
	
	local ecoBoost = checkEcosystem(caster, target, params)
	
	resist = resist * ecoBoost
	
    dmg = dmg * resist	
    dmg = addBonuses(caster, spell, target, dmg)	
    dmg = adjustForTarget(target, dmg, spell:getElement())
	
    if (dmg < 0) then
        dmg = 0
    end

    if (target:isUndead()) then
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
        return dmg
    end

    if (target:getHP() < dmg) then
        dmg = target:getHP()
    end
	
    dmg = BlueFinalAdjustments(caster, target, spell, dmg, params)
    caster:addHP(dmg)

    return dmg
end
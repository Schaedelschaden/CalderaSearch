-----------------------------------------
-- Spell: Blood Saber
-- Steals HP from enemies within range. Ineffective against undead
-- Spell cost: 25 MP
-- Monster Type: Undead
-- Spell Type: Magical (Dark)
-- Blue Magic Points: 2
-- Stat Bonus: HP-5, MP+5
-- Level: 48
-- Casting Time: 4 seconds
-- Recast Time: 90 seconds
-- Magic Bursts on: Compression, Gravitation, Darkness
-- Combos: None
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
    local dmg = 1 + (0.709 * caster:getSkillLevel(tpz.skill.BLUE_MAGIC))
    local params = {}
		params.diff = caster:getStat(tpz.mod.MND)-target:getStat(tpz.mod.MND)
		params.attribute = tpz.mod.MND
		params.skillType = tpz.skill.BLUE_MAGIC
		params.bonus = 1.0
		
    local resist = applyResistance(caster, target, spell, params)
	
    dmg = dmg*resist
    dmg = addBonuses(caster,spell,target,dmg)
    dmg = adjustForTarget(target,dmg,spell:getElement())
	
    if (dmg > (caster:getSkillLevel(tpz.skill.BLUE_MAGIC) + 20)) then
        dmg = (caster:getSkillLevel(tpz.skill.BLUE_MAGIC) + 20)
    end

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

    params.damageType = tpz.damageType.DARK
    dmg = BlueFinalAdjustments(caster,target,spell,dmg,params)
	
	-- Curse II prevents restoring HP
	if not (caster:hasStatusEffect(20)) then
		caster:addHP(dmg)
	end

    return dmg
end
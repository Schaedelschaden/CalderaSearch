-----------------------------------------
-- Spell: Atramentous Libations
-- Steals HP from enemies within range. Ineffective against undead.
-- Spell cost: 164 MP
-- Monster Type: Undead
-- Spell Type: Magical (Dark)
-- Blue Magic Points: 6
-- Stat Bonus: VIT+8
-- Level: 99
-- Casting Time: 4 seconds
-- Recast Time: 180 seconds
-- Magic Bursts on: Compression, Gravitation, Darkness
-- Combos: Defense Bonus
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
	local skill = caster:getSkillLevel(tpz.skill.BLUE_MAGIC)
    local damage = 0
    local params = {}
		params.diff = caster:getStat(tpz.mod.MND) - target:getStat(tpz.mod.MND)
		params.attribute = tpz.mod.MND
		params.skillType = tpz.skill.BLUE_MAGIC
        params.damageType = tpz.damageType.DARK
		params.spellFamily = tpz.ecosystem.UNDEAD
        params.multiplier = 1.00
        params.tMultiplier = 1.0 -- dINT/dMND/dCHR multiplier
        params.duppercap = 136
        params.str_wsc = 0.0
        params.dex_wsc = 0.0
        params.vit_wsc = 0.0
        params.agi_wsc = 0.0
        params.int_wsc = 0.0
        params.mnd_wsc = 0.0
        params.chr_wsc = 0.0
    damage = BlueMagicalSpell(caster, target, spell, params, INT_BASED)
	
    local resist = applyResistance(caster, target, spell, params)
    
	damage = damage * resist
    
	if (damage > (caster:getSkillLevel(tpz.skill.BLUE_MAGIC) + 20)) then
        damage = (caster:getSkillLevel(tpz.skill.BLUE_MAGIC) + 20)
    end

    if (damage < 0) then
        damage = 0
    end

    if (target:isUndead()) then
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
        return damage
    end

    if (target:getHP() < damage) then
        damage = target:getHP()
    end
	
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    caster:addHP(damage)

    return damage
end
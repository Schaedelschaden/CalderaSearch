-----------------------------------------
-- Spell: Sandspray
-- Blinds enemies within a fan-shaped area originating from the caster.
-- Spell cost: 43 MP
-- Monster Type: Beastmen
-- Spell Type: Magical (Dark)
-- Blue Magic Points: 2
-- Stat Bonus: VIT+1
-- Level: 66
-- Casting Time: 3 seconds
-- Recast Time: 90 seconds
-- Magic Bursts on: Compression, Gravitation, and Darkness
-- Combos: Clear Mind
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
	local duration = 120
	local params = {}
		params.attribute = tpz.mod.MND
		params.skillType = tpz.skill.BLUE_MAGIC
        params.damageType = tpz.damageType.DARK
		params.spellFamily = tpz.ecosystem.HUMANOID
        params.multiplier = 1.25
        params.tMultiplier = 1.0 -- dINT/dMND/dCHR multiplier
        params.duppercap = 71
        params.str_wsc = 0.0
        params.dex_wsc = 0.0
        params.vit_wsc = 0.0
        params.agi_wsc = 0.0
        params.int_wsc = 0.0
        params.mnd_wsc = 0.6 -- 0.3
        params.chr_wsc = 0.0
    damage = BlueMagicalSpell(caster, target, spell, params, MND_BASED)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)
	
    local resist = applyResistanceEffect(caster, target, spell, params)
	duration = duration * resist

    if (resist > 0.5) then -- Do it!
        if (target:addStatusEffect(tpz.effect.BLINDNESS, 25, 0, duration)) then
            spell:setMsg(tpz.msg.basic.MAGIC_ENFEEB_IS)
        else
            spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
        end
    else
        spell:setMsg(tpz.msg.basic.MAGIC_RESIST)
    end

    return tpz.effect.BLINDNESS
end
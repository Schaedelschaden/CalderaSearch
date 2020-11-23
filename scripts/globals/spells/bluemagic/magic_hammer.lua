-----------------------------------------
-- Spell: Magic Hammer
-- Steals an amount of enemy's MP equal to damage dealt. Ineffective against undead
-- Spell cost: 40 MP
-- Monster Type: Beastmen
-- Spell Type: Magical (Light)
-- Blue Magic Points: 4
-- Stat Bonus: MP-5, MND+2
-- Level: 74
-- Casting Time: 4 seconds
-- Recast Time: 180 seconds
-- Magic Bursts on: Transfixion, Fusion, and Light
-- Combos: Magic Attack Bonus
-- Notes:
-- Modifiers: MND 30%.
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
		params.attribute = tpz.mod.MND
		params.skillType = tpz.skill.BLUE_MAGIC
        params.damageType = tpz.damageType.LIGHT
		params.spellFamily = tpz.ecosystem.HUMANOID
        params.multiplier = 1.00
        params.tMultiplier = 1.0 -- dINT/dMND/dCHR multiplier
        params.duppercap = 100
        params.str_wsc = 0.0
        params.dex_wsc = 0.0
        params.vit_wsc = 0.0
        params.agi_wsc = 0.0
        params.int_wsc = 0.0
        params.mnd_wsc = 0.6 -- 0.3
        params.chr_wsc = 0.0
    damage = BlueMagicalSpell(caster, target, spell, params, MND_BASED)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    if (target:isUndead()) then
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
    else
        if (target:getMP() > 0) then
            if (target:getMP() < dmg) then
                dmg = target:getMP()
            end
            caster:addMP(dmg)
        else
			spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
            return 0
        end
    end

    return dmg
end
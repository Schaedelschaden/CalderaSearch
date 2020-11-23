-----------------------------------------
-- Spell: Disseverment
-- Delivers a fivefold attack. Accuracy varies with TP.
-- Additional effect: Poison.
-- Spell cost: 74 MP
-- Monster Type: Luminians
-- Spell Type: Physical (Piercing)
-- Blue Magic Points: 5
-- Stat Bonus: INT+1, MND-1
-- Level: 72
-- Casting Time: 0.5 seconds
-- Recast Time: 32.75 seconds
-- Skillchain Element(s): Distortion
-- Combos: Accuracy Bonus
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local params = {}
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
		params.tpmod = TPMOD_ACC
		params.tpmodvalue = 10
        params.damageType = tpz.damageType.PIERCING
		params.spellFamily = tpz.ecosystem.LUMINION
		params.attbonus = -10 -- 10% Attack penalty
        params.numhits = 5
        params.multiplier = 1.50
        params.tp150 = 1.50
        params.tp300 = 1.50
        params.azuretp = 1.50
        params.duppercap = 80
        params.str_wsc = 0.4 -- 0.2
        params.dex_wsc = 0.4 -- 0.2
        params.vit_wsc = 0.0
        params.agi_wsc = 0.0
        params.int_wsc = 0.0
        params.mnd_wsc = 0.0
        params.chr_wsc = 0.0
    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    poison = target:getStatusEffect(tpz.effect.POISON)
    local chance = math.random()
    if (chance < 0.95 and poison == nil) then
        local power = (caster:getMainLvl() / 5) + 3
        target:addStatusEffect(tpz.effect.POISON, power, 3, 180)
    end

    return damage
end
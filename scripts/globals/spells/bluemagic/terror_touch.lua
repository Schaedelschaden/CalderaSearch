-----------------------------------------
-- Spell: Terror Touch 
-- Accuracy varies with TP.
-- Additional effect: Weakens attacks.
-- Spell cost: 62 MP
-- Monster Type: Undead
-- Spell Type: Physical (H2H)
-- Blue Magic Points: 3
-- Stat Bonus: HP-5 MP+10
-- Level: 40
-- Casting Time: 3.25 seconds
-- Recast Time: 21 seconds
-- Duration: 60~ seconds
-- Skillchain Element(s): Compression / Reverberation
-- Combos: Defense Bonus
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
    local damage = 0
    local params = {}
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
    -- D Value (Final Base Damage) ＝ math.floor(D + fSTR + WSC) * fTP
		params.tpmod = TPMOD_ACC
		params.tpmodvalue = 3.34 -- Set to 1/3rd of max value for fTP0 (1x), fTP150 (2x), and fTP300 (3x) bonuses
        params.damageType = tpz.damageType.HTH
		params.spellFamily = tpz.ecosystem.UNDEAD
        params.numhits = 1
        params.multiplier = 1.50 -- fTP @    0-1500 TP
        params.tp150 = 1.50 -- fTP @ 1500-2999 TP
        params.tp300 = 1.50 -- fTP @      3000 TP
        params.azuretp = 1.50 -- fTP @      3500 TP
        params.duppercap = 71
        params.str_wsc = 0.4 -- 0.2
        params.dex_wsc = 0.0
        params.vit_wsc = 0.0
        params.agi_wsc = 0.0
        params.int_wsc = 0.4 -- 0.2
        params.mnd_wsc = 0.0
        params.chr_wsc = 0.0
    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)
	
    if target:hasStatusEffect(tpz.effect.ATTACK_DOWN) then
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT) -- no effect
    else
        target:addStatusEffect(tpz.effect.ATTACK_DOWN, 15, 0, 20)
    end

    return damage
end
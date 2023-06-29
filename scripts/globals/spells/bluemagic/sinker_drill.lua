-----------------------------------------
-- Spell: Sinker Drill
-- Delivers a fivefold attack. Damage varies with TP.
-- Spell cost: 91 MP
-- Monster Type: Arcana
-- Spell Type: Physical (Piercing)
-- Blue Magic Points: 6
-- Stat Bonus: STR+4 DEX+4 VIT+4
-- Level: 99
-- Casting Time: 0.5 seconds
-- Recast Time: 20 seconds
-- Skillchain Element(s): Gravitation / Reverbration
-- Combos: Critical Attack Bonus
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
		params.tpmod       = TPMOD_DAMAGE
		params.tpmodvalue  = 11.67 -- Set to 1/3rd of max value for fTP0 (1x), fTP150 (2x), and fTP300 (3x) bonuses
		params.damageType  = tpz.damageType.PIERCING
		params.spellFamily = tpz.ecosystem.ARCANA
        params.numhits     = 5
        params.multiplier  = 1.00 -- fTP @    0-1500 TP
        params.tp150       = 1.20 -- fTP @ 1500-2999 TP
        params.tp300       = 1.40 -- fTP @      3000 TP
        params.azuretp     = 1.80 -- fTP @      3500 TP
        params.duppercap   = 136
        params.str_wsc     = 1.0 -- 0.5
        params.dex_wsc     = 0.0
        params.vit_wsc     = 1.0 -- 0.5
        params.agi_wsc     = 0.0
        params.int_wsc     = 0.0
        params.mnd_wsc     = 0.0
        params.chr_wsc     = 0.0
        
	damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    return damage
end

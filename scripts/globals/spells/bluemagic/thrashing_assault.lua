-----------------------------------------
-- Spell: Thrashing Assault
-- Delivers a fivefold attack
-- Damage varies with TP
-- Spell cost: 119 MP
-- Monster Type: Beastmen
-- Spell Type: Physical (Slashing)
-- Blue Magic Points: 7
-- Stat Bonus: HP+20 DEX+8
-- Level: 99
-- Casting Time: 0.5 seconds
-- Recast Time: 60 seconds
-- Skillchain Element(s): Fusion
-- Combos: Double Attack / Triple Attack
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
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
		params.tpmodvalue  = 16.67 -- Set to 1/3rd of max value for fTP0 (1x), fTP150 (2x), and fTP300 (3x) bonuses
		params.damageType  = tpz.damageType.SLASHING
		params.spellFamily = tpz.ecosystem.HUMANOID
		params.skillType   = tpz.skill.BLUE_MAGIC
        params.numhits     = 5
        params.multiplier  = 1.25 -- fTP @    0-1500 TP
        params.tp150       = 1.50 -- fTP @ 1500-2999 TP
        params.tp300       = 1.75 -- fTP @      3000 TP
        params.azuretp     = 2.00 -- fTP @      3500 TP
        params.duppercap   = 132
        params.str_wsc     = 0.64 -- 0.32
        params.dex_wsc     = 0.64 -- 0.32
        params.vit_wsc     = 0.0
        params.agi_wsc     = 0.0
        params.int_wsc     = 0.0
        params.mnd_wsc     = 0.0
        params.chr_wsc     = 0.0
    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    return damage
end

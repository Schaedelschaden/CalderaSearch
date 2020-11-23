-----------------------------------------
-- Spell: Saurian Slide
-- Damage varies with TP.
-- Additional effect: Weakens attacks.
-- Spell cost: 109 MP
-- Monster Type: Beastmen
-- Spell Type: Physical (Slashing)
-- Blue Magic Points: 7
-- Stat Bonus: HP+50 VIT+6 INT-3
-- Level: 99
-- Casting Time: 0.5 second
-- Recast Time: 35 seconds
-- Skillchain Element(s): Fragmentation / Distortion
-- Combos: Inquartata
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
	local duration = 60
	local params = {}
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
	-- D Value (Final Base Damage) ＝ math.floor(D + fSTR + WSC) * Multiplier
        params.tpmod = TPMOD_DAMAGE -- Caps at +25% ATT per TP Tier
		params.tpmodvalue = 35
		params.damageType = tpz.damageType.SLASHING
		params.spellFamily = tpz.ecosystem.HUMANOID
		params.attbonus = 50 -- +50% Attack
        params.numhits = 1
        params.multiplier = 7.50 -- 1.00
        params.tp150 = 8.50 -- 2.00
        params.tp300 = 10.00 -- 3.00
        params.azuretp = 15.00 -- 5.00
        params.duppercap = 136
        params.str_wsc = 0.0
        params.dex_wsc = 0.0
        params.vit_wsc = 1.2 -- 0.6
        params.agi_wsc = 0.0
        params.int_wsc = 0.0
        params.mnd_wsc = 0.0
        params.chr_wsc = 0.0
		
    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)
	
	target:addStatusEffect(tpz.effect.ATTACK_DOWN, 25, 0, duration)

    return damage
end
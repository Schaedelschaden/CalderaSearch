-----------------------------------------
-- Spell: Sweeping Gouge
-- Delivers a twofold attack. Duration of effect varies with TP. 
-- Additional effect: Weakens defense.
-- Spell cost: 29 MP
-- Monster Type: Beasts
-- Spell Type: Physical (Impact)
-- Blue Magic Points: 6
-- Stat Bonus: HP+25 VIT+5
-- Level: 99
-- Casting Time: 0.5 second
-- Recast Time: 120 seconds
-- Skillchain Element(s): 
-- Combos: Lizard Killer
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
	local tp = caster:getTP() + caster:getMerit(tpz.merit.ENCHAINMENT)
	local duration = 120
	local params = {}
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
	-- D Value (Final Base Damage) ＝ math.floor(D + fSTR + WSC) * Multiplier
        params.damageType = tpz.damageType.IMPACT
		params.spellFamily = tpz.ecosystem.BEAST
		params.attbonus = 90 -- +90% Attack
		params.isACrit = true
        params.numhits = 2
        params.multiplier = 6.00 -- 1.00
        params.tp150 = 7.00 -- 2.00
        params.tp300 = 8.00 -- 3.00
        params.azuretp = 10.00 -- 5.00
        params.duppercap = 136
        params.str_wsc = 0.0
        params.dex_wsc = 0.0
        params.vit_wsc = 0.6 -- 0.3
        params.agi_wsc = 0.0
        params.int_wsc = 0.0
        params.mnd_wsc = 0.0
        params.chr_wsc = 0.0
		
    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)
	
	--           0 TP = No TP bonus
	--    1 - 1499 TP = Tier 1 bonus
	-- 1500 - 2999 TP = Tier 2 bonus
	--      = 3000 TP = Tier 3 bonus
	--      > 3000 TP = Azure Lore Bonus
	if (tp == 0) then
		duration = duration * 0.50
	elseif (tp >= 1 and tp <= 1499) then
		duration = duration * 0.70
	elseif (tp >= 1500 and tp <= 2999) then
		duration = duration * 0.90
	elseif (tp == 3000) then
		duration = duration
	elseif (tp > 3000) then
		duration = duration * 1.5
	end
	
	target:addStatusEffect(tpz.effect.DEFENSE_DOWN, 16, 0, duration)

    return damage
end
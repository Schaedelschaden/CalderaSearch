-----------------------------------------
-- Spell: Sprout Smack
-- Additional effect: Slow. Duration of effect varies with TP
-- Spell cost: 6 MP
-- Monster Type: Plantoids
-- Spell Type: Physical (Blunt)
-- Blue Magic Points: 2
-- Stat Bonus: MND+1
-- Level: 4
-- Casting Time: 0.5 seconds
-- Recast Time: 7.25 seconds
-- Skillchain property: Reverberation
-- Combos: Beast Killer
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local tp = caster:getTP() + caster:getMerit(tpz.merit.ENCHAINMENT)
	local duration = 40
	local params = {}
	-- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
        params.damageType = tpz.damageType.IMPACT
		params.spellFamily = tpz.ecosystem.PLANTOID
        params.numhits = 1
        params.multiplier = 1.50
        params.tp150 = 1.50
        params.tp300 = 1.50
        params.azuretp = 1.50
        params.duppercap = 15
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
	
    target:addStatusEffect(tpz.effect.SLOW, 1500, 0, duration)

    return damage
end
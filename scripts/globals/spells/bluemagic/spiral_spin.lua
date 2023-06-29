-----------------------------------------
-- Spell: Spiral Spin
-- Chance of effect varies with TP.
-- Additional Effect: Accuracy Down.
-- Spell cost: 39 MP
-- Monster Type: Vermin
-- Spell Type: Physical (Slashing)
-- Blue Magic Points: 3
-- Stat Bonus: STR+1 HP+5
-- Level: 60
-- Casting Time: 4 seconds
-- Recast Time: 45 seconds
-- Skillchain property: Transfixion
-- Combos: Plantoid Killer
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local tp = caster:getTP()
	local threshold = 20 -- 20% chance to apply at 0 TP
	local duration = 45 -- 45s duration at 0 TP
	local chance = math.random(1, 100)
    local damage = 0
	local params = {}
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
    -- D Value (Final Base Damage) ＝ math.floor(D + fSTR + WSC) * fTP
        params.damageType = tpz.damageType.SLASHING
		params.spellFamily = tpz.ecosystem.VERMIN
        params.numhits = 1
        params.multiplier = 2.00 -- fTP @    0-1500 TP
        params.tp150 = 2.00 -- fTP @ 1500-2999 TP
        params.tp300 = 2.00 -- fTP @      3000 TP
        params.azuretp = 2.00 -- fTP @      3500 TP
        params.duppercap = 15
        params.str_wsc = 0.0
        params.dex_wsc = 0.0
        params.vit_wsc = 0.0
        params.agi_wsc = 0.6 -- 0.3
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
	if (tp >= 1 and tp <= 1499) then
		threshold = 40
		duration = 50
	elseif (tp >= 1500 and tp <= 2999) then
		threshold = 60
		duration = 55
	elseif (tp == 3000) then
		threshold = 80
		duration = 60
	elseif (tp > 3000) then
		threshold = 100
		duration = 120
	end

    if damage > 0 and chance < threshold then
        target:addStatusEffect(tpz.effect.ACCURACY_DOWN, 4, 0, duration)
    end

    return damage
end
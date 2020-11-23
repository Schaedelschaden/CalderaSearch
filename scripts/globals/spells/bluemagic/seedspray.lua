-----------------------------------------
-- Spell: Seedspray
-- Delivers a threefold attack. Chance of effect varies with TP.
-- Additional effect: Weakens defense.
-- Spell cost: 61 MP
-- Monster Type: Plantoids
-- Spell Type: Physical (Slashing)
-- Blue Magic Points: 2
-- Stat Bonus: VIT+1
-- Level: 61
-- Casting Time: 4 seconds
-- Recast Time: 35 seconds
-- Skillchain Element(s): Induration / Detonation
-- Combos: Beast Killer
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
	local threshold = 35 -- 35% chance to inflict additional effect at 0 TP
    local chance = math.random()
	local duration = 90
	
	local params = {}
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
        params.damageType = tpz.damageType.SLASHING
		params.spellFamily = tpz.ecosystem.PLANTOID
        params.numhits = 3
        params.multiplier = 0.875
        params.tp150 = 0.875
        params.tp300 = 0.875
        params.azuretp = 0.875
        params.duppercap = 71
        params.str_wsc = 0.0
        params.dex_wsc = 0.6 -- 0.3
        params.vit_wsc = 0.0
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
	if (tp >= 1 and tp <= 1499) then
		threshold = 50
		duration = 100
	elseif (tp >= 1500 and tp <= 2999) then
		threshold = 75
		duration = 110
	elseif (tp == 3000) then
		threshold = 90
		duration = 120
	elseif (tp > 3000) then
		threshold = 100
		duration = 240
	end
	
	if (damage > 0 and chance < threshold) then
        target:addStatusEffect(tpz.effect.DEFENSE_DOWN, 8, 0, duration)
    end

    return damage
end
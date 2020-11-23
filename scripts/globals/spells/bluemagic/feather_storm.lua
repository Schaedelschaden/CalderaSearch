-----------------------------------------
-- Spell: Feather Storm.
-- Chance of effect varies with TP.
-- Additional effect: Poison.
-- Spell cost: 12 MP
-- Monster Type: Beastmen
-- Spell Type: Physical (Piercing)
-- Blue Magic Points: 3
-- Stat Bonus: CHR+2, HP+5
-- Level: 12
-- Casting Time: 0.5 seconds
-- Recast Time: 10 seconds
-- Skillchain Element(s): Transfixion
-- Combos: Rapid Shot
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local tp = caster:getTP() + caster:getMerit(tpz.merit.ENCHAINMENT)
	local duration = 30
	local chance = math.random(1,100)
	local threshold = 30
	local params = {}
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
        params.damageType = tpz.damageType.PIERCING
		params.spellFamily = tpz.ecosystem.HUMANOID
        params.numhits = 1
        params.multiplier = 2.00
        params.tp150 = 2.00
        params.tp300 = 2.00
        params.azuretp = 2.00
        params.duppercap = 17
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
		threshold = 45
	elseif (tp >= 1500 and tp <= 2999) then
		threshold = 60
	elseif (tp == 3000) then
		threshold = 75
	elseif (tp > 3000) then
		threshold = 100
	end

    if (chance <= threshold) then
        target:addStatusEffect(tpz.effect.POISON, 3, 0, duration)
    end

    return damage
end
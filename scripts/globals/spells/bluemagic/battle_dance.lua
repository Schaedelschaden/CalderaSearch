-----------------------------------------
-- Spell: Battle Dance
-- Delivers an area attack. Duration of effect varies with TP.
-- Additional effect: DEX Down.
-- Spell cost: 12 MP
-- Monster Type: Beastmen
-- Spell Type: Physical (Slashing)
-- Blue Magic Points: 3
-- Stat Bonus: DEX+2
-- Level: 12
-- Casting Time: 1 second
-- Recast Time: 10 seconds
-- Skillchain Element(s): Impaction
-- Combos: Attack Bonus
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
	local duration = 60
	local params = {}
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
        params.damageType = tpz.damageType.SLASHING
		params.spellFamily = tpz.ecosystem.HUMANOID
        params.numhits = 1
        params.multiplier = 2.00
        params.tp150 = 2.00
        params.tp300 = 2.00
        params.azuretp = 2.00
        params.duppercap = 17
        params.str_wsc = 0.6 -- 0.3
        params.dex_wsc = 0.0
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

    target:addStatusEffect(tpz.effect.DEX_DOWN, 15, 0, duration)
	target:delStatusEffect(tpz.effect.BLINK)
	target:delStatusEffect(tpz.effect.COPY_IMAGE)
	target:delStatusEffect(tpz.effect.THIRD_EYE)

    return damage
end
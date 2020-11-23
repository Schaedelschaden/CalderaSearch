-----------------------------------------
-- Spell: Queasyshroom
-- Additional effect: Poison. Duration of effect varies with TP
-- Spell cost: 20 MP
-- Monster Type: Plantoids
-- Spell Type: Physical (Piercing)
-- Blue Magic Points: 2
-- Stat Bonus: HP-5, MP+5
-- Level: 8
-- Casting Time: 2 seconds
-- Recast Time: 15 seconds
-- Skillchain Element(s): Compression
-- Combos: None
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
	local tp = caster:getTP() + caster:getMerit(tpz.merit.ENCHAINMENT)
	local duration = 180
	local chance = math.random(1,100)
	local params = {}
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
		params.tpmod = TPMOD_CRITICAL
		params.tpmodvalue = 7
        params.damageType = tpz.damageType.PIERCING
		params.spellFamily = tpz.ecosystem.PLANTOID
        params.numhits = 1
        params.multiplier = 1.75
        params.tp150 = 1.75
        params.tp300 = 1.75
        params.azuretp = 1.75
        params.duppercap = 15
        params.str_wsc = 0.0
        params.dex_wsc = 0.0
        params.vit_wsc = 0.0
        params.agi_wsc = 0.0
        params.int_wsc = 0.2 -- 0.1
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

    if (damage > 0 and chance > 10) then
        target:delStatusEffect(tpz.effect.POISON)
        target:addStatusEffect(tpz.effect.POISON, 3, 0, getBlueEffectDuration(caster, resist, tpz.effect.POISON))
    end
	
	target:delStatusEffect(tpz.effect.BLINK)
	target:delStatusEffect(tpz.effect.COPY_IMAGE)

    return damage
end
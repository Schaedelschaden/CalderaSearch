-----------------------------------------
-- Spell: Delta Thrust
-- Delivers a threefold attack on a single target. 
-- Additional effect: Plague
-- Spell cost: 28 MP
-- Monster Type: Lizards
-- Spell Type: Physical (Slashing)
-- Blue Magic Points: 2
-- Stat Bonus: HP+15 MP-5 INT -1
-- Level: 89
-- Casting Time: 0.5 seconds
-- Recast Time: 15 seconds
-- Skillchain Element(s): Liquefaction / Detonation
-- Combos: Dual Wield
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    local params = {}
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
        params.damageType = tpz.damageType.SLASHING
		params.spellFamily = tpz.ecosystem.LIZARD
		params.diff = caster:getStat(tpz.mod.VIT) - target:getStat(tpz.mod.VIT) -- Determines Plague resist
		params.skillType = tpz.skill.BLUE_MAGIC
        params.numhits = 3
        params.multiplier = 1.09375
        params.tp150 = 2.1875 -- 1.09375
        params.tp300 = 3.2813 -- 1.09375
        params.azuretp = 4.375 -- 1.09375
        params.duppercap = 132
        params.str_wsc = 0.4 -- 0.2
        params.dex_wsc = 0.0
        params.vit_wsc = 1.0 -- 0.5
        params.agi_wsc = 0.0
        params.int_wsc = 0.0
        params.mnd_wsc = 0.0
        params.chr_wsc = 0.0
    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)
	
	local duration = math.random(40,60)
	local tp = caster:getTP()
	local tpModValue = 15 -- 15% base chance to inflict Plague
	local chance = math.random(1,100)
	
	if (tp > 0 and tp <= 1499) then
		tpModValue = 35 -- 35% chance @ 1-1499 TP
	elseif (tp >= 1500 and tp <= 2999) then
		tpModValue = 60 -- 60% chance @ 1500-2999 TP
	elseif (tp >= 3000) then
		tpModValue = 90 -- 90% chance @ 3000+ TP
	end
	
	printf("Delta Thrust onSpellCast IF RANDOM [%i] <= PLAGUE CHANCE [%i] INFLICT PLAGUE\n", chance, tpModValue)
	
	if (damage > 0 and chance <= tpModValue) then
		target:addStatusEffect(tpz.effect.PLAGUE, 12, 0, duration) -- 6 MP/120 TP per tick
	end

    return damage
end
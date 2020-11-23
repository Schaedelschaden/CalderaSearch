-----------------------------------------
-- Spell: Bilgestorm
-- Deals damage in an area of effect.
-- Additional effect: Lowers attack, accuracy, and defense.
-- Spell cost: 122 MP
-- Monster Type: Demons
-- Spell Type: Physical (Impact)
-- Blue Magic Points: 0 (Unbridled Learning/Wisdom)
-- Stat Bonus: 
-- Level: 99
-- Casting Time: 1 second
-- Recast Time: 30 seconds
-- Skillchain Element(s): Darkness / Gravitation
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
	local chance = math.random(1,100)
	local duration = 60
	local randomize = math.random(1,30)
	local params = {}
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
	-- D Value (Final Base Damage) ＝ math.floor(D + fSTR + WSC) * Multiplier
        params.attribute = tpz.mod.INT
		params.skillType = tpz.skill.BLUE_MAGIC
		params.damageType = tpz.damageType.IMPACT
		params.spellFamily = tpz.ecosystem.DEMON
        params.numhits = 1
        params.multiplier = 8.00 -- 5.00
        params.tp150 = 8.00
        params.tp300 = 8.00
        params.azuretp = 10.00
        params.duppercap = 136
        params.str_wsc = 0.0
        params.dex_wsc = 0.0
        params.vit_wsc = 0.0
        params.agi_wsc = 0.0
        params.int_wsc = 0.6 -- 0.3
        params.mnd_wsc = 0.0
        params.chr_wsc = 1.2 -- 0.6
		
    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)
	
	if (chance < 75) then
		randomize = math.random(1,30)
		duration = duration - randomize
		target:addStatusEffect(tpz.effect.ATTACK_DOWN, 25, 0, duration)
	end
	
	chance = math.random(1,100)
	
	if (chance < 75) then
		randomize = math.random(1,30)
		duration = duration - randomize
		target:addStatusEffect(tpz.effect.ACCURACY_DOWN, 25, 0, duration)
	end
	
	if (chance < 75) then
		randomize = math.random(1,30)
		duration = duration - randomize
		target:addStatusEffect(tpz.effect.DEFENSE_DOWN, 25, 0, duration)
	end
	
	caster:delStatusEffect(tpz.effect.UNBRIDLED_LEARNING)

    return damage
end
-----------------------------------------
-- Spell: Bloodrake
-- Delivers a threefold attack. Damage varies with TP.
-- Additional effect: HP Drain.
-- Spell cost: 99 MP
-- Monster Type: Undead
-- Spell Type: Physical (Slashing)
-- Blue Magic Points: 0 (Unbridled Learning/Wisdom)
-- Stat Bonus: 
-- Level: 99
-- Casting Time: 0.5 second
-- Recast Time: 30 seconds
-- Skillchain Element(s): Darkness / Distortion
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
	local params = {}
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
	-- D Value (Final Base Damage) ＝ math.floor(D + fSTR + WSC) * Multiplier
        params.attribute = tpz.mod.INT
		params.skillType = tpz.skill.BLUE_MAGIC
		params.damageType = tpz.damageType.SLASHING
		params.spellFamily = tpz.ecosystem.DEMON
		params.attbonus = 75 -- 75% Attack boost
        params.numhits = 3
        params.multiplier = 50.00 -- 1.00
        params.tp150 = 6.50 -- 1.1375
        params.tp300 = 8.00 -- ???
        params.azuretp = 10.00 -- ???
        params.duppercap = 136
        params.str_wsc = 0.6 -- 0.3
        params.dex_wsc = 0.0
        params.vit_wsc = 0.0
        params.agi_wsc = 0.0
        params.int_wsc = 0.0
        params.mnd_wsc = 0.6 -- 0.3
        params.chr_wsc = 0.0
		
    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)
	
	if (target:isUndead()) then
		return damage
	else
		-- Curse II prevents restoring HP
		if not (caster:hasStatusEffect(20)) then
			caster:addHP(damage)
		end
	end
	
    return damage
end
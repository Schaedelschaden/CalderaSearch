-----------------------------------------
-- Spell: Tourbillion
-- Delivers an area attack. Additional effect duration varies with TP. 
-- Additional effect: Weakens defense.
-- Spell cost: 108 MP
-- Monster Type: Arcana
-- Spell Type: Physical (Impact)
-- Blue Magic Points: 0 (Unbridled Learning/Wisdom)
-- Stat Bonus: 
-- Level: 97
-- Casting Time: 1 second
-- Recast Time: 30 seconds
-- Duration: 90-120 seconds (subject to resists)
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
	local chance   = math.random(1,100)
	local tp       = caster:getTP()
	local duration = BluePhysDebuffDuration(caster, 120)
    local damage   = 0
	local params   = {}
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
    -- D Value (Final Base Damage) ＝ math.floor(D + fSTR + WSC) * fTP
        params.damageType  = tpz.damageType.IMPACT
		params.spellFamily = tpz.ecosystem.ARCANA
        params.numhits     = 1
        params.multiplier  = 8.00 -- fTP @    0-1500 TP
        params.tp150       = 8.00 -- fTP @ 1500-2999 TP
        params.tp300       = 8.00 -- fTP @      3000 TP
        params.azuretp     = 8.00 -- fTP @      3500 TP
        params.duppercap   = 136
        params.str_wsc     = 0.50 -- 0.25
        params.dex_wsc     = 0.0
        params.vit_wsc     = 0.0
        params.agi_wsc     = 0.0
        params.int_wsc     = 0.0
        params.mnd_wsc     = 0.50 -- 0.25
        params.chr_wsc     = 0.0
        
    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)
	
	if chance < 85 then
		target:addStatusEffect(tpz.effect.DEFENSE_DOWN, 33, 0, duration)
	end
	
	caster:delStatusEffect(tpz.effect.UNBRIDLED_LEARNING)

    return damage
end

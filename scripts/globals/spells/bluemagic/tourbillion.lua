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
	local chance = math.random(1,100)
	local tp = caster:getTP() + caster:getMerit(tpz.merit.ENCHAINMENT)
	local duration = 120
	local params = {}
        params.damageType = tpz.damageType.IMPACT
		params.spellFamily = tpz.ecosystem.ARCANA
        params.numhits = 1
        params.multiplier = 50.00 -- 0~1499 TP, D Value Multiplier -- 4.00
        params.tp150 = 12.00 -- 1500~2999 TP
        params.tp300 = 12.00 -- 3000 TP
        params.azuretp = 14.00 -- 3500 TP/Azure Lore TP modifier -- 4.50
        params.duppercap = 136
        params.str_wsc = 0.50 -- 0.25
        params.dex_wsc = 0.0
        params.vit_wsc = 0.0
        params.agi_wsc = 0.0
        params.int_wsc = 0.0
        params.mnd_wsc = 0.50 -- 0.25
        params.chr_wsc = 0.0
    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)
	
	--           0 TP = No TP bonus
	--    1 - 1499 TP = Tier 1 bonus
	-- 1500 - 2999 TP = Tier 2 bonus
	--      = 3000 TP = Tier 3 bonus
	--      > 3000 TP = Azure Lore Bonus
	if (tp == 0) then
		duration = duration * 0.5
	elseif (tp >= 1 and tp <= 1499) then
		duration = duration * 0.7
	elseif (tp >= 1500 and tp <= 2999) then
		duration = duration * 0.9
	elseif (tp == 3000) then
		duration = duration
	elseif (tp > 3000) then
		duration = duration * 1.5
	end
	
	if (chance < 85) then
		target:addStatusEffect(tpz.effect.DEFENSE_DOWN, 33, 0, duration)
	end
	
--	printf("Tourbillion onSpellCast CHANCE: [%i]\n", chance)
	
	caster:delStatusEffect(tpz.effect.UNBRIDLED_LEARNING)

    return damage
end
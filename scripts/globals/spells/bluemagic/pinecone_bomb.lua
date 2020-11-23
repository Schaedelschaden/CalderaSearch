-----------------------------------------
-- Spell: Pinecone Bomb
-- Additional effect: sleep. Duration of effect varies with TP. 
-- Spell cost: 48 MP
-- Monster Type: Plantoid
-- Spell Type: Physical (Piercing)
-- Blue Magic Points: 2
-- Stat Bonus: STR+1
-- Level: 36
-- Casting Time: 2.5 seconds
-- Recast Time: 26 seconds
-- Skillchains Property: Liquefaction
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
	local duration = 60
	local params = {}
        params.damageType = tpz.damageType.PIERCING
		params.spellFamily = tpz.ecosystem.PLANTOID
        params.numhits = 1
        params.multiplier = 2.25
        params.tp150 = 2.25
        params.tp300 = 2.25
        params.azuretp = 2.25
        params.duppercap = 21
        params.str_wsc = 0.4 -- 0.2
        params.dex_wsc = 0.0
        params.vit_wsc = 0.0
        params.agi_wsc = 0.4 -- 0.2
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
	
	-- Set the sleep effect's resist parameters
	local params = {}
		params.diff = caster:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT)
		params.attribute = tpz.mod.INT
		params.skillType = tpz.skill.BLUE_MAGIC
		params.bonus = 1.0
		params.effect = tpz.effect.SLEEP
	
	local resist = applyResistance(caster, target, spell, params)
	
	duration = duration * resist
	
	if (duration < 10) then
		duration = 10
	end
	
--	printf("Pinecone Bomb onSpellCast DURATION: [%i]\n", duration)
	
	target:addStatusEffect(tpz.effect.SLEEP_II, 1, 0, duration)
	
    return damage
end
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
	local tp = caster:getTP()
	local duration = 60
    local damage = 0
	local params = {}
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
    -- D Value (Final Base Damage) ＝ math.floor(D + fSTR + WSC) * fTP
        params.damageType = tpz.damageType.PIERCING
		params.spellFamily = tpz.ecosystem.PLANTOID
        params.numhits = 1
        params.multiplier = 2.25 -- fTP @    0-1500 TP
        params.tp150 = 2.25 -- fTP @ 1500-2999 TP
        params.tp300 = 2.25 -- fTP @      3000 TP
        params.azuretp = 2.25 -- fTP @      3500 TP
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
		params.effect = tpz.effect.SLEEP_II
	
	local resist = applyResistance(caster, target, spell, params)
	
	duration = duration * resist
	
	if duration < 10 then
		duration = 10
	end
	
--	printf("Pinecone Bomb onSpellCast DURATION: [%i]\n", duration)
	
	target:addStatusEffect(tpz.effect.SLEEP_II, 1, 0, duration)
	
    return damage
end
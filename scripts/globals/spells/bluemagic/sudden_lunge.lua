-----------------------------------------
-- Spell: Sudden Lunge
-- Damage varies with TP. Additional effect: "Stun."
-- Spell cost: 18 MP
-- Monster Type: Vermin
-- Spell Type: Physical (Slashing)
-- Blue Magic Points: 4
-- Stat Bonus: HP-5 MP-5 DEX+1 AGI+1
-- Level: 95
-- Casting Time: 0.5 seconds
-- Recast Time: 15 seconds
-- Skillchain Element(s):
-- Combos: Store TP
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local dINT = caster:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT)
    local damage = 0
    local params = {}
		params.diff = nil
		params.attribute = tpz.mod.INT
		params.skillType = tpz.skill.BLUE_MAGIC
		params.bonus = 0
		params.effect = tpz.effect.STUN
		params.resistCap = 0.25
    local resist = applyResistanceEffect(caster, target, spell, params)
    local params = {}
    -- Todo: determine if these param values are retail
        params.tpmod = TPMOD_DAMAGE
        params.tpmodvalue = 16.67 -- Set to 1/3rd of max value for fTP0 (1x), fTP150 (2x), and fTP300 (3x) bonuses
        params.damageType = tpz.damageType.SLASHING
        params.scattr = SC_DETONATION
        params.numhits = 1
        params.multiplier = 1.50 -- fTP @    0-1500 TP
        params.tp150 = 2.50 -- fTP @ 1500-2999 TP
        params.tp300 = 3.00 -- fTP @      3000 TP
        params.azuretp = 3.50 -- fTP @      3500 TP
        params.duppercap = 100
        params.str_wsc = 0.0
        params.dex_wsc = 0.0
        params.vit_wsc = 0.0
        params.agi_wsc = 0.4
        params.int_wsc = 0.0
        params.mnd_wsc = 0.0
        params.chr_wsc = 0.0
    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)
	
    if resist > 0.25 then -- This line may need adjusting for retail accuracy.
        target:addStatusEffect(tpz.effect.STUN, 1, 0, 5 * resist) -- Wiki says duration of "up to" 20 second..
    end

    return damage
end

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

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local duration = BluePhysDebuffDuration(caster, 60)
    local damage   = 0
    local params   = {}
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
    -- D Value (Final Base Damage) ＝ math.floor(D + fSTR + WSC) * fTP
        params.damageType  = tpz.damageType.SLASHING
        params.spellFamily = tpz.ecosystem.LIZARD
        params.diff        = caster:getStat(tpz.mod.VIT) - target:getStat(tpz.mod.VIT) -- Determines Plague resist
        params.skillType   = tpz.skill.BLUE_MAGIC
        params.numhits     = 3
        params.multiplier  = 1.09375 -- fTP @    0-1500 TP
        params.tp150       = 1.09375 -- fTP @ 1500-2999 TP
        params.tp300       = 1.09375 -- fTP @      3000 TP
        params.azuretp     = 1.09375 -- fTP @      3500 TP
        params.duppercap   = 132
        params.str_wsc     = 0.4 -- 0.2
        params.dex_wsc     = 0.0
        params.vit_wsc     = 1.0 -- 0.5
        params.agi_wsc     = 0.0
        params.int_wsc     = 0.0
        params.mnd_wsc     = 0.0
        params.chr_wsc     = 0.0

    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    local tp         = caster:getTP()
    local tpModValue = 15 -- 15% base chance to inflict Plague
    local chance     = math.random(0, 100)

    if tp > 0 and tp <= 1499 then
        tpModValue = 25 -- 25% chance @ 1-1499 TP
    elseif tp >= 1500 and tp <= 2999 then
        tpModValue = 50 -- 50% chance @ 1500-2999 TP
    elseif tp == 3000 then
        tpModValue = 70 -- 70% chance @ 3000 TP
    elseif caster:hasStatusEffect(tpz.effect.AZURE_LORE) then
        tpModValue = 100 -- 100% chance @ 3500 TP
    end

    if damage > 0 and chance <= tpModValue then
        target:addStatusEffect(tpz.effect.PLAGUE, 12, 0, duration) -- 6 MP/120 TP per tick
    end

    return damage
end

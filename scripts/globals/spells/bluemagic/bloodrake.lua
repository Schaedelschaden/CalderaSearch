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
    local damage = 0
    local params = {}
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
    -- D Value (Final Base Damage) ＝ math.floor(D + fSTR + WSC) * fTP
        params.tpmod       = TPMOD_DAMAGE
        params.tpmodvalue  = 15 -- Set to 1/3rd of max value for fTP0 (1x), fTP150 (2x), and fTP300 (3x) bonuses
        params.damageType  = tpz.damageType.SLASHING
        params.spellFamily = tpz.ecosystem.DEMON
        params.attbonus    = 75 -- 75% Attack boost
        params.numhits     = 3
        params.multiplier  = 1.8000 -- fTP @    0-1500 TP
        params.tp150       = 2.6375 -- fTP @ 1500-2999 TP
        params.tp300       = 2.9525 -- fTP @      3000 TP
        params.azuretp     = 3.2875 -- fTP @      3500 TP
        params.duppercap   = 136
        params.str_wsc     = 0.6 -- 0.3
        params.dex_wsc     = 0.0
        params.vit_wsc     = 0.0
        params.agi_wsc     = 0.0
        params.int_wsc     = 0.0
        params.mnd_wsc     = 0.6 -- 0.3
        params.chr_wsc     = 0.0

    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    caster:delStatusEffect(tpz.effect.UNBRIDLED_LEARNING)

    if target:isUndead() then
        return damage
    else
        -- Curse II prevents restoring HP
        if not caster:hasStatusEffect(tpz.effect.CURSE_II) then
            caster:addHP(damage)
        end
    end

    return damage
end

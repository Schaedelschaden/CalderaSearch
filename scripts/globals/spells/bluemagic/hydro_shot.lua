-----------------------------------------
-- Spell: Hydro Shot
-- Chance of effect varies with TP.
-- Additional effect: Enmity Down.
-- Spell cost: 55 MP
-- Monster Type: Beastmen
-- Spell Type: Physical (H2H)
-- Blue Magic Points: 3
-- Stat Bonus: MND+2
-- Level: 63
-- Casting Time: 0.5 seconds
-- Recast Time: 26 seconds
-- Skillchain Element(s): Reverberation
-- Combos: Rapid Shot
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local tp     = caster:getTP()
    local chance = 25
    local damage = 0
    local params = {}
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
    -- D Value (Final Base Damage) ＝ math.floor(D + fSTR + WSC) * fTP
        params.damageType  = tpz.damageType.HTH
        params.spellFamily = tpz.ecosystem.HUMANOID
        params.numhits     = 1
        params.multiplier  = 1.25 -- fTP @    0-1500 TP
        params.tp150       = 1.25 -- fTP @ 1500-2999 TP
        params.tp300       = 1.25 -- fTP @      3000 TP
        params.azuretp     = 1.25 -- fTP @      3500 TP
        params.duppercap   = 75
        params.str_wsc     = 0.0
        params.dex_wsc     = 0.0
        params.vit_wsc     = 0.6 -- 0.3
        params.agi_wsc     = 0.0
        params.int_wsc     = 0.0
        params.mnd_wsc     = 0.0
        params.chr_wsc     = 0.0

    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    if tp >= 1500 and tp <= 2999 then
        chance = 50 -- 50% chance @ 1500-2999 TP
    elseif tp == 3000 then
        chance = 75 -- 75% chance @ 3000 TP
    elseif caster:hasStatusEffect(tpz.effect.AZURE_LORE) then
        chance = 100 -- 100% chance @ 3500 TP
    end

    if caster:getObjType() ~= tpz.objType.MOB and math.random(0, 100) < chance then
        target:lowerEnmity(caster, 15)
    end

    return damage
end

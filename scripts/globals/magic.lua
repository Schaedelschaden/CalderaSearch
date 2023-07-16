require("scripts/globals/spell_data")
require("scripts/globals/magicburst")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/utils")
require("scripts/globals/msg")
require("scripts/globals.geo")
------------------------------------

tpz = tpz or {}
tpz.magic = tpz.magic or {}

tpz.magic.geoCardinalQuadStats =
{
   [1]  = {direction = '[W]',   MATT = 0.00, MACC = 0.00, MAG_BURST_BONUS = 1.00, MAGIC_CRITHITRATE = 0.00},
   [2]  = {direction = '[WSW]', MATT = 0.00, MACC = 0.25, MAG_BURST_BONUS = 0.75, MAGIC_CRITHITRATE = 0.00},
   [3]  = {direction = '[SW]',  MATT = 0.00, MACC = 0.50, MAG_BURST_BONUS = 0.50, MAGIC_CRITHITRATE = 0.00},
   [4]  = {direction = '[SSW]', MATT = 0.00, MACC = 0.75, MAG_BURST_BONUS = 0.25, MAGIC_CRITHITRATE = 0.00},
   [5]  = {direction = '[S]',   MATT = 0.00, MACC = 1.00, MAG_BURST_BONUS = 0.00, MAGIC_CRITHITRATE = 0.00},
   [6]  = {direction = '[SSE]', MATT = 0.25, MACC = 0.75, MAG_BURST_BONUS = 0.00, MAGIC_CRITHITRATE = 0.00},
   [7]  = {direction = '[SE]',  MATT = 0.50, MACC = 0.50, MAG_BURST_BONUS = 0.00, MAGIC_CRITHITRATE = 0.00},
   [8]  = {direction = '[ESE]', MATT = 0.75, MACC = 0.25, MAG_BURST_BONUS = 0.00, MAGIC_CRITHITRATE = 0.00},
   [9]  = {direction = '[E]',   MATT = 1.00, MACC = 0.00, MAG_BURST_BONUS = 0.00, MAGIC_CRITHITRATE = 0.00},
   [10] = {direction = '[ENE]', MATT = 0.75, MACC = 0.00, MAG_BURST_BONUS = 0.00, MAGIC_CRITHITRATE = 0.25},
   [11] = {direction = '[NE]',  MATT = 0.50, MACC = 0.00, MAG_BURST_BONUS = 0.00, MAGIC_CRITHITRATE = 0.50},
   [12] = {direction = '[NNE]', MATT = 0.25, MACC = 0.00, MAG_BURST_BONUS = 0.00, MAGIC_CRITHITRATE = 0.75},
   [13] = {direction = '[N]',   MATT = 0.00, MACC = 0.00, MAG_BURST_BONUS = 0.00, MAGIC_CRITHITRATE = 1.00},
   [14] = {direction = '[NNW]', MATT = 0.00, MACC = 0.00, MAG_BURST_BONUS = 0.25, MAGIC_CRITHITRATE = 0.75},
   [15] = {direction = '[NW]',  MATT = 0.00, MACC = 0.00, MAG_BURST_BONUS = 0.50, MAGIC_CRITHITRATE = 0.50},
   [16] = {direction = '[WNW]', MATT = 0.00, MACC = 0.00, MAG_BURST_BONUS = 0.75, MAGIC_CRITHITRATE = 0.25},
}

-- Base status resistance is set using the resistance mod
-- Immunity status resistance builds based on the use of a status effect
-- Immunity status resistance decays over time
local effectResistTable =
{
 -- [      Status Effect     ] = {"Audit Text",   Resistance mod,      Immunity mod             },
    [tpz.effect.KO           ] = {"KO",           tpz.mod.DEATHRES,    tpz.mod.IMMUNITY_DEATH   },
    [tpz.effect.DOOM         ] = {"DOOM",         tpz.mod.DEATHRES,    tpz.mod.IMMUNITY_DEATH   },
    [tpz.effect.WEIGHT       ] = {"WEIGHT",       tpz.mod.GRAVITYRES,  tpz.mod.IMMUNITY_GRAVITY },
    [tpz.effect.GEO_WEIGHT   ] = {"GEO WEIGHT",   tpz.mod.GRAVITYRES,  tpz.mod.IMMUNITY_GRAVITY },
    [tpz.effect.SLEEP_I      ] = {"SLEEP I",      tpz.mod.SLEEPRES,    tpz.mod.IMMUNITY_SLEEP   },
    [tpz.effect.SLEEP_II     ] = {"SLEEP II",     tpz.mod.SLEEPRES,    tpz.mod.IMMUNITY_SLEEP   },
    [tpz.effect.LULLABY      ] = {"LULLABY",      tpz.mod.LULLABYRES,  tpz.mod.IMMUNITY_LULLABY },
    [tpz.effect.POISON       ] = {"POISON",       tpz.mod.POISONRES,   tpz.mod.IMMUNITY_POISON  },
    [tpz.effect.GEO_POISON   ] = {"GEO POISON",   tpz.mod.POISONRES,   tpz.mod.IMMUNITY_POISON  },
    [tpz.effect.PARALYSIS    ] = {"PARALYZE",     tpz.mod.PARALYZERES, tpz.mod.IMMUNITY_PARALYZE},
    [tpz.effect.GEO_PARALYSIS] = {"GEO PARALYZE", tpz.mod.PARALYZERES, tpz.mod.IMMUNITY_PARALYZE},
    [tpz.effect.BLINDNESS    ] = {"BLIND",        tpz.mod.BLINDRES,    tpz.mod.IMMUNITY_BLIND   },
    [tpz.effect.SILENCE      ] = {"SILENCE",      tpz.mod.SILENCERES,  tpz.mod.IMMUNITY_SILENCE },
    [tpz.effect.PLAGUE       ] = {"PLAGUE",       tpz.mod.VIRUSRES,    tpz.mod.IMMUNITY_VIRUS   },
    [tpz.effect.DISEASE      ] = {"DISEASE",      tpz.mod.VIRUSRES,    tpz.mod.IMMUNITY_VIRUS   },
    [tpz.effect.PETRIFICATION] = {"PETRIFY",      tpz.mod.PETRIFYRES,  tpz.mod.IMMUNITY_PETRIFY },
    [tpz.effect.BIND         ] = {"BIND",         tpz.mod.BINDRES,     tpz.mod.IMMUNITY_BIND    },
    [tpz.effect.CURSE_I      ] = {"CURSE I",      tpz.mod.CURSERES,    tpz.mod.IMMUNITY_CURSE   },
    [tpz.effect.CURSE_II     ] = {"CURSE II",     tpz.mod.CURSERES,    tpz.mod.IMMUNITY_CURSE   },
    [tpz.effect.BANE         ] = {"BANE",         tpz.mod.CURSERES,    tpz.mod.IMMUNITY_CURSE   },
    [tpz.effect.SLOW         ] = {"SLOW",         tpz.mod.SLOWRES,     tpz.mod.IMMUNITY_SLOW    },
    [tpz.effect.GEO_SLOW     ] = {"GEO SLOW",     tpz.mod.SLOWRES,     tpz.mod.IMMUNITY_SLOW    },
    [tpz.effect.ELEGY        ] = {"ELEGY",        tpz.mod.SLOWRES,     tpz.mod.IMMUNITY_SLOW    },
    [tpz.effect.STUN         ] = {"STUN",         tpz.mod.STUNRES,     tpz.mod.IMMUNITY_STUN    },
    [tpz.effect.CHARM_I      ] = {"CHARM I",      tpz.mod.CHARMRES,    tpz.mod.IMMUNITY_CHARM   },
    [tpz.effect.CHARM_II     ] = {"CHARM II",     tpz.mod.CHARMRES,    tpz.mod.IMMUNITY_CHARM   },
    [tpz.effect.AMNESIA      ] = {"AMNESIA",      tpz.mod.AMNESIARES,  tpz.mod.IMMUNITY_AMNESIA },
    [tpz.effect.TERROR       ] = {"TERROR",       tpz.mod.TERRORRES,   tpz.mod.IMMUNITY_TERROR  },
}

------------------------------------
-- Tables by element
------------------------------------
tpz.magic.dayStrong           = {tpz.day.FIRESDAY,              tpz.day.ICEDAY,               tpz.day.WINDSDAY,               tpz.day.EARTHSDAY,              tpz.day.LIGHTNINGDAY,               tpz.day.WATERSDAY,               tpz.day.LIGHTSDAY,           tpz.day.DARKSDAY}
tpz.magic.singleWeatherStrong = {tpz.weather.HOT_SPELL,         tpz.weather.SNOW,             tpz.weather.WIND,               tpz.weather.DUST_STORM,         tpz.weather.THUNDER,                tpz.weather.RAIN,                tpz.weather.AURORAS,         tpz.weather.GLOOM}
tpz.magic.doubleWeatherStrong = {tpz.weather.HEAT_WAVE,         tpz.weather.BLIZZARDS,        tpz.weather.GALES,              tpz.weather.SAND_STORM,         tpz.weather.THUNDERSTORMS,          tpz.weather.SQUALL,              tpz.weather.STELLAR_GLARE,   tpz.weather.DARKNESS}
local elementalObi            = {tpz.mod.FORCE_FIRE_DWBONUS,    tpz.mod.FORCE_ICE_DWBONUS,    tpz.mod.FORCE_WIND_DWBONUS,     tpz.mod.FORCE_EARTH_DWBONUS,    tpz.mod.FORCE_LIGHTNING_DWBONUS,    tpz.mod.FORCE_WATER_DWBONUS,     tpz.mod.FORCE_LIGHT_DWBONUS, tpz.mod.FORCE_DARK_DWBONUS}
local spellAcc                = {tpz.mod.FIREACC,               tpz.mod.ICEACC,               tpz.mod.WINDACC,                tpz.mod.EARTHACC,               tpz.mod.THUNDERACC,                 tpz.mod.WATERACC,                tpz.mod.LIGHTACC,            tpz.mod.DARKACC}
local spellMAB                = {tpz.mod.FIREATT,               tpz.mod.ICEATT,               tpz.mod.WINDATT,                tpz.mod.EARTHATT,               tpz.mod.THUNDERATT,                 tpz.mod.WATERATT,                tpz.mod.LIGHTATT,            tpz.mod.DARKATT}
local strongAffinityDmg       = {tpz.mod.FIRE_AFFINITY_DMG,     tpz.mod.ICE_AFFINITY_DMG,     tpz.mod.WIND_AFFINITY_DMG,      tpz.mod.EARTH_AFFINITY_DMG,     tpz.mod.THUNDER_AFFINITY_DMG,       tpz.mod.WATER_AFFINITY_DMG,      tpz.mod.LIGHT_AFFINITY_DMG,  tpz.mod.DARK_AFFINITY_DMG}
local strongAffinityAcc       = {tpz.mod.FIRE_AFFINITY_ACC,     tpz.mod.ICE_AFFINITY_ACC,     tpz.mod.WIND_AFFINITY_ACC,      tpz.mod.EARTH_AFFINITY_ACC,     tpz.mod.THUNDER_AFFINITY_ACC,       tpz.mod.WATER_AFFINITY_ACC,      tpz.mod.LIGHT_AFFINITY_ACC,  tpz.mod.DARK_AFFINITY_ACC}
tpz.magic.resistMod           = {tpz.mod.FIRERES,               tpz.mod.ICERES,               tpz.mod.WINDRES,                tpz.mod.EARTHRES,               tpz.mod.THUNDERRES,                 tpz.mod.WATERRES,                tpz.mod.LIGHTRES,            tpz.mod.DARKRES}
tpz.magic.specificDmgTakenMod = {tpz.mod.SDT_FIRE,              tpz.mod.SDT_ICE,              tpz.mod.SDT_WIND,               tpz.mod.SDT_EARTH,              tpz.mod.SDT_LIGHTNING,              tpz.mod.SDT_WATER,               tpz.mod.SDT_LIGHT,           tpz.mod.SDT_DARK }
tpz.magic.defenseMod          = {tpz.mod.FIREDEF,               tpz.mod.ICEDEF,               tpz.mod.WINDDEF,                tpz.mod.EARTHDEF,               tpz.mod.THUNDERDEF,                 tpz.mod.WATERDEF,                tpz.mod.LIGHTDEF,            tpz.mod.DARKDEF}
tpz.magic.absorbMod           = {tpz.mod.FIRE_ABSORB,           tpz.mod.ICE_ABSORB,           tpz.mod.WIND_ABSORB,            tpz.mod.EARTH_ABSORB,           tpz.mod.LTNG_ABSORB,                tpz.mod.WATER_ABSORB,            tpz.mod.LIGHT_ABSORB,        tpz.mod.DARK_ABSORB}
tpz.magic.nullMod             = {tpz.mod.FIRE_NULL,             tpz.mod.ICE_NULL,             tpz.mod.WIND_NULL,              tpz.mod.EARTH_NULL,             tpz.mod.LTNG_NULL,                  tpz.mod.WATER_NULL,              tpz.mod.LIGHT_NULL,          tpz.mod.DARK_NULL}
local blmMerit                = {tpz.merit.FIRE_MAGIC_POTENCY,  tpz.merit.ICE_MAGIC_POTENCY,  tpz.merit.WIND_MAGIC_POTENCY,   tpz.merit.EARTH_MAGIC_POTENCY,  tpz.merit.LIGHTNING_MAGIC_POTENCY,  tpz.merit.WATER_MAGIC_POTENCY}
local rdmMerit                = {tpz.merit.FIRE_MAGIC_ACCURACY, tpz.merit.ICE_MAGIC_ACCURACY, tpz.merit.WIND_MAGIC_ACCURACY,  tpz.merit.EARTH_MAGIC_ACCURACY, tpz.merit.LIGHTNING_MAGIC_ACCURACY, tpz.merit.WATER_MAGIC_ACCURACY}
tpz.magic.barSpell            = {tpz.effect.BARFIRE,            tpz.effect.BARBLIZZARD,       tpz.effect.BARAERO,             tpz.effect.BARSTONE,            tpz.effect.BARTHUNDER,              tpz.effect.BARWATER}

tpz.magic.dayWeak             = {tpz.day.WATERSDAY,             tpz.day.FIRESDAY,            tpz.day.ICEDAY,                  tpz.day.WINDSDAY,               tpz.day.EARTHSDAY,                  tpz.day.LIGHTNINGDAY,            tpz.day.DARKSDAY,            tpz.day.LIGHTSDAY           }
tpz.magic.singleWeatherWeak   = {tpz.weather.RAIN,              tpz.weather.HOT_SPELL,       tpz.weather.SNOW,                tpz.weather.WIND,               tpz.weather.DUST_STORM,             tpz.weather.THUNDER,             tpz.weather.GLOOM,           tpz.weather.AURORAS         }
tpz.magic.doubleWeatherWeak   = {tpz.weather.SQUALL,            tpz.weather.HEAT_WAVE,       tpz.weather.BLIZZARDS,           tpz.weather.GALES,              tpz.weather.SAND_STORM,             tpz.weather.THUNDERSTORMS,       tpz.weather.DARKNESS,        tpz.weather.STELLAR_GLARE   }

-- USED FOR DAMAGING MAGICAL SPELLS (Stages 1 and 2 in Calculating Magic Damage on wiki)
--Calculates magic damage using the standard magic damage calc.
--Does NOT handle resistance.
-- Inputs:
-- dmg - The base damage of the spell
-- multiplier - The INT multiplier of the spell
-- skilltype - The skill ID of the spell.
-- atttype - The attribute type (usually tpz.mod.INT , except for things like Banish which is tpz.mod.MND)
-- hasMultipleTargetReduction - true if damage is reduced on AoE. False otherwise (e.g. Charged Whisker vs -ga3 spells)
--
-- Output:
-- The total damage, before resistance and before equipment (so no HQ staff bonus worked out here).
local SOFT_CAP = 60 --guesstimated
local HARD_CAP = 120 --guesstimated

function calculateMagicDamage(caster, target, spell, params)
    local dINT = caster:getStat(params.attribute) - target:getStat(params.attribute)
    local dmg  = params.dmg
    local mDMG = caster:getMod(tpz.mod.MAGIC_DAMAGE)

    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("RAW DAMAGE: [%i] dINT: [%i]", dmg, dINT),tpz.msg.channel.SYSTEM_3)
    end

    if dINT <= 0 then --if dINT penalises, it's always M=1
        dmg = dmg + dINT

        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("    dINT PENALTY! DMG: [%i] = DMG: [%i] + dINT: [%i]", dmg, dmg - dINT, dINT),tpz.msg.channel.SYSTEM_3)
        end

        if dmg <= 0 then --dINT penalty cannot result in negative damage (target absorption)
            return 0
        end
    elseif dINT > 0 and dINT <= SOFT_CAP then --The standard calc, most spells hit this
        dmg = dmg + (dINT * params.multiplier)

        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("    dINT < SOFT CAP! DMG: [%i] = DMG: [%i] + (dINT: [%i] * MULTIPLIER: [%1.2f])", dmg, dmg - (dINT * params.multiplier), dINT, params.multiplier),tpz.msg.channel.SYSTEM_3)
        end
    elseif dINT > 0 and dINT > SOFT_CAP and dINT < HARD_CAP then --After SOFT_CAP, INT is only half effective
        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("    dINT > SOFT CAP! DMG: [%i] = DMG: [%i] + SOFT CAP: [%i] * MULT: [%1.2f] + ((dINT: [%i] - SOFT CAP: [%i]) * MULT: [%1.2f])", dmg + SOFT_CAP * params.multiplier + ((dINT - SOFT_CAP) * params.multiplier) / 2, dmg, SOFT_CAP, params.multiplier, dINT, SOFT_CAP, params.multiplier),tpz.msg.channel.SYSTEM_3)
        end

        dmg = dmg + SOFT_CAP * params.multiplier + ((dINT - SOFT_CAP) * params.multiplier) / 2
    elseif dINT > 0 and dINT > SOFT_CAP and dINT >= HARD_CAP then --After HARD_CAP, INT has no tpz.effect.
        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("    dINT > HARD CAP! DMG: [%i] = DMG: [%i] + HARD CAP: [%i] * MULTIPLIER: [%1.2f]", dmg + HARD_CAP * params.multiplier, dmg, HARD_CAP, params.multiplier),tpz.msg.channel.SYSTEM_3)
        end

        dmg = dmg + HARD_CAP * params.multiplier
    end

    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("    DMG: [%i] = DMG: [%i] + MAGIC DAMAGE: [%i]", dmg + mDMG, dmg, mDMG),tpz.msg.channel.SYSTEM_3)
    end

    dmg = dmg + mDMG

    if params.skillType == tpz.skill.DIVINE_MAGIC and target:isUndead() then
        -- 150% bonus damage
        dmg = dmg * 1.5
    end

    -- printf("dmg: %d dINT: %d\n", dmg, dINT)

    return dmg
end

function doBoostGain(caster, target, spell, effect)
    local duration = calculateDuration(300, caster, target, spell)

    -- Calculate potency
    local magicskill = caster:getSkillLevel(spell:getSkillType())
    local potency    = math.floor((magicskill - 300) / 10) + 5
    local gearbonus  = caster:getMod(tpz.mod.GAIN_MAGIC_EFFECT)

    if potency > 25 then
        potency = 25
    elseif potency < 5 then
        potency = 5
    end

    if target:hasStatusEffect(tpz.effect.EMBOLDEN) then
        potency = potency * 1.5
        target:delStatusEffect(tpz.effect.EMBOLDEN)
    end

    potency = potency + gearbonus

    --printf("BOOST-GAIN: POTENCY = %d", potency)

    -- Only one Boost Effect can be active at once, so if the player has any we have to cancel & overwrite
    local effectOverwrite =
    {
        tpz.effect.STR_BOOST,
        tpz.effect.DEX_BOOST,
        tpz.effect.VIT_BOOST,
        tpz.effect.AGI_BOOST,
        tpz.effect.INT_BOOST,
        tpz.effect.MND_BOOST,
        tpz.effect.CHR_BOOST
    }

    for i, effect in ipairs(effectOverwrite) do
        --printf("BOOST-GAIN: CHECKING FOR EFFECT %d...", effect)
        if target:hasStatusEffect(effect) then
            --printf("BOOST-GAIN: HAS EFFECT %d, DELETING...", effect)
            target:delStatusEffectSilent(effect)
        end
    end

    if target:addStatusEffect(effect, potency, 0, duration) then
        spell:setMsg(tpz.msg.basic.MAGIC_GAIN_EFFECT)
    else
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
    end
end

function doEnspell(caster, target, spell, effect)
    local baseDuration = 180 + caster:getMod(tpz.mod.ENSPELL_DURATION_BONUS)
    local duration = calculateDuration(baseDuration, caster, target, spell)

    --calculate potency
    local magicskill = target:getSkillLevel(tpz.skill.ENHANCING_MAGIC)

    local potency = 0

    if (magicskill < 151) then
        potency = math.floor(math.sqrt(magicskill) - 1)
    elseif (magicskill >= 151 and magicskill < 401) then
        potency = math.floor((magicskill / 20) + 5)
    elseif (magicskill >= 401 and magicskill < 501) then
        potency = math.floor((magicskill + 20) / 8)
    elseif (magicskill >= 501) then
        potency = math.floor(3 * (magicskill + 50) / 25)
    end

    if (caster:hasStatusEffect(tpz.effect.COMPOSURE)) then
        potency = potency * 3
    end

    if target:addStatusEffect(effect, potency, 0, duration) then
        spell:setMsg(tpz.msg.basic.MAGIC_GAIN_EFFECT)
    else
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
    end
end

---------------------------------
--   getCurePower returns the caster's cure power
--   getCureFinal returns the final cure amount
--   Source: http://members.shaw.ca/pizza_steve/cure/Cure_Calculator.html
---------------------------------
function getCurePower(caster, isBlueMagic)
    local MND = caster:getStat(tpz.mod.MND)
    local VIT = caster:getStat(tpz.mod.VIT)
    local skill = caster:getSkillLevel(tpz.skill.HEALING_MAGIC)
    local power = math.floor(MND/2) + math.floor(VIT/4) + skill
    return power
end
function getCurePowerOld(caster)
    local MND = caster:getStat(tpz.mod.MND)
    local VIT = caster:getStat(tpz.mod.VIT)
    local skill = caster:getSkillLevel(tpz.skill.HEALING_MAGIC) -- it's healing magic skill for the BLU cures as well
    local power = ((3 * MND) + VIT + (3 * math.floor(skill/5)))
    return power
end
function getBaseCure(power, divisor, constant, basepower)
    return ((power - basepower) / divisor) + constant
end
function getBaseCureOld(power, divisor, constant)
    return (power / 2) / divisor + constant
end

function getCureFinal(caster, target, spell, basecure, minCure, isBlueMagic)
    local curePot    = math.min(caster:getMod(tpz.mod.CURE_POTENCY), 50) / 100      -- caps at 50%
    local curePotII  = math.min(caster:getMod(tpz.mod.CURE_POTENCY_II), 30) / 100   -- caps at 30%
    local curePotRec = math.min(target:getMod(tpz.mod.CURE_POTENCY_RCVD), 30) / 100 -- caps at 30%
    local potency    = (1 + curePot + curePotII) * (1 + curePotRec)

    if basecure < minCure then
        basecure = minCure
    end

    if spell:getSkillType() == tpz.skill.HEALING_MAGIC and caster:getMod(tpz.mod.CURE_POTENCY_BASE) > 0 then
        basecure = basecure + caster:getMod(tpz.mod.CURE_POTENCY_BASE)
    end

    local dSeal = 1
    if (caster:hasStatusEffect(tpz.effect.DIVINE_SEAL)) then
        dSeal = 2
    end

    local rapture = 1
    if (isBlueMagic == false) then --rapture doesn't affect BLU cures as they're not white magic
        if (caster:hasStatusEffect(tpz.effect.RAPTURE)) then
            rapture = 1.5 + caster:getMod(tpz.mod.RAPTURE_AMOUNT) / 100
            caster:delStatusEffectSilent(tpz.effect.RAPTURE)
        end
    end

    local dayWeatherBonus = 1
    local ele = spell:getElement()

    local castersWeather = caster:getWeather()

    if (castersWeather == tpz.magic.singleWeatherStrong[ele]) then
        if (caster:getMod(tpz.mod.IRIDESCENCE) >= 1) then
            if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1) then
                dayWeatherBonus = dayWeatherBonus + 0.10
            end
        end
        if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1) then
            dayWeatherBonus = dayWeatherBonus + 0.10
        end
    elseif (castersWeather == tpz.magic.singleWeatherWeak[ele]) then
        if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1) then
            dayWeatherBonus = dayWeatherBonus - 0.10
        end
    elseif (castersWeather == tpz.magic.doubleWeatherStrong[ele]) then
        if (caster:getMod(tpz.mod.IRIDESCENCE) >= 1) then
            if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1) then
                dayWeatherBonus = dayWeatherBonus + 0.10
            end
        end
        if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1) then
            dayWeatherBonus = dayWeatherBonus + 0.25
        end
    elseif (castersWeather == tpz.magic.doubleWeatherWeak[ele]) then
        if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1) then
            dayWeatherBonus = dayWeatherBonus - 0.25
        end
    end

    local dayElement = VanadielDayElement()
    if (dayElement == ele) then
        if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1) then
            dayWeatherBonus = dayWeatherBonus + 0.10
        end
    elseif (dayElement == tpz.magic.elementDescendant[ele]) then
        if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1) then
            dayWeatherBonus = dayWeatherBonus - 0.10
        end
    end

    if (caster:getMod(tpz.mod.DAY_NUKE_BONUS) > 0 and castersWeather == tpz.magic.singleWeatherStrong[ele] or castersWeather == tpz.magic.doubleWeatherStrong[ele] or dayElement == ele) then
        dayWeatherBonus = dayWeatherBonus + (caster:getMod(tpz.mod.DAY_NUKE_BONUS) / 100)
    end

    if (dayWeatherBonus > 1.4) then
        dayWeatherBonus = 1.4
    end

    local final = math.floor(math.floor(math.floor(math.floor(basecure) * potency) * dayWeatherBonus) * rapture) * dSeal

    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("FINAL CURE: [%i] = BASE CURE: [%i] * POTENCY: [%1.2f] * DAY/WEATHER: [%1.2f] * RAPTURE: [%1.2f] * DIVINE SEAL: [%1.2f]", final, basecure, potency, dayWeatherBonus, rapture, dSeal),tpz.msg.channel.SYSTEM_3)
    end

    return final
end

function getCureAsNukeFinal(caster, spell, power, divisor, constant, basepower)
    return getCureFinal(caster, spell, power, divisor, constant, basepower)
end

function updateNotorietyCure(caster, target)
    -- Checks the spell target's notoriety list and adds enmity to all mobs aggro'd on the target
    if caster:isPC() then
        local targetNotoriety = target:getNotorietyList()

        for i = 1, #targetNotoriety do
            local combatTarget = GetMobByID(targetNotoriety[i]:getID())

            combatTarget:addEnmity(caster, 1, 1)
        end
    end
end

function isValidHealTarget(caster, target)
    -- Curse II prevents healing
    if not (target:hasStatusEffect(20)) then
        return target:getAllegiance() == caster:getAllegiance() and
                (target:getObjType() == tpz.objType.PC or
                target:getObjType() == tpz.objType.MOB or
                target:getObjType() == tpz.objType.TRUST or
                target:getObjType() == tpz.objType.FELLOW)
    else
        return false
    end
end

-----------------------------------
-- Returns the staff bonus for the caster and spell.
-----------------------------------

-- affinities that strengthen/weaken the index element


function AffinityBonusDmg(caster, ele)
    local affinityMagian = 0
    local affinityMAB    = caster:getMod(spellMAB[ele]) / 100 -- +1% per Elemental "Magic Attack Bonus"
    local bonus          = 1

    if caster:getMod(strongAffinityDmg[ele]) > 0 then
        affinityMagian = 0.05 + caster:getMod(strongAffinityDmg[ele]) * 0.05 -- 5% per level of affinity
    end

    bonus = bonus + affinityMagian + affinityMAB

    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("    AFFINITY BONUS: [%1.2f] = BASE AFFINITY: [1.00] + MAGIAN BONUS: [%1.2f] + ELEMENTAL MAGIC ATTACK BONUS: [%1.2f]", bonus, affinityMagian, affinityMAB),tpz.msg.channel.SYSTEM_3)
    end

    -- print(bonus)
    return bonus
end

function AffinityBonusAcc(caster, ele)
    local affinity = caster:getMod(strongAffinityAcc[ele])
    local bonus = 0 + (affinity * 10) -- 10 acc per level of affinity
    -- print(bonus)
    return bonus
end

-- USED FOR DAMAGING MAGICAL SPELLS. Stage 3 of Calculating Magic Damage on wiki
-- Reduces damage ifit resists.
--
-- Output:
-- The factor to multiply down damage (1/2 1/4 1/8 1/16) - In this format so this func can be used for enfeebs on duration.

function applyResistance(caster, target, spell, params)
    return applyResistanceEffect(caster, target, spell, params)
end

-- USED FOR Status Effect Enfeebs (blind, slow, para, etc.)
-- Output:
-- The factor to multiply down duration (1/2 1/4 1/8 1/16)
--[[
local params = {}
params.attribute = $2
params.skillType = $3
params.bonus = $4
params.effect = $5
]]
function applyResistanceEffect(caster, target, spell, params)
    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("--- CALCULATE RESIST ---"),tpz.msg.channel.SYSTEM_3)
    end

    local diff             = params.diff or (caster:getStat(params.attribute) - target:getStat(params.attribute))
    local skill            = params.skillType
    local bonus            = params.bonus
    local effect           = params.effect
    local element          = spell:getElement()
    local percentBonus     = 0
    local magicAccBonus    = getSpellBonusAcc(caster, target, spell, params)
    local effectResistance = 0
    local p                = 0
    local magicResist      = 0

    if bonus ~= nil then
        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("            BONUS MACC: [%i] = BONUS MACC: [%i] + STAFF BONUS: [%i]", magicAccBonus + bonus, magicAccBonus, bonus),tpz.msg.channel.SYSTEM_3)
        end

        magicAccBonus = magicAccBonus + bonus
    end

    if diff > 10 then
        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("        BASE BONUS MACC: [%i] = BONUS MACC: [%i] + 10 + ((STAT DIFF: [%i] - 10) / 2)", magicAccBonus + 10 + ((diff - 10) / 2), magicAccBonus, diff),tpz.msg.channel.SYSTEM_3)
        end

        magicAccBonus = magicAccBonus + 10 + ((diff - 10) / 2)
    else
        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("        BASE BONUS MACC: [%i] = BONUS MACC: [%i] + STAT DIFF: [%i]", magicAccBonus + diff, magicAccBonus, diff),tpz.msg.channel.SYSTEM_3)
        end

        magicAccBonus = magicAccBonus + diff
    end

    if
        target:hasStatusEffect(tpz.effect.FEALTY) and
        math.random(1, 100) > 5 and
        (skill == tpz.skill.ENFEEBLING_MAGIC or
         skill == tpz.skill.SINGING or
         skill == tpz.skill.STRING or
         skill == tpz.skill.WIND) and
        (spell:getID() ~= tpz.magic.spell.DISPEL or
         params.effect ~= tpz.effect.ELEGY or
         params.effect ~= tpz.effect.LULLABY)
    then
        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("    FEALTY TRIGGERED - DEBUFF FULLY RESISTED"),tpz.msg.channel.SYSTEM_3)
        end

        return 0
    end

    -- If Stymie is active, as long as the mob is not immune, then the effect is not resisted
    if effect ~= nil then -- Dispel's script doesn't have an "effect" to send here, nor should it
        if
            skill == tpz.skill.ENFEEBLING_MAGIC and
            caster:hasStatusEffect(tpz.effect.STYMIE) and
            target:canGainStatusEffect(effect)
        then
            if caster:getLocalVar("AuditMagic") == 1 then
                caster:PrintToPlayer(string.format("    STYMIE TRIGGERED - DEBUFF UNRESISTED"),tpz.msg.channel.SYSTEM_3)
            end

            caster:delStatusEffect(tpz.effect.STYMIE)

            return 1
        end
    end

    effectResistance = getEffectResistance(caster, target, effect)

    if effect ~= nil then
        percentBonus = percentBonus - effectResistance

        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("        PERCENT BONUS: [%i%%] = BASE: [0] - EFFECT RESISTANCE: [%i]", percentBonus, effectResistance),tpz.msg.channel.SYSTEM_3)
        end
    end

    p = getMagicHitRate(caster, target, skill, element, percentBonus, magicAccBonus)

    if
        skill == tpz.skill.DIVINE_MAGIC or
        skill == tpz.skill.ELEMENTAL_MAGIC or
        skill == tpz.skill.DARK_MAGIC or
        skill == tpz.skill.NINJUTSU
    then
        magicResist = getMagicDamageResist(caster, p)
    else
        magicResist = getMagicResist(caster, p)
    end

    buildImmunity(caster, target, params, magicResist)

    return magicResist
end

-- Applies resistance for things that may not be spells - ie. Quick Draw
function applyResistanceAbility(player, target, element, skill, bonus)
    local p = getMagicHitRate(player, target, skill, element, 0, bonus)

    return getMagicResist(player, p)
end

-- Applies resistance for additional effects
function applyResistanceAddEffect(player, target, element, bonus, isPhysical)
    local p = getMagicHitRate(player, target, 0, element, 0, bonus)

    return getMagicResist(player, p)
end

function getMagicHitRate(caster, target, skillType, element, percentBonus, bonusAcc)
    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("    --- MACC & MEVA ---"),tpz.msg.channel.SYSTEM_3)
    end

    local mainJob          = caster:getMainJob()
    local casterLvl        = caster:getMainLvl()
    local targetLvl        = target:getMainLvl()
    local magicACC         = 0
    local baseMACC         = caster:getMod(tpz.mod.MACC) + caster:getILvlMacc(tpz.slot.MAIN)
    local enspellMACC      = 0
    local geoMACC          = 0
    local geoBonus         = 0
    local skillMACC        = 0
    local rdmMeritMACC     = caster:getMerit(tpz.merit.MAGIC_ACCURACY)
    local ninMeritMACC     = caster:getMerit(tpz.merit.NIN_MAGIC_ACCURACY)
    local divineMACC       = 0
    local troubBonus       = 1
    local enfeeblePenalty  = 1
    local elementPenalty   = 1
    local baseBonusMACC    = bonusAcc
    local affinityBonus    = 0
    local elementBonus     = 0
    local calderaMACCBonus = 100
    local foodMACCP        = caster:getMod(tpz.mod.FOOD_MACCP) / 100
    local foodMACCPCap     = caster:getMod(tpz.mod.FOOD_MACC_CAP)
    local magicEVA         = target:getMod(tpz.mod.MEVA)
    local resModMEVA       = 0 -- Some spells may possibly be non elemental, but have status effects.
    local foilMEVA         = 0
    local foodMEVAP        = target:getMod(tpz.mod.FOOD_MEVAP) / 100
    local foodMEVAPCap     = target:getMod(tpz.mod.FOOD_MEVAP_CAP)

    if baseBonusMACC == nil then
        baseBonusMACC = 0
    end

    if caster:isPC() then
        casterLvl = casterLvl + caster:getItemLevel()
    end

    if target:isPC() then
        targetLvl = targetLvl + target:getItemLevel()
    end

    -- Resist everything if magic shield is active
    if target:hasStatusEffect(tpz.effect.MAGIC_SHIELD) then
        local magicShieldSub = target:getStatusEffect(tpz.effect.MAGIC_SHIELD)

        if magicShieldSub:getSubPower() == 0 then
            if caster:getLocalVar("AuditMagic") == 1 then
                caster:PrintToPlayer(string.format("    --- MAGIC SHIELD ACTIVE - SPELL HAS NO EFFECT ---"),tpz.msg.channel.SYSTEM_3)
            end

            return 0
        end
    end

    -- Get the base acc (just skill + skill mod (79 + skillID = ModID) + magic acc mod)
    if skillType ~= 0 then
        skillMACC = caster:getSkillLevel(skillType)

        -- https://www.bluegartr.com/threads/112776-Dev-Tracker-Findings-Posts-%28NO-DISCUSSION%29?p=5912092#post5912092
        -- Handles adding base and item level weapon skill level from magical weaponskills' primary weapon
        if
            skillType == tpz.skill.ARCHERY or
            skillType == tpz.skill.MARKSMANSHIP
        then
            skillMACC = skillMACC + caster:getILvlSkill(tpz.slot.RANGED)
        elseif
            skillType >= tpz.skill.HAND_TO_HAND and
            skillType <= tpz.skill.STAFF
        then
            skillMACC = skillMACC + caster:getILvlSkill(tpz.slot.MAIN)
        end
    else
        -- For mob skills / additional effects which don't have a skill
        skillMACC = utils.getSkillLvl(1, caster:getMainLvl())
    end

    -- Sword enhancement spells (Enspells)
    if caster:getMod(tpz.mod.ENSPELL) > 0 then
        enspellMACC = caster:getMod(tpz.mod.ENSPELL_STAT_BONUS)
    end

    if mainJob == tpz.job.GEO and spellGroup == tpz.magic.spellGroup.BLACK then
        if caster:isSpellAoE(spellId) then
            geoBonus = getCardinalStats(caster, target, 1, spell)
        else
            geoBonus = getCardinalStats(caster, target, 0, spell)
        end

        geoMACC = geoBonus[2]
    end

    if
        skillType == tpz.skill.DIVINE_MAGIC and
        caster:hasStatusEffect(tpz.effect.DIVINE_EMBLEM)
    then
        divineMACC = 256
    end

    if
        skillType == tpz.skill.SINGING and
        caster:hasStatusEffect(tpz.effect.TROUBADOUR)
    then
        troubBonus = troubBonus + ((caster:getMerit(tpz.merit.TROUBADOUR) - 25) / 100)
    end

    if -- Reduce MACC for jobs without Enfeebling Magic Skill
        (mainJob ~= tpz.job.BLM and
         mainJob ~= tpz.job.DRK and
         mainJob ~= tpz.job.GEO and
         mainJob ~= tpz.job.RDM and
         mainJob ~= tpz.job.SCH and
         mainJob ~= tpz.job.WHM and
         mainJob ~= tpz.job.BRD) and
        skillType == tpz.skill.ENFEEBLING_MAGIC and
        caster:isPC()
    then
        enfeeblePenalty = caster:getSkillLevel(skillType) / 414
    elseif -- Reduce MACC for Elemental Magic cast by jobs without Elemental Magic skill
        (mainJob ~= tpz.job.BLM and
         mainJob ~= tpz.job.DRK and
         mainJob ~= tpz.job.GEO and
         mainJob ~= tpz.job.RDM and
         mainJob ~= tpz.job.SCH) and
        skillType == tpz.skill.ELEMENTAL_MAGIC and
        caster:isPC()
    then
        elementPenalty = caster:getSkillLevel(skillType) / 414
    end

    if element ~= tpz.magic.ele.NONE then
        resModMEVA = target:getMod(tpz.magic.resistMod[element])

        -- Add acc for elemental affinity accuracy and element specific accuracy
        affinityBonus = AffinityBonusAcc(caster, element)
        elementBonus  = caster:getMod(spellAcc[element])
        bonusAcc      = baseBonusMACC + affinityBonus + elementBonus
    end

    magicACC = baseMACC
    magicACC = magicACC + skillMACC
    magicACC = magicACC + enspellMACC
    magicACC = magicACC + geoMACC
    magicACC = magicACC + rdmMeritMACC
    magicACC = magicACC + ninMeritMACC
    magicACC = magicACC + divineMACC
    magicACC = magicACC * troubBonus
    magicACC = magicACC * enfeeblePenalty
    magicACC = magicACC * elementPenalty
    magicACC = magicACC + bonusAcc
    magicACC = magicACC + utils.clamp(magicACC * foodMACCP, 0, foodMACCPCap)

    -- Temporary hard bonus to MACC
    -- TODO: Remove after rebalancing
    magicACC = magicACC + calderaMACCBonus

    if caster:getObjType() == tpz.objType.TRUST and caster:getMaster():getName() == "Khalum" then
        printf("            MACC: [%i] = GEAR MACC: [%i] + SKILL MACC: [%i]", baseMACC + skillMACC, caster:getMod(tpz.mod.MACC), skillMACC)
        printf("            MACC: [%i] = BASE MACC: [%i] + ENSPELL MACC: [%i] + GEO MACC: [%i]", baseMACC + skillMACC + enspellMACC + geoMACC, baseMACC + skillMACC, enspellMACC, geoMACC)
        printf("            MACC: [%i] = BASE MACC: [%i] + RDM MERIT MACC: [%i] + NIN MERIT MACC: [%i] + DIVINE EMBLEM BONUS: [%i]", baseMACC + skillMACC + enspellMACC + geoMACC + rdmMeritMACC + ninMeritMACC + divineMACC, baseMACC + skillMACC + enspellMACC + geoMACC, rdmMeritMACC, ninMeritMACC, divineMACC)
        printf("            MACC: [%i] = BASE MACC: [%i] * TROUBADOUR BONUS: [%1.2f] * UNDERLVL ENFEEBLE PENALTY: [%1.2f] * UNDERLVL ELEMENTAL PENALTY: [%1.2f]", baseMACC + skillMACC + enspellMACC + geoMACC + rdmMeritMACC + ninMeritMACC + divineMACC * troubBonus * enfeeblePenalty * elementPenalty, baseMACC + skillMACC + enspellMACC + geoMACC + rdmMeritMACC + ninMeritMACC + divineMACC, troubBonus, enfeeblePenalty, elementPenalty)
        printf("            MACC: [%i] = BASE MACC: [%i] + BASE BONUS MACC: [%i] + AFFINITY BONUS MACC: [%i] + ELEMENTAL MACC: [%i]", baseMACC + skillMACC + enspellMACC + geoMACC + rdmMeritMACC + ninMeritMACC + divineMACC * troubBonus * enfeeblePenalty * elementPenalty + bonusAcc, baseMACC + skillMACC + enspellMACC + geoMACC + rdmMeritMACC + ninMeritMACC + divineMACC * troubBonus * enfeeblePenalty * elementPenalty, baseBonusMACC, affinityBonus, elementBonus)
        printf("            MACC: [%i] = BASE MACC: [%i] + (BASE MACC: [%i] * FOOD MACCP: [%1.2f]) (CAPPED @ +[%i])", baseMACC + skillMACC + enspellMACC + geoMACC + rdmMeritMACC + ninMeritMACC + divineMACC * troubBonus * enfeeblePenalty * elementPenalty + bonusAcc + utils.clamp(magicACC * foodMACCP, 0, foodMACCPCap), baseMACC + skillMACC + enspellMACC + geoMACC + rdmMeritMACC + ninMeritMACC + divineMACC * troubBonus * enfeeblePenalty * elementPenalty + bonusAcc, baseMACC + skillMACC + enspellMACC + geoMACC + rdmMeritMACC + ninMeritMACC + divineMACC * troubBonus * enfeeblePenalty * elementPenalty + bonusAcc, foodMACCP, foodMACCPCap)
        printf("        FINAL MACC: [%i] = BASE MACC: [%i] + CALDERA BONUS MACC: [%i]", baseMACC + skillMACC + enspellMACC + geoMACC + rdmMeritMACC + ninMeritMACC + divineMACC * troubBonus * enfeeblePenalty * elementPenalty + bonusAcc + utils.clamp(magicACC * foodMACCP, 0, foodMACCPCap) + calderaMACCBonus, baseMACC + skillMACC + enspellMACC + geoMACC + rdmMeritMACC + ninMeritMACC + divineMACC * troubBonus * enfeeblePenalty * elementPenalty + bonusAcc + utils.clamp(magicACC * foodMACCP, 0, foodMACCPCap), calderaMACCBonus)
    end

    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("            MACC: [%i] = GEAR MACC: [%i] + WEAPON ILVL MACC: [%i] + SKILL MACC: [%i]", baseMACC + skillMACC, caster:getMod(tpz.mod.MACC), caster:getILvlMacc(tpz.slot.MAIN), skillMACC),tpz.msg.channel.SYSTEM_3)
        caster:PrintToPlayer(string.format("            MACC: [%i] = BASE MACC: [%i] + ENSPELL MACC: [%i] + GEO MACC: [%i]", baseMACC + skillMACC + enspellMACC + geoMACC, baseMACC + skillMACC, enspellMACC, geoMACC),tpz.msg.channel.SYSTEM_3)
        caster:PrintToPlayer(string.format("            MACC: [%i] = BASE MACC: [%i] + RDM MERIT MACC: [%i] + NIN MERIT MACC: [%i] + DIVINE EMBLEM BONUS: [%i]", baseMACC + skillMACC + enspellMACC + geoMACC + rdmMeritMACC + ninMeritMACC + divineMACC, baseMACC + skillMACC + enspellMACC + geoMACC, rdmMeritMACC, ninMeritMACC, divineMACC),tpz.msg.channel.SYSTEM_3)
        caster:PrintToPlayer(string.format("            MACC: [%i] = BASE MACC: [%i] * TROUBADOUR BONUS: [%1.2f] * UNDERLVL ENFEEBLE PENALTY: [%1.2f] * UNDERLVL ELEMENTAL PENALTY: [%1.2f]", baseMACC + skillMACC + enspellMACC + geoMACC + rdmMeritMACC + ninMeritMACC + divineMACC * troubBonus * enfeeblePenalty * elementPenalty, baseMACC + skillMACC + enspellMACC + geoMACC + rdmMeritMACC + ninMeritMACC + divineMACC, troubBonus, enfeeblePenalty, elementPenalty),tpz.msg.channel.SYSTEM_3)
        caster:PrintToPlayer(string.format("            MACC: [%i] = BASE MACC: [%i] + BASE BONUS MACC: [%i] + AFFINITY BONUS MACC: [%i] + ELEMENTAL MACC: [%i]", baseMACC + skillMACC + enspellMACC + geoMACC + rdmMeritMACC + ninMeritMACC + divineMACC * troubBonus * enfeeblePenalty * elementPenalty + bonusAcc, baseMACC + skillMACC + enspellMACC + geoMACC + rdmMeritMACC + ninMeritMACC + divineMACC * troubBonus * enfeeblePenalty * elementPenalty, baseBonusMACC, affinityBonus, elementBonus),tpz.msg.channel.SYSTEM_3)
        caster:PrintToPlayer(string.format("            MACC: [%i] = BASE MACC: [%i] + (BASE MACC: [%i] * FOOD MACCP: [%1.2f]) (CAPPED @ +[%i])", baseMACC + skillMACC + enspellMACC + geoMACC + rdmMeritMACC + ninMeritMACC + divineMACC * troubBonus * enfeeblePenalty * elementPenalty + bonusAcc + utils.clamp(magicACC * foodMACCP, 0, foodMACCPCap), baseMACC + skillMACC + enspellMACC + geoMACC + rdmMeritMACC + ninMeritMACC + divineMACC * troubBonus * enfeeblePenalty * elementPenalty + bonusAcc, baseMACC + skillMACC + enspellMACC + geoMACC + rdmMeritMACC + ninMeritMACC + divineMACC * troubBonus * enfeeblePenalty * elementPenalty + bonusAcc, foodMACCP, foodMACCPCap),tpz.msg.channel.SYSTEM_3)
        caster:PrintToPlayer(string.format("        FINAL MACC: [%i] = BASE MACC: [%i] + CALDERA BONUS MACC: [%i]", baseMACC + skillMACC + enspellMACC + geoMACC + rdmMeritMACC + ninMeritMACC + divineMACC * troubBonus * enfeeblePenalty * elementPenalty + bonusAcc + utils.clamp(magicACC * foodMACCP, 0, foodMACCPCap) + calderaMACCBonus, baseMACC + skillMACC + enspellMACC + geoMACC + rdmMeritMACC + ninMeritMACC + divineMACC * troubBonus * enfeeblePenalty * elementPenalty + bonusAcc + utils.clamp(magicACC * foodMACCP, 0, foodMACCPCap), calderaMACCBonus),tpz.msg.channel.SYSTEM_3)
    end

    -- Foil "special attack" evasion bonus
    if target:hasStatusEffect(tpz.effect.FOIL) then
        foilMEVA = target:getMod(tpz.mod.TP_MOVE_EVASION)
    end

    -- Base magic evasion (base magic evasion plus resistances(players), plus elemental defense(mobs)
    magicEVA = magicEVA + resModMEVA
    magicEVA = magicEVA + foilMEVA
    magicEVA = magicEVA + utils.clamp(magicEVA * foodMEVAP, 0, foodMEVAPCap)

    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("            MEVA: [%i] = MEVA STAT: [%i] + ELEMENTAL RESISTANCE: [%i] + FOIL: [%i]", target:getMod(tpz.mod.MEVA) + resModMEVA + foilMEVA, target:getMod(tpz.mod.MEVA), resModMEVA, foilMEVA),tpz.msg.channel.SYSTEM_3)
        caster:PrintToPlayer(string.format("        FINAL MEVA: [%i] = BASE MEVA: [%i] * (BASE MEVA: [%i] * FOOD MEVAP: [%1.2f]) (CAPPED @ +[%i])", target:getMod(tpz.mod.MEVA) + resModMEVA + foilMEVA + utils.clamp((target:getMod(tpz.mod.MEVA) + resModMEVA + foilMEVA) * foodMEVAP, 0, foodMEVAPCap), target:getMod(tpz.mod.MEVA) + resModMEVA + foilMEVA, target:getMod(tpz.mod.MEVA) + resModMEVA + foilMEVA, foodMEVAP, foodMEVAPCap),tpz.msg.channel.SYSTEM_3)
    end

    return calculateMagicHitRate(caster, magicACC, magicEVA, percentBonus, casterLvl, targetLvl)
end

function calculateMagicHitRate(caster, magicACC, magicEVA, percentBonus, casterLvl, targetLvl)
    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("    --- MAGIC HIT RATE ---"),tpz.msg.channel.SYSTEM_3)
    end

    local p         = 0
    local levelDiff = casterLvl - targetLvl

    if levelDiff < 0 then
        magicEVA = magicEVA + (levelDiff * -2)
    end

    local dMACC           = magicACC - magicEVA
    local adjustedPercent = 1

    if percentBonus <= 100 then
        adjustedPercent = 1 + (percentBonus / 100)
    end

    if caster:getObjType() == tpz.objType.TRUST and caster:getMaster():getName() == "Khalum" then
        printf("magic.lua calculateMagicHitRate  MASTER: [%s]  NAME: [%s]  ADJ PERCENT: [%2.2f]  PERCENT BONUS: [%i]", caster:getMaster():getName(), caster:getName(), adjustedPercent, percentBonus)
    end

    if dMACC < 0 then
        p = (70 + math.floor(dMACC / 2)) * adjustedPercent

        -- if caster:getObjType() == tpz.objType.TRUST and caster:getMaster():getName() == "Khalum" then
            -- printf("magic.lua calculateMagicHitRate      dMACC: [%i] = MACC: [%i] - MEVA: [%i]", dMACC, magicACC, magicEVA)
            -- printf("magic.lua calculateMagicHitRate  p: [%i] = (70 + (dMACC: [%i] / 2)) * ADJ PERCENT: [%2.2f]", p, dMACC, adjustedPercent)
        -- end

        if
            caster:getLocalVar("AuditWeaponskill") == 1 or
            caster:getLocalVar("AuditMagic") == 1
        then
            caster:PrintToPlayer(string.format("        HIT RATE: [%i%%] = (BASE: [70] + ((CASTER MACC: [%i] - TARGET MEVA: [%i]) / 2)) * PERCENTBONUS: [%1.2f]", utils.clamp(p, 5, 95), magicACC, magicEVA, adjustedPercent),tpz.msg.channel.SYSTEM_3)
        end
    else
        p = (70 + dMACC) * adjustedPercent

        -- if caster:getObjType() == tpz.objType.TRUST and caster:getMaster():getName() == "Khalum" then
            -- printf("magic.lua calculateMagicHitRate      dMACC: [%i] = MACC: [%i] - MEVA: [%i]", dMACC, magicACC, magicEVA)
            -- printf("magic.lua calculateMagicHitRate  p: [%i] = (70 + dMACC: [%i]) * ADJ PERCENT: [%2.2f]", p, dMACC, adjustedPercent)
        -- end

        if
            caster:getLocalVar("AuditWeaponskill") == 1 or
            caster:getLocalVar("AuditMagic") == 1
        then
            caster:PrintToPlayer(string.format("        HIT RATE: [%i%%] = (BASE: [70] + (CASTER MACC: [%i] - TARGET MEVA: [%i])) * PERCENTBONUS: [%1.2f]", utils.clamp(p, 5, 95), magicACC, magicEVA, adjustedPercent),tpz.msg.channel.SYSTEM_3)
        end
    end

    if caster:getObjType() == tpz.objType.TRUST and caster:getMaster():getName() == "Khalum" then
        printf("magic.lua calculateMagicHitRate  MASTER: [%s]  NAME: [%s]  p: [%i]", caster:getMaster():getName(), caster:getName(), p)
    end

    return utils.clamp(p, 0, 95)
end

-- Returns resistance value from given magic hit rate (p) for damaging magic spells
function getMagicDamageResist(caster, magicHitRate)
    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("    --- RESISTANCE LEVEL ---"),tpz.msg.channel.SYSTEM_3)
    end

    if caster:getObjType() == tpz.objType.TRUST and caster:getMaster():getName() == "Khalum" then
        printf("magic.lua getMagicDamageResist  MASTER: [%s]  NAME: [%s]  p: [%1.2f]", caster:getMaster():getName(), caster:getName(), magicHitRate)
    end

    local p      = magicHitRate / 100
    local resist = 1

    local half    = (1- p)
    local quarter = (1- p) ^ 2
    local eighth  = (1- p) ^ 3

    local resvar = math.random()

    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("        HIT RATE: [%1.2f]  NEW RANDOM: [%1.2f]  HALF RESIST THRESHOLD: [%1.4f]", p, resvar, half),tpz.msg.channel.SYSTEM_3)
    end

    if resvar < half then
        resist = 0.5
        resvar = math.random()

        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("        HALF RESIST!  NEW RANDOM: [%1.2f]  QUARTER: [%1.4f] RESIST THRESHOLD", resvar, quarter),tpz.msg.channel.SYSTEM_3)
        end

        if resvar < quarter then
            resist = 0.25
            resvar = math.random()

            if caster:getLocalVar("AuditMagic") == 1 then
                caster:PrintToPlayer(string.format("        QUARTER RESIST!  NEW RANDOM: [%1.2f]  EIGHTH RESIST THRESHOLD: [%1.4f]", resvar, eighth),tpz.msg.channel.SYSTEM_3)
            end

            if resvar < eighth then
                resist = 0.125

                if caster:getLocalVar("AuditMagic") == 1 then
                    caster:PrintToPlayer(string.format("        EIGHTH RESIST!"),tpz.msg.channel.SYSTEM_3)
                end
            end
        end
    else
        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("        NO RESIST!"),tpz.msg.channel.SYSTEM_3)
        end
    end

    return resist
end

-- Returns resistance value from given magic hit rate (p)
function getMagicResist(caster, magicHitRate)
    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("    --- RESISTANCE LEVEL ---"),tpz.msg.channel.SYSTEM_3)
    end

    local p      = magicHitRate / 100
    local resist = 1

    -- Resistance thresholds based on p.  A higher p leads to lower resist rates, and a lower p leads to higher resist rates.
    local half      = (1 - p)
    local quarter   = ((1 - p)^2)
    local eighth    = ((1 - p)^3)
    local sixteenth = ((1 - p)^4)
    -- print("HALF: "..half)
    -- print("QUART: "..quart)
    -- print("EIGHTH: "..eighth)
    -- print("SIXTEENTH: "..sixteenth)

    local resvar = math.random()

    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("        HIT RATE: [%1.2f]  NEW RANDOM: [%1.2f]  HALF RESIST THRESHOLD: [%1.4f]", p, resvar, half),tpz.msg.channel.SYSTEM_3)
    end

    if resvar < half then
        resist = 0.5
        resvar = math.random()

        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("        HALF RESIST!  NEW RANDOM: [%1.2f]  QUARTER RESIST THRESHOLD: [%1.4f]", resvar, quarter),tpz.msg.channel.SYSTEM_3)
        end

        if resvar < quarter then
            resist = 0.25
            resvar = math.random()

            if caster:getLocalVar("AuditMagic") == 1 then
                caster:PrintToPlayer(string.format("        QUARTER RESIST!  NEW RANDOM: [%1.2f]  EIGHTH RESIST THRESHOLD: [%1.4f]", resvar, eighth),tpz.msg.channel.SYSTEM_3)
            end

            if resvar < eighth then
                resist = 0.125
                resvar = math.random()

                if caster:getLocalVar("AuditMagic") == 1 then
                    caster:PrintToPlayer(string.format("        EIGHTH RESIST!  NEW RANDOM: [%1.2f]  SIXTEENTH RESIST THRESHOLD: [%1.4f]", resvar, sixteenth),tpz.msg.channel.SYSTEM_3)
                end

                if resvar < sixteenth then
                    resist = 0.0625

                    if caster:getLocalVar("AuditMagic") == 1 then
                        caster:PrintToPlayer(string.format("        SIXTEENTH RESIST!"),tpz.msg.channel.SYSTEM_3)
                    end
                end
            end
        end
    else
        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("        NO RESIST!"),tpz.msg.channel.SYSTEM_3)
        end
    end

    return resist
end

-- Returns the amount of resistance the
-- target has to the given effect (stun, sleep, etc..)
function getEffectResistance(caster, target, effect)
    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("    --- EFFECT RESISTANCE ---"),tpz.msg.channel.SYSTEM_3)
    end

    local resFinal       = 0
    local effectResist   = 0
    local effectImmunity = 0
    local effectAllRes   = 0

    if
        effect ~= nil and
        effectResistTable[effect] ~= nil
    then
        effectResist   = target:getMod(effectResistTable[effect][2])
        effectImmunity = target:getMod(effectResistTable[effect][3])
        effectAllRes   = target:getMod(tpz.mod.ALLSTATUSRES)

        resFinal = utils.clamp(effectResist + effectAllRes + effectImmunity, 0, 100)

        if caster:getObjType() == tpz.objType.TRUST and caster:getMaster():getName() == "Khalum" then
            printf("magic.lua calculateMagicHitRate  MASTER: [%s]  NAME: [%s]  EFFECT: [%i]  TOTAL: [%i] = RESIST: [%i]  IMMUNITY: [%i]  ALL RESIST: [%i]", caster:getMaster():getName(), caster:getName(), effect, resFinal, effectResist, effectImmunity, effectAllRes)
        end

        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("        STATUS EFFECT: [%s]", effectResistTable[effect][1]),tpz.msg.channel.SYSTEM_3)
            caster:PrintToPlayer(string.format("        EFFECT RESISTANCE: [%i] = STATUS RESIST: [%i] + ALL STATUS RESIST: [%i] + STATUS IMMUNITY: [%i]", resFinal, effectResist, effectAllRes, effectImmunity),tpz.msg.channel.SYSTEM_3)
        end
    end

    -- switch (effect): caseof
    -- {
        -- [tpz.effect.KO] = function ()
            -- statusResist   = target:getMod(tpz.mod.DEATHRES)
            -- statusImmunity = target:getMod(tpz.mod.IMMUNITY_DEATH)
        -- end,
        -- [tpz.effect.DOOM] = function ()
            -- statusResist   = target:getMod(tpz.mod.DEATHRES)
            -- statusImmunity = target:getMod(tpz.mod.IMMUNITY_DEATH)
        -- end,
        -- [tpz.effect.WEIGHT] = function ()
            -- statusResist   = target:getMod(tpz.mod.GRAVITYRES)
            -- statusImmunity = target:getMod(tpz.mod.IMMUNITY_GRAVITY)
        -- end,
        -- [tpz.effect.GEO_WEIGHT] = function ()
            -- statusResist   = target:getMod(tpz.mod.GRAVITYRES)
            -- statusImmunity = target:getMod(tpz.mod.IMMUNITY_GRAVITY)
        -- end,
        -- [tpz.effect.SLEEP_I] = function ()
            -- statusResist   = target:getMod(tpz.mod.SLEEPRES)
            -- statusImmunity = target:getMod(tpz.mod.IMMUNITY_SLEEP)
        -- end,
        -- [tpz.effect.SLEEP_II] = function ()
            -- statusResist   = target:getMod(tpz.mod.SLEEPRES)
            -- statusImmunity = target:getMod(tpz.mod.IMMUNITY_SLEEP)
        -- end,
        -- [tpz.effect.LULLABY] = function ()
            -- statusResist   = target:getMod(tpz.mod.LULLABYRES)
            -- statusImmunity = target:getMod(tpz.mod.IMMUNITY_LULLABY)
        -- end,
        -- [tpz.effect.POISON] = function ()
            -- statusResist   = target:getMod(tpz.mod.POISONRES)
            -- statusImmunity = target:getMod(tpz.mod.IMMUNITY_POISON)
        -- end,
        -- [tpz.effect.PARALYSIS] = function ()
            -- statusResist   = target:getMod(tpz.mod.PARALYZERES)
            -- statusImmunity = target:getMod(tpz.mod.IMMUNITY_PARALYZE)
        -- end,
        -- [tpz.effect.BLINDNESS] = function ()
            -- statusResist   = target:getMod(tpz.mod.BLINDRES)
            -- statusImmunity = target:getMod(tpz.mod.IMMUNITY_BLIND)
        -- end,
        -- [tpz.effect.SILENCE] = function ()
            -- statusResist   = target:getMod(tpz.mod.SILENCERES)
            -- statusImmunity = target:getMod(tpz.mod.IMMUNITY_SILENCE)
        -- end,
        -- [tpz.effect.PLAGUE] = function ()
            -- statusResist   = target:getMod(tpz.mod.VIRUSRES)
            -- statusImmunity = target:getMod(tpz.mod.IMMUNITY_VIRUS)
        -- end,
        -- [tpz.effect.DISEASE] = function ()
            -- statusResist   = target:getMod(tpz.mod.VIRUSRES)
            -- statusImmunity = target:getMod(tpz.mod.IMMUNITY_VIRUS)
        -- end,
        -- [tpz.effect.PETRIFICATION] = function ()
            -- statusResist   = target:getMod(tpz.mod.PETRIFYRES)
            -- statusImmunity = target:getMod(tpz.mod.IMMUNITY_PETRIFY)
        -- end,
        -- [tpz.effect.BIND] = function ()
            -- statusResist   = target:getMod(tpz.mod.BINDRES)
            -- statusImmunity = target:getMod(tpz.mod.IMMUNITY_BIND)
        -- end,
        -- [tpz.effect.CURSE_I] = function ()
            -- statusResist   = target:getMod(tpz.mod.CURSERES)
            -- statusImmunity = target:getMod(tpz.mod.IMMUNITY_CURSE)
        -- end,
        -- [tpz.effect.CURSE_II] = function ()
            -- statusResist   = target:getMod(tpz.mod.CURSERES)
            -- statusImmunity = target:getMod(tpz.mod.IMMUNITY_CURSE)
        -- end,
        -- [tpz.effect.BANE] = function ()
            -- statusResist   = target:getMod(tpz.mod.CURSERES)
            -- statusImmunity = target:getMod(tpz.mod.IMMUNITY_CURSE)
        -- end,
        -- [tpz.effect.SLOW] = function ()
            -- statusResist   = target:getMod(tpz.mod.SLOWRES)
            -- statusImmunity = target:getMod(tpz.mod.IMMUNITY_SLOW)
        -- end,
        -- [tpz.effect.ELEGY] = function ()
            -- statusResist   = target:getMod(tpz.mod.SLOWRES)
            -- statusImmunity = target:getMod(tpz.mod.IMMUNITY_SLOW)
        -- end,
        -- [tpz.effect.STUN] = function ()
            -- statusResist   = target:getMod(tpz.mod.STUNRES)
            -- statusImmunity = target:getMod(tpz.mod.IMMUNITY_STUN)
        -- end,
        -- [tpz.effect.CHARM_I] = function ()
            -- statusResist   = target:getMod(tpz.mod.CHARMRES)
            -- statusImmunity = target:getMod(tpz.mod.IMMUNITY_CHARM)
        -- end,
        -- [tpz.effect.CHARM_II] = function ()
            -- statusResist   = target:getMod(tpz.mod.CHARMRES)
            -- statusImmunity = target:getMod(tpz.mod.IMMUNITY_CHARM)
        -- end,
        -- [tpz.effect.AMNESIA] = function ()
            -- statusResist   = target:getMod(tpz.mod.AMNESIARES)
            -- statusImmunity = target:getMod(tpz.mod.IMMUNITY_AMNESIA)
        -- end,
        -- [tpz.effect.TERROR] = function ()
            -- statusResist   = target:getMod(tpz.mod.TERRORRES)
            -- statusImmunity = target:getMod(tpz.mod.IMMUNITY_TERROR)
        -- end,
    -- }

    return resFinal
end

function buildImmunity(caster, target, params, magicResist)
    local skill       = params.skillType
    local effect      = params.effect
    local resistCap   = 0.5000 -- Standard resist level for enfeebling spells and songs
    local addImmunity = 0

    if
        effect ~= nil and
        effectResistTable[effect] ~= nil
    then
        -- Amount of immunity added varies based on mob type
        -- NM's build immunity faster
        -- Normal mobs build immunity more slowly
        -- RDM's under the effect of Chainspell will build mob immunity the slowest (e.g. Chainspell Stunning)
        if
            target:isMob() and
            target:isNM()
        then
            addImmunity = 30
        elseif
            target:isMob() and
            not target:isNM()
        then
            addImmunity = 10
        elseif
            caster:isPC() and
            caster:hasStatusEffect(tpz.effect.CHAINSPELL)
        then
            addImmunity = 3
        end

        -- Standard resist level for BLU status effects
        if
            skill == tpz.skill.BLUE_MAGIC and
            params.resistCap ~= nil
        then
            resistCap = params.resistCap
        elseif
            skill == tpz.skill.BLUE_MAGIC and
            params.resistCap == nil
        then
            resistCap = 0.0625
        end

        if
            target:isMob() and
            -- (skill == tpz.skill.ENFEEBLING_MAGIC or
             -- skill == tpz.skill.SINGING or
             -- skill == tpz.skill.STRING_INSTRUMENT or
             -- skill == tpz.skill.WIND_INSTRUMENT or
             -- skill == tpz.skill.BLUE_MAGIC) and
            magicResist >= resistCap
        then
            if caster:getLocalVar("AuditMagic") == 1 then
                caster:PrintToPlayer(string.format("    --- BUILD IMMUNITY ---"),tpz.msg.channel.SYSTEM_3)
            end

            if target:getMod(effectResistTable[effect][3]) > 100 - addImmunity then
                addImmunity = 100 - target:getMod(effectResistTable[effect][3])
            end

            if caster:getLocalVar("AuditMagic") == 1 then
                caster:PrintToPlayer(string.format("        STATUS EFFECT: [%s]", effectResistTable[effect][1]),tpz.msg.channel.SYSTEM_3)
                caster:PrintToPlayer(string.format("        FINAL IMMUNITY: [%i] = CURRENT IMMUNITY: [%i] + ADDITIONAL IMMUNITY: [%i]", target:getMod(effectResistTable[effect][3]) + addImmunity, target:getMod(effectResistTable[effect][3]), addImmunity),tpz.msg.channel.SYSTEM_3)
            end

            target:addMod(effectResistTable[effect][3], addImmunity)
        end
    end
end

-- Returns the bonus magic accuracy for any spell
function getSpellBonusAcc(caster, target, spell, params)
    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("    --- BONUS MACC ---"),tpz.msg.channel.SYSTEM_3)
    end

    local castersWeather = caster:getWeather()
    local skill          = spell:getSkillType()
    local spellGroup     = spell:getSpellGroup()
    local element        = spell:getElement()
    local magicAccBonus  = 0
    local scBonus        = 0
    local darkSealBonus  = 0
    local altruismBonus  = 0
    local focalBonus     = 0
    local grimoireBonus  = 0
    local meritBLM       = 0
    local meritRDM       = 0
    local meritBLU       = 0
    local klimaformBonus = 0
    local geoMACC        = 0

    local skillchainTier, skillchainCount = FormMagicBurst(element, target)

    -- SKILLCHAINS
    -- Add acc for skillchains
    if skillchainTier > 0 then
        scBonus = 25 + caster:getMod(tpz.mod.MAGIC_BURST_ACC)
        -- magicAccBonus = magicAccBonus + 25 + caster:getMod(tpz.mod.MAGIC_BURST_ACC)
    end

    -- JOB ABILITIES
    -- Add acc for dark seal
    if
        skill == tpz.skill.DARK_MAGIC and
        caster:hasStatusEffect(tpz.effect.DARK_SEAL)
    then
        darkSealBonus = 256
        -- magicAccBonus = magicAccBonus + 256
    end

    if
        caster:hasStatusEffect(tpz.effect.ALTRUISM) and
        spellGroup == tpz.magic.spellGroup.WHITE
    then
        altruismBonus = caster:getStatusEffect(tpz.effect.ALTRUISM):getPower()
        -- magicAccBonus = magicAccBonus + caster:getStatusEffect(tpz.effect.ALTRUISM):getPower()
    end

    if
        caster:hasStatusEffect(tpz.effect.FOCALIZATION) and
        spellGroup == tpz.magic.spellGroup.BLACK
    then
        focalBonus = caster:getStatusEffect(tpz.effect.FOCALIZATION):getPower()
        -- magicAccBonus = magicAccBonus + caster:getStatusEffect(tpz.effect.FOCALIZATION):getPower()
    end

    -- Add acc for Grimoire: Magic Accuracy mod
    if
        caster:getMod(tpz.mod.GRIMOIRE_MACC) > 0 and
        spellGroup == tpz.magic.spellGroup.WHITE and
        caster:hasStatusEffect(tpz.effect.EFFECT_LIGHT_ARTS)
    then
        grimoireBonus = caster:getMod(tpz.mod.GRIMOIRE_MACC)
        -- magicAccBonus = magicAccBonus + caster:getMod(tpz.mod.GRIMOIRE_MACC)
    end

    if
        caster:getMod(tpz.mod.GRIMOIRE_MACC) > 0 and
        spellGroup == tpz.magic.spellGroup.BLACK and
        caster:hasStatusEffect(tpz.effect.EFFECT_DARK_ARTS)
    then
        grimoireBonus = caster:getMod(tpz.mod.GRIMOIRE_MACC)
        -- magicAccBonus = magicAccBonus + caster:getMod(tpz.mod.GRIMOIRE_MACC)
    end

    -- MERITS
    -- Add for blm elemental magic merits
    if skill == tpz.skill.ELEMENTAL_MAGIC then
        meritBLM = caster:getMerit(tpz.merit.ELEMENTAL_MAGIC_ACCURACY)
        -- magicAccBonus = magicAccBonus + caster:getMerit(tpz.merit.ELEMENTAL_MAGIC_ACCURACY)
    end

    -- Add acc for RDM group 1 merits
    if
        element >= tpz.magic.element.FIRE and
        element <= tpz.magic.element.WATER
    then
        meritRDM = caster:getMerit(rdmMerit[element])
        -- magicAccBonus = magicAccBonus + caster:getMerit(rdmMerit[element])
    end

    -- BLU mag acc merits - nuke acc is handled in bluemagic.lua
    if skill == tpz.skill.BLUE_MAGIC then
        meritBLU = caster:getMerit(tpz.merit.MAGICAL_ACCURACY)
        -- magicAccBonus = magicAccBonus + caster:getMerit(tpz.merit.MAGICAL_ACCURACY)
    end

    -- ENHANCING SPELLS
    -- Add acc for klimaform
    if
        element > 0 and
        caster:hasStatusEffect(tpz.effect.KLIMAFORM) and
        (castersWeather == tpz.magic.singleWeatherStrong[element] or
         castersWeather == tpz.magic.doubleWeatherStrong[element])
    then
        klimaformBonus = caster:getStatusEffect(tpz.effect.KLIMAFORM):getPower()
        -- magicAccBonus = magicAccBonus + 15
    end

    -- JOB TRAITS
    -- GEO Cardinal Chant bonus
    if
        caster:getMainJob() == tpz.job.GEO and
        spellGroup == tpz.magic.spellGroup.BLACK
    then
        if caster:isSpellAoE(spellId) then
            geoBonus = getCardinalStats(caster, target, 1, spell)
        else
            geoBonus = getCardinalStats(caster, target, 0, spell)
        end

        geoMACC = geoBonus[2]
        -- magicAccBonus = magicAccBonus + geoMACC
    end

    magicAccBonus = magicAccBonus + scBonus
    magicAccBonus = magicAccBonus + darkSealBonus
    magicAccBonus = magicAccBonus + altruismBonus
    magicAccBonus = magicAccBonus + focalBonus
    magicAccBonus = magicAccBonus + grimoireBonus
    magicAccBonus = magicAccBonus + meritBLM
    magicAccBonus = magicAccBonus + meritRDM
    magicAccBonus = magicAccBonus + meritBLU
    magicAccBonus = magicAccBonus + klimaformBonus
    magicAccBonus = magicAccBonus + geoMACC

    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("            BONUS MACC: [%i] = SKILLCHAIN BONUS: [%i]", scBonus, scBonus),tpz.msg.channel.SYSTEM_3)
        caster:PrintToPlayer(string.format("            BONUS MACC: [%i] = BONUS MACC: [%i] + DARK SEAL BONUS: [%i] + ALTRUISM BONUS: [%i] + FOCALIZATION BONUS: [%i] + GRIMOIRE BONUS: [%i]", scBonus + darkSealBonus + altruismBonus + focalBonus + grimoireBonus, scBonus, darkSealBonus, altruismBonus, focalBonus, grimoireBonus),tpz.msg.channel.SYSTEM_3)
        caster:PrintToPlayer(string.format("            BONUS MACC: [%i] = BONUS MACC: [%i] + BLM MERITS: [%i] + RDM MERITS: [%i] + BLU MERITS: [%i]", scBonus + darkSealBonus + altruismBonus + focalBonus + grimoireBonus + meritBLM + meritRDM + meritBLU, scBonus + darkSealBonus + altruismBonus + focalBonus + grimoireBonus, meritBLM, meritRDM, meritBLU),tpz.msg.channel.SYSTEM_3)
        caster:PrintToPlayer(string.format("            BONUS MACC: [%i] = BONUS MACC: [%i] + KLIMAFORM: [%i] + CARDINAL CHANT MACC: [%i]", magicAccBonus, scBonus + darkSealBonus + altruismBonus + focalBonus + grimoireBonus + meritBLM + meritRDM + meritBLU, klimaformBonus, geoMACC),tpz.msg.channel.SYSTEM_3)
    end

    return magicAccBonus
end

function handleAfflatusMisery(caster, spell, dmg)
    if (caster:hasStatusEffect(tpz.effect.AFFLATUS_MISERY)) then
        local misery = caster:getMod(tpz.mod.AFFLATUS_MISERY)
        -- According to BGWiki Caps at 300 magic damage.
        local miseryMax = 300

        miseryMax = miseryMax * (1 - caster:getMerit(tpz.merit.ANIMUS_MISERY)/100)

        -- BGwiki puts the boost capping at 200% bonus at 1/4th max HP.
        if (misery > miseryMax) then
            misery = miseryMax
        end

        -- Damage is 2x at boost cap.
        local boost = 1 + (misery / miseryMax)

        dmg = math.floor(dmg * boost)

        -- printf("AFFLATUS MISERY: Damage boosted by %f to %d", boost, dmg)

        --Afflatus Mod is Used Up...
        caster:setMod(tpz.mod.AFFLATUS_MISERY, 0)
    end
    return dmg
end

 function finalMagicAdjustments(caster, target, spell, dmg)
    --Handles target's HP adjustment and returns UNSIGNED dmg (absorb message is set in this function)

    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("--- CALCULATE FINAL MAGIC ADJUSTMENTS ---"),tpz.msg.channel.SYSTEM_3)
    end
 
    local spellTier =
    {
        -- Tier 1 (1-13) - Fire, Blizzard, Aero, Stone, Thunder, Water, Firaga, Blizzaga, Aeroga, Stonega, Thundaga, Waterga
        144, 149, 154, 159, 164, 169, 174, 179, 184, 189, 189, 194, 199,
        -- Tier 2 (14-32) - Fire II, Blizzard II, Aero II, Stone II, Thunder II, Water II, Firaga II, Blizzaga II, Aeroga II, Stonega II, Thundaga II, Waterga II
        --                  Fira, Blizzara, Aera, Stonera, Thundara, Watera
        145, 150, 155, 160, 165, 170, 175, 180, 185, 190, 190, 195, 200, 828, 830, 832, 834, 836, 838,
        -- Tier 3 (33-45) - Fire III, Blizzard III, Aero III, Stone III, Thunder III, Water III, Firaga III, Blizzaga III, Aeroga III, Stonega III, Thundaga III, Waterga III
        146, 151, 156, 161, 166, 171, 176, 181, 186, 191, 191, 196, 201,
        -- Tier 4 (46-63) - Fire IV, Blizzard IV, Aero IV, Stone IV, Thunder IV, Water IV, Firaja, Blizzaja, Aeroja, Stoneja, Thundaja, Waterja
        --                  Fira II, Blizzara II, Aera II, Stonera II, Thundara II, Watera II
        147, 152, 157, 162, 167, 172, 496, 497, 498, 499, 500, 501, 829, 831, 833, 835, 837, 839,
        -- Tier 5 (64-69) - Fire V, Blizzard V, Aero V, Stone V, Thunder V, Water V
        148, 153, 158, 163, 168, 173,
        -- Tier 6 () -     Fire VI, Blizzard VI, Aero VI, Stone VI, Thunder VI, Water VI

        -- Ancient Magic (70-81) - Flare, Freeze, Tornado, Quake, Burst, Flood, Flare II, Freeze II, Tornado II, Quake II, Burst II, Flood II
        204, 206, 208, 210, 212, 214, 205, 207, 209, 211, 213, 215,
        -- Non-elemental (82-84) - Meteor, Comet, Impact
        218, 219, 503,

        -- Helix (85-92) - Geohelix, Hydrohelix, Anemohelix, Pyrohelix, Cryohelix, Ionohelix, Noctohelix, Luminohelix
        278, 279, 280, 281, 282, 283, 284, 285,
    }
 
    local enmityDmgMit  = 0
    local currentEnmity = 0
    local multiplier    = 1
    local skill         = spell:getSkillType()
    local casterLvl     = caster:getMainLvl()
    local tpGenerated   = 0

    -- Handles -% Damage Taken from the "Mitigates damage taken based on enmity" item stat
    if
        caster:getObjType() == tpz.objType.MOB and
        target:getObjType() == tpz.objType.PC and
        target:getMod(tpz.mod.ENMITY_MITIGATES_DMG) > 0
    then
        currentEnmity = caster:getCE(target) + caster:getVE(target)
        enmityDmgMit  = currentEnmity / 5000

        if enmityDmgMit < 2 then
            enmityDmgMit = 2
        elseif enmityDmgMit > 10 then
            enmityDmgMit = 10
        end

        target:addMod(tpz.mod.ENMITY_MITIGATES_DMG_DT, -enmityDmgMit)
    end

    if skill == tpz.skill.ELEMENTAL_MAGIC then
        -- dmg = dmg * ELEMENTAL_POWER
        if
            caster:getObjType() == tpz.objType.PC and
            (caster:getMainJob() == tpz.job.BLM or
             caster:getMainJob() == tpz.job.DRK or
             caster:getMainJob() == tpz.job.GEO or
             caster:getMainJob() == tpz.job.RDM or
             caster:getMainJob() == tpz.job.SCH)
        then
            casterLvl = caster:getMainLvl() + caster:getItemLevel()

            if casterLvl < 100 then
                multiplier = utils.clamp(1 + (casterLvl / 99), 1.25, 1.85)
            elseif casterLvl >= 100 then
                for i = 1, #spellTier do
                    -- Tier 1
                    if i > 0 and i <= 13 and spell:getID() == spellTier[i] then
                        -- printf("magic.lua finalMagicAdjustments TIER 1 ELEMENTAL MAGIC")
                        multiplier = 1.45
                    -- Tier 2
                    elseif i > 13 and i <= 32 and spell:getID() == spellTier[i] then
                        -- printf("magic.lua finalMagicAdjustments TIER 2 ELEMENTAL MAGIC")
                        multiplier = 1.40
                    -- Tier 3
                    elseif i > 32 and i <= 45 and spell:getID() == spellTier[i] then
                        -- printf("magic.lua finalMagicAdjustments TIER 3 ELEMENTAL MAGIC")
                        multiplier = 2.00-- 2.75
                    -- Tier 4
                    elseif i > 45 and i <= 63 and spell:getID() == spellTier[i] then
                        -- printf("magic.lua finalMagicAdjustments TIER 4 ELEMENTAL MAGIC")
                        multiplier = 3.95
                    -- Tier 5
                    elseif i > 63 and i <= 69 and spell:getID() == spellTier[i] then
                        -- printf("magic.lua finalMagicAdjustments TIER 5 ELEMENTAL MAGIC")
                        multiplier = 4.90
                    -- Ancient Magic
                    elseif i > 69 and i <= 81 and spell:getID() == spellTier[i] then
                        -- printf("magic.lua finalMagicAdjustments ANCIENT ELEMENTAL MAGIC")
                        multiplier = 5.95
                    -- Non-elemental
                    elseif i > 81 and i <= 84 and spell:getID() == spellTier[i] then
                        -- printf("magic.lua finalMagicAdjustments NON-ELEMENTAL MAGIC")
                        multiplier = 6.50
                    -- Helixes
                    elseif i > 84 and i <= 92 and spell:getID() == spellTier[i] then
                        -- printf("magic.lua finalMagicAdjustments HELIX MAGIC")
                        multiplier = 4.85
                    end
                end

                if spell:getElement() == tpz.magic.element.EARTH then
                    multiplier = multiplier - 0.75
                elseif spell:getElement() == tpz.magic.element.WATER then
                    multiplier = multiplier - 0.60
                elseif spell:getElement() == tpz.magic.element.WIND then
                    multiplier = multiplier - 0.45
                elseif spell:getElement() == tpz.magic.element.FIRE then
                    multiplier = multiplier - 0.30
                elseif spell:getElement() == tpz.magic.element.ICE then
                    multiplier = multiplier - 0.15
                end
            end
        else
            multiplier = 1.25
        end
    elseif skill == tpz.skill.DARK_MAGIC then
        if
            caster:getObjType() == tpz.objType.PC and
            caster:getMainJob() == tpz.job.SCH
        then
            casterLvl = caster:getMainLvl() + caster:getItemLevel()

            if spell:getID() == tpz.magic.spell.KAUSTRA then
                if casterLvl < 100 then
                    multiplier = 2
                elseif casterLvl > 100 then
                    multiplier = 8
                end
            end
        else
            multiplier = DARK_POWER
        end
    elseif skill == tpz.skill.NINJUTSU then
        multiplier = NINJUTSU_POWER
    elseif
        skill == tpz.skill.DIVINE_MAGIC and
        caster:getObjType() == tpz.objType.PC
    then
        multiplier = DIVINE_POWER
    end

    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("        DMG: [%i] = DMG: [%i] * CALDERA MULTIPLIER: [%1.2f]", dmg * multiplier, dmg, multiplier),tpz.msg.channel.SYSTEM_3)
    end

    -- Apply server specific damage multipliers
    dmg = dmg * multiplier

    -- Passes the PC caster's character ID to the core to obtain a PChar pointer
    if
        caster:getLocalVar("AuditMagic") == 1 and
        caster:isPC()
    then
        target:setLocalVar("AuditMagicTarget", caster:getID())
    end

    dmg = target:magicDmgTaken(dmg, spell:getElement())

    -- Resets the local variable to prevent conflicts
    if target:getLocalVar("AuditMagicTarget") > 0 then
        target:setLocalVar("AuditMagicTarget", 0)
    end

    -- Reverse the -% Damage Taken from the "Mitigates damage taken based on enmity" item stat
    if enmityDmgMit > 0 then
        target:delMod(tpz.mod.ENMITY_MITIGATES_DMG_DT, -enmityDmgMit)
    end

    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("        DMG: [%i] = DMG: [%i] - PHALANX: [%i]", dmg - target:getMod(tpz.mod.PHALANX), dmg, target:getMod(tpz.mod.PHALANX)),tpz.msg.channel.SYSTEM_3)
    end

    -- Handle Phalanx
    if dmg > 0 then
        dmg = dmg - target:getMod(tpz.mod.PHALANX)
        dmg = utils.clamp(dmg, 0, 99999)
    end

    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("        DMG: [%i] = DMG: [%i] - STONESKIN: [%i]", utils.stoneskin(target, dmg), dmg, dmg - utils.stoneskin(target, dmg)),tpz.msg.channel.SYSTEM_3)
    end

    -- Handle Stoneskin
    dmg = utils.stoneskin(target, dmg)

    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("        DMG: [%i] = DMG: [%i] - MAGIC SHIELD: [%i]", utils.clamp(utils.magicshield(target, dmg), -99999, 99999), dmg, dmg - utils.magicshield(target, dmg)),tpz.msg.channel.SYSTEM_3)
    end

    if target:getLocalVar("AuditMagic") == 1 and target:getObjType() == tpz.objType.PC then
        target:PrintToPlayer(string.format("        DMG BEFORE MAGIC SHIELD: [%i]", dmg),tpz.msg.channel.SYSTEM_3)
    end

    dmg = utils.magicshield(target, dmg)
    dmg = utils.clamp(dmg, -99999, 99999)

    if dmg < 0 then
        -- target:addHP(-dmg)
        target:takeSpellDamage(caster, spell, dmg, tpz.attackType.MAGICAL, tpz.damageType.ELEMENTAL + spell:getElement())
        spell:setMsg(tpz.msg.basic.MAGIC_RECOVERS_HP)

        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("DAMAGE ABSORBED: [%i]", dmg),tpz.msg.channel.SYSTEM_3)
        end

        return -dmg
    else
        target:takeSpellDamage(caster, spell, dmg, tpz.attackType.MAGICAL, tpz.damageType.ELEMENTAL + spell:getElement())
        target:handleAfflatusMiseryDamage(dmg)
        target:updateEnmityFromDamage(caster, dmg)

        -- Only add TP if the target is a mob
        -- Subtle Blow applies
        if target:getObjType() ~= tpz.objType.PC then
            tpGenerated = 100 * (1 - utils.clamp(caster:getMod(tpz.mod.SUBTLE_BLOW) + caster:getMod(tpz.mod.SUBTLE_BLOW_II), 0, 75) / 100)

            target:addTP(tpGenerated)
        end

        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("FINAL DAMAGE: [%i]", dmg),tpz.msg.channel.SYSTEM_3)
        end
    end

    return dmg
 end

function finalMagicNonSpellAdjustments(caster, target, ele, dmg)
    --Handles target's HP adjustment and returns SIGNED dmg (negative values on absorb)
    local enmityDmgMit = 0

    -- Handles -% Damage Taken from the "Mitigates damage taken based on enmity" item stat
    if (caster:getObjType() == tpz.objType.MOB and target:getObjType() == tpz.objType.PC and target:getMod(tpz.mod.ENMITY_MITIGATES_DMG) > 0) then
        local currentEnmity = caster:getCE(target) + caster:getVE(target)
        enmityDmgMit = currentEnmity / 5000

        if (enmityDmgMit < 2) then
            enmityDmgMit = 2
        elseif (enmityDmgMit > 10) then
            enmityDmgMit = 10
        end

        target:addMod(tpz.mod.ENMITY_MITIGATES_DMG_DT, -enmityDmgMit)
    end

    dmg = target:magicDmgTaken(dmg)

    -- Reverse the -% Damage Taken from the "Mitigates damage taken based on enmity" item stat
    if (enmityDmgMit > 0) then
        target:delMod(tpz.mod.ENMITY_MITIGATES_DMG_DT, -enmityDmgMit)
    end

    if (dmg > 0) then
        dmg = dmg - target:getMod(tpz.mod.PHALANX)
        dmg = utils.clamp(dmg, 0, 99999)
    end

    --handling stoneskin
    dmg = utils.stoneskin(target, dmg)
    dmg = utils.magicshield(target, dmg)
    dmg = utils.clamp(dmg, -99999, 99999)

    if (dmg < 0) then
        dmg = -(target:addHP(-dmg))
    else
        target:takeDamage(dmg, caster, tpz.attackType.MAGICAL, tpz.damageType.ELEMENTAL + ele)
    end
    --Not updating enmity from damage, as this is primarily used for additional effects (which don't generate emnity)
    -- in the case that updating enmity is needed, do it manually after calling this
    --target:updateEnmityFromDamage(caster, dmg)

    return dmg
end

function adjustForTarget(target, dmg, ele)
    local absorbElement = target:getMod(tpz.magic.absorbMod[ele])
    local absorbRandom = math.random(0, 99)
    local nullRandom = math.random(0, 99)

    if (dmg > 0 and absorbRandom < absorbElement) then
--      printf("magic.lua adjustForTarget ABSORB RANDOM: [%i]", absorbRandom)
        if (absorbElement > 100) then
            dmg = dmg * (absorbElement / 100)
            printf("magic.lua adjustForTarget ELEMENT: [%i]  ABSORB ELEMENT: [%f]  DAMAGE: [%i]", ele, absorbElement / 100, dmg)
        end

        return -dmg
    end

    if (nullRandom < target:getMod(tpz.magic.nullMod[ele])) then
--      printf("magic.lua adjustForTarget NULL RANDOM: [%i]", nullRandom)
        return 0
    end
    --Moved non element specific absorb and null mod checks to core
    --TODO: update all lua calls to magicDmgTaken with appropriate element and remove this function
    return dmg
end

function calculateMagicBurst(caster, spell, target, params)
    local burst              = 1.0
    local skillchainburst    = 1.0
    local modburst           = 1.0
    local modburstII         = 1.0
    local modSengikori       = 1.0
    local SengikoriBonus     = target:getMod(tpz.mod.SENGIKORI_BONUS) / 100
    local geoBonus           = {0.00, 0.00, 0.00, 0.00}
    local geoMagicBurstBonus = 0.0
    local spellGroup         = spell:getSpellGroup()
    local spellId            = spell:getID()

    if caster:getMainJob() == tpz.job.GEO and spellGroup == tpz.magic.spellGroup.BLACK then
        if caster:isSpellAoE(spellId) then
            geoBonus = getCardinalStats(caster, target, 1, spell)
        else
            geoBonus = getCardinalStats(caster, target, 0, spell)
        end

        geoMagicBurstBonus = geoBonus[3]
--      printf("magic.lua calculateMagicBurst GEO MAGIC BURST Bonus: [%i]", geoMagicBurstBonus)
    end

    if
        spell:getSpellGroup() == 3 and
        not (caster:hasStatusEffect(tpz.effect.BURST_AFFINITY) or
             caster:hasStatusEffect(tpz.effect.AZURE_LORE))
    then
        return burst
    end

    -- Obtain multipliers from gear, atma and job traits
    modburst   = modburst + (caster:getMod(tpz.mod.MAG_BURST_BONUS) / 100) + params.AMIIburstBonus + geoMagicBurstBonus
    modburstII = modburstII + (caster:getMod(tpz.mod.MAG_BURST_BONUS_II) / 100) -- Magic Burst II Modifier

    if target:hasStatusEffect(tpz.effect.SENGIKORI) then
        modSengikori = modSengikori + SengikoriBonus
--      print(modSengikori)
    end

    if caster:isBehind(target) and caster:hasStatusEffect(tpz.effect.INNIN) then
        modburst = modburst + (caster:getMerit(tpz.merit.INNIN_EFFECT) / 100)
    end

    -- Cap bonuses from first multiplier at 40% or 1.4
    -- Job Trait Magic Attack Bonus is additive and ignores the normal MAB cap of 40%
    if modburst > 1.4 then
        modburst = 1.4 + (caster:getMod(tpz.mod.TRAIT_MAG_BURST_BONUS) / 100)
    end

    -- Cap bonuses from second multiplier at 40% or 1.4
    if modburstII > 1.4 then
        modburstII = 1.4
    end

    -- Cap bonuses from third multipler at 40% or 1.4
    if modSengikori > 1.4 then
        modSengikori = 1.4
    end

    -- Obtain fourth multiplier from skillchain
    -- Starts at 35% damage bonus, increases by 10% for every additional weaponskill in the chain
    local skillchainTier, skillchainCount = FormMagicBurst(spell:getElement(), target)

    if skillchainTier > 0 then
        if skillchainCount == 1 then -- two weaponskills
            skillchainburst = 1.35
        elseif skillchainCount == 2 then -- three weaponskills
            skillchainburst = 1.45
        elseif skillchainCount == 3 then -- four weaponskills
             skillchainburst = 1.55
        elseif skillchainCount == 4 then -- five weaponskills
            skillchainburst = 1.65
        elseif skillchainCount == 5 then -- six weaponskills
            skillchainburst = 1.75
        else
            -- Something strange is going on if this occurs.
            skillchainburst = 1.0
        end
    end

    if
        caster:getLocalVar("AuditMagic") == 1 and
        skillchainburst > 1
    then
        caster:PrintToPlayer(string.format("        MAGIC BURST BONUS: [%1.2f] = BASE: [%1.2f] * BURST BONUS I: [%1.2f] * BURST BONUS II: [%1.2f] * SKILLCHAIN BONUS: [%1.2f] * SENGIKORI: [%1.2f]", burst * modburst * modburstII * skillchainburst * modSengikori, burst, modburst, modburstII, skillchainburst, modSengikori),tpz.msg.channel.SYSTEM_3)
    end

    -- Multiply
    if skillchainburst > 1 then
        burst = burst * modburst * modburstII * skillchainburst * modSengikori
    end

    return burst
end

function calculateLungeMagicBurst(caster, target, params)

    local burst           = 1.0
    local skillchainburst = 1.0
    local modburst        = 1.0
    local modburstII      = 1.0
    local modSengikori    = 1.0
    local SengikoriBonus  = target:getMod(tpz.mod.SENGIKORI_BONUS) / 100
--  print(SengikoriBonus)

    -- Obtain multipliers from gear, atma and job traits
    modburst   = modburst + (caster:getMod(tpz.mod.MAG_BURST_BONUS) / 100)
    modburstII = modburstII + (caster:getMod(tpz.mod.MAG_BURST_BONUS_II) / 100) -- Magic Burst II Modifier

    if target:hasStatusEffect(tpz.effect.SENGIKORI) then
        modSengikori = modSengikori + SengikoriBonus
--      print(modSengikori)
--      target:delMod(tpz.mod.SENGIKORI_BONUS, SengikoriBonus)
        target:delStatusEffect(tpz.effect.SENGIKORI)
    end

    -- Cap bonuses from first multiplier at 40% or 1.4
    if modburst > 1.4 then
        modburst = 1.4
    end

    -- Cap bonuses from second multiplier at 40% or 1.4
    if modburstII > 1.4 then
        modburstII = 1.4
    end

    -- Cap bonuses from third multipler at 40% or 1.4
    if modSengikori > 1.4 then
        modSengikori = 1.4
    end

    -- Obtain fourth multiplier from skillchain
    -- Starts at 35% damage bonus, increases by 10% for every additional weaponskill in the chain
    local skillchainTier, skillchainCount = FormMagicBurst(params.element, target)

    if skillchainTier > 0 then
        if skillchainCount == 1 then     -- two weaponskills
            skillchainburst = 1.35
        elseif skillchainCount == 2 then -- three weaponskills
            skillchainburst = 1.45
        elseif skillchainCount == 3 then -- four weaponskills
             skillchainburst = 1.55
        elseif skillchainCount == 4 then -- five weaponskills
            skillchainburst = 1.65
        elseif skillchainCount == 5 then -- six weaponskills
            skillchainburst = 1.75
        else
            -- Something strange is going on if this occurs.
            skillchainburst = 1.0
        end
    end

    if
        caster:getLocalVar("AuditMagic") == 1 and
        skillchainburst > 1
    then
        caster:PrintToPlayer(string.format("        MAGIC BURST BONUS: [%1.2f] = BASE: [%1.2f] * BURST BONUS I: [%1.2f] * BURST BONUS II: [%1.2f] * SKILLCHAIN BONUS: [%1.2f] * SENGIKORI: [%1.2f]", burst * modburst * modburstII * skillchainburst * modSengikori, burst, modburst, modburstII, skillchainburst, modSengikori),tpz.msg.channel.SYSTEM_3)
    end

    -- Multiply
    if skillchainburst > 1 then
        burst = burst * modburst * modburstII * skillchainburst * modSengikori
    end

    return burst
end

function addBonuses(caster, spell, target, dmg, params)
    params = params or {}

    -- https://www.bg-wiki.com/ffxi/Magic_Damage

    local ele             = spell:getElement()   -- Fire (1), Stone (2), Water (3), Aero (4), Blizzard (5), Thunder (6), Light (7), Dark (8)
    local weather         = caster:getWeather()
    local dayElement      = VanadielDayElement() -- Firesday (0), Earthsday (1), Watersday (2), Windsday (3), Iceday (4), Lightningday (5), Lightsday (6), Darksday (7)
    local affinityBonus   = 0
    local magicDefense    = 1
    local dayWeatherBonus = 1.00
    local weatherBonus    = 0.00
    local dayBonus        = 0.00
    local dependDayBonus  = 0.00
    local klimaBonus      = 0.00
    local burst           = 1
    local nvBonus         = 1
    local mabRaetic       = 0
    local mabNinjutsu     = 0
    local magicCrit       = caster:getMod(tpz.mod.MAGIC_CRITHITRATE)
    local magicCritDmg    = caster:getMod(tpz.mod.MAGIC_CRIT_DMG_INCREASE)
    local mabBonus        = 1.00
    local spellId         = spell:getID()
    local geoBonus        = {0.00, 0.00, 0.00, 0.00} -- {MATT, MACC, MAG_BURST_BONUS, MAGIC_CRITHITRATE}
    local geoMATT         = 0.00
    local geoMCHR         = 0.00
    local blmMerits       = 0
    local mdefBarBonus    = 0
    local scarDelBonus    = 1
    local ebullBase       = 1.20
    local ebullBonus      = 0.00
    local banishBonus     = 1.00
    local conMPReduction  = 1

    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("--- CALCULATE SPELL BONUS DAMAGE ---"),tpz.msg.channel.SYSTEM_3)
        caster:PrintToPlayer(string.format("    SPELL ELEMENT: [%i]  DAY ELEMENT: [%i]  WEATHER ELEMENT: [%i]", ele, dayElement, weather),tpz.msg.channel.SYSTEM_3)
    end

    affinityBonus = AffinityBonusDmg(caster, ele)

    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("        DMG: [%i] = BASE DMG: [%i] * AFFINITY BONUS: [%1.2f]", dmg * affinityBonus, dmg, affinityBonus),tpz.msg.channel.SYSTEM_3)
    end

    dmg = dmg * affinityBonus

    params.bonusmab       = params.bonusmab or 0
    params.AMIIburstBonus = params.AMIIburstBonus or 0
    params.bonusmab       = params.bonusmab

    magicDefense = getElementalDamageReduction(caster, target, ele)

    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("        DMG: [%i] = BASE DMG: [%i] * DEFENSE: [%3.2f]", dmg * magicDefense, dmg, magicDefense),tpz.msg.channel.SYSTEM_3)
    end

    dmg = dmg * magicDefense

    if weather == tpz.magic.singleWeatherStrong[ele] then
        if
            math.random() < 0.33 or
            caster:getMod(elementalObi[ele]) >= 1 or
            isHelixSpell(spell)
        then
            weatherBonus = weatherBonus + 0.10

            if caster:getLocalVar("AuditMagic") == 1 then
                caster:PrintToPlayer(string.format("    SINGLE WEATHER STRONG +0.10"),tpz.msg.channel.SYSTEM_3)
            end
        end
    elseif caster:getWeather() == tpz.magic.singleWeatherWeak[ele] then
        if
            math.random() < 0.33 or
            caster:getMod(elementalObi[ele]) >= 1 or
            isHelixSpell(spell)
        then
            weatherBonus = weatherBonus - 0.10

            if caster:getLocalVar("AuditMagic") == 1 then
                caster:PrintToPlayer(string.format("    SINGLE WEATHER WEAK -0.10"),tpz.msg.channel.SYSTEM_3)
            end
        end
    elseif weather == tpz.magic.doubleWeatherStrong[ele] then
        if
            math.random() < 0.33 or
            caster:getMod(elementalObi[ele]) >= 1 or
            isHelixSpell(spell)
        then
            weatherBonus = weatherBonus + 0.25

            if caster:getLocalVar("AuditMagic") == 1 then
                caster:PrintToPlayer(string.format("    DOUBLE WEATHER STRONG +0.25"),tpz.msg.channel.SYSTEM_3)
            end
        end
    elseif weather == tpz.magic.doubleWeatherWeak[ele] then
        if
            math.random() < 0.33 or
            caster:getMod(elementalObi[ele]) >= 1 or
            isHelixSpell(spell)
        then
            weatherBonus = weatherBonus - 0.25

            if caster:getLocalVar("AuditMagic") == 1 then
                caster:PrintToPlayer(string.format("    DOUBLE WEATHER WEAK -0.25"),tpz.msg.channel.SYSTEM_3)
            end
        end
    end

    -- Iridescence can proc outside of the normal weather bonus
    -- Elemental obis will force an Iridescence proc
    -- Helix spells will force an Iridescence proc
    if caster:getMod(tpz.mod.IRIDESCENCE) >= 1 then
        if
            math.random() < 0.33 or
            caster:getMod(elementalObi[ele]) >= 1 or
            isHelixSpell(spell)
        then
            local iridescence = 0.00 + caster:getMod(tpz.mod.IRIDESCENCE) / 10
            local auditMsg    = ""

            if weather == tpz.magic.singleWeatherStrong[ele] then
                iridescence = 0.05
                auditMsg = "    SINGLE WEATHER STRONG / IRIDESCENCE"
            elseif caster:getWeather() == tpz.magic.singleWeatherWeak[ele] then
                iridescence = -0.05
                auditMsg = "    SINGLE WEATHER WEAK / IRIDESCENCE"
            elseif weather == tpz.magic.doubleWeatherStrong[ele] then
                iridescence = 0.10
                auditMsg = "    DOUBLE WEATHER STRONG / IRIDESCENCE"
            elseif weather == tpz.magic.doubleWeatherWeak[ele] then
                iridescence = -0.10
                auditMsg = "    DOUBLE WEATHER WEAK / IRIDESCENCE"
            end

            weatherBonus = weatherBonus + iridescence

            if caster:getLocalVar("AuditMagic") == 1 then
                if iridescence < 0 then
                    caster:PrintToPlayer(string.format("%s %1.2f", auditMsg, iridescence),tpz.msg.channel.SYSTEM_3)
                else
                    caster:PrintToPlayer(string.format("%s +%1.2f", auditMsg, iridescence),tpz.msg.channel.SYSTEM_3)
                end
            end
        end
    end

    dayWeatherBonus = dayWeatherBonus + weatherBonus

    if dayElement == ele then
        if
            math.random() < 0.33 or
            caster:getMod(elementalObi[ele]) >= 1 or
            isHelixSpell(spell)
        then
            dayBonus = dayBonus + 0.10
        end
    elseif dayElement == tpz.magic.elementDescendant[ele] then
        if
            math.random() < 0.33 or
            caster:getMod(elementalObi[ele]) >= 1 or
            isHelixSpell(spell)
        then
            dayBonus = dayBonus - 0.10
        end
    end

    dayWeatherBonus = dayWeatherBonus + dayBonus

    if
        dayElement == ele or
        weather == tpz.magic.singleWeatherStrong[ele] or
        weather == tpz.magic.doubleWeatherStrong[ele]
    then
        dependDayBonus = caster:getMod(tpz.mod.DAY_NUKE_BONUS) / 100 -- sorc. tonban(+1)/zodiac ring
    end

    dayWeatherBonus = dayWeatherBonus + dependDayBonus

    if
        caster:hasStatusEffect(tpz.effect.KLIMAFORM) and
        caster:getMod(tpz.mod.ENH_KLIMAFORM) > 0 and
        (weather == tpz.magic.singleWeatherStrong[ele] or
         weather == tpz.magic.doubleWeatherStrong[ele])
    then
        klimaBonus = caster:getMod(tpz.mod.ENH_KLIMAFORM) / 100
    end

    dayWeatherBonus = dayWeatherBonus + klimaBonus

    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("    DAY/WEATHER BONUS: [%1.2f] = BASE: [1.00] + WEATHER BONUS: [%1.2f] + DAY BONUS: [%1.2f] + SPECIAL DAY BONUS: [%1.2f] + KLIMAFORM BONUS: [%1.2f]", utils.clamp(dayWeatherBonus, 0, 1.40), weatherBonus, dayBonus, dependDayBonus, klimaBonus),tpz.msg.channel.SYSTEM_3)
    end

    if dayWeatherBonus > 1.4 then
        dayWeatherBonus = 1.4
    end

    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("        DMG: [%i] = BASE DMG: [%i] * DAY/WEATHER BONUS: [%1.2f]", dmg * dayWeatherBonus, dmg, dayWeatherBonus),tpz.msg.channel.SYSTEM_3)
    end

    dmg = dmg * dayWeatherBonus

    burst = calculateMagicBurst(caster, spell, target, params)

    if burst > 1.0 then
        spell:setMsg(spell:getMagicBurstMessage()) -- "Magic Burst!"
    end

    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("        DMG: [%i] = BASE DMG: [%i] * MAGIC BURST BONUS: [%1.2f]", dmg * burst, dmg, burst),tpz.msg.channel.SYSTEM_3)
    end

    dmg = dmg * burst

    if spellId >= 245 and spellId <= 248 then -- Drain I, Drain II, Aspir I, Aspir II
        nvBonus = 1 + (caster:getMod(tpz.mod.NETHER_VOID_BONUS) / 100)

        if caster:hasStatusEffect(tpz.effect.NETHER_VOID) then
            if caster:getLocalVar("AuditMagic") == 1 then
                caster:PrintToPlayer(string.format("        DMG: [%i] = BASE DMG: [%i] * NETHER VOID BONUS: [%1.2f]", dmg * nvBonus, dmg, nvBonus),tpz.msg.channel.SYSTEM_3)
            end

            dmg = dmg * nvBonus
        end

        mabBonus = mabBonus + caster:getMod(tpz.mod.ENH_DRAIN_ASPIR) / 100

        if spellId == 247 or spellId == 248 then
            mabBonus = mabBonus + (caster:getMerit(tpz.merit.ASPIR_ABSORPTION_AMOUNT) / 100)
        end

        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("        DMG: [%i] = BASE DMG: [%i] * (1 + ENHANCE DRAIN/ASPIR: [%1.2f] + ASPIR AMOUNT MERITS: [%1.2f])", dmg * mabBonus, dmg, caster:getMod(tpz.mod.ENH_DRAIN_ASPIR) / 100, caster:getMerit(tpz.merit.ASPIR_ABSORPTION_AMOUNT) / 100),tpz.msg.channel.SYSTEM_3)
        end
    else
        local spellGroup = spell:getSpellGroup()
        local mabBase    = caster:getMod(tpz.mod.MATT)
        local paramBonus = params.bonusmab
        local mab        = mabBase + paramBonus

        if caster:getMainJob() == tpz.job.GEO and spellGroup == tpz.magic.spellGroup.BLACK then
            if caster:isSpellAoE(spellId) then
                geoBonus = getCardinalStats(caster, target, 1, spell)
            else
                geoBonus = getCardinalStats(caster, target, 0, spell)
            end

            geoMATT = geoBonus[1]
            geoMCHR = geoBonus[4]
--          printf("magic.lua addBonuses GEO MATT Bonus: [%i]  GEO MAGIC CRIT HIT RATE: [%i]\n", geoMATT, geoMCHR)
        end

        mab       = mab + geoMATT
        magicCrit = magicCrit + geoMCHR

        if spell:getSkillType() == tpz.skill.ELEMENTAL and CONSUME_MP_ELEM_BONUS > 0 then
            mabRaetic = 50
            mab = mab + mabRaetic
        elseif spell:getSkillType() == tpz.skill.NINJUTSU then
            mabNinjutsu = caster:getMerit(tpz.merit.NIN_MAGIC_BONUS)
            mab = mab + mabNinjutsu
        end

        if ele >= tpz.magic.element.FIRE and ele <= tpz.magic.element.WATER then
            blmMerits = caster:getMerit(blmMerit[ele])
            mab       = mab + blmMerits

            if target:hasStatusEffect(tpz.magic.barSpell[ele]) then -- Barspell magic defense bonus
                mdefBarBonus = target:getStatusEffect(tpz.magic.barSpell[ele]):getSubPower()
            end
        end

        if math.random(1, 100) < magicCrit then
            mab = mab + utils.clamp(10 + magicCritDmg, 0, 40)

            if caster:getLocalVar("AuditMagic") == 1 then
                caster:PrintToPlayer(string.format("    CRITICIAL HIT!"),tpz.msg.channel.SYSTEM_3)
                caster:PrintToPlayer(string.format("        MAB: [%i] = BASE: [%i] + BONUS MAB: [%i] + GEO MAB: [%i] + NINJUTSU MAB: [%i] + BLM MERIT MAB: [%i] + CRIT BASE: [10] + CRIT BONUS: [%i]", mab, mabBase, paramBonus, geoMATT, mabNinjutsu, blmMerits, magicCritDmg),tpz.msg.channel.SYSTEM_3)
            end
        else
            if caster:getLocalVar("AuditMagic") == 1 then
                caster:PrintToPlayer(string.format("        MAB: [%i] = BASE: [%i] + BONUS MAB: [%i] + GEO MAB: [%i] + NINJUTSU MAB: [%i] + BLM MERIT MAB: [%i]", mab, mabBase, paramBonus, geoMATT, mabNinjutsu, blmMerits),tpz.msg.channel.SYSTEM_3)
            end
        end

        mabBonus = (100 + mab) / (100 + target:getMod(tpz.mod.MDEF) + mdefBarBonus)

        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("    MAB: [%1.2f] = (100 + MAB: [%i]) / (100 + MDEF: [%i] + BARSPELL MDEF BONUS: [%i])", mabBonus, mab, target:getMod(tpz.mod.MDEF), mdefBarBonus),tpz.msg.channel.SYSTEM_3)
        end
    end

    if mabBonus < 0 then
        mabBonus = 0
    end

    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("        DMG: [%i] = BASE DMG: [%i] * MAB: [%1.2f]", dmg * mabBonus, dmg, mabBonus),tpz.msg.channel.SYSTEM_3)
    end

    dmg = dmg * mabBonus

    if caster:hasStatusEffect(tpz.effect.SCARLET_DELIRIUM_1) then
        scarDelBonus = scarDelBonus + (caster:getStatusEffect(tpz.effect.SCARLET_DELIRIUM_1):getPower() / 100)

        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("        DMG: [%i] = BASE DMG: [%i] * SCARLET DELIRIUM BONUS: [%1.2f])", dmg * scarDelBonus, dmg, scarDelBonus),tpz.msg.channel.SYSTEM_3)
        end

        dmg = dmg * scarDelBonus
    end

    if caster:hasStatusEffect(tpz.effect.EBULLIENCE) then
        ebullBonus = caster:getMod(tpz.mod.EBULLIENCE_AMOUNT) / 100

        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("        DMG: [%i] = BASE DMG: [%i] * (EBULLIENCE BASE: [%1.2f] + EBULLIENCE BONUS: [%1.2f])", dmg * (ebullBase + ebullBonus), dmg, ebullBase, ebullBonus),tpz.msg.channel.SYSTEM_3)
        end
        
        dmg = dmg * (ebullBase + ebullBonus)

        caster:delStatusEffectSilent(tpz.effect.EBULLIENCE)
    end

    -- Spell is a Banish and target's is Undead
    if
        spellId >= 28 and
        spellId <= 32 and
        target:isUndead() == true
    then
        banishBonus = banishBonus + (caster:getMod(tpz.mod.POT_BANISH_UNDEAD) / 100)

        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("        DMG: [%i] = BASE DMG: [%i] * BANISH BONUS: [%1.2f]", dmg * banishBonus, dmg, banishBonus),tpz.msg.channel.SYSTEM_3)
        end

        dmg = dmg * banishBonus
    end

    -- Checks for and applies Augments "Conserve MP" set bonus
    if
        caster:getCharVar("AugConserveMP") > 1 and
        math.random(1, 100) < caster:getMod(tpz.mod.AUGMENT_CONSERVE_MP)
    then
        conMPReduction = 1 + ((caster:getCharVar("AugConserveMP") * 2) / 100)

        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("        DMG: [%i] = BASE DMG: [%i] * AUGMENTS CONSERVE MP: [%1.2f]", dmg * conMPReduction, dmg, conMPReduction),tpz.msg.channel.SYSTEM_3)
        end

        dmg = dmg * conMPReduction
    end

    dmg = math.floor(dmg)

    -- print(affinityBonus)
    -- print(dayWeatherBonus)
    -- print(burst)
    -- print(mab)
    -- print(magicDmgMod)

    return dmg
end

function addBonusesAbility(caster, ele, target, dmg, params)
    -- if (caster:getName() == "Khalum") then
        -- printf("magic.lua addBonusesAbility DAMAGE: [%i]", dmg)
    -- end

    --ele = Fire (1), Stone (2), Water (3), Aero (4), Blizzard (5), Thunder (6), Light (7), Dark (8)
    local weather         = caster:getWeather()
    local dayElement      = VanadielDayElement() -- Firesday (0), Earthsday (1), Watersday (2), Windsday (3), Iceday (4), Lightningday (5), Lightsday (6), Darksday (7)
    local affinityBonus   = 1
    local magicDefense    = 1
    local weatherBonus    = 0
    local dayBonus        = 0
    local dependDayBonus  = 0
    local dayWeatherBonus = 1.00

    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("--- CALCULATE ABILITY BONUS DAMAGE ---"),tpz.msg.channel.SYSTEM_3)
        caster:PrintToPlayer(string.format("    SPELL ELEMENT: [%i]  DAY ELEMENT: [%i]  WEATHER ELEMENT: [%i]", ele, dayElement, weather),tpz.msg.channel.SYSTEM_3)
    end

    affinityBonus = AffinityBonusDmg(caster, ele)

    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("        DMG: [%i] = BASE DMG: [%i] * AFFINITY BONUS: [%1.2f]", dmg * affinityBonus, dmg, affinityBonus),tpz.msg.channel.SYSTEM_3)
    end

    dmg = math.floor(dmg * affinityBonus)

    magicDefense = getElementalDamageReduction(caster, target, ele)

    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("        DMG: [%i] = BASE DMG: [%i] * DEFENSE: [%3.2f]", dmg * magicDefense, dmg, magicDefense),tpz.msg.channel.SYSTEM_3)
    end

    dmg = math.floor(dmg * magicDefense)

    if weather == tpz.magic.singleWeatherStrong[ele] then
        if
            math.random() < 0.33 or
            caster:getMod(elementalObi[ele]) >= 1
        then
            weatherBonus = weatherBonus + 0.10

            if caster:getLocalVar("AuditMagic") == 1 then
                caster:PrintToPlayer(string.format("    SINGLE WEATHER STRONG +0.10"),tpz.msg.channel.SYSTEM_3)
            end
        end
    elseif caster:getWeather() == tpz.magic.singleWeatherWeak[ele] then
        if
            math.random() < 0.33 or
            caster:getMod(elementalObi[ele]) >= 1
        then
            weatherBonus = weatherBonus - 0.10

            if caster:getLocalVar("AuditMagic") == 1 then
                caster:PrintToPlayer(string.format("    SINGLE WEATHER WEAK -0.10"),tpz.msg.channel.SYSTEM_3)
            end
        end
    elseif weather == tpz.magic.doubleWeatherStrong[ele] then
        if
            math.random() < 0.33 or
            caster:getMod(elementalObi[ele]) >= 1
        then
            weatherBonus = weatherBonus + 0.25

            if caster:getLocalVar("AuditMagic") == 1 then
                caster:PrintToPlayer(string.format("    DOUBLE WEATHER STRONG +0.25"),tpz.msg.channel.SYSTEM_3)
            end
        end
    elseif weather == tpz.magic.doubleWeatherWeak[ele] then
        if
            math.random() < 0.33 or
            caster:getMod(elementalObi[ele]) >= 1
        then
            weatherBonus = weatherBonus - 0.25

            if caster:getLocalVar("AuditMagic") == 1 then
                caster:PrintToPlayer(string.format("    DOUBLE WEATHER WEAK -0.25"),tpz.msg.channel.SYSTEM_3)
            end
        end
    end

    -- Iridescence can proc outside of the normal weather bonus
    -- Elemental obis will force an Iridescence proc
    -- Helix spells will force an Iridescence proc
    if caster:getMod(tpz.mod.IRIDESCENCE) >= 1 then
        if
            math.random() < 0.33 or
            caster:getMod(elementalObi[ele]) >= 1
        then
            local iridescence = 0.00 + caster:getMod(tpz.mod.IRIDESCENCE) / 10
            local auditMsg    = ""

            if weather == tpz.magic.singleWeatherStrong[ele] then
                iridescence = 0.05
                auditMsg = "    SINGLE WEATHER STRONG / IRIDESCENCE"
            elseif caster:getWeather() == tpz.magic.singleWeatherWeak[ele] then
                iridescence = -0.05
                auditMsg = "    SINGLE WEATHER WEAK / IRIDESCENCE"
            elseif weather == tpz.magic.doubleWeatherStrong[ele] then
                iridescence = 0.10
                auditMsg = "    DOUBLE WEATHER STRONG / IRIDESCENCE"
            elseif weather == tpz.magic.doubleWeatherWeak[ele] then
                iridescence = -0.10
                auditMsg = "    DOUBLE WEATHER WEAK / IRIDESCENCE"
            end

            weatherBonus = weatherBonus + iridescence

            if caster:getLocalVar("AuditMagic") == 1 then
                if iridescence < 0 then
                    caster:PrintToPlayer(string.format("%s %1.2f", auditMsg, iridescence),tpz.msg.channel.SYSTEM_3)
                else
                    caster:PrintToPlayer(string.format("%s +%1.2f", auditMsg, iridescence),tpz.msg.channel.SYSTEM_3)
                end
            end
        end
    end

    dayWeatherBonus = dayWeatherBonus + weatherBonus

    if dayElement == ele then
        if
            math.random() < 0.33 or
            caster:getMod(elementalObi[ele]) >= 1
        then
            dayBonus = dayBonus + 0.10
        end
    elseif dayElement == tpz.magic.elementDescendant[ele] then
        if
            math.random() < 0.33 or
            caster:getMod(elementalObi[ele]) >= 1
        then
            dayBonus = dayBonus - 0.10
        end
    end

    dayWeatherBonus = dayWeatherBonus + dayBonus

    if
        dayElement == ele or
        weather == tpz.magic.singleWeatherStrong[ele] or
        weather == tpz.magic.doubleWeatherStrong[ele]
    then
        dependDayBonus = caster:getMod(tpz.mod.DAY_NUKE_BONUS) / 100 -- sorc. tonban(+1)/zodiac ring
    end

    dayWeatherBonus = dayWeatherBonus + dependDayBonus

    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("    DAY/WEATHER BONUS: [%1.2f] = BASE: [1.00] + WEATHER BONUS: [%1.2f] + DAY BONUS: [%1.2f] + SPECIAL DAY BONUS: [%1.2f]", utils.clamp(dayWeatherBonus, 0, 1.40), weatherBonus, dayBonus, dependDayBonus),tpz.msg.channel.SYSTEM_3)
    end

    if dayWeatherBonus > 1.4 then
        dayWeatherBonus = 1.4
    end

    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("        DMG: [%i] = BASE DMG: [%i] * DAY/WEATHER BONUS: [%1.2f]", dmg * dayWeatherBonus, dmg, dayWeatherBonus),tpz.msg.channel.SYSTEM_3)
    end

    dmg = dmg * dayWeatherBonus

    if params.canBurst == true then
        local burst = calculateLungeMagicBurst(caster, target, params)

        if burst > 1.0 then
            caster:setCharVar("SwipeLungeHasMB", 1)
        end

        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("    CAN BURST: [%s]", params.canBurst),tpz.msg.channel.SYSTEM_3)
            caster:PrintToPlayer(string.format("        DMG: [%i] = DMG: [%i] * MAGIC BURST DAMAGE: [%1.2f]", dmg, dmg* burst, burst),tpz.msg.channel.SYSTEM_3)
        end

        dmg = math.floor(dmg * burst)
    end

    local mab          = 1
    local mdefBarBonus = 0

    if
        ele >= tpz.magic.element.FIRE and
        ele <= tpz.magic.element.WATER and
        target:hasStatusEffect(tpz.magic.barSpell[ele])
    then -- bar- spell magic defense bonus
        mdefBarBonus = target:getStatusEffect(tpz.magic.barSpell[ele]):getSubPower()

        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("    ENEMY BARSPELL MDEF BONUS: [%i]", mdefBarBonus),tpz.msg.channel.SYSTEM_3)
        end
    end

    local adjustMDEF = 1

    if params.adjustMDEFCalc ~= adjustMDEF then
        adjustMDEF = params.adjustMDEFCalc
    end

    if adjustMDEF == nil or adjustMDEF == 0 then
        adjustMDEF = 1
        -- printf("magic.lua addBonusesAbility USER NAME: [%s]", caster:getName())
    end

    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("    MAB: [%1.2f] = (100 + BASE MAB: [%i]) / (100 + ENEMY MDEF: [%i] + ENEMY BARSPELL MDEF BONUS: [%i])", (100 + caster:getMod(tpz.mod.MATT)) / (100 + target:getMod(tpz.mod.MDEF) + mdefBarBonus), caster:getMod(tpz.mod.MATT), target:getMod(tpz.mod.MDEF), mdefBarBonus),tpz.msg.channel.SYSTEM_3)
    end

    if params ~= nil and params.includemab == true then
        mab = (100 + caster:getMod(tpz.mod.MATT)) / (100 + target:getMod(tpz.mod.MDEF) + mdefBarBonus)
    end

    if mab < 0 then
        mab = 0
    end

    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("    DMG: [%i] = DMG: [%i] * MAB: [%1.2f]", dmg * mab, dmg, mab),tpz.msg.channel.SYSTEM_3)
    end

    dmg = math.floor(dmg * mab)

    -- if (caster:getName() == "Khalum") then
        -- printf("magic.lua addBonusesAbility POST-MAB vs MDEF DAMAGE: [%i] = MATT: [%i] / MDEF: [%i]", dmg, (100 + caster:getMod(tpz.mod.MATT) + mabBonus), ((100 + target:getMod(tpz.mod.MDEF) + mdefBarBonus)))
    -- end

    -- print(affinityBonus)
    -- print(speciesReduction)
    -- print(dayWeatherBonus)
    -- print(burst)
    -- print(mab)
    -- print(magicDmgMod)

    return dmg
end

-- get elemental damage reduction
function getElementalDamageReduction(caster, target, element)
    local defense = 1

    if
        element ~= nil and
        element > 0
    then
        defense = utils.clamp(1 - (target:getMod(tpz.magic.defenseMod[element]) / 256), 0.0, 2.0)

        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("    DEFENSE: [%3.2f] = 1 - TARGET ELEMENTAL DEFENSE: [%3.2f]", defense, target:getMod(tpz.magic.defenseMod[element]) / 256),tpz.msg.channel.SYSTEM_3)
        end
    end

    return defense
end

---------------------------------------------
--  Elemental Debuff Potency functions
---------------------------------------------

function getElementalDebuffDOT(INT)
    local DOT = 0

    if INT<= 39 then
        DOT = 1
    elseif INT <= 69 then
        DOT = 2
    elseif INT <= 99 then
        DOT = 3
    elseif INT <= 149 then
        DOT = 4
    else
        DOT = 5
    end

    return DOT
end

function getElementalDebuffStatDownFromDOT(dot)
    local stat_down = 0

    stat_down = (dot - 1) * 2 + 5

    return stat_down
end

function getHelixDuration(caster)
    --Dark Arts will further increase Helix duration, but testing is ongoing.
    local casterLevel = caster:getMainLvl()
    local duration    = 30 --fallthrough

    if casterLevel <= 39 then
        duration = 30
    elseif casterLevel <= 59 then
        duration = 60
    elseif casterLevel <= 99 then
        duration = 90
    elseif casterLevel >= 100 then
        duration = 90
    end

    return duration
end

function isHelixSpell(spell)
    local id = spell:getID()

    if id >= 278 and id <= 285 then
        return true
    end

    return false
end

function handleThrenody(caster, target, spell, basePower, baseDuration, modifier)
    -- Process resitances
    local staff = AffinityBonusAcc(caster, spell:getElement())
    local dCHR  = (caster:getStat(tpz.mod.CHR) - target:getStat(tpz.mod.CHR))

    local params = {}
        params.attribute = tpz.mod.CHR
        params.skillType = tpz.skill.SINGING
        params.bonus     = staff

    local resm = applyResistance(caster, target, spell, params)

    if resm < 0.5 then
        spell:setMsg(tpz.msg.basic.MAGIC_RESIST)

        return tpz.effect.THRENODY
    end

    -- Remove previous Threnody
    target:delStatusEffect(tpz.effect.THRENODY)

    local iBoost   = caster:getMod(tpz.mod.THRENODY_EFFECT) + caster:getMod(tpz.mod.ALL_SONGS_EFFECT)
    local power    = basePower + (iBoost * 5)
    local duration = baseDuration * ((iBoost * 0.1) + (caster:getMod(tpz.mod.SONG_DURATION_BONUS) / 100) + 1)

    if caster:hasStatusEffect(tpz.effect.SOUL_VOICE) then
        power = power * 2
    elseif caster:hasStatusEffect(tpz.effect.MARCATO) then
        power = power * 1.5
    end

    if caster:hasStatusEffect(tpz.effect.TROUBADOUR) then
        duration = duration * 2
    end

    -- Set spell message and apply status effect
    target:addStatusEffect(tpz.effect.THRENODY, -power, 0, duration, 0, modifier, 0)

    return tpz.effect.THRENODY
end

function handleNinjutsuDebuff(caster, target, spell, basePower, baseDuration, modifier)
    -- Add new
    target:addStatusEffectEx(tpz.effect.NINJUTSU_ELE_DEBUFF, 0, basePower, 0, baseDuration, 0, modifier, 0)

    return tpz.effect.NINJUTSU_ELE_DEBUFF
end

-- Returns true if you can overwrite the effect
-- Example: canOverwrite(target, tpz.effect.SLOW, 25)
function canOverwrite(target, effect, power, mod)
    mod = mod or 1

    local statusEffect = target:getStatusEffect(effect)

    -- effect not found so overwrite
    if statusEffect == nil then
        return true
    end

    -- overwrite if its weaker
    if statusEffect:getPower() * mod > power then
        return false
    end

    return true
end

function doElementalNuke(caster, spell, target, spellParams)
    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("--- BEGIN ELEMENTAL NUKE DAMAGE CALCULATION ---"),tpz.msg.channel.SYSTEM_3)
    end

 -- printf("magic.lua doElementalNuke CASTER: [%s]  SPELL: [%i]  TARGET: [%s]", caster:getName(), spell:getID(), target:getName())
    local DMG           = 0
    local dINT          = caster:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT)
    local V             = 0
    local M             = 0
    local I             = 0
    local cap           = 0
    local resistBonus   = spellParams.resistBonus
    local mDMG          = caster:getMod(tpz.mod.MAGIC_DAMAGE)
    local mtdrReduction = 1.00

    if caster:getMod(tpz.mod.CONSUME_MP_ELEM_BONUS) == 2 then
        mDMG = mDMG + 50
    end

    -- Calculate D (base damage)
    if USE_OLD_MAGIC_DAMAGE and spellParams.V ~= nil and spellParams.M ~= nil then
        V   = spellParams.V -- Base value
        M   = spellParams.M -- Tier multiplier
        I   = spellParams.I -- Inflection point
        cap = I * 2 + V     -- Base damage soft cap

        if dINT < 0 then
            -- If dINT is a negative value the tier multiplier is always 1
            DMG = V + dINT

            -- Check/ set lower limit of 0 damage for negative dINT
            if DMG < 1 then
                return 0
            end

        elseif dINT < I then
            -- If dINT > 0 but below inflection point I
            DMG = V + dINT * M

        else
            -- Above inflection point I additional dINT is only half as effective
            DMG = V + I + ((dINT - I) * (M / 2))
        end

        -- Check/ set damage soft cap
        if DMG > cap then
            DMG = cap
        end
    else
      --[[
            Calculate base damage:
            D = mDMG + V + (dINT × M)
            D is then floored
            For dINT reduce by amount factored into the V value (example: at 134 INT, when using V100 in the calculation, use dINT = 134-100 = 34)
        ]]

        if dINT <= 49 then
            V   = spellParams.V0
            M   = spellParams.M0
            DMG = math.floor(DMG + mDMG + V + (dINT * M))

            if DMG <= 0 then
                return 0
            end

            if caster:getLocalVar("AuditMagic") == 1 then
                caster:PrintToPlayer(string.format("    BASE DMG: [%i] = MAGIC DAMAGE: [%i] + V: [%i] + (dINT: [%i] * M: [%1.2f])", DMG, mDMG, V, dINT, M),tpz.msg.channel.SYSTEM_3)
            end
        elseif dINT >= 50 and dINT <= 99 then
            V   = spellParams.V50
            M   = spellParams.M50
            DMG = math.floor(DMG + mDMG + V + ((dINT - 50) * M))

            if caster:getLocalVar("AuditMagic") == 1 then
                caster:PrintToPlayer(string.format("    BASE DMG: [%i] = MAGIC DAMAGE: [%i] + V: [%i] + ((dINT: [%i] - 50) * M: [%1.2f])", DMG, mDMG, V, dINT, M),tpz.msg.channel.SYSTEM_3)
            end
        elseif dINT >= 100 and dINT <= 199 then
            V   = spellParams.V100
            M   = spellParams.M100
            DMG = math.floor(DMG + mDMG + V + ((dINT - 100) * M))

            if caster:getLocalVar("AuditMagic") == 1 then
                caster:PrintToPlayer(string.format("    BASE DMG: [%i] = MAGIC DAMAGE: [%i] + V: [%i] + ((dINT: [%i] - 100) * M: [%1.2f])", DMG, mDMG, V, dINT, M),tpz.msg.channel.SYSTEM_3)
            end
        elseif dINT > 199 then
            V   = spellParams.V200
            M   = spellParams.M200
            DMG = math.floor(DMG + mDMG + V + ((dINT - 200) * M))

            if caster:getLocalVar("AuditMagic") == 1 then
                caster:PrintToPlayer(string.format("    BASE DMG: [%i] = MAGIC DAMAGE: [%i] + V: [%i] + ((dINT: [%i] - 200) * M: [%1.2f])", DMG, mDMG, V, dINT, M),tpz.msg.channel.SYSTEM_3)
            end
        end
    end

    -- Toggle MTDR (Multiple-Target Damage Reduction)
    -- spellParams.hasMultipleTargetReduction -- still unused!!!
    if
        spell:isAoE() > 0 and
        spell:getTotalTargets() > 1
    then
        if
            spell:getTotalTargets() >= 2 and
            spell:getTotalTargets() < 10
        then
            mtdrReduction = 1 - (0.05 * spell:getTotalTargets())
        elseif spell:getTotalTargets() >= 10 then
            mtdrReduction = 0.4
        end

        if caster:getLocalVar("AuditMagic") == 1 then
            -- caster:PrintToPlayer(string.format("        SPELL IS AOE"),tpz.msg.channel.SYSTEM_3)
            caster:PrintToPlayer(string.format("        MULTI TARGET REDUCTION: [%1.2f] = BASE: [1.00] - (0.05 * TOTAL TARGETS: [%i])", mtdrReduction, spell:getTotalTargets()),tpz.msg.channel.SYSTEM_3)
            caster:PrintToPlayer(string.format("    DMG: [%i] = BASE DMG: [%i] * MULTI TARGET REDUCTION: [%1.2f]", DMG * mtdrReduction, DMG, mtdrReduction),tpz.msg.channel.SYSTEM_3)
        end
    end

    DMG = DMG * mtdrReduction

    -- Get resist multiplier (1x if no resist)
    local params = {}
        params.attribute   = tpz.mod.INT
        params.skillType   = tpz.skill.ELEMENTAL_MAGIC
        params.resistBonus = resistBonus

    local resist = applyResistance(caster, target, spell, params)

    --get the resisted damage
    DMG = DMG * resist
    
    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("    DMG: [%i] = DMG: [%i] * RESIST: [%1.4f]", DMG, DMG / resist, resist),tpz.msg.channel.SYSTEM_3)
    end
    
    --add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
    DMG = addBonuses(caster, spell, target, DMG, spellParams)
    
    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("    DMG AFTER BONUSES: [%i]", DMG),tpz.msg.channel.SYSTEM_3)
    end

    -- Add in final adjustments
    DMG = finalMagicAdjustments(caster, target, spell, DMG)

    if DMG < 0 then
        spell:setMsg(tpz.msg.basic.MAGIC_RECOVERS_HP)
    end

    -- Converts 2% of elemental magic damage dealt to MP
    -- Unclear if there is a cap to how much MP this restores
    -- A 10,000 damage nuke would "restore"/reduce the cost of a spell by 200 MP
    -- High damage spells effectively become free to cast with no cap so we'll cap it at 25% of the spell's original cost
    if caster:getMod(tpz.mod.CONVERT_ELEM_DMG_MP) > 0 then
        local restoreMP  = DMG * (caster:getMod(tpz.mod.CONVERT_ELEM_DMG_MP) / 100)
        local restoreCap = spell:getMPCost() / 4

        if restoreMP > restoreCap then
            restoreMP = restoreCap
        end

        caster:addMP(restoreMP)

        -- printf("magic.lua doElementalNuke CASTER: [%s]  SPELL COST: [%i]  RESTORE CAP: [%i]  RESTORE MP: [%i]", caster:getName(), spell:getMPCost(), restoreCap, restoreMP)
    end

    if caster:hasStatusEffect(tpz.effect.THEURGIC_FOCUS) then
        caster:delStatusEffectSilent(tpz.effect.THEURGIC_FOCUS)
    end

    if caster:hasStatusEffect(tpz.effect.COLLIMATED_FERVOR) then
        caster:delStatusEffectSilent(tpz.effect.COLLIMATED_FERVOR)
    end

    return DMG
end

function doDivineNuke(caster, target, spell, params)
    params.skillType = tpz.skill.DIVINE_MAGIC
    params.attribute = tpz.mod.MND

    return doNuke(caster, target, spell, params)
end

function doNinjutsuNuke(caster, target, spell, params)
    local mabBonus = params.mabBonus

    mabBonus = mabBonus or 0
    mabBonus = mabBonus + caster:getMod(tpz.mod.NIN_NUKE_BONUS) -- "enhances ninjutsu damage" bonus

    if caster:hasStatusEffect(tpz.effect.INNIN) and caster:isBehind(target, 23) then -- Innin mag atk bonus from behind, guesstimating angle at 23 degrees
        mabBonus = mabBonus + caster:getStatusEffect(tpz.effect.INNIN):getPower()
    end

    params.skillType = tpz.skill.NINJUTSU
    params.attribute = tpz.mod.INT
    params.mabBonus  = mabBonus

    if caster:getObjType() == tpz.objType.PC then
        local mLvl      = caster:getMainLvl()
        local custBonus = 1 + ((mLvl - 30) / 100) -- Ichi elemental ninjutsu (params.dmg == 56)

        if params.dmg == 138 then -- Ni elemental ninjutsu
            custBonus = 1 + ((mLvl - 50) / 50)
        elseif params.dmg == 268 then -- San elemental ninjutsu
            custBonus = 1 + ((mLvl - 80 ) / 20)
        end

        params.dmg = params.dmg * custBonus
    end

    return doNuke(caster, target, spell, params)
end

function doNuke(caster, target, spell, params)
    local auditRawDmg       = 0
    local auditResist       = 0
    local auditBaseDmg      = 0
    local auditNinDmg       = 0
    local auditFutaeBonus   = 0
    local auditFutaeDmg     = 0
    local auditElementBonus = 0
    local auditFinalDmg     = 0

    local skill = spell:getSkillType()

    --calculate raw damage
    local dmg = calculateMagicDamage(caster, target, spell, params)
    -- Audit value
    auditRawDmg = dmg

    --get resist multiplier (1x if no resist)
    local resist = applyResistance(caster, target, spell, params)
    -- Audit value
    auditResist = resist

    --get the resisted damage
    dmg = dmg * resist
    -- Audit value
    auditBaseDmg = dmg

    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("BASE DAMAGE: [%i] = RAW DAMAGE: [%i] * RESIST: [%1.4f]", auditBaseDmg, auditRawDmg, auditResist),tpz.msg.channel.SYSTEM_3)
    end

    if skill == tpz.skill.NINJUTSU then
        if caster:getMainJob() == tpz.job.NIN then -- NIN main gets a bonus to their ninjutsu nukes
            local ninSkillBonus = 100

            if spell:getID() % 3 == 2 then -- ichi nuke spell ids are 320, 323, 326, 329, 332, and 335
                ninSkillBonus = 100 + math.floor((caster:getSkillLevel(tpz.skill.NINJUTSU) - 50) / 2) -- getSkillLevel includes bonuses from merits and modifiers (ie. gear)
            elseif spell:getID() % 3 == 0 then -- ni nuke spell ids are 1 more than their corresponding ichi spell
                ninSkillBonus = 100 + math.floor((caster:getSkillLevel(tpz.skill.NINJUTSU) - 125) / 2)
            else -- san nuke spell, also has ids 1 more than their corresponding ni spell
                ninSkillBonus = 100 + math.floor((caster:getSkillLevel(tpz.skill.NINJUTSU) - 275) / 2)
            end

            ninSkillBonus = utils.clamp(ninSkillBonus, 100, 200) -- bonus caps at +100%, and does not go negative

            -- Audit value
            auditNinDmg = dmg

            dmg = dmg * ninSkillBonus / 100

            if caster:getLocalVar("AuditMagic") == 1 then
                caster:PrintToPlayer(string.format("NINJUTSU MODIFIED DAMAGE: [%i] = BASE DAMAGE: [%i] * SKILL BONUS: [%1.2f]", dmg, auditNinDmg, ninSkillBonus / 100),tpz.msg.channel.SYSTEM_3)
            end
        end

        -- boost with Futae
        if caster:hasStatusEffect(tpz.effect.FUTAE) then
            -- Audit value
            auditFutaeBonus = 1.50 + (caster:getMod(tpz.mod.ENH_FUTAE) / 100)

            -- Audit value
            auditFutaeDmg = dmg

            dmg = math.floor(dmg * (1.50 + (caster:getMod(tpz.mod.ENH_FUTAE) / 100)))

            if caster:getLocalVar("AuditMagic") == 1 then
                caster:PrintToPlayer(string.format("FUTAE MODIFIED DAMAGE: [%i] = BASE DAMAGE: [%i] * (1.50 + FUTAE BONUS: [%1.2f])", dmg, auditFutaeDmg, auditFutaeBonus),tpz.msg.channel.SYSTEM_3)
            end

            caster:delStatusEffect(tpz.effect.FUTAE)
        end
    end

    -- Audit value
    auditElementBonus = dmg
    -- add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
    dmg = addBonuses(caster, spell, target, dmg, params)

    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("BONUS MODIFIED DAMAGE: [%i] = BASE DAMAGE: [%i] + BONUS DAMAGE: [%i]", dmg, auditElementBonus, dmg - auditElementBonus),tpz.msg.channel.SYSTEM_3)
    end

    -- add in target adjustment
--    dmg = adjustForTarget(target, dmg, spell:getElement())
    -- Audit value
    auditFinalDmg = dmg
    -- add in final adjustments
    dmg = finalMagicAdjustments(caster, target, spell, dmg)

    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("FINAL DAMAGE: [%i] = BASE DAMAGE: [%i] + FINAL ADJUSTMENTS: [%i]", dmg, auditFinalDmg, dmg - auditFinalDmg),tpz.msg.channel.SYSTEM_3)
    end

    return dmg
end

function doDivineBanishNuke(caster, target, spell, params)
    local auditRawDmg       = 0
    local auditElementBonus = 0
    local auditFinalDmg     = 0

    params.skillType = tpz.skill.DIVINE_MAGIC
    params.attribute = tpz.mod.MND

    --calculate raw damage
    local dmg = calculateMagicDamage(caster, target, spell, params)
    auditRawDmg = dmg
    --get resist multiplier (1x if no resist)
    local resist = applyResistance(caster, target, spell, params)

    --get the resisted damage
    dmg = dmg * resist

    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("BASE DAMAGE: [%i] = RAW DAMAGE: [%i] * RESIST: [%1.4f]", dmg, auditRawDmg, resist),tpz.msg.channel.SYSTEM_3)
    end

    -- Audit value
    auditElementBonus = dmg
    --add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
    dmg = addBonuses(caster, spell, target, dmg, params)

    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("BONUS MODIFIED DAMAGE: [%i] = BASE DAMAGE: [%i] + BONUS DAMAGE: [%i]", dmg, auditElementBonus, dmg - auditElementBonus),tpz.msg.channel.SYSTEM_3)
    end

    --add in target adjustment
--    dmg = adjustForTarget(target, dmg, spell:getElement())
    --handling afflatus misery
    dmg = handleAfflatusMisery(caster, spell, dmg)
    -- Audit value
    auditFinalDmg = dmg
    --add in final adjustments
    dmg = finalMagicAdjustments(caster, target, spell, dmg)

    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("FINAL DAMAGE: [%i] = BASE DAMAGE: [%i] + FINAL ADJUSTMENTS: [%i]", dmg, auditFinalDmg, dmg - auditFinalDmg),tpz.msg.channel.SYSTEM_3)
    end

    return dmg
end

function calculateDurationForLvl(duration, spellLvl, targetLvl)
    if targetLvl < spellLvl then
        return duration * targetLvl / spellLvl
    end

    return duration
end

function calculateDuration(duration, caster, target, spell, useComposure)
    -- Force enfeebling spell duration to 60s duration during PvP
    if
        caster:getZoneID() == 43 and
        caster:hasStatusEffect(tpz.effect.ALLIED_TAGS) and
        magicSkill == tpz.skill.ENFEEBLING_MAGIC
    then
        return 60
    end
    -- if (caster:getObjType() == tpz.objType.PC or caster:getObjType() == tpz.objType.TRUST) then
        -- printf("magic.lua calculateDuration SPELL ID: [%i]", spell:getID())
    -- end
    local spellGroup = spell:getSpellGroup()
    local magicSkill = spell:getSkillType()

    if magicSkill == tpz.skill.ENHANCING_MAGIC then -- Enhancing Magic
        -- printf("magic.lua calculateDuration  1  CASTER: [%s]  DURATION: [%i]", caster:getName(), duration)
        -- Gear mods
        duration = duration + (duration * caster:getMod(tpz.mod.ENH_MAGIC_DURATION) / 100)
        -- printf("magic.lua calculateDuration  2  CASTER: [%s]  DURATION: [%i]", caster:getName(), duration)

        -- prior according to bg-wiki
        duration = duration + caster:getMerit(tpz.merit.ENHANCING_MAGIC_DURATION)
        -- printf("magic.lua calculateDuration  3  CASTER: [%s]  DURATION: [%i]", caster:getName(), duration)

        -- Default is true
        useComposure = useComposure or (useComposure == nil and true)

        if useComposure and caster:hasStatusEffect(tpz.effect.COMPOSURE) and caster:getID() == target:getID() then
            duration = duration * 3
        end

        -- Set: Augments "Composure" only applies to others, not the RDM
        if caster ~= target and caster:getMod(tpz.mod.AUGMENT_COMPOSURE) > 0 and caster:hasStatusEffect(tpz.effect.COMPOSURE) then
            duration = duration * (1 + (caster:getMod(tpz.mod.AUGMENT_COMPOSURE) / 100))
        end

        -- Perpetuance
        if caster:hasStatusEffect(tpz.effect.PERPETUANCE) and spellGroup == tpz.magic.spellGroup.WHITE then
            if caster:getLocalVar("PERPETUANCE_TOGGLE") == 0 then
                caster:setLocalVar("PERPETUANCE_COUNTER", spell:getTotalTargets())
                caster:setLocalVar("PERPETUANCE_TOGGLE", 1)
            else
                caster:setLocalVar("PERPETUANCE_COUNTER", caster:getLocalVar("PERPETUANCE_COUNTER") - 1)
            end

            duration = duration * (2 + (caster:getMod(tpz.mod.ENH_PERPETUANCE) / 100))

            if (caster:getLocalVar("PERPETUANCE_COUNTER") <= 1) then
                caster:delStatusEffect(tpz.effect.PERPETUANCE)
                caster:setLocalVar("PERPETUANCE_TOGGLE", 0)
            end
        end

        -- Embolden
        if caster:hasStatusEffect(tpz.effect.EMBOLDEN) then
            duration = duration * 0.5
        end
    elseif magicSkill == tpz.skill.ENFEEBLING_MAGIC then -- Enfeebling Magic
        if caster:hasStatusEffect(tpz.effect.SABOTEUR) then
            if target:isNM() then
                duration = duration * 1.25
            else
                duration = duration * 2
            end
        end

        -- After Saboteur according to bg-wiki
        duration = duration + caster:getMerit(tpz.merit.ENFEEBLING_MAGIC_DURATION)
    elseif magicSkill == tpz.skill.DARK_MAGIC then -- Dark Magic
        duration = duration * (1 + (caster:getMod(tpz.mod.DARK_MAGIC_DURATION) / 100))
    end

    return math.floor(duration)
end

function calculatePotency(basePotency, magicSkill, caster, target)
    if magicSkill ~= tpz.skill.ENFEEBLING_MAGIC then
        return basePotency
    end

    if caster:hasStatusEffect(tpz.effect.SABOTEUR) then
        if target:isNM() then
            basePotency = math.floor(basePotency * (1.25 + (caster:getMod(tpz.mod.ENHANCES_SABOTEUR) / 100)))
        else
            basePotency = math.floor(basePotency * (2 + (caster:getMod(tpz.mod.ENHANCES_SABOTEUR) / 100)))
        end
    end

    basePotency = basePotency + caster:getMod(tpz.mod.ENH_ENFEEBLE)

    return math.floor(basePotency * (1 + caster:getMod(tpz.mod.ENF_MAG_POTENCY) / 100))
end

-- Output magic hit rate for all levels
function outputMagicHitRateInfo()
    for casterLvl = 1, 75 do

--        printf("")
--        printf("-------- CasterLvl: %d", casterLvl)

        for lvlMod = -5, 20 do

            local targetLvl = casterLvl + lvlMod

            if targetLvl >= 0 then
                -- assume BLM spell, A+
                local magicAcc = utils.getSkillLvl(6, casterLvl)
                -- assume default monster magic eva, D
                local magicEvaRank = 3
                local rate = 0

                local magicEva = utils.getMobSkillLvl(magicEvaRank, targetLvl)

                local dINT = (lvlMod + 1) * -1

                if dINT > 10 then
                    magicAcc = magicAcc + 10 + (dINT - 10)/2
                else
                    magicAcc = magicAcc + dINT
                end

                local magicHitRate = calculateMagicHitRate(caster, magicAcc, magicEva, 0, casterLvl, targetLvl)

--                printf("Lvl: %d vs %d, %d%%, MA: %d, ME: %d", casterLvl, targetLvl, magicHitRate, magicAcc, magicEva)
            end

        end
    end
end

local geoCardinalTierStat =
{
    [0] = {0, 0},
    [1] = {8.0,  5.0},
    [2] = {10.0, 7.0},
    [3] = {14.0, 10.0},
    [4] = {17.0, 13.0},
}

local geoBurstBonus =
{
    [0] = {0, 0},
    [1] = {15.0, 10.0},
    [2] = {19.0, 14.0},
    [3] = {24.0, 18.0},
    [4] = {28.0, 22.0},
}

function getCardinalStats(caster, target, isAraSpell, spell)
    local spellID           = spell:getID()
    local cardinalQuadrant  = caster:getCardinalQuadrant(target)
    local modTier           = caster:getMod(tpz.mod.CARDINAL_CHANT) or 0
    local MAG_BURST_BONUS   = caster:getMod(tpz.mod.MAG_BURST_BONUS)
    local MAGIC_CRITHITRATE = caster:getMod(tpz.mod.MAGIC_CRITHITRATE)
    local enhCardinalChant  = 1 + (caster:getMod(tpz.mod.ENH_CARDINAL_CHANT) / 100)
    local base              = 0.0
    local burstbase         = 0.0
    local cardinalStats     = {0.00, 0.00, 0.00, 0.00}

    if isAraSpell == 1 then
        base = geoCardinalTierStat[modTier][1]
        burstbase = geoBurstBonus[modTier][1]
    else
        base = geoCardinalTierStat[modTier][2]
        burstbase = geoBurstBonus[modTier][2]
    end

    if caster:hasStatusEffect(tpz.effect.COLLIMATED_FERVOR) then
        base = base * 1.5
        burstbase = burstbase * 1.5
    end

    cardinalStats[1] = (base * tpz.magic.geoCardinalQuadStats[cardinalQuadrant].MATT) * enhCardinalChant
    cardinalStats[2] = (base * tpz.magic.geoCardinalQuadStats[cardinalQuadrant].MACC) * enhCardinalChant
    cardinalStats[3] = (burstbase * tpz.magic.geoCardinalQuadStats[cardinalQuadrant].MAG_BURST_BONUS) * enhCardinalChant
    cardinalStats[4] = (base * tpz.magic.geoCardinalQuadStats[cardinalQuadrant].MAGIC_CRITHITRATE) * enhCardinalChant

    return cardinalStats
end

function magicReduceAllianceEnmity(caster, target)
    if target:getObjType() == tpz.objType.PC then
        return
    end

    if
        caster:getObjType() == tpz.objType.PC or
        caster:getObjType() == tpz.objType.TRUST
    then
        local enmityBonus = utils.clamp(caster:getMod(tpz.mod.ENMITY) + caster:getMerit(tpz.merit.ENMITY_INCREASE) - caster:getMerit(tpz.merit.ENMITY_DECREASE), -50, 200)
        local enmityList = target:getEnmityList()
        local enmityListName = {}
        local targ
        local currentCE
        local currentVE

        for i, v in ipairs(enmityList) do
            local removeEnmity = true
            local reduceCE = 100 * (1 + (enmityBonus / 100))
            local reduceVE

            enmityListName[i] = v.entity:getName()

            if (v.entity:isPC()) then
                targ = GetPlayerByName(enmityListName[i])
            else
                targ = v.entity
            end

            currentCE = target:getCE(targ)
            currentVE = target:getVE(targ)

            if (currentCE >= 29501) then
                reduceCE = 1000
            end

            if (currentCE < reduceCE) then
                reduceCE = currentCE - 1
            end

            reduceVE = reduceCE * 4

            if (targ:getMainJob() == tpz.job.PLD or targ:getMainJob() == tpz.job.RUN or targ:getMainJob() == tpz.job.NIN) then
                removeEnmity = false
            end

            -- printf("magic.lua magicReduceAllianceEnmity  TARG NAME: [%s]  CURRENT CE: [%i]  REMOVE ENMITY: [%s]", targ:getName(), currentCE, removeEnmity)

            if (targ:getName() ~= caster:getName() and removeEnmity == true) then
                -- printf("magic.lua magicReduceAllianceEnmity [%s] REDUCING [%s's] CE/VE BY [%i]/[%i] FROM [%i]/[%i] TO [%i]/[%i]", caster:getName(), targ:getName(), reduceCE, reduceCE * 4, target:getCE(targ), target:getVE(targ), target:getCE(targ) - reduceCE, target:getVE(targ) - (reduceCE * 4))
                target:setCE(targ, utils.clamp(target:getCE(targ) - reduceCE, 1, 29999))
                target:setVE(targ, utils.clamp(target:getVE(targ) - reduceVE, 1, 29999))
            end
        end
    end
end

function checkWeakestElement(caster, target, spell)
    local weakness = {0, 0, 0, 0, 0, 0, 0, 0}
    local weakestElement = 0
    local weakestTracker = 0

    -- if (target ~= nil) then
        -- for i = 1, #tpz.magic.resistMod do -- Check through all resistances for any negatives (weak to element)
            -- weakness[i] = target:getMod(tpz.magic.resistMod[i])

            -- if ((weakestElement == 0 and weakestTracker == 0) or (weakness[i] < weakestTracker)) then
                -- weakestElement = i
                -- weakestTracker = target:getMod(tpz.magic.resistMod[i])
            -- end
        -- end
    -- end

    -- local dayElement = VanadielDayOfTheWeek()

    -- if (weakestElement == 0) then
        -- weakestElement = dayElement
    -- end

    return weakestElement
end

function songsCheckEmpEffect(target, effect)
    local power       = effect:getPower()
    local subPower    = effect:getSubPower()
    local element     = {tpz.magic.ele.FIRE, tpz.magic.ele.EARTH, tpz.magic.ele.WATER, tpz.magic.ele.WIND, tpz.magic.ele.ICE, tpz.magic.ele.LIGHTNING, tpz.magic.ele.LIGHT, tpz.magic.ele.DARK}
    local stats       = {tpz.mod.STR,        tpz.mod.VIT,         tpz.mod.MND,         tpz.mod.AGI,        tpz.mod.INT,       tpz.mod.DEX,             tpz.mod.CHR,         tpz.mod.MP        }
    local empSetBonus = 0
    local bonusMod    = tpz.mod.NONE

    -- Scherzo requires an exception to where its Empyrean mod power is stored
    -- Effect power holds the damage threshold
    -- Effect sub power holds the damage reduction
    if effect:getType() == tpz.effect.SCHERZO then
        power    = effect:getTier()
        subPower = tpz.magic.ele.EARTH
    elseif effect:getType() == tpz.effect.MARCH then
        power    = effect:getTier()
        subPower = tpz.magic.ele.LIGHTNING
    end

    if power >= 2000 and power < 3000 then
        power = power - 2000
        empSetBonus = 1
    elseif power >= 3000 and power < 4000 then
        power = power - 3000
        empSetBonus = 2
    elseif power >= 4000 and power < 5000 then
        power = power - 4000
        empSetBonus = 3
    elseif power >= 5000 then
        power = power - 5000
        empSetBonus = 5
    end

    for i, v in pairs(element) do
		if subPower == element[i] and empSetBonus > 0 then
            bonusMod = stats[i]

			if bonusMod == tpz.mod.MP then
				empSetBonus = empSetBonus * 10
			end
		end
	end

    return power, empSetBonus, bonusMod
end

tpz.ma = tpz.magic

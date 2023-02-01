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

------------------------------------
-- Tables by element
------------------------------------
tpz.magic.dayStrong           = {tpz.day.FIRESDAY,              tpz.day.ICEDAY,               tpz.day.WINDSDAY,               tpz.day.EARTHSDAY,              tpz.day.LIGHTNINGDAY,               tpz.day.WATERSDAY,               tpz.day.LIGHTSDAY,           tpz.day.DARKSDAY}
tpz.magic.singleWeatherStrong = {tpz.weather.HOT_SPELL,         tpz.weather.SNOW,             tpz.weather.WIND,               tpz.weather.DUST_STORM,         tpz.weather.THUNDER,                tpz.weather.RAIN,                tpz.weather.AURORAS,         tpz.weather.GLOOM}
tpz.magic.doubleWeatherStrong = {tpz.weather.HEAT_WAVE,         tpz.weather.BLIZZARDS,        tpz.weather.GALES,              tpz.weather.SAND_STORM,         tpz.weather.THUNDERSTORMS,          tpz.weather.SQUALL,              tpz.weather.STELLAR_GLARE,   tpz.weather.DARKNESS}
local elementalObi            = {tpz.mod.FORCE_FIRE_DWBONUS,    tpz.mod.FORCE_ICE_DWBONUS,    tpz.mod.FORCE_WIND_DWBONUS,     tpz.mod.FORCE_EARTH_DWBONUS,    tpz.mod.FORCE_LIGHTNING_DWBONUS,    tpz.mod.FORCE_WATER_DWBONUS,     tpz.mod.FORCE_LIGHT_DWBONUS, tpz.mod.FORCE_DARK_DWBONUS}
local spellAcc                = {tpz.mod.FIREACC,               tpz.mod.EARTHACC,             tpz.mod.WATERACC,               tpz.mod.WINDACC,                tpz.mod.ICEACC,                     tpz.mod.THUNDERACC,              tpz.mod.LIGHTACC,            tpz.mod.DARKACC}
local spellMAB                = {tpz.mod.FIREATT,               tpz.mod.EARTHATT,             tpz.mod.WATERATT,               tpz.mod.WINDATT,                tpz.mod.ICEATT,                     tpz.mod.THUNDERATT,              tpz.mod.LIGHTATT,            tpz.mod.DARKATT}
local strongAffinityDmg       = {tpz.mod.FIRE_AFFINITY_DMG,     tpz.mod.ICE_AFFINITY_DMG,     tpz.mod.WIND_AFFINITY_DMG,      tpz.mod.EARTH_AFFINITY_DMG,     tpz.mod.THUNDER_AFFINITY_DMG,       tpz.mod.WATER_AFFINITY_DMG,      tpz.mod.LIGHT_AFFINITY_DMG,  tpz.mod.DARK_AFFINITY_DMG}
local strongAffinityAcc       = {tpz.mod.FIRE_AFFINITY_ACC,     tpz.mod.ICE_AFFINITY_ACC,     tpz.mod.WIND_AFFINITY_ACC,      tpz.mod.EARTH_AFFINITY_ACC,     tpz.mod.THUNDER_AFFINITY_ACC,       tpz.mod.WATER_AFFINITY_ACC,      tpz.mod.LIGHT_AFFINITY_ACC,  tpz.mod.DARK_AFFINITY_ACC}
tpz.magic.resistMod           = {tpz.mod.FIRERES,               tpz.mod.ICERES,               tpz.mod.WINDRES,                tpz.mod.EARTHRES,               tpz.mod.THUNDERRES,                 tpz.mod.WATERRES,                tpz.mod.LIGHTRES,            tpz.mod.DARKRES}
tpz.magic.defenseMod          = {tpz.mod.FIREDEF,               tpz.mod.ICEDEF,               tpz.mod.WINDDEF,                tpz.mod.EARTHDEF,               tpz.mod.THUNDERDEF,                 tpz.mod.WATERDEF,                tpz.mod.LIGHTDEF,            tpz.mod.DARKDEF}
tpz.magic.absorbMod           = {tpz.mod.FIRE_ABSORB,           tpz.mod.ICE_ABSORB,           tpz.mod.WIND_ABSORB,            tpz.mod.EARTH_ABSORB,           tpz.mod.LTNG_ABSORB,                tpz.mod.WATER_ABSORB,            tpz.mod.LIGHT_ABSORB,        tpz.mod.DARK_ABSORB}
local nullMod                 = {tpz.mod.FIRE_NULL,             tpz.mod.ICE_NULL,             tpz.mod.WIND_NULL,              tpz.mod.EARTH_NULL,             tpz.mod.LTNG_NULL,                  tpz.mod.WATER_NULL,              tpz.mod.LIGHT_NULL,          tpz.mod.DARK_NULL}
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
    local dmg = params.dmg

    if (dINT <= 0) then --if dINT penalises, it's always M=1
        dmg = dmg + dINT
        if (dmg <= 0) then --dINT penalty cannot result in negative damage (target absorption)
            return 0
        end
    elseif (dINT > 0 and dINT <= SOFT_CAP) then --The standard calc, most spells hit this
        dmg = dmg + (dINT * params.multiplier)
    elseif (dINT > 0 and dINT > SOFT_CAP and dINT < HARD_CAP) then --After SOFT_CAP, INT is only half effective
        dmg = dmg + SOFT_CAP * params.multiplier + ((dINT - SOFT_CAP) * params.multiplier) / 2
    elseif (dINT > 0 and dINT > SOFT_CAP and dINT >= HARD_CAP) then --After HARD_CAP, INT has no tpz.effect.
        dmg = dmg + HARD_CAP * params.multiplier
    end


    if (params.skillType == tpz.skill.DIVINE_MAGIC and target:isUndead()) then
        -- 150% bonus damage
        dmg = dmg * 1.5
    end

    -- printf("dmg: %d dINT: %d\n", dmg, dINT)

    return dmg

end

function doBoostGain(caster, target, spell, effect)
    local duration = calculateDuration(300, caster, target, spell)

    --calculate potency
    local magicskill = target:getSkillLevel(spell:getSkillType())

    local potency = math.floor((magicskill - 300) / 10) + 5

    local gearbonus = caster:getMod(tpz.mod.GAIN_MAGIC_EFFECT)

    if potency > 25 then
        potency = 25
    elseif potency < 5 then
        potency = 5
    end

    if (target:hasStatusEffect(tpz.effect.EMBOLDEN)) then
        potency = potency * 1.5
        target:delStatusEffect(tpz.effect.EMBOLDEN)
    end

    potency = potency + gearbonus

    --printf("BOOST-GAIN: POTENCY = %d", potency)

    --Only one Boost Effect can be active at once, so if the player has any we have to cancel & overwrite
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
            if caster:hasStatusEffect(effect) then
                --printf("BOOST-GAIN: HAS EFFECT %d, DELETING...", effect)
                caster:delStatusEffect(effect)
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

function getCureFinal(caster, spell, basecure, minCure, isBlueMagic)
    if basecure < minCure then
        basecure = minCure
    end

    local curePot = math.min(caster:getMod(tpz.mod.CURE_POTENCY), 50) / 100 -- caps at 50%
    local curePotII = math.min(caster:getMod(tpz.mod.CURE_POTENCY_II), 30) / 100 -- caps at 30%
    local potency = 1 + curePot + curePotII

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

    local affinity = caster:getMod(strongAffinityDmg[ele])
    local bonus = 1.00 + affinity * 0.05 -- 5% per level of affinity
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
    local diff = params.diff or (caster:getStat(params.attribute) - target:getStat(params.attribute))
    local skill = params.skillType
    local bonus = params.bonus
    local effect = params.effect
    local resistCap = params.resistCap or 0.0625
    -- printf("magic.lua applyResistanceEffect EFFECT: [%s]", effect)

    if target:hasStatusEffect(tpz.effect.FEALTY) and math.random(1, 100) > 5 and
       (spell:getID() ~= tpz.magic.spell.DISPEL or
       params.effect ~= tpz.effect.ELEGY or params.effect ~= tpz.effect.LULLABY)
       then
        return 0
    end

    -- If Stymie is active, as long as the mob is not immune then the effect is not resisted
    if (effect ~= nil) then -- Dispel's script doesn't have an "effect" to send here, nor should it.
        if (skill == tpz.skill.ENFEEBLING_MAGIC and caster:hasStatusEffect(tpz.effect.STYMIE) and target:canGainStatusEffect(effect)) then
            caster:delStatusEffect(tpz.effect.STYMIE)
            return 1
        end
    end

    if (skill == tpz.skill.SINGING and caster:hasStatusEffect(tpz.effect.TROUBADOUR)) then
        if (math.random(0, 99) < caster:getMerit(tpz.merit.TROUBADOUR)-25) then
            return 1.0
        end
    end

    local element = spell:getElement()
    local percentBonus = 0
    local magicaccbonus = getSpellBonusAcc(caster, target, spell, params)

    if (diff > 10) then
        magicaccbonus = magicaccbonus + 10 + ((diff - 10) / 2)
    else
        magicaccbonus = magicaccbonus + diff
    end

    if (bonus ~= nil) then
        magicaccbonus = magicaccbonus + bonus
    end

    -- if (caster:getName() == "Khalum" or caster:getName() == "Shumi") then
        -- printf("magic.lua applyResistanceEffect EFFECT: [%s]  MACC BONUS: [%i]", effect, magicaccbonus)
    -- end

    local effectResistance = getEffectResistance(target, effect)

    if effect ~= nil then
        percentBonus = percentBonus - effectResistance
        
        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("EFFECT: [%i]  EFFECT RESISTANCE: [%i]", effect, effectResistance),tpz.msg.channel.SYSTEM_3)
        end
    end

    local p = getMagicHitRate(caster, target, skill, element, percentBonus, magicaccbonus)

    -- if (caster:getName() == "Khalum" or caster:getName() == "Azurewrath") then
        -- printf("magic.lua applyResistanceEffect EFFECT: [%s]  EFFECT RES: [%i]  MAGIC HIT RATE: [%i]  PERCENT BONUS: [%i]  MAGIC RES: [%i]", effect, effectResistance, p, percentBonus, getMagicResist(caster, p))
    -- end

    local magicResist

    if (skill == tpz.skill.DIVINE_MAGIC or skill == tpz.skill.ELEMENTAL_MAGIC or skill == tpz.skill.DARK_MAGIC or skill == tpz.skill.NINJUTSU) then
        magicResist = getMagicDamageResist(caster, p)
    else
        magicResist = getMagicResist(caster, p)
    end

    local enfeeblingEffects = {tpz.effect.WEIGHT,        tpz.effect.POISON, tpz.effect.PARALYSIS, tpz.effect.BLINDNESS, tpz.effect.SILENCE,
                               tpz.effect.PETRIFICATION, tpz.effect.BIND,   tpz.effect.SLOW,      tpz.effect.STUN,      tpz.effect.SLEEP_I, tpz.effect.SLEEP_II}
    local immunities =        {tpz.mod.IMMUNITY_GRAVITY, tpz.mod.IMMUNITY_POISON, tpz.mod.IMMUNITY_PARALYZE, tpz.mod.IMMUNITY_BLIND, tpz.mod.IMMUNITY_SILENCE,
                               tpz.mod.IMMUNITY_PETRIFY, tpz.mod.IMMUNITY_BIND,   tpz.mod.IMMUNITY_SLOW,     tpz.mod.IMMUNITY_STUN,  tpz.mod.IMMUNITY_SLEEP}
    local addImmunity

    if (target:isMob() and target:isNM()) then
        addImmunity = 30
    elseif (target:isMob() and not target:isNM()) then
        addImmunity = 10
    elseif (caster:isPC() and caster:hasStatusEffect(tpz.effect.CHAINSPELL)) then
        addImmunity = 3
    end

    if target:isMob() and skill == tpz.skill.ENFEEBLING_MAGIC and magicResist >= 0.5 then
        for i = 1, #enfeeblingEffects do
            if i >= 1 and i <= 9 and effect == enfeeblingEffects[i] then
                if target:getMod(immunities[i]) > 100 - addImmunity then
                    addImmunity = 100 - target:getMod(immunities[i])
                end

                target:addMod(immunities[i], addImmunity)
                -- printf("magic.lua applyResistanceEffect ENFEEBLING SPELL LANDED, INCREASING IMMUNITY  CURRENT: [%i]", target:getMod(immunities[i]))
            elseif i >= 10 and i <= 11 and effect == enfeeblingEffects[i] then
                if target:getMod(immunities[10]) > 100 - addImmunity then
                    addImmunity = 100 - target:getMod(immunities[10])
                end

                target:addMod(immunities[10], addImmunity)
                -- printf("magic.lua applyResistanceEffect ENFEEBLING SPELL LANDED, INCREASING IMMUNITY  CURRENT: [%i]", target:getMod(immunities[10]))
            end
        end
    elseif target:isMob() and skill == tpz.skill.BLUE_MAGIC and magicResist >= resistCap then
        for i = 1, #enfeeblingEffects do
            if i >= 1 and i <= 9 and effect == enfeeblingEffects[i] then
                if target:getMod(immunities[i]) > 100 - addImmunity then
                    addImmunity = 100 - target:getMod(immunities[i])
                end

                target:addMod(immunities[i], addImmunity)
                -- printf("magic.lua applyResistanceEffect BLUE MAGIC SPELL LANDED, INCREASING IMMUNITY  CURRENT: [%i]", target:getMod(immunities[i]))
            elseif i >= 10 and i <= 11 and effect == enfeeblingEffects[i] then
                if target:getMod(immunities[10]) > 100 - addImmunity then
                    addImmunity = 100 - target:getMod(immunities[10])
                end

                target:addMod(immunities[10], addImmunity)
                -- printf("magic.lua applyResistanceEffect BLUE MAGIC SPELL LANDED, INCREASING IMMUNITY  CURRENT: [%i]", target:getMod(immunities[10]))
            end
        end
    elseif target:isMob() and skill == tpz.skill.SKILL_SINGING or skill == tpz.skill.SKILL_STRING_INSTRUMENT or skill == tpz.skill.SKILL_WIND_INSTRUMENT and magicResist >= 0.5 then
        if effect == tpz.effect.LULLABY then
            if target:getMod(tpz.mod.IMMUNITY_LULLABY) > 70 then
                addImmunity = 100 - target:getMod(tpz.mod.IMMUNITY_LULLABY)
            end

            target:addMod(tpz.mod.IMMUNITY_LULLABY, addImmunity)
        elseif effect == tpz.effect.ELEGY then
            if target:getMod(tpz.mod.IMMUNITY_SLOW) > 70 then
                addImmunity = 100 - target:getMod(tpz.mod.IMMUNITY_SLOW)
            end

            target:addMod(tpz.mod.IMMUNITY_SLOW, addImmunity)
        end
    end

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
    local mainJob = caster:getMainJob()
    local casterLvl = caster:getMainLvl()
    local targetLvl = target:getMainLvl()

    if (caster:isPC()) then
        casterLvl = casterLvl + caster:getItemLevel()
    end

    if (target:isPC()) then
        targetLvl = targetLvl + target:getItemLevel()
    end

    -- resist everything if magic shield is active
    if (target:hasStatusEffect(tpz.effect.MAGIC_SHIELD)) then
        local magicshieldsub = target:getStatusEffect(tpz.effect.MAGIC_SHIELD)

        if magicshieldsub:getSubPower() == 0 then
            return 0
        end
    end

    local magiceva = 0

    if (bonusAcc == nil) then
        bonusAcc = 0
    end

    local magicacc = caster:getMod(tpz.mod.MACC) + caster:getILvlMacc(tpz.slot.MAIN)
    -- if (caster:getName() == "Khalum") then
        -- printf("magic.lua getMagicHitRate  1  MACC: [%i]  =  MACC MOD: [%i]  ITEM LVL MACC: [%i]", magicacc, caster:getMod(tpz.mod.MACC), caster:getILvlMacc(tpz.slot.MAIN))
    -- end

    -- Sword enhancement spells (Enspells)
    if (caster:getMod(tpz.mod.ENSPELL) > 0) then
        magicacc = magicacc + caster:getMod(tpz.mod.ENSPELL_STAT_BONUS)
    end

    local geoMACC = 0.0

    if mainJob == tpz.job.GEO and spellGroup == tpz.magic.spellGroup.BLACK then
        if caster:isSpellAoE(spellId) then
            geoBonus = getCardinalStats(caster, target, 1, spell)
        else
            geoBonus = getCardinalStats(caster, target, 0, spell)
        end
        geoMACC = geoBonus[2]
--      printf("magic.lua getMagicHitRate GEO MACC Bonus: [%i]", geoMACC)
    end

    -- Get the base acc (just skill + skill mod (79 + skillID = ModID) + magic acc mod)
    if (skillType ~= 0) then
        -- Reduce MACC for jobs without Enfeebling Magic Skill
        if ((mainJob ~= tpz.job.BLM and mainJob ~= tpz.job.DRK and mainJob ~= tpz.job.GEO and
             mainJob ~= tpz.job.RDM and mainJob ~= tpz.job.SCH and mainJob ~= tpz.job.WHM and mainJob ~= tpz.job.BRD) and
             skillType == tpz.skill.ENFEEBLING_MAGIC and not caster:isPet()) then
            -- if (caster:getName() == "Khalum") then
                -- printf("magic.lua getMagicHitRate  2  MACC: [%i]  =  MACC: [%i] * SKILL LVL: [%i]", magicacc * (caster:getSkillLevel(skillType) / 414), magicacc, caster:getSkillLevel(skillType) / 414)
            -- end
            magicacc = magicacc * (caster:getSkillLevel(skillType) / 414)
        else
            -- if (caster:getName() == "Khalum") then
                -- printf("magic.lua getMagicHitRate  3  MACC: [%i]  =  MACC: [%i] + SKILL LVL: [%i]", magicacc + caster:getSkillLevel(skillType), magicacc, caster:getSkillLevel(skillType))
            -- end

            -- https://www.bluegartr.com/threads/112776-Dev-Tracker-Findings-Posts-%28NO-DISCUSSION%29?p=5912092#post5912092
            -- Handles adding base and item level weapon skill level from magical weaponskills' primary weapon
            magicacc = magicacc + caster:getSkillLevel(skillType)

            if (skillType == tpz.skill.ARCHERY or skillType == tpz.skill.MARKSMANSHIP) then
                magicacc = magicacc + caster:getILvlSkill(tpz.slot.RANGED)
            elseif (skillType > 0 and skillType <= 12) then
                magicacc = magicacc + caster:getILvlSkill(tpz.slot.MAIN)
            end
        end
    else
        -- for mob skills / additional effects which don't have a skill
        -- if (caster:getName() == "Khalum") then
            -- printf("magic.lua getMagicHitRate  4  MACC: [%i]  =  MACC: [%i] + SKILL LVL: [%i]", magicacc + utils.getSkillLvl(1, caster:getMainLvl()), magicacc, utils.getSkillLvl(1, caster:getMainLvl()))
        -- end
        magicacc = magicacc + utils.getSkillLvl(1, caster:getMainLvl())
    end

    local resMod = 0 -- Some spells may possibly be non elemental, but have status effects.
    if (element ~= tpz.magic.ele.NONE) then
        resMod = target:getMod(tpz.magic.resistMod[element])
--      printf("magic.lua getMagicHitRate RES: [%i]",  resMod)

        -- Add acc for elemental affinity accuracy and element specific accuracy
        local affinityBonus = AffinityBonusAcc(caster, element)
        local elementBonus = caster:getMod(spellAcc[element])
        -- print(elementBonus)
        bonusAcc = bonusAcc + affinityBonus + elementBonus
    end

    -- if (caster:getName() == "Khalum") then
        -- printf("magic.lua getMagicHitRate  5  MACC: [%i]  =  MACC: [%i] + GEO MACC: [%i] + MACC MERIT: [%i]  + NIN MACC MERIT: [%i]", magicacc + geoMACC + caster:getMerit(tpz.merit.MAGIC_ACCURACY) + caster:getMerit(tpz.merit.NIN_MAGIC_ACCURACY), magicacc, geoMACC, caster:getMerit(tpz.merit.MAGIC_ACCURACY), caster:getMerit(tpz.merit.NIN_MAGIC_ACCURACY))
    -- end

    magicacc = magicacc + geoMACC

    magicacc = magicacc + caster:getMerit(tpz.merit.MAGIC_ACCURACY)

    magicacc = magicacc + caster:getMerit(tpz.merit.NIN_MAGIC_ACCURACY)

    if (skillType == tpz.skill.DIVINE_MAGIC and caster:hasStatusEffect(tpz.effect.DIVINE_EMBLEM)) then
        magicacc = magicacc + 500
    end

    -- Base magic evasion (base magic evasion plus resistances(players), plus elemental defense(mobs)
    local magiceva = target:getMod(tpz.mod.MEVA) + resMod
    magiceva = magiceva + (math.min(magiceva * (target:getMod(tpz.mod.FOOD_MEVAP) / 100), target:getMod(tpz.mod.FOOD_MEVAP_CAP)))

    -- Foil "special attack" evasion bonus
    if (target:hasStatusEffect(tpz.effect.FOIL)) then
        magiceva = magiceva * (1 + (target:getMod(tpz.mod.TP_MOVE_EVASION) / 100))
    end

    -- if (caster:getName() == "Khalum") then
        -- printf("magic.lua getMagicHitRate  6  MACC: [%i]  =  MACC: [%i] + BONUS MACC: [%i]", magicacc + bonusAcc, magicacc, bonusAcc)
    -- end

    magicacc = magicacc + bonusAcc

    -- Temporary hard bonus to MACC
    -- TODO: Remove after rebalancing
    magicacc = magicacc + 100

    -- Add macc% from food
    local maccFood = magicacc * (caster:getMod(tpz.mod.FOOD_MACCP)/100)
    magicacc = magicacc + utils.clamp(maccFood, 0, caster:getMod(tpz.mod.FOOD_MACC_CAP))

    -- Reduce MACC for Elemental Magic cast by jobs without Elemental Magic skill
    if ((mainJob ~= tpz.job.BLM and mainJob ~= tpz.job.DRK and mainJob ~= tpz.job.GEO and
         mainJob ~= tpz.job.RDM and mainJob ~= tpz.job.SCH) and
         skillType == tpz.skill.ELEMENTAL_MAGIC and not caster:isPet()) then
            magicacc = magicacc * 0.75
    end

    -- if (caster:getLocalVar("AuditWeaponskill") == 1) then
        -- caster:PrintToPlayer(string.format("CASTER:[%s]  MAGICACC: [%i]  TARGET: [%s]", caster:getName(), magicacc, target:getName()),tpz.msg.channel.SYSTEM_3)
    -- end

    -- if (caster:getLocalVar("AuditMagic") == 1) then
        -- printf("magic.lua getMagicHitRate CASTER:[%s]  MAGICACC: [%i]  TARGET: [%s]", caster:getName(), magicacc, target:getName())
    -- end

    return calculateMagicHitRate(caster, magicacc, magiceva, percentBonus, casterLvl, targetLvl)
end

function calculateMagicHitRate(caster, magicacc, magiceva, percentBonus, casterLvl, targetLvl)
    -- local p = 0
    -- --add a scaling bonus or penalty based on difference of targets level from caster
    -- local levelDiff = utils.clamp(casterLvl - targetLvl, -5, 5)
    -- local adjustedPercent = 1

    -- if (percentBonus <= 100) then
        -- adjustedPercent = 1 + (percentBonus / 100)
    -- end

    -- p = (70 - 0.5 * (magiceva - magicacc) + levelDiff * 3) * adjustedPercent

    local p = 0
    local levelDiff = casterLvl - targetLvl

    if (levelDiff < 0) then
        magiceva = magiceva + (levelDiff * -2)
    end

    local dMACC = magicacc - magiceva
    local adjustedPercent = 1

    -- if (caster:getLocalVar("AuditMagic") == 1) then
        -- printf("magic.lua calculateMagicHitRate  PERCENT BONUS: [%i]", percentBonus)
    -- end

    if (percentBonus <= 100) then
        adjustedPercent = 1 + (percentBonus / 100)
    end

    -- if caster:getObjType() == tpz.objType.MOB then
        -- printf("magic.lua calculateMagicHitRate  MOB: [%s]  ADJUSTED PERCENT: [%1.2f]", caster:getName(), adjustedPercent)
    -- end

    if (dMACC < 0) then
        -- if (caster:getLocalVar("AuditMagic") == 1) then
            -- printf("magic.lua calculateMagicHitRate dMACC < 0")
        -- end
        p = (70 + math.floor(dMACC / 2)) * adjustedPercent
        -- if caster:getObjType() == tpz.objType.MOB then
            -- printf("magic.lua calculateMagicHitRate  dMACC < 0  MOB: [%s]  p: [%1.2f]", caster:getName(), p)
        -- end
    else
        -- if (caster:getLocalVar("AuditMagic") == 1) then
            -- printf("magic.lua calculateMagicHitRate dMACC > 0")
        -- end
        p = (70 + dMACC) * adjustedPercent
        -- if caster:getObjType() == tpz.objType.MOB then
            -- printf("magic.lua calculateMagicHitRate  ELSE  MOB: [%s]  p: [%1.2f]", caster:getName(), p)
        -- end
    end

    if (caster:getLocalVar("AuditWeaponskill") == 1) then
        caster:PrintToPlayer(string.format("CASTER MACC: [%i]  TARGET MEVA: [%i]  PERCENTBONUS: [%1.2f]  HIT RATE: [%i%%]  CAPPED HIT RATE: [%i%%]", magicacc, magiceva, adjustedPercent, p, utils.clamp(p, 5, 95)),tpz.msg.channel.SYSTEM_3)
    end

    if (caster:getLocalVar("AuditMagic") == 1) then
        caster:PrintToPlayer(string.format("CASTER MACC: [%i]  TARGET MEVA: [%i]  PERCENTBONUS: [%1.2f]  HIT RATE: [%i%%]  CAPPED HIT RATE: [%i%%]", magicacc, magiceva, adjustedPercent, p, utils.clamp(p, 5, 95)),tpz.msg.channel.SYSTEM_3)
    end

    return utils.clamp(p, 0, 95)
end

-- Returns resistance value from given magic hit rate (p) for damaging magic spells
function getMagicDamageResist(caster, magicHitRate)
    local p = magicHitRate / 100
    local resist = 1

    local half = (1- p)
    local quarter = (1- p) ^ 2
    local eighth = (1- p) ^ 3

    local resvar = math.random()

    if (caster:getLocalVar("AuditMagic") == 1) then
        caster:PrintToPlayer(string.format("CASTER: [%s]  HIT RATE: [%1.2f]  RANDOM: [%1.2f]  HALF: [%1.4f]  QUARTER: [%1.4f]  EIGHTH: [%1.4f]", caster:getName(), p, resvar, half, quarter, eighth),tpz.msg.channel.SYSTEM_3)
    end

    if (resvar < half) then
        resist = 0.5
        resvar = math.random()

        if (caster:getLocalVar("AuditMagic") == 1) then
            caster:PrintToPlayer(string.format("HALF TRIGGERED  NEW RANDOM: [%1.2f]", resvar),tpz.msg.channel.SYSTEM_3)
        end

        if (resvar < quarter) then
            resist = 0.25
            resvar = math.random()

            if (caster:getLocalVar("AuditMagic") == 1) then
                caster:PrintToPlayer(string.format("QUARTER TRIGGERED  NEW RANDOM: [%1.2f]", resvar),tpz.msg.channel.SYSTEM_3)
            end

            if (resvar < eighth) then
                resist = 0.125

                if (caster:getLocalVar("AuditMagic") == 1) then
                    caster:PrintToPlayer(string.format("EIGHTH TRIGGERED"),tpz.msg.channel.SYSTEM_3)
                end
            end
        end
    end

    return resist
end

-- Returns resistance value from given magic hit rate (p)
function getMagicResist(caster, magicHitRate)

    local p = magicHitRate / 100
    local resist = 1

    -- Resistance thresholds based on p.  A higher p leads to lower resist rates, and a lower p leads to higher resist rates.
    local half = (1 - p)
    local quart = ((1 - p)^2)
    local eighth = ((1 - p)^3)
    local sixteenth = ((1 - p)^4)
    -- print("HALF: "..half)
    -- print("QUART: "..quart)
    -- print("EIGHTH: "..eighth)
    -- print("SIXTEENTH: "..sixteenth)

    local resvar = math.random()

    if (caster:getLocalVar("TestMagicSystem") ~= 1) then
        -- Determine final resist based on which thresholds have been crossed.
        if (resvar <= sixteenth) then
            resist = 0.0625
            if (caster:getLocalVar("AuditMagic") == 1) then
                caster:PrintToPlayer(string.format("CASTER: [%s]  HIT RATE: [%1.2f]  SIXTEENTH TRIGGERED  RANDOM: [%1.2f] <= THRESHOLD: [%1.4f]", caster:getName(), p, resvar, sixteenth),tpz.msg.channel.SYSTEM_3)
            end
        elseif (resvar <= eighth) then
            resist = 0.125
            if (caster:getLocalVar("AuditMagic") == 1) then
                caster:PrintToPlayer(string.format("CASTER: [%s]  HIT RATE: [%1.2f]  EIGHTH TRIGGERED  RANDOM: [%1.2f] <= THRESHOLD: [%1.4f]", caster:getName(), p, resvar, eighth),tpz.msg.channel.SYSTEM_3)
            end
        elseif (resvar <= quart) then
            resist = 0.25
            if (caster:getLocalVar("AuditMagic") == 1) then
                caster:PrintToPlayer(string.format("CASTER: [%s]  HIT RATE: [%1.2f]  QUARTER TRIGGERED  RANDOM: [%1.2f] <= THRESHOLD: [%1.4f]", caster:getName(), p, resvar, quart),tpz.msg.channel.SYSTEM_3)
            end
        elseif (resvar <= half) then
            resist = 0.5
            if (caster:getLocalVar("AuditMagic") == 1) then
                caster:PrintToPlayer(string.format("CASTER: [%s]  HIT RATE: [%1.2f]  HALF TRIGGERED  RANDOM: [%1.2f] <= THRESHOLD: [%1.4f]", caster:getName(), p, resvar, half),tpz.msg.channel.SYSTEM_3)
            end
        else
            resist = 1.0
            if (caster:getLocalVar("AuditMagic") == 1) then
                caster:PrintToPlayer(string.format("CASTER: [%s]  HIT RATE: [%1.2f]  NO RESIST", caster:getName(), p),tpz.msg.channel.SYSTEM_3)
            end
        end
    else
        local resvar = math.random()

        if (caster:getLocalVar("AuditMagic") == 1) then
            caster:PrintToPlayer(string.format("CASTER: [%s]  HIT RATE: [%1.2f]  RANDOM: [%1.2f]  HALF: [%1.4f]  QUARTER: [%1.4f]  EIGHTH: [%1.4f]  SIXTEENTH: [%1.4f]", caster:getName(), p, resvar, half, quart, eighth, sixteenth),tpz.msg.channel.SYSTEM_3)
        end

        if (resvar < half) then
            resist = 0.5
            resvar = math.random()

            if (caster:getLocalVar("AuditMagic") == 1) then
                caster:PrintToPlayer(string.format("HALF TRIGGERED  NEW RANDOM: [%1.2f]", resvar),tpz.msg.channel.SYSTEM_3)
            end

            if (resvar < quart) then
                resist = 0.25
                resvar = math.random()

                if (caster:getLocalVar("AuditMagic") == 1) then
                    caster:PrintToPlayer(string.format("QUARTER TRIGGERED  NEW RANDOM: [%1.2f]", resvar),tpz.msg.channel.SYSTEM_3)
                end

                if (resvar < eighth) then
                    resist = 0.125
                    resvar = math.random()

                    if (caster:getLocalVar("AuditMagic") == 1) then
                        caster:PrintToPlayer(string.format("EIGHTH TRIGGERED  NEW RANDOM: [%1.2f]", resvar),tpz.msg.channel.SYSTEM_3)
                    end

                    if (resvar < sixteenth) then
                        resist = 0.0625

                        if (caster:getLocalVar("AuditMagic") == 1) then
                            caster:PrintToPlayer(string.format("SIXTEENTH TRIGGERED"),tpz.msg.channel.SYSTEM_3)
                        end
                    end
                end
            end
        end
    end

    return resist
end

-- Returns the amount of resistance the
-- target has to the given effect (stun, sleep, etc..)
function getEffectResistance(target, effect)
    -- if target:getLocalVar("AuditMagic") == 1 then
        -- printf("magic.lua getEffectResistance EFFECT: [%s]", effect)
    -- end

    local modRes      = 0
    local modImmunity = 0

    switch (effect): caseof
    {
        [tpz.effect.KO] = function ()
            modRes      = tpz.mod.DEATHRES
            modImmunity = tpz.mod.IMMUNITY_DEATH
        end,
        [tpz.effect.DOOM] = function ()
            modRes      = tpz.mod.DEATHRES
            modImmunity = tpz.mod.IMMUNITY_DEATH
        end,
        [tpz.effect.WEIGHT] = function ()
            modRes      = tpz.mod.GRAVITYRES
            modImmunity = tpz.mod.IMMUNITY_GRAVITY
        end,
        [tpz.effect.GEO_WEIGHT] = function ()
            modRes      = tpz.mod.GRAVITYRES
            modImmunity = tpz.mod.IMMUNITY_GRAVITY
        end,
        [tpz.effect.SLEEP_I] = function ()
            modRes      = tpz.mod.SLEEPRES
            modImmunity = tpz.mod.IMMUNITY_SLEEP
        end,
        [tpz.effect.SLEEP_II] = function ()
            modRes      = tpz.mod.SLEEPRES
            modImmunity = tpz.mod.IMMUNITY_SLEEP
        end,
        [tpz.effect.LULLABY] = function ()
            modRes      = tpz.mod.LULLABYRES
            modImmunity = tpz.mod.IMMUNITY_LULLABY
        end,
        [tpz.effect.POISON] = function ()
            modRes      = tpz.mod.POISONRES
            modImmunity = tpz.mod.IMMUNITY_POISON
        end,
        [tpz.effect.PARALYSIS] = function ()
            modRes      = tpz.mod.PARALYZERES
            modImmunity = tpz.mod.IMMUNITY_PARALYZE
        end,
        [tpz.effect.BLINDNESS] = function ()
            modRes      = tpz.mod.BLINDRES
            modImmunity = tpz.mod.IMMUNITY_BLIND
        end,
        [tpz.effect.SILENCE] = function ()
            modRes      = tpz.mod.SILENCERES
            modImmunity = tpz.mod.IMMUNITY_SILENCE
        end,
        [tpz.effect.PLAGUE] = function ()
            modRes      = tpz.mod.VIRUSRES
            modImmunity = tpz.mod.IMMUNITY_VIRUS
        end,
        [tpz.effect.DISEASE] = function ()
            modRes      = tpz.mod.VIRUSRES
            modImmunity = tpz.mod.IMMUNITY_VIRUS
        end,
        [tpz.effect.PETRIFICATION] = function ()
            modRes      = tpz.mod.PETRIFYRES
            modImmunity = tpz.mod.IMMUNITY_PETRIFY
        end,
        [tpz.effect.BIND] = function ()
            modRes      = tpz.mod.BINDRES
            modImmunity = tpz.mod.IMMUNITY_BIND
        end,
        [tpz.effect.CURSE_I] = function ()
            modRes      = tpz.mod.CURSERES
            modImmunity = tpz.mod.IMMUNITY_CURSE
        end,
        [tpz.effect.CURSE_II] = function ()
            modRes      = tpz.mod.CURSERES
            modImmunity = tpz.mod.IMMUNITY_CURSE
        end,
        [tpz.effect.BANE] = function ()
            modRes      = tpz.mod.CURSERES
            modImmunity = tpz.mod.IMMUNITY_CURSE
        end,
        [tpz.effect.SLOW] = function ()
            modRes      = tpz.mod.SLOWRES
            modImmunity = tpz.mod.IMMUNITY_SLOW
        end,
        [tpz.effect.ELEGY] = function ()
            modRes      = tpz.mod.SLOWRES
            modImmunity = tpz.mod.IMMUNITY_SLOW
        end,
        [tpz.effect.STUN] = function ()
            modRes      = tpz.mod.STUNRES
            modImmunity = tpz.mod.IMMUNITY_STUN
        end,
        [tpz.effect.CHARM_I] = function ()
            modRes      = tpz.mod.CHARMRES
            modImmunity = tpz.mod.IMMUNITY_CHARM
        end,
        [tpz.effect.CHARM_II] = function ()
            modRes      = tpz.mod.CHARMRES
            modImmunity = tpz.mod.IMMUNITY_CHARM
        end,
        [tpz.effect.AMNESIA] = function ()
            modRes      = tpz.mod.AMNESIARES
            modImmunity = tpz.mod.IMMUNITY_AMNESIA
        end,
        [tpz.effect.TERROR] = function ()
            modRes      = tpz.mod.TERRORRES
            modImmunity = tpz.mod.IMMUNITY_TERROR
        end,
    }

    local statusResist   = target:getMod(modRes)
    local statusImmunity = target:getMod(modImmunity)
    local statusAllRes   = target:getMod(tpz.mod.ALLSTATUSRES)

    if modRes ~= 0 then
        -- if target:getLocalVar("AuditMagic") == 1 then
            -- printf("magic.lua getEffectResistance RESIST: [%i]  IMMUNITY: [%i]", modRes, modImmunity)
            -- printf("magic.lua getEffectResistance EFFECT RESISTANCE: [%i]  STATUS RES: [%i]  IMMUNITY: [%i]", statusResist, statusAllRes, statusImmunity)
        -- end

        return statusResist + statusAllRes + statusImmunity
    end

    return 0
end

-- Returns the bonus magic accuracy for any spell
function getSpellBonusAcc(caster, target, spell, params)
    local magicAccBonus = 0
    local castersWeather = caster:getWeather()
    local skill = spell:getSkillType()
    local spellGroup = spell:getSpellGroup()
    local element = spell:getElement()
    local geoMACC = 0.0

    if caster:hasStatusEffect(tpz.effect.ALTRUISM) and spellGroup == tpz.magic.spellGroup.WHITE then
        magicAccBonus = magicAccBonus + caster:getStatusEffect(tpz.effect.ALTRUISM):getPower()
    end

    if caster:hasStatusEffect(tpz.effect.FOCALIZATION) and spellGroup == tpz.magic.spellGroup.BLACK then
        magicAccBonus = magicAccBonus + caster:getStatusEffect(tpz.effect.FOCALIZATION):getPower()
    end

    local skillchainTier, skillchainCount = FormMagicBurst(element, target)

    --add acc for skillchains
    if (skillchainTier > 0) then
        magicAccBonus = magicAccBonus + 25 + caster:getMod(tpz.mod.MAGIC_BURST_ACC)
    end

    -- Add acc for Grimoire: Magic Accuracy mod
    if (caster:getMod(tpz.mod.GRIMOIRE_MACC) > 0 and spellGroup == tpz.magic.spellGroup.WHITE and caster:hasStatusEffect(tpz.effect.EFFECT_LIGHT_ARTS)) then
        magicAccBonus = magicAccBonus + caster:getMod(tpz.mod.GRIMOIRE_MACC)
    end

    if (caster:getMod(tpz.mod.GRIMOIRE_MACC) > 0 and spellGroup == tpz.magic.spellGroup.BLACK and caster:hasStatusEffect(tpz.effect.EFFECT_DARK_ARTS)) then
        magicAccBonus = magicAccBonus + caster:getMod(tpz.mod.GRIMOIRE_MACC)
    end

    --Add acc for klimaform
    if element > 0 then
        if caster:hasStatusEffect(tpz.effect.KLIMAFORM) and (castersWeather == tpz.magic.singleWeatherStrong[element] or castersWeather == tpz.magic.doubleWeatherStrong[element]) then
            magicAccBonus = magicAccBonus + 15
        end
    end

    --add for blm elemental magic merits
    if skill == tpz.skill.ELEMENTAL_MAGIC then
        magicAccBonus = magicAccBonus + caster:getMerit(tpz.merit.ELEMENTAL_MAGIC_ACCURACY)
    end

    --Add acc for dark seal
    if (skill == tpz.skill.DARK_MAGIC and caster:hasStatusEffect(tpz.effect.DARK_SEAL)) then
        magicAccBonus = magicAccBonus + 256
    end

    --add acc for RDM group 1 merits
    if (element >= tpz.magic.element.FIRE and element <= tpz.magic.element.WATER) then
        magicAccBonus = magicAccBonus + caster:getMerit(rdmMerit[element])
    end

    -- BLU mag acc merits - nuke acc is handled in bluemagic.lua
    if (skill == tpz.skill.BLUE_MAGIC) then
        magicAccBonus = magicAccBonus + caster:getMerit(tpz.merit.MAGICAL_ACCURACY)
    end

    -- GEO Cardinal Chant bonus
    if caster:getMainJob() == tpz.job.GEO and spellGroup == tpz.magic.spellGroup.BLACK then
        if caster:isSpellAoE(spellId) then
            geoBonus = getCardinalStats(caster, target, 1, spell)
        else
            geoBonus = getCardinalStats(caster, target, 0, spell)
        end

        geoMACC = geoBonus[2]
        magicAccBonus = magicAccBonus + geoMACC
--      printf("magic.lua getSpellBonusAcc GEO MACC Bonus: [%i]", geoMACC)
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
    local enmityDmgMitigation = 0

    -- Handles -% Damage Taken from the "Mitigates damage taken based on enmity" item stat
    if
        caster:getObjType() == tpz.objType.MOB and
        target:getObjType() == tpz.objType.PC and
        target:getMod(tpz.mod.ENMITY_MITIGATES_DMG) > 0
    then
        local currentEnmity = caster:getCE(target) + caster:getVE(target)
        enmityDmgMitigation = currentEnmity / 5000

        if (enmityDmgMitigation < 2) then
            enmityDmgMitigation = 2
        elseif (enmityDmgMitigation > 10) then
            enmityDmgMitigation = 10
        end

        target:addMod(tpz.mod.ENMITY_MITIGATES_DMG_DT, -enmityDmgMitigation)
    end

    -- handle multiple targets
    if caster:isSpellAoE(spell:getID()) then
        local total = spell:getTotalTargets()

        -- printf("magic.lua finalMagicAdjustments MULTI TARGET REDUCTION  TARGETS: [%i]  DAMAGE: [%i]", total, dmg)

        if total > 9 then
            -- ga spells on 10+ targets = 0.4
            dmg = dmg * 0.4
        elseif total > 1 then
            -- -ga spells on 2 to 9 targets = 0.9 - 0.05T where T = number of targets
            dmg = dmg * (0.9 - 0.05 * total)
        end

        -- printf("magic.lua finalMagicAdjustments MULTI TARGET REDUCTION  DAMAGE: [%i]", dmg)

        -- kill shadows
        -- target:delStatusEffect(tpz.effect.COPY_IMAGE)
        -- target:delStatusEffect(tpz.effect.BLINK)
    else
        -- this logic will eventually be moved here
        -- dmg = utils.takeShadows(target, dmg, 1)

        -- if (dmg == 0) then
            -- spell:setMsg(tpz.msg.basic.SHADOW_ABSORB)
            -- return 1
        -- end
    end

    -- Tier 1 (1-13) - Fire, Blizzard, Aero, Stone, Thunder, Water, Firaga, Blizzaga, Aeroga, Stonega, Thundaga, Waterga
    local spellTier = {144, 149, 154, 159, 164, 169, 174, 179, 184, 189, 189, 194, 199,
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

    local multiplier = 1
    local skill = spell:getSkillType()

    if skill == tpz.skill.ELEMENTAL_MAGIC then
        -- dmg = dmg * ELEMENTAL_POWER
        if
            caster:getObjType() == tpz.objType.PC and
                (caster:getMainJob() == tpz.job.BLM or caster:getMainJob() == tpz.job.DRK or
                 caster:getMainJob() == tpz.job.GEO or caster:getMainJob() == tpz.job.RDM or
                 caster:getMainJob() == tpz.job.SCH)
        then
            local casterLvl = caster:getMainLvl() + caster:getItemLevel()

            if casterLvl < 100 then
                multiplier = utils.clamp(1 + (casterLvl / 99), 1.25, 1.85)
            elseif casterLvl >= 100 then
                for i = 1, #spellTier do
                    -- Tier 1
                    if (i > 0 and i <= 13 and spell:getID() == spellTier[i]) then
                        -- printf("magic.lua finalMagicAdjustments TIER 1 ELEMENTAL MAGIC")
                        multiplier = 1.45
                    -- Tier 2
                    elseif (i > 13 and i <= 32 and spell:getID() == spellTier[i]) then
                        -- printf("magic.lua finalMagicAdjustments TIER 2 ELEMENTAL MAGIC")
                        multiplier = 1.40
                    -- Tier 3
                    elseif (i > 32 and i <= 45 and spell:getID() == spellTier[i]) then
                        -- printf("magic.lua finalMagicAdjustments TIER 3 ELEMENTAL MAGIC")
                        multiplier = 2.00-- 2.75
                    -- Tier 4
                    elseif (i > 45 and i <= 63 and spell:getID() == spellTier[i]) then
                        -- printf("magic.lua finalMagicAdjustments TIER 4 ELEMENTAL MAGIC")
                        multiplier = 3.95
                    -- Tier 5
                    elseif (i > 63 and i <= 69 and spell:getID() == spellTier[i]) then
                        -- printf("magic.lua finalMagicAdjustments TIER 5 ELEMENTAL MAGIC")
                        multiplier = 4.90
                    -- Ancient Magic
                    elseif (i > 69 and i <= 81 and spell:getID() == spellTier[i]) then
                        -- printf("magic.lua finalMagicAdjustments ANCIENT ELEMENTAL MAGIC")
                        multiplier = 5.95
                    -- Non-elemental
                    elseif (i > 81 and i <= 84 and spell:getID() == spellTier[i]) then
                        -- printf("magic.lua finalMagicAdjustments NON-ELEMENTAL MAGIC")
                        multiplier = 6.50
                    -- Helixes
                    elseif (i > 84 and i <= 92 and spell:getID() == spellTier[i]) then
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

        dmg = dmg * multiplier
    elseif skill == tpz.skill.DARK_MAGIC then
        if
            caster:getObjType() == tpz.objType.PC and
            caster:getMainJob() == tpz.job.SCH
        then
            local casterLvl = caster:getMainLvl() + caster:getItemLevel()

            if spell:getID() == 502 then
                if casterLvl < 100 then
                    dmg = dmg * 2
                elseif casterLvl > 100 then
                    dmg = dmg * 8
                end
            end
        else
            dmg = dmg * DARK_POWER
        end
    elseif skill == tpz.skill.NINJUTSU then
        dmg = dmg * NINJUTSU_POWER
    elseif
        skill == tpz.skill.DIVINE_MAGIC and
        caster:getObjType() == tpz.objType.PC
    then
        dmg = dmg * DIVINE_POWER
    end

    dmg = target:magicDmgTaken(dmg, spell:getElement())

    -- Reverse the -% Damage Taken from the "Mitigates damage taken based on enmity" item stat
    if enmityDmgMitigation > 0 then
        target:delMod(tpz.mod.ENMITY_MITIGATES_DMG_DT, -enmityDmgMitigation)
    end

    -- Handle Phalanx
    if dmg > 0 then
        dmg = dmg - target:getMod(tpz.mod.PHALANX)
        dmg = utils.clamp(dmg, 0, 99999)
    end

    -- Handle Stoneskin
    dmg = utils.stoneskin(target, dmg)
    dmg = utils.magicshield(target, dmg)
    dmg = utils.clamp(dmg, -99999, 99999)

    if dmg < 0 then
        target:addHP(-dmg)
        spell:setMsg(tpz.msg.basic.MAGIC_RECOVERS_HP)

        return -dmg
    else
        target:takeSpellDamage(caster, spell, dmg, tpz.attackType.MAGICAL, tpz.damageType.ELEMENTAL + spell:getElement())
        target:handleAfflatusMiseryDamage(dmg)
        target:updateEnmityFromDamage(caster, dmg)

        -- Only add TP if the target is a mob
        if target:getObjType() ~= tpz.objType.PC then
            target:addTP(100)
        end
    end

    return dmg
 end

function finalMagicNonSpellAdjustments(caster, target, ele, dmg)
    --Handles target's HP adjustment and returns SIGNED dmg (negative values on absorb)
    local enmityDmgMitigation = 0

    -- Handles -% Damage Taken from the "Mitigates damage taken based on enmity" item stat
    if (caster:getObjType() == tpz.objType.MOB and target:getObjType() == tpz.objType.PC and target:getMod(tpz.mod.ENMITY_MITIGATES_DMG) > 0) then
        local currentEnmity = caster:getCE(target) + caster:getVE(target)
        enmityDmgMitigation = currentEnmity / 5000

        if (enmityDmgMitigation < 2) then
            enmityDmgMitigation = 2
        elseif (enmityDmgMitigation > 10) then
            enmityDmgMitigation = 10
        end

        target:addMod(tpz.mod.ENMITY_MITIGATES_DMG_DT, -enmityDmgMitigation)
    end

    dmg = target:magicDmgTaken(dmg)

    -- Reverse the -% Damage Taken from the "Mitigates damage taken based on enmity" item stat
    if (enmityDmgMitigation > 0) then
        target:delMod(tpz.mod.ENMITY_MITIGATES_DMG_DT, -enmityDmgMitigation)
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

    if (nullRandom < target:getMod(nullMod[ele])) then
--      printf("magic.lua adjustForTarget NULL RANDOM: [%i]", nullRandom)
        return 0
    end
    --Moved non element specific absorb and null mod checks to core
    --TODO: update all lua calls to magicDmgTaken with appropriate element and remove this function
    return dmg
end

function calculateMagicBurst(caster, spell, target, params)

    local burst = 1.0
    local skillchainburst = 1.0
    local modburst = 1.0
    local modburstII = 1.0
    local modSengikori = 1.0
    local SengikoriBonus = target:getMod(tpz.mod.SENGIKORI_BONUS) / 100
--  print(SengikoriBonus)
    local geoBonus = {0.00, 0.00, 0.00, 0.00}
    local geoMagicBurstBonus = 0.0
    local spellGroup = spell:getSpellGroup()
    local spellId = spell:getID()

    if (caster:getMainJob() == tpz.job.GEO) and (spellGroup == tpz.magic.spellGroup.BLACK) then
        if caster:isSpellAoE(spellId) then
            geoBonus = getCardinalStats(caster, target, 1, spell)
        else
            geoBonus = getCardinalStats(caster, target, 0, spell)
        end
        geoMagicBurstBonus = geoBonus[3]
--      printf("magic.lua calculateMagicBurst GEO MAGIC BURST Bonus: [%i]", geoMagicBurstBonus)
    end

    if (spell:getSpellGroup() == 3 and not(caster:hasStatusEffect(tpz.effect.BURST_AFFINITY) or caster:hasStatusEffect(tpz.effect.AZURE_LORE))) then
        return burst
    end

    -- Obtain multipliers from gear, atma and job traits
    modburst = modburst + (caster:getMod(tpz.mod.MAG_BURST_BONUS) / 100) + params.AMIIburstBonus + geoMagicBurstBonus
    modburstII = modburstII + (caster:getMod(tpz.mod.MAG_BURST_BONUS_II) / 100) -- Magic Burst II Modifier

    if target:hasStatusEffect(tpz.effect.SENGIKORI) then
        modSengikori = modSengikori + SengikoriBonus
--      print(modSengikori)
    end

    if caster:isBehind(target) and caster:hasStatusEffect(tpz.effect.INNIN) then
        modburst = modburst + (caster:getMerit(tpz.merit.INNIN_EFFECT)/100)
    end

    -- Cap bonuses from first multiplier at 40% or 1.4
    -- Job Trait Magic Attack Bonus is additive and ignores the normal MAB cap of 40%
    if (modburst > 1.4) then
        modburst = 1.4 + (caster:getMod(tpz.mod.TRAIT_MAG_BURST_BONUS) / 100)
    end

    -- Cap bonuses from second multiplier at 40% or 1.4
    if (modburstII > 1.4) then
        modburstII = 1.4
    end

    -- Cap bonuses from third multipler at 40% or 1.4
    if (modSengikori > 1.4) then
        modSengikori = 1.4
    end

    -- Obtain fourth multiplier from skillchain
    -- Starts at 35% damage bonus, increases by 10% for every additional weaponskill in the chain
    local skillchainTier, skillchainCount = FormMagicBurst(spell:getElement(), target)

    if (skillchainTier > 0) then
        if (skillchainCount == 1) then -- two weaponskills
            skillchainburst = 1.35
        elseif (skillchainCount == 2) then -- three weaponskills
            skillchainburst = 1.45
        elseif (skillchainCount == 3) then -- four weaponskills
             skillchainburst = 1.55
        elseif (skillchainCount == 4) then -- five weaponskills
            skillchainburst = 1.65
        elseif (skillchainCount == 5) then -- six weaponskills
            skillchainburst = 1.75
        else
            -- Something strange is going on if this occurs.
            skillchainburst = 1.0
        end
    end

    -- Multiply
    if (skillchainburst > 1) then
        burst = burst * modburst * skillchainburst * modburstII * modSengikori
    end

    return burst
end

function calculateLungeMagicBurst(caster, target, params)

    local burst = 1.0
    local skillchainburst = 1.0
    local modburst = 1.0
    local modburstII = 1.0
    local modSengikori = 1.0
    local SengikoriBonus = target:getMod(tpz.mod.SENGIKORI_BONUS) / 100
--  print(SengikoriBonus)

    -- Obtain multipliers from gear, atma and job traits
    modburst = modburst + (caster:getMod(tpz.mod.MAG_BURST_BONUS) / 100)
    modburstII = modburstII + (caster:getMod(tpz.mod.MAG_BURST_BONUS_II) / 100) -- Magic Burst II Modifier

    if target:hasStatusEffect(tpz.effect.SENGIKORI) then
        modSengikori = modSengikori + SengikoriBonus
--      print(modSengikori)
--      target:delMod(tpz.mod.SENGIKORI_BONUS, SengikoriBonus)
        target:delStatusEffect(tpz.effect.SENGIKORI)
    end

    -- Cap bonuses from first multiplier at 40% or 1.4
    if (modburst > 1.4) then
        modburst = 1.4
    end

    -- Cap bonuses from second multiplier at 40% or 1.4
    if (modburstII > 1.4) then
        modburstII = 1.4
    end

    -- Cap bonuses from third multipler at 40% or 1.4
    if (modSengikori > 1.4) then
        modSengikori = 1.4
    end

    -- Obtain fourth multiplier from skillchain
    -- Starts at 35% damage bonus, increases by 10% for every additional weaponskill in the chain
    local skillchainTier, skillchainCount = FormMagicBurst(params.element, target)

    if (skillchainTier > 0) then
        if (skillchainCount == 1) then -- two weaponskills
            skillchainburst = 1.35
        elseif (skillchainCount == 2) then -- three weaponskills
            skillchainburst = 1.45
        elseif (skillchainCount == 3) then -- four weaponskills
             skillchainburst = 1.55
        elseif (skillchainCount == 4) then -- five weaponskills
            skillchainburst = 1.65
        elseif (skillchainCount == 5) then -- six weaponskills
            skillchainburst = 1.75
        else
            -- Something strange is going on if this occurs.
            skillchainburst = 1.0
        end
    end

    -- Multiply
    if (skillchainburst > 1) then
        burst = burst * modburst * skillchainburst * modburstII * modSengikori
    end

    return burst
end

function addBonuses(caster, spell, target, dmg, params)
    params = params or {}

--  Fire (1), Stone (2), Water (3), Aero (4), Blizzard (5), Thunder (6), Light (7), Dark (8)
    local ele = spell:getElement()

    local affinityBonus = AffinityBonusDmg(caster, ele)
    dmg = math.floor(dmg * affinityBonus)

    params.bonusmab = params.bonusmab or 0
    params.AMIIburstBonus = params.AMIIburstBonus or 0
--  printf("magic.lua addBonuses BONUS MAB 1: [%i]", params.bonusmab)
    params.bonusmab = params.bonusmab + caster:getMod(spellMAB[ele])
--  printf("magic.lua addBonuses ELEMENT: [%i]  BONUS MAB 2: [%i]", ele, params.bonusmab)

    local magicDefense = getElementalDamageReduction(target, ele)
    dmg = math.floor(dmg * magicDefense)

    local dayWeatherBonus = 1.00
    local weather = caster:getWeather()

    if (weather == tpz.magic.singleWeatherStrong[ele]) then
        if (caster:getMod(tpz.mod.IRIDESCENCE) >= 1) then
            if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1 or isHelixSpell(spell)) then
                dayWeatherBonus = dayWeatherBonus + 0.10
            end
        end
        if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1 or isHelixSpell(spell)) then
            dayWeatherBonus = dayWeatherBonus + 0.10
        end
    elseif (caster:getWeather() == tpz.magic.singleWeatherWeak[ele]) then
        if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1 or isHelixSpell(spell)) then
            dayWeatherBonus = dayWeatherBonus - 0.10
        end
    elseif (weather == tpz.magic.doubleWeatherStrong[ele]) then
        if (caster:getMod(tpz.mod.IRIDESCENCE) >= 1) then
            if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1 or isHelixSpell(spell)) then
                dayWeatherBonus = dayWeatherBonus + 0.10
            end
        end
        if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1 or isHelixSpell(spell)) then
            dayWeatherBonus = dayWeatherBonus + 0.25
        end
    elseif (weather == tpz.magic.doubleWeatherWeak[ele]) then
        if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1 or isHelixSpell(spell)) then
            dayWeatherBonus = dayWeatherBonus - 0.25
        end
    end

    local dayElement = VanadielDayElement()
    if (dayElement == ele) then
        if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1 or isHelixSpell(spell)) then
            dayWeatherBonus = dayWeatherBonus + 0.10
        end
    elseif (dayElement == tpz.magic.elementDescendant[ele]) then
        if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1 or isHelixSpell(spell)) then
            dayWeatherBonus = dayWeatherBonus - 0.10
        end
    end

    if (dayElement == ele or weather == tpz.magic.singleWeatherStrong[ele] or weather == tpz.magic.doubleWeatherStrong[ele]) then
        dayWeatherBonus = dayWeatherBonus + caster:getMod(tpz.mod.DAY_NUKE_BONUS)/100 -- sorc. tonban(+1)/zodiac ring
    end

    -- printf("magic.lua addBonuses SPELL ELEMENT: [%s]  DAY ELEMENT: [%s]  WEATHER: [%s]", ele, dayElement, weather)
    -- printf("magic.lua addBonuses DAY/WEATHER BONUS TOTAL: [%f]", dayWeatherBonus)

    if (caster:hasStatusEffect(tpz.effect.KLIMAFORM) and caster:getMod(tpz.mod.ENH_KLIMAFORM) > 0 and (weather == tpz.magic.singleWeatherStrong[ele] or weather == tpz.magic.doubleWeatherStrong[ele])) then
--      printf("magic.lua addBonuses KLIMAFORM WEATHER BEFORE BONUS: [%i]", dayWeatherBonus)
        dayWeatherBonus = dayWeatherBonus + (caster:getMod(tpz.mod.ENH_KLIMAFORM) / 100)
--      printf("magic.lua addBonuses KLIMAFORM WEATHER AFTER BONUS: [%i]", dayWeatherBonus)
    end

    if dayWeatherBonus > 1.4 then
        dayWeatherBonus = 1.4
    end

    dmg = math.floor(dmg * dayWeatherBonus)

    local burst = calculateMagicBurst(caster, spell, target, params)

    if burst > 1.0 then
        spell:setMsg(spell:getMagicBurstMessage()) -- "Magic Burst!"
    end

    dmg = math.floor(dmg * burst)
    local mabbonus = 0
    local geoBonus = {0.00,0.00,0.00,0.00} -- {MATT, MACC, MAG_BURST_BONUS, MAGIC_CRITHITRATE}
    local geoMATT = 0.0
    local geoMCHR = 0.0
    local nvbonus = 1 + (caster:getMod(tpz.mod.NETHER_VOID_BONUS) / 100)
    local spellId = spell:getID()
    local spellGroup = spell:getSpellGroup()

    if (spellId >= 245 and spellId <= 248) then -- Drain/Aspir (II)
        mabbonus = 1 + caster:getMod(tpz.mod.ENH_DRAIN_ASPIR) / 100
        if caster:hasStatusEffect(tpz.effect.NETHER_VOID) then
            dmg = math.floor(dmg * nvbonus)
        end
        if spellId == 247 or spellId == 248 then
            mabbonus = mabbonus + caster:getMerit(tpz.merit.ASPIR_ABSORPTION_AMOUNT) / 100
        end
    else
        local mab = caster:getMod(tpz.mod.MATT) + params.bonusmab

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

        mab = mab + geoMATT

        if spell:getSkillType() == tpz.skill.NINJUTSU then
            mab = mab + caster:getMerit(tpz.merit.NIN_MAGIC_BONUS)
        end

        local mab_crit = caster:getMod(tpz.mod.MAGIC_CRITHITRATE) + geoMCHR

        if ( math.random(1, 100) < mab_crit ) then
           mab = mab + utils.clamp(10 + caster:getMod(tpz.mod.MAGIC_CRIT_DMG_INCREASE), 0, 40)
        end

        local mdefBarBonus = 0

        if (ele >= tpz.magic.element.FIRE and ele <= tpz.magic.element.WATER) then
            mab = mab + caster:getMerit(blmMerit[ele])
            if (target:hasStatusEffect(tpz.magic.barSpell[ele])) then -- bar- spell magic defense bonus
                mdefBarBonus = target:getStatusEffect(tpz.magic.barSpell[ele]):getSubPower()
            end
        end

        mabbonus = (100 + mab) / (100 + target:getMod(tpz.mod.MDEF) + mdefBarBonus)
    end

    if (mabbonus < 0) then
        mabbonus = 0
    end

    dmg = math.floor(dmg * mabbonus)

    if (caster:hasStatusEffect(tpz.effect.EBULLIENCE)) then
        dmg = dmg * (1.2 + caster:getMod(tpz.mod.EBULLIENCE_AMOUNT)/100)
        caster:delStatusEffectSilent(tpz.effect.EBULLIENCE)
    end

    -- Spell is a Banish and target's is Undead
    if
        spellId >= 28 and
        spellId <= 32 and
        target:isUndead() == true
    then
        dmg = dmg * (1 + (caster:getMod(tpz.mod.POT_BANISH_UNDEAD) / 100))
    end

    dmg = math.floor(dmg)

    -- print(affinityBonus)
    -- print(speciesReduction)
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

    local affinityBonus = AffinityBonusDmg(caster, ele)
    dmg = math.floor(dmg * affinityBonus)

    -- if (caster:getName() == "Khalum") then
        -- printf("magic.lua addBonusesAbility POST-AFFINITY BONUS DAMAGE: [%i]", dmg)
    -- end

    local magicDefense = getElementalDamageReduction(target, ele)
    dmg = math.floor(dmg * magicDefense)

    -- if (caster:getName() == "Khalum") then
        -- printf("magic.lua addBonusesAbility POST-ELEMENTAL REDUCTION DAMAGE: [%i]", dmg)
    -- end

    local dayWeatherBonus = 1.00
    local weather = caster:getWeather()

    if (weather == tpz.magic.singleWeatherStrong[ele]) then
        if (caster:getMod(tpz.mod.IRIDESCENCE) >= 1) then
            if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1) then
                dayWeatherBonus = dayWeatherBonus + 0.10
            end
        end
        if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1) then
            dayWeatherBonus = dayWeatherBonus + 0.10
        end
    elseif (caster:getWeather() == tpz.magic.singleWeatherWeak[ele]) then
        if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1) then
            dayWeatherBonus = dayWeatherBonus - 0.10
        end
    elseif (weather == tpz.magic.doubleWeatherStrong[ele]) then
        if (caster:getMod(tpz.mod.IRIDESCENCE) >= 1) then
            if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1) then
                dayWeatherBonus = dayWeatherBonus + 0.10
            end
        end
        if (math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1) then
            dayWeatherBonus = dayWeatherBonus + 0.25
        end
    elseif (weather == tpz.magic.doubleWeatherWeak[ele]) then
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

    if (dayElement == ele or weather == tpz.magic.singleWeatherStrong[ele] or weather == tpz.magic.doubleWeatherStrong[ele]) then
        dayWeatherBonus = dayWeatherBonus + caster:getMod(tpz.mod.DAY_NUKE_BONUS)/100 -- sorc. tonban(+1)/zodiac ring
    end

    if dayWeatherBonus > 1.4 then
        dayWeatherBonus = 1.4
    end

    dmg = math.floor(dmg * dayWeatherBonus)

    -- if (caster:getName() == "Khalum") then
        -- printf("magic.lua addBonusesAbility POST-DAY/WEATHER BONUS DAMAGE: [%i]", dmg)
    -- end

    if (params.canBurst == true) then
        local burst = calculateLungeMagicBurst(caster, target, params)

        if (burst > 1.0) then
            caster:setCharVar("SwipeLungeHasMB", 1)
        end

        dmg = math.floor(dmg * burst)
    end

    local mab = 1
    local mdefBarBonus = 0
    if
        ele >= tpz.magic.element.FIRE and
        ele <= tpz.magic.element.WATER and
        target:hasStatusEffect(tpz.magic.barSpell[ele])
    then -- bar- spell magic defense bonus
        mdefBarBonus = target:getStatusEffect(tpz.magic.barSpell[ele]):getSubPower()
    end

    local adjustMDEF = 1

    if (params.adjustMDEFCalc ~= adjustMDEF) then
        adjustMDEF = params.adjustMDEFCalc
    end

    if (adjustMDEF == nil or adjustMDEF == 0) then
        adjustMDEF = 1
        -- printf("magic.lua addBonusesAbility USER NAME: [%s]", caster:getName())
    end

    local mabBonus = params.mabBonus or 0

    if (params ~= nil and params.bonusmab ~= nil and params.includemab == true) then
        mab = (100 + caster:getMod(tpz.mod.MATT) + mabBonus) / ((100 + target:getMod(tpz.mod.MDEF) + mdefBarBonus))
    elseif (params == nil or (params ~= nil and params.includemab == true)) then
        mab = (100 + caster:getMod(tpz.mod.MATT) + mabBonus) / ((100 + target:getMod(tpz.mod.MDEF) + mdefBarBonus))
    end

    if (mab < 0) then
        mab = 0
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
function getElementalDamageReduction(target, element)
    local defense = 1
    if (element > 0) then
        defense = 1 - (target:getMod(tpz.magic.defenseMod[element]) / 256)

        return utils.clamp(defense, 0.0, 2.0)
    end

    return defense
end

---------------------------------------------
--  Elemental Debuff Potency functions
---------------------------------------------

function getElementalDebuffDOT(INT)
    local DOT = 0
    if (INT<= 39) then
        DOT = 1
    elseif (INT <= 69) then
        DOT = 2
    elseif (INT <= 99) then
        DOT = 3
    elseif (INT <= 149) then
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
    local duration = 30 --fallthrough

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
    --Dark Arts will further increase Helix duration, but testing is ongoing.

    local id = spell:getID()
    if id >= 278 and id <= 285 then
        return true
    end
    return false
end

function handleThrenody(caster, target, spell, basePower, baseDuration, modifier)
    -- Process resitances
    local staff = AffinityBonusAcc(caster, spell:getElement())
    -- print("staff=" .. staff)
    local dCHR = (caster:getStat(tpz.mod.CHR) - target:getStat(tpz.mod.CHR))
    -- print("dCHR=" .. dCHR)
    local params = {}
    params.attribute = tpz.mod.CHR
    params.skillType = tpz.skill.SINGING
    params.bonus = staff

    local resm = applyResistance(caster, target, spell, params)
    -- print("rsem=" .. resm)

    if (resm < 0.5) then
        -- print("resm resist")
        spell:setMsg(tpz.msg.basic.MAGIC_RESIST)
        return tpz.effect.THRENODY
    end

    -- Remove previous Threnody
    target:delStatusEffect(tpz.effect.THRENODY)

    local iBoost = caster:getMod(tpz.mod.THRENODY_EFFECT) + caster:getMod(tpz.mod.ALL_SONGS_EFFECT)
    local power = basePower + iBoost*5
    local duration = baseDuration * ((iBoost * 0.1) + (caster:getMod(tpz.mod.SONG_DURATION_BONUS)/100) + 1)

    if (caster:hasStatusEffect(tpz.effect.SOUL_VOICE)) then
        power = power * 2
    elseif (caster:hasStatusEffect(tpz.effect.MARCATO)) then
        power = power * 1.5
    end

    if (caster:hasStatusEffect(tpz.effect.TROUBADOUR)) then
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
    if (statusEffect == nil) then
        return true
    end

    -- overwrite if its weaker
    if (statusEffect:getPower()*mod > power) then
        return false
    end

    return true
end

function doElementalNuke(caster, spell, target, spellParams)
 -- printf("magic.lua doElementalNuke CASTER: [%s]  SPELL: [%i]  TARGET: [%s]", caster:getName(), spell:getID(), target:getName())
    local DMG = 0
    local dINT = caster:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT)
    local V = 0
    local M = 0

    if USE_OLD_MAGIC_DAMAGE and spellParams.V ~= nil and spellParams.M ~= nil then
        V = spellParams.V -- Base value
        M = spellParams.M -- Tier multiplier
        local I = spellParams.I -- Inflection point
        local cap = I * 2 + V -- Base damage soft cap

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
        local hasMultipleTargetReduction = spellParams.hasMultipleTargetReduction --still unused!!!
        local resistBonus = spellParams.resistBonus
        local mDMG = caster:getMod(tpz.mod.MAGIC_DAMAGE)

        --[[
                Calculate base damage:
                D = mDMG + V + (dINT × M)
                D is then floored
                For dINT reduce by amount factored into the V value (example: at 134 INT, when using V100 in the calculation, use dINT = 134-100 = 34)
        ]]

        if (dINT <= 49) then
            V = spellParams.V0
            M = spellParams.M0
            DMG = math.floor(DMG + mDMG + V + (dINT * M))

            if (DMG <= 0) then
                return 0
            end

            -- if (caster:getName() == "Testmage" or caster:getName() == "Khalum") then
                -- printf("magic.lua doElementalNuke  CASTER: [%s]  dINT <= 49  CASTER: [%s]  BASE DMG: [%i]  MAGIC DMG: [%i]  V: [%i]  dINT: [%i]  M: [%2.2f]", caster:getName(), DMG, mDMG, V, dINT, M)
            -- end

        elseif (dINT >= 50 and dINT <= 99) then
            V = spellParams.V50
            M = spellParams.M50
            DMG = math.floor(DMG + mDMG + V + ((dINT - 50) * M))

            -- if (caster:getName() == "Testmage" or caster:getName() == "Khalum") then
                -- printf("magic.lua doElementalNuke  dINT >= 50 & dINT <= 99  CASTER: [%s]  BASE DMG: [%i]  MAGIC DMG: [%i]  V: [%i]  dINT: [%i]  M: [%2.2f]", caster:getName(), DMG, mDMG, V, dINT, M)
            -- end
        elseif (dINT >= 100 and dINT <= 199) then
            V = spellParams.V100
            M = spellParams.M100
            DMG = math.floor(DMG + mDMG + V + ((dINT - 100) * M))

            -- if (caster:getName() == "Testmage" or caster:getName() == "Khalum") then
                -- printf("magic.lua doElementalNuke  dINT >= 100 & dINT <= 199  CASTER: [%s]  BASE DMG: [%i]  MAGIC DMG: [%i]  V: [%i]  dINT: [%i]  M: [%2.2f]", caster:getName(), DMG, mDMG, V, dINT, M)
            -- end
        elseif (dINT > 199) then
            V = spellParams.V200
            M = spellParams.M200
            DMG = math.floor(DMG + mDMG + V + ((dINT - 200) * M))

            -- if (caster:getName() == "Testmage" or caster:getName() == "Khalum") then
                -- printf("magic.lua doElementalNuke  dINT > 199  CASTER: [%s]  BASE DMG: [%i]  MAGIC DMG: [%i]  V: [%i]  dINT: [%i]  M: [%2.2f]", caster:getName(), DMG, mDMG, V, dINT, M)
            -- end
        end
    end

    --get resist multiplier (1x if no resist)
    local params = {}
    params.attribute = tpz.mod.INT
    params.skillType = tpz.skill.ELEMENTAL_MAGIC
    params.resistBonus = resistBonus

    local resist = applyResistance(caster, target, spell, params)
    -- printf("magic.lua doElementalNuke RESIST: [%1.2f]\n", resist)

    --get the resisted damage
    DMG = DMG * resist

    --add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
    DMG = addBonuses(caster, spell, target, DMG, spellParams)
    -- if (caster:getName() == "Testmage" or caster:getName() == "Khalum") then
        -- printf("magic.lua doElementalNuke > addBonuses  CASTER: [%s]  DMG: [%i]", caster:getName(), DMG)
    -- end

    --add in target adjustment
    local ele = spell:getElement()
--  printf("magic.lua doElementalNuke DMG BEFORE ABSORB: [%i]", DMG)
--  DMG = adjustForTarget(target, DMG, ele)
--  printf("magic.lua doElementalNuke DMG AFTER ABSORB: [%i]\n", DMG)

    --add in final adjustments
    DMG = finalMagicAdjustments(caster, target, spell, DMG)
    -- if (caster:getName() == "Testmage" or caster:getName() == "Khalum") then
        -- printf("magic.lua doElementalNuke > finalMagicAdjustments  CASTER: [%s]  DMG: [%i]", caster:getName(), DMG)
    -- end

    if DMG < 0 then
        spell:setMsg(tpz.msg.basic.MAGIC_RECOVERS_HP)
    end

    -- Checks for and applies Augments "Conserve MP" set bonus
    local conMPReduction = spell:getMPCost() -- caster:getCharVar("AugConserveMP")
    if (conMPReduction > 0 and math.random(1, 100) < caster:getMod(tpz.mod.AUGMENT_CONSERVE_MP)) then
--      printf("magic.lua doElementalNuke CONSERVE MP ADJUSTMENT: [%f]\n", 1 + ((conMPReduction * 2) / 100))
        DMG = DMG * (1 + ((conMPReduction * 2) / 100))
    end

    local canRestoreMP = false

    if (caster:isPC()) then
        local bodyEquip = caster:getEquipID(tpz.slot.BODY)

        if (bodyEquip == 27810 or bodyEquip == 27831 or bodyEquip == 23110 or bodyEquip == 23445) then
            canRestoreMP = true
        end
    end

    if (caster:getMod(tpz.mod.CONVERT_ELEM_DMG_MP) > 0 or canRestoreMP == true) then
        local restoreMP = DMG * 0.02 -- (caster:getMod(tpz.mod.CONVERT_ELEM_DMG_MP) / 100)
        local restoreCap = spell:getMPCost() / 4

        if (restoreMP > restoreCap) then
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
    if (caster:hasStatusEffect(tpz.effect.INNIN) and caster:isBehind(target, 23)) then -- Innin mag atk bonus from behind, guesstimating angle at 23 degrees
        mabBonus = mabBonus + caster:getStatusEffect(tpz.effect.INNIN):getPower()
    end
    params.skillType = tpz.skill.NINJUTSU
    params.attribute = tpz.mod.INT
    params.mabBonus = mabBonus

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
                caster:PrintToPlayer(string.format("NINJUTSU MODIFIED DAMAGE: [%i] = BASE DAMAGE: [%i] * SKILL BONUS: [%1.2f]", dmg, auditNinDmg, ninSkillBonus),tpz.msg.channel.SYSTEM_3)        
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
    if (targetLvl < spellLvl) then
        return duration * targetLvl / spellLvl
    end

    return duration
end

function calculateDuration(duration, caster, target, spell, useComposure)
    -- if (caster:getObjType() == tpz.objType.PC or caster:getObjType() == tpz.objType.TRUST) then
        -- printf("magic.lua calculateDuration SPELL ID: [%i]", spell:getID())
    -- end
    local spellGroup = spell:getSpellGroup()
    local magicSkill = spell:getSkillType()

    if (magicSkill == tpz.skill.ENHANCING_MAGIC) then -- Enhancing Magic
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
        if (caster ~= target and caster:getMod(tpz.mod.AUGMENT_COMPOSURE) > 0 and caster:hasStatusEffect(tpz.effect.COMPOSURE)) then
            duration = duration * (1 + (caster:getMod(tpz.mod.AUGMENT_COMPOSURE) / 100))
        end

        -- Perpetuance
        if caster:hasStatusEffect(tpz.effect.PERPETUANCE) and spellGroup == tpz.magic.spellGroup.WHITE then
            if (caster:getLocalVar("PERPETUANCE_TOGGLE") == 0) then
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
        if (caster:hasStatusEffect(tpz.effect.EMBOLDEN)) then
            duration = duration * 0.5
        end
    elseif (magicSkill == tpz.skill.ENFEEBLING_MAGIC) then -- Enfeebling Magic
        if caster:hasStatusEffect(tpz.effect.SABOTEUR) then
            if target:isNM() then
                duration = duration * 1.25
            else
                duration = duration * 2
            end
        end

        -- After Saboteur according to bg-wiki
        duration = duration + caster:getMerit(tpz.merit.ENFEEBLING_MAGIC_DURATION)
    elseif (magicSkill == tpz.skill.DARK_MAGIC) then -- Dark Magic
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

            if (targetLvl >= 0) then
                -- assume BLM spell, A+
                local magicAcc = utils.getSkillLvl(6, casterLvl)
                -- assume default monster magic eva, D
                local magicEvaRank = 3
                local rate = 0

                local magicEva = utils.getMobSkillLvl(magicEvaRank, targetLvl)

                local dINT = (lvlMod + 1) * -1

                if (dINT > 10) then
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

function getCardinalStats(caster, target, is_araSpell, spell)
    local targ = target
    local spellID = spell:getID()
    local cardinalQuadrant = caster:getCardinalQuadrant(targ)
    local modTier = caster:getMod(tpz.mod.CARDINAL_CHANT) or 0
    local MAG_BURST_BONUS = caster:getMod(tpz.mod.MAG_BURST_BONUS)
    local MAGIC_CRITHITRATE = caster:getMod(tpz.mod.MAGIC_CRITHITRATE)
    local enhCardinalChant = 1 + (caster:getMod(tpz.mod.ENH_CARDINAL_CHANT) / 100)
    local base = 0.0
    local burstbase = 0.0
    local cardinalStats = {0.00, 0.00, 0.00, 0.00}

    if is_araSpell == 1 then
        base = geoCardinalTierStat[modTier][1]
        burstbase = geoBurstBonus[modTier][1]
    else
        base = geoCardinalTierStat[modTier][2]
        burstbase = geoBurstBonus[modTier][2]
    end

    if (caster:hasStatusEffect(tpz.effect.COLLIMATED_FERVOR)) then
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
    if (caster:getObjType() == tpz.objType.PC or caster:getObjType() == tpz.objType.TRUST) then
        local enmityBonus = utils.clamp(caster:getMod(tpz.mod.ENMITY) + caster:getMerit(tpz.merit.ENMITY_INCREASE) + caster:getMerit(tpz.merit.ENMITY_DECREASE), 0, 200)
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

tpz.ma = tpz.magic
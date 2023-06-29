-----------------------------------------
-- Trust: Amchuchu
-----------------------------------------
require("scripts/globals/trust")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return tpz.trust.canCast(caster, spell)
end

function onSpellCast(caster, target, spell)
    return tpz.trust.spawn(caster, spell)
end

function onMobSpawn(mob)
    mob:addListener("ENGAGE", "AMCHUCHU_ENGAGE", function(chuEngage, target)
        local elemDay =
        {
            [tpz.day.FIRESDAY    ] = {tpz.jobAbility.UNDA,     tpz.magic.spell.BARFIRE    },
            [tpz.day.EARTHSDAY   ] = {tpz.jobAbility.FLABRA,   tpz.magic.spell.BARSTONE   },
            [tpz.day.WATERSDAY   ] = {tpz.jobAbility.SULPOR,   tpz.magic.spell.BARWATER   },
            [tpz.day.WINDSDAY    ] = {tpz.jobAbility.GELUS,    tpz.magic.spell.BARAERO    },
            [tpz.day.ICEDAY      ] = {tpz.jobAbility.IGNIS,    tpz.magic.spell.BARBLIZZARD},
            [tpz.day.LIGHTNINGDAY] = {tpz.jobAbility.TELLUS,   tpz.magic.spell.THUNDER    },
            [tpz.day.LIGHTSDAY   ] = {tpz.jobAbility.TENEBRAE, 0                          },
            [tpz.day.DARKSDAY    ] = {tpz.jobAbility.LUX,      0                          },
        }

        local day = VanadielDayOfTheWeek()

        for i = tpz.day.FIRESDAY, tpz.day.LIGHTSDAY do
            if day == i and chuEngage:getLocalVar("dBlock") == 0 then
                -- printf("amchuchu.lua AMCHUCHU_ENGAGE  DAY: [%i]  ELEM DAY 1: [%i]  ELEM DAY 2: [%i]", day, elemDay[i][1], elemDay[i][2])
                chuEngage:useJobAbility(elemDay[i][1], chuEngage)

                if elemDay[i][2] > 0 then
                    chuEngage:castSpell(elemDay[i][2], chuEngage)
                end

                chuEngage:setLocalVar("dBlock", 1)
                chuEngage:setLocalVar("STACK_DELAY", os.time() + 10)
            end
        end
    end)

    mob:addListener("TAKE_DAMAGE", "AMCHUCHU_TAKE_DAMAGE", function(amchuchu, damage, attacker, attackType, damageType)
        local runeSpell =
        {
            [tpz.damageType.FIRE     ] = {tpz.effect.UNDA,     tpz.jobAbility.UNDA,     tpz.magic.spell.BARFIRE    },
            [tpz.damageType.ICE      ] = {tpz.effect.IGNIS,    tpz.jobAbility.IGNIS,    tpz.magic.spell.BARBLIZZARD},
            [tpz.damageType.WIND     ] = {tpz.effect.GELUS,    tpz.jobAbility.GELUS,    tpz.magic.spell.BARAERO    },
            [tpz.damageType.EARTH    ] = {tpz.effect.FLABRA,   tpz.jobAbility.FLABRA,   tpz.magic.spell.BARSTONE   },
            [tpz.damageType.LIGHTNING] = {tpz.effect.TELLUS,   tpz.jobAbility.TELLUS,   tpz.magic.spell.THUNDER    },
            [tpz.damageType.WATER    ] = {tpz.effect.SULPOR,   tpz.jobAbility.SULPOR,   tpz.magic.spell.BARWATER   },
            [tpz.damageType.LIGHT    ] = {tpz.effect.TENEBRAE, tpz.jobAbility.TENEBRAE, 0                          },
            [tpz.damageType.DARK     ] = {tpz.effect.LUX,      tpz.jobAbility.LUX,      0                          },
        }

        local lastDmg = amchuchu:getLocalVar("LAST_DAMAGETYPE")

        if
            os.time() > amchuchu:getLocalVar("DAMAGE_DELAY") and
            lastDmg ~= damageType
        then
            local isBusy = false
            local act    = amchuchu:getCurrentAction()

            if
                act == tpz.act.WEAPONSKILL_START or
                act == tpz.act.WEAPONSKILL_FINISH or
                act == tpz.act.MOBABILITY_START or
                act == tpz.act.MOBABILITY_USING or
                act == tpz.act.MOBABILITY_FINISH or
                act == tpz.act.MAGIC_START or
                act == tpz.act.MAGIC_CASTING or
                act == tpz.act.MAGIC_FINISH
            then
                isBusy = true
            end

            if isBusy == false and amchuchu:actionQueueEmpty() == true then
                local mLvl     = amchuchu:getMainLvl()
                local numRunes = 1

                if mLvl >= 35 and mLvl < 65 then
                    numRunes = 2
                elseif mLvl >= 65 then
                    numRunes = 3
                end

                for i = tpz.damageType.FIRE, tpz.damageType.DARK do
                    if
                        damageType == i and
                        amchuchu:countEffect(runeSpell[i][1]) < numRunes
                    then
                        -- printf("amchuchu.lua AMCHUCHU_TAKE_DAMAGE  DMG TYPE: [%i]  RUNE: [%i]  SPELL: [%i]", damageType, runeSpell[i][1], runeSpell[i][2])
                        amchuchu:useJobAbility(runeSpell[i][2], amchuchu)
                    end

                    if
                        damageType == i and
                        amchuchu:countEffect(runeSpell[i][1]) == numRunes
                    then
                        amchuchu:castSpell(runeSpell[i][3], amchuchu)
                    end
                end
            end

            amchuchu:setLocalVar("DAMAGE_DELAY", os.time() + 20)
        end

        if damageType >= tpz.damageType.FIRE and damageType <= tpz.damageType.DARK then
            amchuchu:setLocalVar("LAST_DAMAGETYPE", damageType)
        end
    end)

    mob:addListener("COMBAT_TICK", "AMCHUCHU_CTICK", function(mobArg)
        local runeSpell =
        {
            [tpz.effect.IGNIS   ] = {tpz.jobAbility.IGNIS,    tpz.effect.BARBLIZZARD, tpz.magic.spell.BARBLIZZARD},
            [tpz.effect.GELUS   ] = {tpz.jobAbility.GELUS,    tpz.effect.BARAERO,     tpz.magic.spell.BARAERO    },
            [tpz.effect.FLABRA  ] = {tpz.jobAbility.FLABRA,   tpz.effect.BARSTONE,    tpz.magic.spell.BARSTONE   },
            [tpz.effect.TELLUS  ] = {tpz.jobAbility.TELLUS,   tpz.effect.BARTHUNDER,  tpz.magic.spell.BARTHUNDER },
            [tpz.effect.SULPOR  ] = {tpz.jobAbility.SULPOR,   tpz.effect.BARWATER,    tpz.magic.spell.BARWATER   },
            [tpz.effect.UNDA    ] = {tpz.jobAbility.UNDA,     tpz.effect.BARFIRE,     tpz.magic.spell.BARFIRE    },
            [tpz.effect.LUX     ] = {tpz.jobAbility.LUX,      0,                      0                          },
            [tpz.effect.TENEBRAE] = {tpz.jobAbility.TENEBRAE, 0,                      0                          },
        }

        local elemDay =
        {
            [tpz.day.FIRESDAY    ] = {tpz.jobAbility.UNDA    },
            [tpz.day.EARTHSDAY   ] = {tpz.jobAbility.FLABRA  },
            [tpz.day.WATERSDAY   ] = {tpz.jobAbility.SULPOR  },
            [tpz.day.WINDSDAY    ] = {tpz.jobAbility.GELUS   },
            [tpz.day.ICEDAY      ] = {tpz.jobAbility.IGNIS   },
            [tpz.day.LIGHTNINGDAY] = {tpz.jobAbility.TELLUS  },
            [tpz.day.LIGHTSDAY   ] = {tpz.jobAbility.TENEBRAE},
            [tpz.day.DARKSDAY    ] = {tpz.jobAbility.LUX     },
        }

        local mLvl       = mobArg:getMainLvl()
        local runeStack  = 0
        local totalRunes = 0
        local maxRunes   = 1
        local day        = VanadielDayOfTheWeek()
        local isBusy     = false
        local act        = mobArg:getCurrentAction()

        -- Set the max number of runes allowable based on her job level
        if mLvl >= 35 and mLvl < 65 then
            maxRunes = 2
        elseif mLvl >= 65 then
            maxRunes = 3
        end

        if
            act == tpz.act.WEAPONSKILL_START or
            act == tpz.act.WEAPONSKILL_FINISH or
            act == tpz.act.MOBABILITY_START or
            act == tpz.act.MOBABILITY_USING or
            act == tpz.act.MOBABILITY_FINISH or
            act == tpz.act.MAGIC_START or
            act == tpz.act.MAGIC_CASTING or
            act == tpz.act.MAGIC_START
        then
            isBusy = true
        end

        -- Handle stacking runes from her last damage type taken
        if
            os.time() > mobArg:getLocalVar("STACK_DELAY") and
            isBusy == false
        then
            local spellToCast = 0
            local currentHigh = 0
            local runeCount   =
            {
                [tpz.effect.IGNIS   ] = { 7, 0},
                [tpz.effect.GELUS   ] = { 8, 0},
                [tpz.effect.FLABRA  ] = { 9, 0},
                [tpz.effect.TELLUS  ] = {10, 0},
                [tpz.effect.SULPOR  ] = {11, 0},
                [tpz.effect.UNDA    ] = { 6, 0},
                [tpz.effect.LUX     ] = {13, 0},
                [tpz.effect.TENEBRAE] = {12, 0},
            }

            -- printf("amchuchu.lua AMCHUCHU_CTICK  LAST DMG TYPE: [%i]", mobArg:getLocalVar("LAST_DAMAGETYPE"))

            for i = tpz.effect.IGNIS, tpz.effect.TENEBRAE do
                -- Count the total number of runes currently active
                if mobArg:hasStatusEffect(i) then
                    runeCount[i][2] = mobArg:countEffect(i)
                    totalRunes = totalRunes + mobArg:countEffect(i)
                end

                -- Check the last magical damage taken and assign the rune to use
                if
                    mobArg:getLocalVar("LAST_DAMAGETYPE") == runeCount[i][1] and
                    runeCount[i][2] < 3
                then
                    runeStack = i
                    -- printf("amchuchu.lua AMCHUCHU_CTICK  i: [%i]  LAST DMG TYPE: [%i]  RUNE ELEM: [%i]  RUNE COUNT: [%i]  RUNE STACK: [%i]", i, mobArg:getLocalVar("LAST_DAMAGETYPE"), runeCount[i][1], runeCount[i][2], runeStack)
                end
            end

            -- printf("amchuchu.lua AMCHUCHU_CTICK  TOTAL RUNES: [%i]", totalRunes)

            if runeStack ~= 0 then
                -- Use the last magical damage type taken
                spellToCast = runeSpell[runeStack][3]

                -- printf("amchuchu.lua AMCHUCHU_CTICK  RUNE STACK: [%i]  RUNE: [%i]  EFFECT: [%i]  SPELL: [%i]", runeStack, runeSpell[runeStack][1], runeSpell[runeStack][2], runeSpell[runeStack][3])

                if mLvl >= 35 and mLvl < 65 then
                    if mobArg:countEffect(runeStack) < 2 then
                        mobArg:useJobAbility(runeSpell[runeStack][1], mobArg)
                    end

                    if
                        mobArg:countEffect(runeStack) == 2 and
                        mobArg:hasStatusEffect(runeSpell[runeStack][2]) == false and
                        spellToCast ~= 0
                    then
                        mobArg:castSpell(spellToCast, mobArg)
                    end
                elseif mLvl >= 65 then
                    if mobArg:countEffect(runeStack) < 3 then
                        mobArg:useJobAbility(runeSpell[runeStack][1], mobArg)
                    end

                    if
                        mobArg:countEffect(runeStack) == 3 and
                        mobArg:hasStatusEffect(runeSpell[runeStack][2]) == false and
                        spellToCast ~= 0
                    then
                        mobArg:castSpell(spellToCast, mobArg)
                    end
                end
            elseif runeStack == 0 then
                -- Default to the current day's rune if no previous magical damage taken is present
                -- printf("amchuchu.lua AMCHUCHU_CTICK  NO RUNE CURRENTLY ACTIVE  DAY: [%i]  RUNE: [%i]", day, elemDay[day][1])
                mobArg:useJobAbility(elemDay[day][1], mobArg)
            end

            mobArg:setLocalVar("STACK_DELAY", os.time() + 10)
        end

        -- Handle Swordplay
        if not mobArg:hasStatusEffect(tpz.effect.SWORDPLAY) then
            mobArg:useJobAbility(tpz.jobAbility.SWORDPLAY, mobArg)
        end

        -- Handle Vivacious Pulse
        if
            os.time() > mobArg:getLocalVar("VIV_PULSE_COOL") and
            (mobArg:getHPP() < 90 or
             (mobArg:getMP() / mobArg:getMaxMP() * 100) < 90)
        then
            if (mobArg:getMP() / mobArg:getMaxMP() * 100) <= 50 then
                mobArg:useJobAbility(tpz.jobAbility.TENEBRAE, mobArg)
            end

            mobArg:useJobAbility(tpz.jobAbility.VIVACIOUS_PULSE, mobArg)

            mobArg:setLocalVar("VIV_PULSE_COOL", os.time() + 60)
        end

        -- Handle Valiance
        if
            mLvl >= 50 and
            totalRunes == maxRunes and
            mobArg:hasStatusEffect(tpz.effect.VALLATION) == false and
            os.time() > mobArg:getLocalVar("VALIANCE_COOLDOWN")
        then
            -- printf("amchuchu.lua AMCHUCHU_CTICK  USE VALIANCE")
            mobArg:useJobAbility(tpz.jobAbility.VALIANCE, mobArg)
            mobArg:setLocalVar("VALIANCE_COOLDOWN", os.time() + 300)

            return 1
        end

        -- Handle Vallation
        if
            mLvl >= 10 and
            totalRunes == maxRunes and
            mobArg:hasStatusEffect(tpz.effect.VALIANCE) == false and
            mobArg:getLocalVar("VALIANCE_COOLDOWN") > os.time() and
            os.time() > mobArg:getLocalVar("VALLATION_COOLDOWN")
        then
            -- printf("amchuchu.lua AMCHUCHU_CTICK  USE VALLATION")
            mobArg:useJobAbility(tpz.jobAbility.VALLATION, mobArg)
            mobArg:setLocalVar("VALLATION_COOLDOWN", os.time() + 180)

            return 1
        end
    end)

    -- Special counters
    mob:addSimpleGambit(ai.t.TARGET, ai.c.STATUS, tpz.effect.CHAINSPELL, ai.r.JA, ai.s.SPECIFIC, tpz.ja.ONE_FOR_ALL)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.STATUS, tpz.effect.MANAFONT, ai.r.JA, ai.s.SPECIFIC, tpz.ja.ONE_FOR_ALL)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.STATUS, tpz.effect.ASTRAL_FLOW, ai.r.JA, ai.s.SPECIFIC, tpz.ja.ONE_FOR_ALL)

    -- Enmity Control
    mob:addSimpleGambit(ai.t.TARGET, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.PROVOKE)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, tpz.effect.FLASH, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.FLASH)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.FOIL, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.FOIL)

    -- Mods
    mob:addMod(tpz.mod.DMGPHYS, 25)
    mob:addMod(tpz.mod.PARRY_RATE_BONUS, 12)
    mob:addMod(tpz.mod.ABSORB_DMG_TO_MP, 5)
    mob:addMod(tpz.mod.ENHANCES_REFRESH, 4)
    mob:addMod(tpz.mod.FASTCAST, 50) --inspiration bonus
    mob:addMod(tpz.mod.ENMITY, 35)
    mob:addMod(tpz.mod.ACC, 400)
    mob:setTrustTPSkillSettings(ai.tp.CLOSER, ai.s.RANDOM)
    mob:addStatusEffect(tpz.effect.MAX_HP_BOOST, 20, 0, 0)
    mob:addStatusEffect(tpz.effect.MAX_MP_BOOST, 10, 0, 0)
    mob:setHP(mob:getMaxHP())
    mob:setMP(mob:getMaxMP())

    -- Buffs
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.BATTUTA, ai.r.JA, ai.s.SPECIFIC, tpz.ja.BATTUTA)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.PROTECT,ai.r.JA, ai.s.SPECIFIC, tpz.ja.EMBOLDEN)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.PROTECT, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.PROTECT)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.SHELL, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.SHELL)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.PHALANX, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.PHALANX)
    -- mob:addSimpleGambit(ai.t.SELF, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.VIVACIOUS_PULSE)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.REGEN, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.REGEN)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.REFRESH, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.REFRESH)
end

function onMobDisengage(mob)
    mob:setLocalVar("dBlock", 0)
end

function onMobDespawn(mob)
    mob:removeListener("AMCHUCHU_ENGAGE")
    mob:removeListener("AMCHUCHU_CTICK")
    mob:removeListener("AMCHUCHU_TAKE_DAMAGE")
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
end

function onMobDeath(mob)
    mob:removeListener("AMCHUCHU_ENGAGE")
    mob:removeListener("AMCHUCHU_CTICK")
    mob:removeListener("AMCHUCHU_TAKE_DAMAGE")
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
end

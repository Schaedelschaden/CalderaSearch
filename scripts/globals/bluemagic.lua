require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/spell_data")

-- The TP modifier
TPMOD_NONE     = 0
TPMOD_CRITICAL = 1
TPMOD_DAMAGE   = 2
TPMOD_ACC      = 3
TPMOD_ATTACK   = 4

-- The SC the spell makes
SC_IMPACTION     = 0
SC_TRANSFIXION   = 1
SC_DETONATION    = 2
SC_REVERBERATION = 3
SC_SCISSION      = 4
SC_INDURATION    = 5
SC_LIQUEFACTION  = 6
SC_COMPRESSION   = 7

SC_FUSION        = 8
SC_FRAGMENTATION = 9
SC_DISTORTION    = 10
SC_GRAVITATION   = 11

SC_DARK  = 12
SC_LIGHT = 13

INT_BASED  = 1
CHR_BASED  = 2
MND_BASED  = 3
MDEF_BASED = 4 -- Used by Blazing Bound
DEF_BASED  = 5 -- Used by Cannonball

------------------------------------------
-- Blue Magic Physical Spell Parameters --
------------------------------------------
-- caster - The entity casting the spell.
-- target - The target of the spell.
-- spell - The blue magic spell itself.
-- params - The parameters for the spell. Specify these in the spell's LUA script.
--      .tpmod - The TP modifier for the spell (attack, accuracy, chance of critical hit, damage varies with TP)
--          TPMOD_ACC caps at +100% Accuracy per TP tier (+300% ACC @ 3000 TP)
--          TPMOD_ATTACK caps at +100% Attack per TP tier (+300% ATK @ 3000 TP)
--          TPMOD_CRITICAL caps at 100% Critical Hit Rate total (no TP tier caps)
--          TPMOD_DAMAGE caps at +100% damage per TP tier (+300% damage @ 3000 TP)
--      .tpmodvalue  - The TP modifier's value (.tpmod = TPMOD_DAMAGE and .tpmodvalue = 35 gives a 35% attack boost starting at 1 TP, 70% starting at 1500 TP, etc)
--      .damageType  - Spell's physical damage type (PIERCING, SLASHING or IMPACT (Blunt))
--      .spellFamily - Monster ecosystem to determine correlation bonus (+/- 25%)(tpz.ecosystem.BEAST/AMORPH/etc.)
--      .attbonus    - Base attack bonus which is separate from the bonus applied by TPMOD_ATTACK (see Vanity Dive)
--      .accbonus    - Base accuracy bonus which is separate from the bonus applied by TPMOD_ACC (see Heavy Strike)
--      .isACrit     - Forces the spell to act as a critical hit regardless of "Chance of Critical Hit Varies with TP"
--      .numHits     - The number of hits in the spell.
--      .effect      - Used to calculate status effect durations (tpz.effect.PLAGUE, PARALYSIS, etc.)
--      .multiplier  - The base damage multiplier for the spell (Listed as fTP 0~1499 on BGWiki)
--      .tp150       - The TP modifier @ 150% TP. (Listed as fTP 1500~2999 on BGWiki)
--      .tp300       - The TP modifier @ 300% TP. (Listed as fTP 3000 on BGWiki)
--      .azuretp     - The TP modifier under Azure Lore. (Listed as fTP 3500 on BGWiki)
--      .duppercap   - The spell's upper cap for D. All Blue Magic spells under level 75 have upper D caps. All spells over 75 are uncapped.
--          D = ((Blue Magic Skill * 0.11) * 2) + 3 (Assuming 600 max blue magic skill the limit for this is 135)
--      .str_wsc - The decimal % value for STR WSC (e.g. STR 20% becomes 0.2)
--      .dex_wsc - The decimal % value for DEX WSC (e.g. DEX 20% becomes 0.2)
--      .vit_wsc - The decimal % value for VIT WSC (e.g. VIT 20% becomes 0.2)
--      .agi_wsc - The decimal % value for AGI WSC (e.g. AGI 20% becomes 0.2)
--      .int_wsc - The decimal % value for INT WSC (e.g. INT 20% becomes 0.2)
--      .mnd_wsc - The decimal % value for MND WSC (e.g. MND 20% becomes 0.2)
--      .chr_wsc - The decimal % value for CHR WSC (e.g. CHR 20% becomes 0.2)

-----------------------------------------
-- Blue Magic Magical Spell Parameters --
-----------------------------------------
-- params
--      .attribute   - The main attribute to compare, usually INT (tpz.mod.INT/MND/CHR)
--      .skillType   - Should always be tpz.skill.BLUE_MAGIC
--      .damageType  - The spell's element (tpz.damageType.FIRE/EARTH/WATER/WIND/ICE/LIGHTNING/THUNDER/LIGHT/DARK)
--      .spellFamily - Monster ecosystem to determine correlation bonus (+/- 25%)(tpz.ecosystem.BEAST/AMORPH/etc.)
--      .multiplier  - The base multiplier for the spell. Referred to as fTP on BGWiki
--      .tMultiplier - The dINT/dMND/dCHR multiplier. Referred to as 1.0dINT/2.0dINT/etc on BGWiki
--      .duppercap   - The spell's upper cap for D. All spells under level 75 have upper D caps. All spells over 75 are uncapped.
--          D = ((Blue Magic Skill * 0.11) * 2) + 3 (Assuming 600 max blue magic skill the limit for this is 135)
--      .str_wsc - The decimal % value for STR WSC (e.g. STR 20% becomes 0.2)
--      .dex_wsc - The decimal % value for DEX WSC (e.g. DEX 20% becomes 0.2)
--      .vit_wsc - The decimal % value for VIT WSC (e.g. VIT 20% becomes 0.2)
--      .agi_wsc - The decimal % value for AGI WSC (e.g. AGI 20% becomes 0.2)
--      .int_wsc - The decimal % value for INT WSC (e.g. INT 20% becomes 0.2)
--      .mnd_wsc - The decimal % value for MND WSC (e.g. MND 20% becomes 0.2)
--      .chr_wsc - The decimal % value for CHR WSC (e.g. CHR 20% becomes 0.2)

----------------------------------------
-- Blue Magic Breath Spell Parameters --
----------------------------------------
-- Breath spells use the formula ((CurrentHP / hpMod) + (MaxLvl / lvlMod)) (Modified to use Max HP instead of current)
-- params
--      .attackType = The type of attack (tpz.attackType.BREATH)
--      .damageType = The spell's element (tpz.damageType.FIRE/EARTH/WATER/WIND/ICE/LIGHTNING/THUNDER/LIGHT/DARK)
--      .spellFamily = Monster ecosystem to determine correlation bonus (+/- 25%)(tpz.ecosystem.BEAST/AMORPH/etc.)
--      .hpMod = 50 -- 50%
--      .lvlMod = 0.075 -- fLV
--      .bonus = 1.00 -- +% Base Damage Bonus
--      .multiplier = 1.50 -- Azure Lore Damage multiplier

-------------------------------
-- Blue Physical type spells --
-------------------------------
function BluePhysicalSpell(caster, target, spell, params)
    local casterLvl       = caster:getMainLvl()
    local fStr            = BluefSTR(caster:getStat(tpz.mod.STR) - target:getStat(tpz.mod.VIT))
    local blueSkill       = caster:getSkillLevel(tpz.skill.BLUE_MAGIC)
    local blueMerits      = caster:getMerit(tpz.merit.BLUE)
    local blueGear        = caster:getMod(tpz.mod.BLUE)
    -- local magicSkill      = blueSkill + blueMerits + blueGear -- Skill + Merits + Equipment bonuses
    local tp              = caster:getTP() + caster:getMod(tpz.mod.TP_BONUS)
    local accBonus        = 0
    local WSC             = BlueGetWsc(caster, params)
    local wscCA           = 1
    local wscAugBlueMagic = 0
    local augChance       = math.random(0, 100)
    local setEffect       = caster:getMod(tpz.mod.AUGMENT_BLUE_MAGIC)
    local fTP             = 1.0 -- Always assume a 1x fTP so the calculation doesn't zero out

    -- Cap TP
    if tp > 3000 then
        tp = 3000
    end

    if params.accbonus ~= nil then
        accBonus = params.accbonus / 100
        -- printf("bluemagic.lua BluePhysicalSpell ACC Bonus: [%f]", accbonus)
    end

    -- Sets the fTP multiplier to the value specified in the spell if provided
    if params.multiplier ~= nil then
        fTP = params.multiplier
    end

    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("PHYSICAL BLUE MAGIC AUDIT"),tpz.msg.channel.SYSTEM_3)
        caster:PrintToPlayer(string.format("BLUE MAGIC SKILL: [%i] = SKILL: [%i] + MERITS: [%i] + GEAR BONUS: [%i]", blueSkill, blueSkill - blueMerits - blueGear, blueMerits, blueGear),tpz.msg.channel.SYSTEM_3)
        caster:PrintToPlayer(string.format("CURRENT TP: [%i]  ACC BONUS: [%i]", tp, accBonus),tpz.msg.channel.SYSTEM_3)
    end

    -- TODO: Under Efflux?
    -- TODO: Merits.

    ---------------------------------
    -- Calculate the final D value  -
    ---------------------------------
    -- Worked out from http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
    -- Final D value = (floor(D + fSTR + WSC) * fTP)

    -- Calculate Base Damage
    local D = 3

    if params.duppercap <= 64 then
        -- Level 75 cap
        D = (math.floor(blueSkill * 0.11) * 2) + 3

        -- Cap D
        if D > params.duppercap then
            D = params.duppercap
        end

        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("D: [%i] = ((BLUE MAGIC SKILL: [%i] * 0.11) * 2) + 3 (CAP: [%i])", D, blueSkill, params.duppercap),tpz.msg.channel.SYSTEM_3)
        end
    else
        -- Uncapped above level 75
        D = math.floor(blueSkill * 0.22) * 2

        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("D: [%i] = (BLUE MAGIC SKILL: [%i] * 0.22) * 2 (UNCAPPED)", D, blueSkill),tpz.msg.channel.SYSTEM_3)
        end
    end

    -- print("D val is ".. D)

    -- Cap fSTR
    -- Smite of Rage and Grand Slam ignore the fStr cap.
    if fStr > 22 and casterLvl <= 75 and not (spell:getID() == tpz.magic.spell.SMITE_OF_RAGE or spell:getID() == tpz.magic.spell.GRAND_SLAM) then
        -- fStr is capped at 22 for spells below level 75.
        fStr = 22
    elseif fStr > 26 and not (spell:getID() == tpz.magic.spell.SMITE_OF_RAGE or spell:getID() == tpz.magic.spell.GRAND_SLAM) then
        -- fStr is capped at 26 for spells above level 75.
        fStr = 26
    end

    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("FSTR: [%i] = CASTER STR: [%i] - TARGET VIT: [%i] (DIFF CAPPED AT 22 OR 26)", fStr, caster:getStat(tpz.mod.STR), target:getStat(tpz.mod.VIT)),tpz.msg.channel.SYSTEM_3)
    end

    -- print("fStr val is ".. fStr)

    -- Handle "Occ. augments blue magic spells" bonus when Chain Affinity is active
    if caster:hasStatusEffect(tpz.effect.CHAIN_AFFINITY) and augChance > setEffect then
        wscCA = 2
    elseif caster:hasStatusEffect(tpz.effect.CHAIN_AFFINITY) and augChance < setEffect then
        wscCA = 1
    end

    -- Apply Mavi/Hashishin set effect and Chain Affinity WSC modifier
    if setEffect < caster:getMod(tpz.mod.AUGMENT_BLUE_MAGIC) then
        wscAugBlueMagic = 2
    end

    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("WSC: [%i] = (STR: [%i] * STR_WSC: [%1.2f]) + (DEX: [%i] * DEX_WSC: [%1.2f]) + (VIT: [%i] * VIT_WSC: [%1.2f]) + (AGI: [%i] * AGI_WSC: [%1.2f]) +", WSC, caster:getStat(tpz.mod.STR), params.str_wsc, caster:getStat(tpz.mod.DEX), params.dex_wsc, caster:getStat(tpz.mod.VIT), params.vit_wsc, caster:getStat(tpz.mod.AGI), params.agi_wsc),tpz.msg.channel.SYSTEM_3)
        caster:PrintToPlayer(string.format("                (INT: [%i] * INT_WSC: [%1.2f]) + (MND: [%i] * MND_WSC: [%1.2f]) + (CHR: [%i] * CHR_WSC: [%1.2f])", caster:getStat(tpz.mod.INT), params.int_wsc, caster:getStat(tpz.mod.MND), params.mnd_wsc, caster:getStat(tpz.mod.CHR), params.chr_wsc),tpz.msg.channel.SYSTEM_3)
    end

    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("FINAL WSC: [%i] = WSC: [%i] * (CHAIN AFFINTY BONUS: [%i] + EMPYREAN SET BONUS: [%1.2f])", WSC * (wscCA + wscAugBlueMagic), WSC, wscCA, wscAugBlueMagic),tpz.msg.channel.SYSTEM_3)
    end

    -- Calculate the final WSC
    WSC = WSC * (wscCA + wscAugBlueMagic)

    -- print("wsc val is ".. WSC)

    ----------------------------------------------------------------
    -- Applies Chain Affinity, increases base damage, and adjusts --
    -- the multipliers to fTP(fTP, tp150, tp300)           --
    ----------------------------------------------------------------
    local chainAffinity = caster:getStatusEffect(tpz.effect.CHAIN_AFFINITY)
    local caBonus       = 0

    if chainAffinity ~= nil then
        caBonus = caster:getMod(tpz.mod.CHAIN_AFFINITY_EFFECT)

        -- Calculate the total TP available for the fTP multiplier.
        if not caster:hasStatusEffect(tpz.effect.EFFLUX) then
            tp = tp + caster:getMerit(tpz.merit.ENCHAINMENT)
        end

        if tp > 3000 then
            tp = 3000
        end

        D = D + caBonus
    end

    ----------------------------------------------------------------
    -- Applies Efflux, increases base damage, and adds a TP Bonus --
    -- the multipliers to fTP(fTP, tp150, tp300)                  --
    ----------------------------------------------------------------
    local effluxBonus = 1

    if caster:hasStatusEffect(tpz.effect.EFFLUX) then
        effluxBonus = 1.5

        if not caster:hasStatusEffect(tpz.effect.CHAIN_AFFINITY) then
            tp = tp + 1000 + caster:getMod(tpz.mod.ENH_EFFLUX)
        else
            tp = 1000 + caster:getMod(tpz.mod.ENH_EFFLUX)
        end

        if tp > 3000 then
            tp = 3000
        end

        D = D * effluxBonus

        caster:delStatusEffect(tpz.effect.EFFLUX)
    end

    ----------------------------------------------------------------
    -- Calculates Blue Magic fTP                                  --
    ----------------------------------------------------------------
    fTP = BluefTP(tp, fTP, params.tp150, params.tp300)

    ------------------------
    -- Applies Azure Lore --
    ------------------------
    local azureLore = caster:getStatusEffect(tpz.effect.AZURE_LORE)

    if azureLore ~= nil then
        if tp < 3500 then
            tp = 3500
        end

        fTP = params.azuretp
    end

    -----------------------------------------
    -- Check and apply Monster Correlation --
    -----------------------------------------
    local ecoBonus = checkEcosystem(caster, target, params)

    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("FTP: [%2.4f] = BASE FTP: [%2.4f] + ECOSYSTEM BONUS: [%2.4f]", fTP + ecoBonus, fTP, ecoBonus),tpz.msg.channel.SYSTEM_3)
    end

    fTP = fTP + ecoBonus

    -----------------------
    -- Calculate Final D --
    -----------------------
    local finalD = math.floor(D + fStr + WSC) * fTP

    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("FINAL D: [%i] = ((D: [%i] + CA BONUS: [%i] * EFFLUX BONUS: [%1.2f])+ FSTR: [%i] * WSC: [%i]) * FTP: [%1.2f]", finalD, D, caBonus, effluxBonus, fStr, WSC, fTP),tpz.msg.channel.SYSTEM_3)
    end

    ------------------------------
    -- Gets the caster's Attack and the Spell's Attack bonus --
    ------------------------------
    local casterATT = 0
    local attBonus  = 1

    if params.attbonus ~= nil then
        attBonus = 1 + (params.attbonus / 100)
    end

    -- Check for offcratiomod parameter from spell.
    -- Only Cannonball uses offcratiomod at the moment
    if params.offcratiomod ~= nil then
        casterATT = params.offcratiomod
    else
        casterATT = caster:getStat(tpz.mod.ATT)
        casterATT = casterATT * attBonus
    end

    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("ATTACK: [%i] = BASE ATTACK: [%i] * ATTACK BONUS: [%1.2f]", casterATT, caster:getStat(tpz.mod.ATT), attBonus),tpz.msg.channel.SYSTEM_3)
    end

    --------------------------------------------------------------
    -- Applies attack bonus from "Attack Varies with TP" Spells --
    --------------------------------------------------------------
    if
        params.tpmod == TPMOD_ATTACK or
        params.tpmod1 == TPMOD_ATTACK
    then
        local tpModValue = params.tpmodvalue

        if params.tpmod1 == TPMOD_ATTACK then
            tpModValue = params.tpmodvalue1
        end

        if tpModValue == nil then
            printf("bluemagic.lua BluePhysicalSpell  SPELL ID: [%i] NIL TPMOD_ATTACK VALUE", spell:getID())
            tpModValue = 0
        end

        -- Caps maximum attack bonus at 100% per TP tier
        if tpModValue > 100 then
            tpModValue = 100
        end

        --           0 TP = No TP bonus
        --    1 - 1499 TP = Tier 1 bonus
        -- 1500 - 2999 TP = Tier 2 bonus
        --     >= 3000 TP = Tier 3 bonus
        if tp == 0 then
            tpModValue = 0
        elseif tp >= 1500 and tp <= 2999 then
            tpModValue = tpModValue * 2
        elseif tp >= 3000 then
            tpModValue = tpModValue * 3
        end

        tpModValue = 1 + (tpModValue / 100)

        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("ATTACK TP BONUS: [%i] = ATTACK: [%i] * ATTACK VARIES WITH TP BONUS: [%1.2f]", casterATT * tpModValue, casterATT, tpModValue),tpz.msg.channel.SYSTEM_3)
        end

        casterATT = casterATT * tpModValue
    end

    ---------------------------------------------
    -- Check and apply Cannonball DEF modifier --
    ---------------------------------------------
    local statMod = params.statMod
    if statMod == DEF_BASED then -- Stat mod is DEF (Cannonball)
        local casterDEF = caster:getMod(tpz.mod.DEF)

        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("CANNONBALL BONUS: [%i] = ATTACK: [%i] + DEFENSE: [%i]", casterATT + casterDEF, casterATT, casterDEF),tpz.msg.channel.SYSTEM_3)
        end

        casterATT = casterATT + casterDEF
    end

    -----------------------------------------------
    -- Gets the possible pDIF range and hit rate --
    -----------------------------------------------
    local mLvl = caster:getMainLvl()

    if caster:isPC() then
        mLvl = mLvl + caster:getItemLevel()
    end

    local cratio  = BluecRatio(caster, casterATT, target:getStat(tpz.mod.DEF), mLvl, target:getMainLvl())
    local hitrate = BlueGetHitRate(caster, target, true)

    ------------------------------------------------------------------
    -- Applies accuracy bonus from "Accuracy Varies with TP" Spells --
    ------------------------------------------------------------------
    if
        params.tpmod == TPMOD_ACC or
        params.tpmod1 == TPMOD_ACC
    then
        local tpModValue = params.tpmodvalue

        if params.tpmod1 == TPMOD_ACC then
            tpModValue = params.tpmodvalue1
        end

        if tpModValue == nil then
            printf("bluemagic.lua BluePhysicalSpell  SPELL ID: [%i] NIL TPMOD_ACC VALUE", spell:getID())
            tpModValue = 0
        end

        -- Caps maximum accuracy bonus at 100% per TP tier
        if tpModValue > 100 then
            tpModValue = 100
        end

        --           0 TP = No TP bonus
        --    1 - 1499 TP = Tier 1 bonus
        -- 1500 - 2999 TP = Tier 2 bonus
        --     >= 3000 TP = Tier 3 bonus
        if tp == 0 then
            tpModValue = 0
        elseif tp >= 1500 and tp <= 2999 then
            tpModValue = tpModValue * 2
        elseif tp >= 3000 then
            tpModValue = tpModValue * 3
        end

        tpModValue = (tpModValue / 100)

        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("HIT RATE TP BONUS: [%1.2f] = HIT RATE: [%1.2f] + ACCURACY VARIES WITH TP BONUS: [%1.2f]", hitrate + tpModValue, hitrate, tpModValue),tpz.msg.channel.SYSTEM_3)
        end

        hitrate = hitrate + tpModValue
    end

    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("FINAL HIT RATE: [%1.2f] = HIT RATE: [%1.2f] + ACC BONUS: [%1.2f]", utils.clamp(hitrate + accBonus, 0.20, 0.95), hitrate, accBonus),tpz.msg.channel.SYSTEM_3)
    end

    hitrate = utils.clamp(hitrate + accBonus, 0.20, 0.95)

    -- print("pdifmin "..cratio[1].." pdifmax "..cratio[2])

    -------------------------
    -- Perform the attacks --
    -------------------------
    local hitsdone     = 0
    local hitslanded   = 0
    local finaldmg     = 0
    local baseHits     = params.numhits
    local multiAttacks = getPhysMultiAttacks(caster)
    local totalHits    = 1

    if multiAttacks > 0 then
        totalHits = baseHits + multiAttacks

        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("           TOTAL HITS: [%i] = BASE HITS: [%i] + MULTI ATTACKS: [%i]", totalHits, baseHits, multiAttacks),tpz.msg.channel.SYSTEM_3)
        end
    end

    while hitsdone < totalHits do
        local chance = math.random()

        if chance <= hitrate then -- it hit
            -- TODO: Check for shadow absorbs.

            -- Generate a random pDIF between min and max
            local pdif = math.random((cratio[1] * 1000), (cratio[2] * 1000))

            pdif = pdif / 1000

            if caster:getLocalVar("AuditMagic") == 1 then
                caster:PrintToPlayer(string.format("HIT: [%i]  PDIF: [%2.4f] = RANDOM BTWN CRATIO MIN: [%2.4f] & CRATIO MAX: [%2.4f]", hitsdone + 1, pdif, cratio[1], cratio[2]),tpz.msg.channel.SYSTEM_3)
            end

            local isACrit = false

            ---------------------------------------------------------------------------------------------
            -- Checks for "Chance of Critical Hit Varies with TP" Spells --
            ---------------------------------------------------------------------------------------------
            if
                (params.tpmod == TPMOD_CRITICAL or
                 params.tpmod1 == TPMOD_CRITICAL) and
                (caster:hasStatusEffect(tpz.effect.CHAIN_AFFINITY) or
                 caster:hasStatusEffect(tpz.effect.EFFLUX))
            then
                local tpModValue = params.tpmodvalue

                if params.tpmod1 == TPMOD_CRITICAL then
                    tpModValue = params.tpmodvalue1
                end

                if tpModValue == nil then
                    printf("bluemagic.lua BluePhysicalSpell  SPELL ID: [%i] NIL TPMOD_CRITICAL VALUE", spell:getID())
                    tpModValue = 0
                end

                local tpModCrit = tpModValue
                --           0 TP = No TP bonus
                --    1 - 1499 TP = Tier 1 bonus
                -- 1500 - 2999 TP = Tier 2 bonus
                --     >= 3000 TP = Tier 3 bonus
                if tp == 0 then
                    tpModCrit = 0
                elseif tp >= 1500 and tp <= 2999 then
                    tpModCrit = tpModValue * 2
                elseif tp >= 3000 then
                    tpModCrit = tpModValue * 3
                end

                -- printf("bluemagic.lua BluePhysicalSpell  CRIT HIT VARIES WITH TP: [%2.2f]  MOD VALUE: [%2.2f]", tpModCrit, tpModValue)

                isACrit = BlueGetCrit(caster, target, tpModCrit)
            elseif
                (params.isACrit == true or
                 (caster:hasStatusEffect(tpz.effect.SNEAK_ATTACK) and
                  caster:isBehind(target))) and
                hitsdone == 0
            then
                isACrit = true

                caster:delStatusEffect(tpz.effect.SNEAK_ATTACK)
            end

            ----------------------------------------------------
            -- Applies crits and calculates crit damage bonus --
            ----------------------------------------------------
            if isACrit == true then
                local critbonus = (100 + caster:getMod(tpz.mod.CRIT_DMG_INCREASE)) / 100

                if caster:getLocalVar("AuditMagic") == 1 then
                    caster:PrintToPlayer(string.format("           CRIT BONUS PDIF: [%1.4f] = (PDIF: [%1.4f] + 1) * CRIT BONUS: [%1.2f]", (pdif + 1) * critbonus, pdif, critbonus),tpz.msg.channel.SYSTEM_3)
                end

                pdif = (pdif + 1) * critbonus
            end

            -- Handle fTP replication
            if baseHits == 1 and hitsdone > 0 then
                -- Single Hit Physical Spells that proc a multihit do not replicate fTP
                if caster:getLocalVar("AuditMagic") == 1 then
                    caster:PrintToPlayer(string.format("           HIT DAMAGE: [%i] = (D: [%i] + fSTR: [%i] + WSC: [%i]) * PDIF: [%1.4f]   (NO FTP REPLICATION)", math.floor(D + fStr + WSC) * pdif, D, fStr, WSC, pdif),tpz.msg.channel.SYSTEM_3)
                end

                finaldmg = finaldmg + ((math.floor(D + fStr + WSC)) * pdif)
            else
                if caster:getLocalVar("AuditMagic") == 1 then
                    if baseHits == 1 then
                        caster:PrintToPlayer(string.format("           HIT DAMAGE: [%i] = FINAL D: [%i] * PDIF: [%1.4f]   (NO FTP REPLICATION)", finalD * pdif, finalD, pdif),tpz.msg.channel.SYSTEM_3)
                    else
                        caster:PrintToPlayer(string.format("           HIT DAMAGE: [%i] = FINAL D: [%i] * PDIF: [%1.4f]   (FTP REPLICATION)", finalD * pdif, finalD, pdif),tpz.msg.channel.SYSTEM_3)
                    end
                end

                finaldmg = finaldmg + (finalD * pdif)
            end

            -- Calculate the first hit's bonuses
            if hitsdone == 0 then -- Only the first hit benefits from "Damage Varies with TP"
                --------------------------------------------------------------
                -- Applies damage bonus from "Damage Varies with TP" Spells --
                --------------------------------------------------------------
                if
                    params.tpmod == TPMOD_DAMAGE or
                    params.tpmod1 == TPMOD_DAMAGE
                then
                    local tpModValue = params.tpmodvalue

                    if params.tpmod1 == TPMOD_DAMAGE then
                        tpModValue = params.tpmodvalue1
                    end

                    if tpModValue == nil then
                        printf("bluemagic.lua BluePhysicalSpell  SPELL ID: [%i] NIL TPMOD_DAMAGE VALUE", spell:getID())
                        tpModValue = 0
                    end

                    -- Caps maximum damage bonus at 100% per TP tier
                    if tpModValue > 100 then
                        tpModValue = 100
                    end

                    --           0 TP = No TP bonus
                    --    1 - 1499 TP = Tier 1 bonus
                    -- 1500 - 2999 TP = Tier 2 bonus
                    --     >= 3000 TP = Tier 3 bonus
                    if tp == 0 then
                        tpModValue = 0
                    elseif tp >= 1500 and tp <= 2999 then
                        tpModValue = tpModValue * 2
                    elseif tp >= 3000 then
                        tpModValue = tpModValue * 3
                    end

                    tpModValue = 1 + (tpModValue / 100)

                    if caster:getLocalVar("AuditMagic") == 1 then
                        caster:PrintToPlayer(string.format("           HIT DAMAGE: [%i] = DAMAGE: [%i] * DAMAGE VARIES WITH TP BONUS: [%1.2f]", finaldmg * tpModValue, finaldmg, tpModValue),tpz.msg.channel.SYSTEM_3)
                    end

                    finaldmg = finaldmg * tpModValue
                end
            end

            hitslanded = hitslanded + 1

            -- Give the target TP (100TP per hit landed)
            -- Subtle Blow applies
            local tpGenerated = 100 * (1 - utils.clamp(caster:getMod(tpz.mod.SUBTLE_BLOW) + caster:getMod(tpz.mod.SUBTLE_BLOW_II), 0, 75) / 100)

            target:addTP(tpGenerated)
        else
            if caster:getLocalVar("AuditMagic") == 1 then
                caster:PrintToPlayer(string.format("HIT: [%i]  MISS!", hitsdone + 1),tpz.msg.channel.SYSTEM_3)
            end
        end

        hitsdone = hitsdone + 1
    end

    ---------------------------------------------
    -- Check and apply Physical Potency merits --
    ---------------------------------------------
    local potencyMerits = 1 + caster:getMerit(tpz.merit.PHYSICAL_POTENCY) / 100

    finaldmg = finaldmg * potencyMerits

    -- print("Hits landed "..hitslanded.."/"..hitsdone.." for total damage: "..finaldmg)

    -- if (caster:hasStatusEffect(tpz.effect.CHAIN_AFFINITY)) then
        -- caster:setTP(0)
        -- caster:delStatusEffectSilent(tpz.effect.CHAIN_AFFINITY)
    -- end

    -- local godModeActive = caster:getCharVar("GodMode")

    -- if godModeActive == 1 then
        -- finaldmg = finaldmg + math.random(25000, 70000)
        -- if finaldmg > 99999 then
            -- finaldmg = 99999
        -- end
    -- end

    return finaldmg
end

------------------------------
-- Blue Magical type spells --
------------------------------
function BlueMagicalSpell(caster, target, spell, params, statMod)
    if caster:hasStatusEffect(tpz.effect.BURST_AFFINITY) and caster:getLocalVar("BLUAoETrigger") == 0 then
        caster:setLocalVar("BLUAoETargets", spell:getTotalTargets())
        caster:setLocalVar("BLUAoETrigger", 1)
--      printf("thermal_pulse.lua onMagicCastingCheck TARGETS: [%i]", spell:getTotalTargets())
    end

    local D = caster:getMainLvl() + 2

    if D > params.duppercap then
        D = params.duppercap
    end

    local ST = BlueGetWsc(caster, params) -- According to Wiki ST is the same as WSC, essentially Blue mage spells that are magical use the dmg formula of Magical type Weapon skills

    local stBA           = 1
    local baBonus        = caster:getMod(tpz.mod.BURST_AFFINITY_EFFECT) / 100
    local stAugBlueMagic = 0
    local augChance      = math.random(0, 100)
    local setEffect      = caster:getMod(tpz.mod.AUGMENT_BLUE_MAGIC)

    if caster:hasStatusEffect(tpz.effect.BURST_AFFINITY) and augChance > setEffect then
        stBA = 2 + baBonus
    elseif caster:hasStatusEffect(tpz.effect.BURST_AFFINITY) and augChance < setEffect then
        stBA = 1 + baBonus
    end

    -- Apply Mavi/Hashishin set effect and Burst Affinity WSC modifier
    if augChance < setEffect then
        stAugBlueMagic = 3
    end

    ST = ST * (stBA + stAugBlueMagic)

    -- Always assume a 1x multiplier so the calculation doesn't zero out
    -- Sets the multiplier to the value specified in the spell if provided
    local multiplier = 1.0

    if params.multiplier ~= nil then
        multiplier = params.multiplier
    end

    local convergenceBonus = 1.0

    if caster:hasStatusEffect(tpz.effect.CONVERGENCE) then
        local convergenceEffect = caster:getStatusEffect(tpz.effect.CONVERGENCE)
        local convLvl = convergenceEffect:getPower()

        if convLvl == 1 then
            convergenceBonus = 1.05
        elseif convLvl == 2 then
            convergenceBonus = 1.1
        elseif convLvl == 3 then
            convergenceBonus = 1.15
        end
    end

    local statBonus = 0
    local dStat     = 0 -- Please make sure to add an additional stat check if there is to be a spell that uses neither INT, MND, or CHR. None currently exist.

    if statMod == INT_BASED then -- Stat mod is INT
        dStat = caster:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT)
        statBonus = (dStat) * params.tMultiplier
    elseif statMod == CHR_BASED then -- Stat mod is CHR
        dStat = caster:getStat(tpz.mod.CHR) - target:getStat(tpz.mod.CHR)
        statBonus = (dStat) * params.tMultiplier
    elseif statMod == MND_BASED then -- Stat mod is MND
        dStat = caster:getStat(tpz.mod.MND) - target:getStat(tpz.mod.MND)
        statBonus = (dStat) * params.tMultiplier
    elseif statMod == MDEF_BASED then -- Stat mod is MDEF
        dStat = caster:getMod(tpz.mod.MDEF) - target:getMod(tpz.mod.MDEF)
        statBonus = (dStat) * params.tMultiplier
    end

    D = (((D + ST) * multiplier * convergenceBonus) + statBonus)

    -- At this point according to wiki we apply standard magic attack calculations

    local magicAttack = 1.0
    local multTargetReduction = 1.0 -- TODO: Make this dynamically change, temp static till implemented.

    magicAttack = math.floor(D * multTargetReduction)

    local rparams = {}
        rparams.diff = dStat
        rparams.skillType = tpz.skill.BLUE_MAGIC
    magicAttack = math.floor(magicAttack * applyResistance(caster, target, spell, rparams))

    dmg = math.floor(addBonuses(caster, spell, target, magicAttack))
    -- printf("bluemagic.lua BlueMagicalSpell BASE DAMAGE: [%i]", dmg)

    -----------------------------------------
    -- Check and apply Monster Correlation --
    -----------------------------------------
    local ecoBonus = 1 + checkEcosystem(caster, target, params)

    dmg = dmg * ecoBonus
    -- printf("bluemagic.lua BlueMagicalSpell ECO ADJUSTED DAMAGE: [%i]", dmg)

    ------------------------
    -- Applies Azure Lore --
    ------------------------
    if caster:hasStatusEffect(tpz.effect.AZURE_LORE) then
        dmg = dmg * 1.5
        -- printf("bluemagic.lua BlueMagicalSpell AZURE LORE DAMAGE: [%i]", dmg)
    end

    caster:delStatusEffectSilent(tpz.effect.CONVERGENCE)

    return dmg
end

-----------------------------
-- Blue Breath type spells --
-----------------------------
function BlueBreathSpell(caster, target, spell, params)
    local MaxHP        = caster:getMaxHP()
    local hpMod        = params.hpMod / 100
    local Lvl          = caster:getMainLvl()
    local lvlMod       = params.lvlMod
    local HP           = MaxHP * hpMod
    local fLV          = Lvl / lvlMod
    local breathDmgMod = 1 + (caster:getMod(tpz.mod.BREATH_DMG_DEALT)/100)
    local dmgBonus     = params.bonus

    -------------------------------
    -- Check Monster Correlation --
    -------------------------------
    local ecoBonus = 1 + checkEcosystem(caster, target, params)

    -----------------------------------
    -- Check for Convergence bonuses --
    -----------------------------------
    local convBonus = 1.0
    if caster:hasStatusEffect(tpz.effect.CONVERGENCE) then
        local convergenceEffect = caster:getStatusEffect(tpz.effect.CONVERGENCE)
        local convLvl = convergenceEffect:getPower()

        if convLvl == 1 then
            convBonus = 1.05
        elseif convLvl == 2 then
            convBonus = 1.1
        elseif convLvl == 3 then
            convBonus = 1.15
        end
    end

    --------------------------------------
    -- Check for Chain Affinity bonuses --
    --------------------------------------
    local baBonus = 1.00

    if caster:hasStatusEffect(tpz.effect.BURST_AFFINITY) then
        local baMod = caster:getMod(tpz.mod.BURST_AFFINITY_EFFECT) / 100

        baBonus = baBonus + 1 + baMod
    end

    ----------------------------------
    -- Check for Azure Lore bonuses --
    ----------------------------------
    local AzureLoreMult = 1.00

    if caster:hasStatusEffect(tpz.effect.AZURE_LORE) and not params.multiplier == nil then
        AzureLoreMult = params.multiplier
    end

    local baseDamage = (((HP + fLV) * ecoBonus) * dmgBonus)
    local damage = ((((baseDamage * breathDmgMod) * convBonus) * baBonus) * AzureLoreMult)
    -- printf("bluemagic.lua BlueBreathSpell BLUE MAGIC BREATH SPELL")
    -- printf("HP[%i] = Max HP[%i] / HP MOD[%0.2f%%]    fLV[%5.2f] = LVL[%i] / LVL MOD[%f]", HP, MaxHP, hpMod, fLV, Lvl, lvlMod)
    -- printf("DAMAGE[%i] = (((((((HP[%i] + fLV[%i]) * ECO BONUS[%1.2f]) * DMG BONUS[%1.2f]) * BREATH DMG MOD[%1.2f]) * CONVERGENCE BONUS[%1.2f]) * BURST AFFINITY BONUS[%1.2f]) * AZURE LORE MULTIPLIER[%1.2f])", damage, HP, fLV, ecoBonus, dmgBonus, breathDmgMod, convBonus, baBonus, AzureLoreMult)

    caster:delStatusEffectSilent(tpz.effect.BURST_AFFINITY)
    caster:delStatusEffectSilent(tpz.effect.CONVERGENCE)

    return damage
end

---------------------------------------------
-- Checks if a spell procs additional hits --
---------------------------------------------
function getPhysMultiAttacks(caster)
    local offHandHit   = 0
    local bonusHits    = 0
    local doubleRate   = caster:getMod(tpz.mod.DOUBLE_ATTACK)
    local tripleRate   = caster:getMod(tpz.mod.TRIPLE_ATTACK)
    local quadRate     = caster:getMod(tpz.mod.QUAD_ATTACK)
    local oaThriceRate = caster:getMod(tpz.mod.MYTHIC_OCC_ATT_THRICE)
    local oaTwiceRate  = caster:getMod(tpz.mod.MYTHIC_OCC_ATT_TWICE)

    -- Add an additional hit for dual wielding
    if caster:getOffhandDmg() > 0 then
        offHandHit = 1

        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("           ADDITIONAL HIT: [%i] - OFF HAND", offHandHit),tpz.msg.channel.SYSTEM_3)
        end
    end

    -- Try to proc Quad/Triple/Double Attack once
    if math.random(0, 100) < quadRate then
        bonusHits = bonusHits + 3

        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("           ADDITIONAL HITS: [%i] - QUAD ATTACK", bonusHits),tpz.msg.channel.SYSTEM_3)
        end
    elseif math.random(0, 100) < tripleRate then
        bonusHits = bonusHits + 2

        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("           ADDITIONAL HITS: [%i] - TRIPLE ATTACK", bonusHits),tpz.msg.channel.SYSTEM_3)
        end
    elseif math.random(0, 100) < doubleRate then
        bonusHits = bonusHits + 1

        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("           ADDITIONAL HITS: [%i] - DOUBLE ATTACK", bonusHits),tpz.msg.channel.SYSTEM_3)
        end
    elseif math.random(0, 100) < oaThriceRate then
        bonusHits = bonusHits + 2

        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("           ADDITIONAL HITS: [%i] - OA THRICE", bonusHits),tpz.msg.channel.SYSTEM_3)
        end
    elseif math.random(0, 100) < oaTwiceRate then
        bonusHits = bonusHits + 1

        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("           ADDITIONAL HITS: [%i] - OA TWICE", bonusHits),tpz.msg.channel.SYSTEM_3)
        end
    end

    -- No more than 8 total hits can occur
    -- This function is triggered during the first hit, so we cap total multi hits to +7
    if offHandHit + bonusHits > 7 then
        return 7
    end

    return offHandHit + bonusHits
end

-----------------------------------------------------------------------------------------
-- Multiplies the total power by the server constant and adjusts for Phalanx/Stoneskin --
-----------------------------------------------------------------------------------------
function BlueFinalAdjustments(caster, target, spell, dmg, params)
    if dmg < 0 then
        dmg = 0
    end

    if caster:isSpellAoE(spell:getID()) then
        local total = spell:getTotalTargets()

        if total >= 10 then
            -- AoE spells on 10+ targets = 0.4

            if caster:getLocalVar("AuditMagic") == 1 then
                caster:PrintToPlayer(string.format("AOE SPELL - TOTAL TARGETS: [%i] > 10", total),tpz.msg.channel.SYSTEM_3)
                caster:PrintToPlayer(string.format("            DAMAGE: [%i] = BASE DAMAGE: [%i] * 0.4", dmg * 0.4, dmg),tpz.msg.channel.SYSTEM_3)
            end

            dmg = dmg * 0.4
        elseif total > 1 then
            -- AoE spells on 2 to 9 targets = 0.9 - 0.05T where T = number of targets

            if caster:getLocalVar("AuditMagic") == 1 then
                caster:PrintToPlayer(string.format("AOE SPELL - TOTAL TARGETS: [%i] < 10", total),tpz.msg.channel.SYSTEM_3)
                caster:PrintToPlayer(string.format("            DAMAGE: [%i] = BASE DAMAGE: [%i] * (0.9 - 0.05 * TOTAL TARGETS: [%i])", dmg * (0.9 - 0.05 * total), dmg, total),tpz.msg.channel.SYSTEM_3)
            end

            dmg = dmg * (0.9 - 0.05 * total)
        end
    end

    local attackType = params.attackType or tpz.attackType.PHYSICAL
    local damageType = params.damageType or tpz.damageType.NONE

    dmg = target:physicalDmgTaken(dmg, damageType)

    -- if (caster:getObjType() == tpz.objType.PC) then
        -- local casterLvl = caster:getMainLvl() + caster:getItemLevel()

        -- if (casterLvl < 99) then
            -- dmg = dmg * (BLUE_POWER + 0.75)
        -- end
    -- else
    if caster:getObjType() == tpz.objType.PC then
        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("GLOBAL MULTIPLIER - DAMAGE: [%i] = BASE DAMAGE: [%i] * BLUE SPELL POWER: [%1.2f]", dmg * BLUE_POWER, dmg, BLUE_POWER),tpz.msg.channel.SYSTEM_3)
        end

        dmg = dmg * BLUE_POWER
    elseif caster:getObjType() == tpz.objType.MOB then
        local mobMult = 1

        if caster:getLocalVar("BLU_DMGMOD") ~= 0 then
            mobMult = 1 + (caster:getLocalVar("BLU_DMGMOD") / 100)
        end

        dmg = dmg * mobMult
    end
    -- end

    dmg = dmg - target:getMod(tpz.mod.PHALANX)

    if dmg < 0 then
        dmg = 0
    end

    -- handling stoneskin
    dmg = utils.stoneskin(target, dmg)
    dmg = utils.magicshield(target, dmg)

    target:takeSpellDamage(caster, spell, dmg, attackType, damageType)
    target:updateEnmityFromDamage(caster, dmg)
    target:handleAfflatusMiseryDamage(dmg)
    -- TP has already been dealt with.

    local AoETargets = caster:getLocalVar("BLUAoETargets")

    if AoETargets <= 1 and caster:hasStatusEffect(tpz.effect.BURST_AFFINITY) then
        caster:delStatusEffectSilent(tpz.effect.BURST_AFFINITY)
        caster:setLocalVar("BLUAoETargets", 0)
        caster:setLocalVar("BLUAoETrigger", 0)
    elseif AoETargets > 1 and caster:hasStatusEffect(tpz.effect.BURST_AFFINITY) then
        AoETargets = AoETargets - 1
        caster:setLocalVar("BLUAoETargets", AoETargets)
--      printf("bluemagic.lua BlueFinalAdjustments AOE TARGETS: [%i]", AoETargets)
    end

    return dmg
end

-------------------------------------------------
-- Finds the Final Base Damage's WSC component --
-------------------------------------------------
function BlueGetWsc(attacker, params)
    wsc = (attacker:getStat(tpz.mod.STR) * params.str_wsc + attacker:getStat(tpz.mod.DEX) * params.dex_wsc +
           attacker:getStat(tpz.mod.VIT) * params.vit_wsc + attacker:getStat(tpz.mod.AGI) * params.agi_wsc +
           attacker:getStat(tpz.mod.INT) * params.int_wsc + attacker:getStat(tpz.mod.MND) * params.mnd_wsc +
           attacker:getStat(tpz.mod.CHR) * params.chr_wsc)

    return wsc
end

--------------------------------------------------------------------------
-- Applies level correction to the ratio and returns min and max cRatio --
--------------------------------------------------------------------------
function BluecRatio(caster, casterATT, targetDEF, atk_lvl, def_lvl)
    local base      = casterATT / targetDEF
    local ratio     = 0
    local levelcor  = 0
    local cratiomin = 0
    local cratiomax = 0

    -- Apply level penalty
    if atk_lvl < def_lvl then
        levelcor = 0.05 * (def_lvl - atk_lvl)
    end

    ratio = base - levelcor

    -- Apply caps (Assume one-handed weapon pDIF caps)
    if ratio < 0 then
        ratio = 0
    elseif ratio > 3.25 then
        ratio = 3.25
    end

    -- Calculate Minimum cRatio
    if ratio < 0.38 then
        cratiomin = 0
    elseif ratio >= 0.38 and ratio < 1.25 then
        cratiomin = ratio * (1176 / 1024) - (448 / 1024)
    elseif ratio >= 1.25 and ratio < 1.51 then
        cratiomin = 1
    elseif ratio >= 1.51 and ratio < 2.44 then
        cratiomin = ratio * (1176 / 1024) - (755 / 1024)
    elseif ratio >= 2.44 then
        cratiomin = ratio - 0.375
    end

    -- Calculate Maximum cRatio
    if ratio < 0.5 then
        cratiomax = ratio + 0.5
    elseif ratio >= 0.5 and ratio < 0.70 then
        cratiomax = 1
    elseif ratio >= 0.7 and ratio < 1.20 then
        cratiomax = ratio + 0.30
    elseif ratio >= 1.20 and ratio < 1.50 then
        cratiomax = ratio + (ratio * 0.25)
    elseif ratio >= 1.50 then
        cratiomax = ratio + 0.375
    end

    -- Apply the Damage Limit+ Trait and the Physical Damage Limit +% mod
    local dmgLimitTrait = caster:getMod(tpz.mod.DAMAGE_LIMIT_TRAIT) / 10
    local dmgLimitGear  = (100 + caster:getMod(tpz.mod.DAMAGE_LIMIT_GEAR)) / 100

    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("CRATIO: [%1.4f] = (CASTER ATK: [%i] / TARGET DEF: [%i]) - LEVEL CORRECTION: [%1.2f]", ratio, casterATT, targetDEF, levelcor),tpz.msg.channel.SYSTEM_3)
        caster:PrintToPlayer(string.format("CRATIO MIN: [%1.4f] = (BASE: [%1.4f] + DMG LIMIT TRAIT: [%1.2f]) * DMG LIMIT GEAR: [%1.2f]", (cratiomin + dmgLimitTrait) * dmgLimitGear, cratiomin, dmgLimitTrait, dmgLimitGear),tpz.msg.channel.SYSTEM_3)
        caster:PrintToPlayer(string.format("CRATIO MAX: [%1.4f] = (BASE: [%1.4f] + DMG LIMIT TRAIT: [%1.2f]) * DMG LIMIT GEAR: [%1.2f]", (cratiomax + dmgLimitTrait) * dmgLimitGear, cratiomax, dmgLimitTrait, dmgLimitGear),tpz.msg.channel.SYSTEM_3)
    end

    cratio = {}

    cratio[1] = (cratiomin + dmgLimitTrait) * dmgLimitGear
    cratio[2] = (cratiomax + dmgLimitTrait) * dmgLimitGear

    return cratio
end

------------------------------------------------------------------------------------------
-- Gets the fTP multiplier by applying 2 straight lines between ftp1-ftp2 and ftp2-ftp3 --
-- tp = The current TP                                                                  --
-- ftp1 = The TP 0% value                                                               --
-- ftp2 = The TP 150% value                                                             --
-- ftp3 = The TP 300% value                                                             --
------------------------------------------------------------------------------------------
function BluefTP(tp, ftp1, ftp2, ftp3)
    if tp >= 0 and tp < 1500 then
        return ftp1 + (((ftp2 - ftp1) / 100) * (tp / 10))
    elseif tp >= 1500 and tp <= 3000 then
        -- Generate a straight line between ftp2 and ftp3 and find point @ tp
        return ftp2 + (((ftp3 - ftp2) / 100) * ((tp - 1500) / 10))
    else
        print("blue fTP error: TP value is not between 0-3000!")
    end

    return 1 -- No ftp mod
end

--------------------------------------------------
-- Finds the Final Base Damage's fSTR component --
--------------------------------------------------
function BluefSTR(dSTR)
    local fSTR2 = nil

    if dSTR >= 12 then
        fSTR2 = (dSTR + 4) / 2
    elseif dSTR >= 6 then
        fSTR2 = (dSTR + 6) / 2
    elseif dSTR >= 1 then
        fSTR2 = (dSTR + 7 ) / 2
    elseif dSTR >= -2 then
        fSTR2 = (dSTR + 8) / 2
    elseif dSTR >= -7 then
        fSTR2 = (dSTR + 9) / 2
    elseif dSTR >= -15 then
        fSTR2 = (dSTR + 10 ) / 2
    elseif dSTR >= -21 then
        fSTR2 = (dSTR + 12) / 2
    else
        fSTR2 = (dSTR + 13) / 2
    end

    return fSTR2
end

---------------------------------------------------------------------------
-- Determines whether a hit connects based off caster ACC and target EVA --
---------------------------------------------------------------------------
function BlueGetHitRate(attacker, target, capHitRate)
    local acc       = attacker:getACC()
    local eva       = target:getEVA()
    local attLevel  = attacker:getMainLvl()
    local targLevel = target:getMainLvl()

    if attacker:getObjType() == tpz.objType.PC then
        attLevel = attLevel + attacker:getItemLevel()
    end

    if attLevel > targLevel then -- ACC bonus
        if attacker:getLocalVar("AuditMagic") == 1 then
            attacker:PrintToPlayer(string.format("ACC BONUS: [%i] = BASE ACC: [%i] + ((CASTER LVL: [%i] - TARGET LVL: [%i]) * 4)", acc + ((attLevel - targLevel) * 4), acc, attLevel, targLevel),tpz.msg.channel.SYSTEM_3)
        end

        acc = acc + ((attLevel - targLevel) * 4)
    elseif attLevel < targLevel then -- ACC penalty
        if attacker:getLocalVar("AuditMagic") == 1 then
            attacker:PrintToPlayer(string.format("ACC PENALTY: [%i] = BASE ACC: [%i] - ((TARGET LVL: [%i] - CASTER LVL: [%i]) * 4)", acc - ((targLevel - attLevel) * 4), acc, targLevel, attLevel),tpz.msg.channel.SYSTEM_3)
        end

        acc = acc - ((targLevel - attLevel) * 4)
    end

    local hitdiff = 0
    local hitrate = 75

    if acc > eva then
        hitdiff = (acc - eva) / 2

        if attacker:getLocalVar("AuditMagic") == 1 then
            attacker:PrintToPlayer(string.format("ACC/EVA DIFF: [%3.2f] = (CASTER ACC: [%i] - TARGET EVA: [%i]) / 2", hitdiff, acc, eva),tpz.msg.channel.SYSTEM_3)
        end
    else
        hitdiff = ((-1) * (eva - acc)) / 2

        if attacker:getLocalVar("AuditMagic") == 1 then
            attacker:PrintToPlayer(string.format("ACC/EVA DIFF: [%3.2f] = (-1 * (TARGET EVA: [%i] - CASTER ACC: [%i])) / 2", hitdiff, eva, acc),tpz.msg.channel.SYSTEM_3)
        end
    end

    if attacker:getLocalVar("AuditMagic") == 1 then
        attacker:PrintToPlayer(string.format("HIT RATE: [%1.2f] = (BASE: [%2.2f] + ACC/EVA DIFF: [%3.2f]) / 100", utils.clamp((hitrate + hitdiff) / 100, 0.20, 0.95), hitrate, hitdiff),tpz.msg.channel.SYSTEM_3)
    end

    hitrate = (hitrate + hitdiff) / 100

    -- if (attacker:getName() == "Khalum") then
        -- printf("bluemagic.lia BlueGetHitRate CASTER LEVEL: [%i]  ACC: [%i]  TARGET LEVEL: [%i]  EVA: [%i]  Hit DIFF: [%i]  HIT RATE: [%1.2f]", attLevel, acc, targLevel, eva, hitdiff, hitrate)
    -- end

    -- Applying hitrate caps
    if capHitRate then -- This isn't capped for 'ACC varies with TP', as more penalties are due
        if hitrate > 0.95 then
            hitrate = 0.95
        end

        if hitrate < 0.20 then
            hitrate = 0.20
        end
    end

    return hitrate
end

function handleDiffusion(caster, target, spell, duration)
    if caster:hasStatusEffect(tpz.effect.DIFFUSION) then
        if caster:getName() == target:getName() then
            caster:setLocalVar("DIFFUSION_COUNTER", spell:getTotalTargets())
        else
            caster:setLocalVar("DIFFUSION_COUNTER", caster:getLocalVar("DIFFUSION_COUNTER") - 1)
        end

        local merits = caster:getMerit(tpz.merit.DIFFUSION)

        if merits > 0 then
            duration = duration + (duration * (merits / 100))
        end
    end

    if caster:getLocalVar("DIFFUSION_COUNTER") <= 1 then
        caster:delStatusEffect(tpz.effect.DIFFUSION)
    end

    return duration
end

-------------------------------------------------------------------------------------------------
-- Determines critical hit chance from base crit, caster DEX vs. target AGI, gear, and merits. --
-------------------------------------------------------------------------------------------------
function BlueGetCrit(caster, target, tpModCrit)
    local critBase   = 5
    local critGear   = caster:getMod(tpz.mod.CRITHITRATE)
    local critMerits = caster:getMerit(tpz.merit.CRIT_HIT_RATE)
    local dDEX       = caster:getStat(tpz.mod.DEX) - target:getStat(tpz.mod.AGI)

    -- Caps dDEX's maximum benefit at a difference of 50 (+15% crit hit rate)
    if dDEX > 50 then
        dDEX = 50
    end

    -- Determines the crit hit rate bonus from caster:DEX - target:AGI
    if dDEX > 39 and dDEX < 51 then -- 5-15%
        dDEX = dDEX - 35
    elseif dDEX > 29 and dDEX < 40 then -- 4%
        dDEX = 4
    elseif dDEX > 19 and dDEX < 30 then -- 3%
        dDEX = 3
    elseif dDEX > 13 and dDEX < 20 then -- 2%
        dDEX = 2
    elseif dDEX > 6 and dDEX < 14 then -- 1%
        dDEX = 1
    elseif dDEX < 6 then -- 0%
        dDEX = 0
    end

    local critChance = critBase + critGear + critMerits + dDEX + tpModCrit -- Base + Gear + Merits + Stat Difference + Spell TP Crit Mod

    if caster:getLocalVar("AuditMagic") == 1 then
        caster:PrintToPlayer(string.format("           CRIT HIT RATE: [%i] = BASE: [%i] + GEAR: [%i] + MERITS: [%i] + dDEX: [%i] + TP MOD: [%i]", utils.clamp(critChance, 0, 100), critBase, critGear, critMerits, dDEX, tpModCrit),tpz.msg.channel.SYSTEM_3)
    end

    -- Caps crit hit chance at 100%
    if critChance > 100 then
        critChance = 100
    end

    local rollForCrit = math.random(1, 100)
    local isACrit     = false

    if rollForCrit <= critChance then
        isACrit = true

        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("           CRITICAL HIT!"),tpz.msg.channel.SYSTEM_3)
        end
    end

    return isACrit
end

--------------------------------------------------------------------
-- Compares the spell's ecosystem vs. the target's ecosystem.     --
-- If a correlation is found assigns +25%/-25% effect multiplier. --
--------------------------------------------------------------------
function checkEcosystem(caster, target, params)
    local merits         = caster:getMerit(tpz.merit.MONSTER_CORRELATION)
    local mobCorrelation = caster:getMod(tpz.mod.ENH_MONSTER_CORRELATION)
    local mobSystem      = target:getSystem()
    local spellSystem    = tpz.eco.UNCLASSIFIED

    if params.spellFamily ~= nil then
        spellSystem = params.spellFamily
    end

    local ecoBonus = 0

    -- Beast vs Lizard(+25%)/Plantoid(-25%)
    if spellSystem == tpz.eco.BEAST and mobSystem == tpz.eco.LIZARD then
        ecoBonus = 25

        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("           [ BEAST ] STRONG AGAINST [ LIZARD ]  ECOSYSTEM BONUS: [%i]", (ecoBonus + merits + mobCorrelation) / 100),tpz.msg.channel.SYSTEM_3)
        end
    elseif spellSystem == tpz.eco.BEAST and mobSystem == tpz.eco.PLANTOID then
        ecoBonus = -25

        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("           [ BEAST ] WEAK AGAINST [ PLANTOID ]  ECOSYSTEM PENALTY: [%i]", (ecoBonus + merits + mobCorrelation) / 100),tpz.msg.channel.SYSTEM_3)
        end
    end

    -- Lizard vs Vermin(+25%)/Beast(-25%)
    if spellSystem == tpz.eco.LIZARD and mobSystem == tpz.eco.VERMIN then
        ecoBonus = 25

        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("           [ LIZARD ] STRONG AGAINST [ VERMIN ]  ECOSYSTEM BONUS: [%i]", (ecoBonus + merits + mobCorrelation) / 100),tpz.msg.channel.SYSTEM_3)
        end
    elseif spellSystem == tpz.eco.LIZARD and mobSystem == tpz.eco.BEAST then
        ecoBonus = -25

        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("           [ LIZARD ] WEAK AGAINST [ BEAST ]  ECOSYSTEM PENALTY: [%i]", (ecoBonus + merits + mobCorrelation) / 100),tpz.msg.channel.SYSTEM_3)
        end
    end

    -- Vermin vs Plantoid(+25%)/Lizard(-25%)
    if spellSystem == tpz.eco.VERMIN and mobSystem == tpz.eco.PLANTOID then
        ecoBonus = 25

        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("           [ VERMIN ] STRONG AGAINST [ PLANTOID ]  ECOSYSTEM BONUS: [%i]", (ecoBonus + merits + mobCorrelation) / 100),tpz.msg.channel.SYSTEM_3)
        end
    elseif spellSystem == tpz.eco.VERMIN and mobSystem == tpz.eco.LIZARD then
        ecoBonus = -25

        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("           [ VERMIN ] WEAK AGAINST [ LIZARD ]  ECOSYSTEM PENALTY: [%i]", (ecoBonus + merits + mobCorrelation) / 100),tpz.msg.channel.SYSTEM_3)
        end
    end

    -- Plantoid vs Beast(+25%)/Vermin(-25%)
    if spellSystem == tpz.eco.PLANTOID and mobSystem == tpz.eco.BEAST then
        ecoBonus = 25

        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("           [ PLANTOID ] STRONG AGAINST [ BEAST ]  ECOSYSTEM BONUS: [%i]", (ecoBonus + merits + mobCorrelation) / 100),tpz.msg.channel.SYSTEM_3)
        end
    elseif spellSystem == tpz.eco.PLANTOID and mobSystem == tpz.eco.VERMIN then
        ecoBonus = -25

        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("           [ PLANTOID ] WEAK AGAINST [ VERMIN ]  ECOSYSTEM PENALTY: [%i]", (ecoBonus + merits + mobCorrelation) / 100),tpz.msg.channel.SYSTEM_3)
        end
    end

    -- Amorph vs Bird(+25%)/Aquan(-25%)
    if spellSystem == tpz.eco.AMORPH and mobSystem == tpz.eco.BIRD then
        ecoBonus = 25

        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("           [ AMORPH ] STRONG AGAINST [ BIRD ]  ECOSYSTEM BONUS: [%i]", (ecoBonus + merits + mobCorrelation) / 100),tpz.msg.channel.SYSTEM_3)
        end
    elseif spellSystem == tpz.eco.AMORPH and mobSystem == tpz.eco.AQUAN then
        ecoBonus = -25

        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("           [ AMORPH ] WEAK AGAINST [ AQUAN ]  ECOSYSTEM PENALTY: [%i]", (ecoBonus + merits + mobCorrelation) / 100),tpz.msg.channel.SYSTEM_3)
        end
    end

    -- Bird vs Aquan(+25%)/Amorph(-25%)
    if spellSystem == tpz.eco.BIRD and mobSystem == tpz.eco.AQUAN then
        ecoBonus = 25

        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("           [ BIRD ] STRONG AGAINST [ AQUAN ]  ECOSYSTEM BONUS: [%i]", (ecoBonus + merits + mobCorrelation) / 100),tpz.msg.channel.SYSTEM_3)
        end
    elseif spellSystem == tpz.eco.BIRD and mobSystem == tpz.eco.AMORPH then
        ecoBonus = -25

        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("           [ BIRD ] WEAK AGAINST [ AMORPH ]  ECOSYSTEM PENALTY: [%i]", (ecoBonus + merits + mobCorrelation) / 100),tpz.msg.channel.SYSTEM_3)
        end
    end

    -- Aquan vs Amorph(+25%)/Bird(-25%)
    if spellSystem == tpz.eco.AQUAN and mobSystem == tpz.eco.AMORPH then
        ecoBonus = 25

        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("           [ AQUAN ] STRONG AGAINST [ AMORPH ]  ECOSYSTEM BONUS: [%i]", (ecoBonus + merits + mobCorrelation) / 100),tpz.msg.channel.SYSTEM_3)
        end
    elseif spellSystem == tpz.eco.AQUAN and mobSystem == tpz.eco.BIRD then
        ecoBonus = -25

        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("           [ AQUAN ] WEAK AGAINST [ BIRD ]  ECOSYSTEM PENALTY: [%i]", (ecoBonus + merits + mobCorrelation) / 100),tpz.msg.channel.SYSTEM_3)
        end
    end

    -- Undead vs Arcana (+25%)
    if spellSystem == tpz.eco.UNDEAD and mobSystem == tpz.eco.ARCANA then
        ecoBonus = 25

        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("           [ UNDEAD ] STRONG AGAINST [ ARCANA ]  ECOSYSTEM BONUS: [%i]", (ecoBonus + merits + mobCorrelation) / 100),tpz.msg.channel.SYSTEM_3)
        end
    elseif spellSystem == tpz.eco.ARCANA and mobSystem == tpz.eco.UNDEAD then
        ecoBonus = 25

        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("           [ ARCANA ] STRONG AGAINST [ UNDEAD ]  ECOSYSTEM BONUS: [%i]", (ecoBonus + merits + mobCorrelation) / 100),tpz.msg.channel.SYSTEM_3)
        end
    end

    -- Dragon vs Demon (+25%)
    if spellSystem == tpz.eco.DRAGON and mobSystem == tpz.eco.DEMON then
        ecoBonus = 25

        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("           [ DRAGON ] STRONG AGAINST [ DEMON ]  ECOSYSTEM BONUS: [%i]", (ecoBonus + merits + mobCorrelation) / 100),tpz.msg.channel.SYSTEM_3)
        end
    elseif spellSystem == tpz.eco.DEMON and mobSystem == tpz.eco.DRAGON then
        ecoBonus = 25

        if caster:getLocalVar("AuditMagic") == 1 then
            caster:PrintToPlayer(string.format("           [ DEMON ] STRONG AGAINST [ DRAGON ]  ECOSYSTEM BONUS: [%i]", (ecoBonus + merits + mobCorrelation) / 100),tpz.msg.channel.SYSTEM_3)
        end
    end

    ecoBonus = ecoBonus + merits + mobCorrelation
    ecoBonus = ecoBonus / 100

    -- printf("bluemagic.lua checkEcosystem SPELL ECOSYSTEM: [%s]    MOB ECOSYSTEM: [%s]    ECO BONUS: [%1.2f]", spellSystem, mobSystem, ecoBonus)

    return ecoBonus
end

-----------------------------------------------------------
-- Calculates Physical BLU spell status debuff durations --
-----------------------------------------------------------
function BluePhysDebuffDuration(caster, duration)
    local tp = caster:getTP()

    --           0 TP =  50% duration
    --    1 - 1499 TP =  70% duration
    -- 1500 - 2999 TP =  90% duration
    --        3000 TP = 100% duration
    --        3500 TP = 150% duration
    if tp == 0 then
        duration = duration * 0.50
    elseif tp >= 1 and tp <= 1499 then
        duration = duration * 0.70
    elseif tp >= 1500 and tp <= 2999 then
        duration = duration * 0.90
    elseif tp == 3000 then
        duration = duration
    elseif caster:hasStatusEffect(tpz.effect.AZURE_LORE) then
        -- Azure Lore forces all spells to act as if they are cast with 3500 TP
        duration = duration * 1.5
    end

    return duration
end

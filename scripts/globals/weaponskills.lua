-- Contains all common weaponskill calculations including but not limited to:
-- fSTR
-- Alpha
-- Ratio -> cRatio
-- min/max cRatio
-- applications of fTP
-- applications of critical hits ('Critical hit rate varies with TP.')
-- applications of accuracy mods ('Accuracy varies with TP.')
-- applications of damage mods ('Damage varies with TP.')
-- performance of the actual WS (rand numbers, etc)
require("scripts/globals/settings")
require("scripts/globals/magicburst")
require("scripts/globals/ability")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/utils")
require("scripts/globals/msg")

-- Function to calculate if a hit in a WS misses, criticals, and the respective damage done
function getSingleHitDamage(attacker, target, dmg, wsParams, calcParams)
    local criticalHit = false
    local pdif = 0
    local finaldmg = 0
    local dmgLimitTrait = (attacker:getMod(tpz.mod.DAMAGE_LIMIT_TRAIT) / 10)
    local dmgLimitGear = ((100 + attacker:getMod(tpz.mod.DAMAGE_LIMIT_GEAR)) / 100)

    local missChance = math.random()

    if ((missChance <= calcParams.hitRate) -- See if we hit the target
    or calcParams.guaranteedHit
    or (calcParams.melee and math.random() < attacker:getMod(tpz.mod.ZANSHIN)/100))
    and not calcParams.mustMiss then
        if not shadowAbsorb(target) then
            critChance = math.random() -- See if we land a critical hit
            criticalHit = (wsParams.canCrit and critChance <= calcParams.critRate) or
                          calcParams.forcedFirstCrit or calcParams.mightyStrikesApplicable
            if criticalHit then
                calcParams.criticalHit = true
                calcParams.pdif = generatePdif (calcParams.ccritratio[1], calcParams.ccritratio[2], true)
            else
                calcParams.pdif = generatePdif (calcParams.cratio[1], calcParams.cratio[2], true)
            end
            -- Apply Damage Limit+ from Job Traits and Physical Damage Limit +% from gear
            calcParams.pdif = ((calcParams.pdif + dmgLimitTrait) * dmgLimitGear)
            finaldmg = dmg * calcParams.pdif

            -- Duplicate the first hit with an added magical component for hybrid WSes
            if calcParams.hybridHit then
                -- Calculate magical bonuses and reductions
                local magicdmg = addBonusesAbility(attacker, wsParams.ele, target, finaldmg, wsParams)
                magicdmg = magicdmg * applyResistanceAbility(attacker, target, wsParams.ele, wsParams.skill, bonusacc)
                magicdmg = target:magicDmgTaken(magicdmg)
                magicdmg = adjustForTarget(target, magicdmg, wsParams.ele)

                finaldmg = finaldmg + magicdmg
            end

            calcParams.hitsLanded = calcParams.hitsLanded + 1
        else
            calcParams.shadowsAbsorbed = calcParams.shadowsAbsorbed + 1
        end
    end

    return finaldmg, calcParams
end

-- Calculates the raw damage for a weaponskill, used by both doPhysicalWeaponskill and doRangedWeaponskill.
-- Behavior of damage calculations can vary based on the passed in calcParams, which are determined by the calling function
-- depending on the type of weaponskill being done, and any special cases for that weaponskill
--
-- wsParams can contain: ftp100, ftp200, ftp300, str_wsc, dex_wsc, vit_wsc, int_wsc, mnd_wsc, canCrit, crit100, crit200, crit300,
-- acc100, acc200, acc300, ignoresDef, ignore100, ignore200, ignore300, atk100, atk200, atk300, kick, hybridWS, hitsHigh, formless
--
-- See doPhysicalWeaponskill or doRangedWeaponskill for how calcParams are determined.
function calculateRawWSDmg(attacker, target, wsID, tp, action, wsParams, calcParams)

    -- Recalculate accuracy if it varies with TP, applied to all hits
    if wsParams.acc100 ~= 0 then
        calcParams.hitRate = accVariesWithTP(calcParams.hitRate, calcParams.accStat, tp, wsParams.acc100, wsParams.acc200, wsParams.acc300)
    end

    -- Calculate alpha, WSC, and our modifiers for our base per-hit damage
    if not calcParams.alpha then
        if USE_ADOULIN_WEAPON_SKILL_CHANGES then
            calcParams.alpha = 1
        else
            calcParams.alpha = getAlpha(attacker:getMainLvl())
        end
    end

    -- Begin Checks for bonus wsc bonuses. See the following for details:
    -- https://www.bg-wiki.com/bg/Utu_Grip
    -- https://www.bluegartr.com/threads/108199-Random-Facts-Thread-Other?p=6826618&viewfull=1#post6826618
    
    if attacker:getMod(tpz.mod.WS_STR_BONUS) > 0 then
        wsParams.str_wsc = wsParams.str_wsc + (attacker:getMod(tpz.mod.WS_STR_BONUS) / 100)
    end

    if attacker:getMod(tpz.mod.WS_DEX_BONUS) > 0 then
        wsParams.dex_wsc = wsParams.dex_wsc + (attacker:getMod(tpz.mod.WS_DEX_BONUS) / 100)
    end

    if attacker:getMod(tpz.mod.WS_VIT_BONUS) > 0 then
        wsParams.vit_wsc = wsParams.vit_wsc + (attacker:getMod(tpz.mod.WS_VIT_BONUS) / 100)
    end

    if attacker:getMod(tpz.mod.WS_AGI_BONUS) > 0 then
        wsParams.agi_wsc = wsParams.agi_wsc + (attacker:getMod(tpz.mod.WS_AGI_BONUS) / 100)
    end

    if attacker:getMod(tpz.mod.WS_INT_BONUS) > 0 then
        wsParams.int_wsc = wsParams.int_wsc + (attacker:getMod(tpz.mod.WS_INT_BONUS) / 100)
    end

    if attacker:getMod(tpz.mod.WS_MND_BONUS) > 0 then
        wsParams.mnd_wsc = wsParams.mnd_wsc + (attacker:getMod(tpz.mod.WS_MND_BONUS) / 100)
    end

    if attacker:getMod(tpz.mod.WS_CHR_BONUS) > 0 then
        wsParams.chr_wsc = wsParams.chr_wsc + (attacker:getMod(tpz.mod.WS_CHR_BONUS) / 100)
    end

    local wsMods = calcParams.fSTR +
        (attacker:getStat(tpz.mod.STR) * wsParams.str_wsc + attacker:getStat(tpz.mod.DEX) * wsParams.dex_wsc +
         attacker:getStat(tpz.mod.VIT) * wsParams.vit_wsc + attacker:getStat(tpz.mod.AGI) * wsParams.agi_wsc +
         attacker:getStat(tpz.mod.INT) * wsParams.int_wsc + attacker:getStat(tpz.mod.MND) * wsParams.mnd_wsc +
         attacker:getStat(tpz.mod.CHR) * wsParams.chr_wsc) * calcParams.alpha
    local mainBase = calcParams.weaponDamage[1] + wsMods + calcParams.bonusWSmods

    -- Calculate fTP multiplier
    local ftp = fTP(tp, wsParams.ftp100, wsParams.ftp200, wsParams.ftp300) + calcParams.bonusfTP

    -- Calculate critrates
    local critRate = 0

    if (wsParams.canCrit) then -- Work out critical hit ratios
        local nativecrit = 0
        critrate = fTP(tp, wsParams.crit100, wsParams.crit200, wsParams.crit300)

        if calcParams.flourishEffect then
            if calcParams.flourishEffect:getPower() > 1 then
                critrate = critrate + (10 + calcParams.flourishEffect:getSubPower()/2)/100
            end
        end

        -- Add on native crit hit rate (guesstimated, it actually follows an exponential curve)
        nativecrit = (attacker:getStat(tpz.mod.DEX) - target:getStat(tpz.mod.AGI))*0.005 -- assumes +0.5% crit rate per 1 dDEX
        if (nativecrit > 0.2) then -- caps only apply to base rate, not merits and mods
            nativecrit = 0.2
        elseif (nativecrit < 0.05) then
            nativecrit = 0.05
        end

        local fencerBonus = calcParams.fencerBonus or 0
        nativecrit = nativecrit + attacker:getMod(tpz.mod.CRITHITRATE)/100 + attacker:getMerit(tpz.merit.CRIT_HIT_RATE)/100
                                + fencerBonus - target:getMerit(tpz.merit.ENEMY_CRIT_RATE)/100

        -- Innin critical boost when attacker is behind target
        if (attacker:hasStatusEffect(tpz.effect.INNIN) and attacker:isBehind(target, 23)) then
            nativecrit = nativecrit + attacker:getStatusEffect(tpz.effect.INNIN):getPower()
        end

        critrate = critrate + nativecrit
    end
    calcParams.critRate = critrate

--	printf("weaponskills.lua calculateRawWSDmg  WS ACC MOD: [%i]  WS BASE DMG: [%i]  CRIT HIT RATE: [%s]  fTP: [%i]", calcParams.hitRate, mainBase, critrate, ftp)

    -- Start the WS
    local hitdmg = 0
    local finaldmg = 0
    calcParams.hitsLanded = 0
    calcParams.shadowsAbsorbed = 0

    -- Calculate the damage from the first hit
    local dmg = mainBase
    
    local climacticflourishcrits = attacker:getCharVar("ClimacticFlourishCrits")
    
    if (attacker:hasStatusEffect(tpz.effect.CLIMACTIC_FLOURISH) and (climacticflourishcrits > 0)) then
        dmg = (dmg + (attacker:getStat(tpz.mod.CHR) / 2)) * (1 + (attacker:getMod(tpz.mod.ENH_CLIMACTIC_FLOURISH) / 100))
        calcParams.critRate = 100
        attacker:setCharVar("ClimacticFlourishCrits", climacticflourishcrits - 1)
    end
    
    if (attacker:hasStatusEffect(tpz.effect.STRIKING_FLOURISH) or attacker:hasStatusEffect(tpz.effect.TERNARY_FLOURISH)) then
        dmg = dmg + attacker:getStat(tpz.mod.CHR)
		calcParams.critRate = calcParams.critRate + attacker:getMod(tpz.mod.ENH_STRIKING_FLOURISH)
        attacker:delStatusEffectSilent(tpz.effect.STRIKING_FLOURISH)
        attacker:delStatusEffectSilent(tpz.effect.TERNARY_FLOURISH)
    end
	
	-- Consume Mana
	if (attacker:hasStatusEffect(tpz.effect.CONSUME_MANA)) then
		local currentMP = attacker:getMP()
		local consumeMana = currentMP / 5
		dmg = dmg + consumeMana
		attacker:delStatusEffect(tpz.effect.CONSUME_MANA)
		attacker:setMP(0)
	end
    
    dmg = dmg * ftp
    
    hitdmg, calcParams = getSingleHitDamage(attacker, target, dmg, wsParams, calcParams)
    
    finaldmg = finaldmg + hitdmg

    -- Have to calculate added bonus for SA/TA here since it is done outside of the fTP multiplier
    if attacker:getMainJob() == tpz.job.THF then
		if (calcParams.pdif == 0 or calcParams.pdif == nil) then
			calcParams.pdif = 1
		end
	
        -- Add DEX/AGI bonus to first hit if THF main and valid Sneak/Trick Attack
        if calcParams.sneakApplicable then
			-- printf("weaponskills.lua calculateRawWSDmg PLAYER NAME: [%s]  WS ID: [%i]", attacker:getName(), wsID)
            finaldmg = finaldmg +
                        (attacker:getStat(tpz.mod.DEX) * (1 + attacker:getMod(tpz.mod.SNEAK_ATK_DEX)/100) * calcParams.pdif) *
                        ((100+(attacker:getMod(tpz.mod.AUGMENTS_SA)))/100)
        end
        if calcParams.trickApplicable then
            finaldmg = finaldmg +
                        (attacker:getStat(tpz.mod.AGI) * (1 + attacker:getMod(tpz.mod.TRICK_ATK_AGI)/100) * calcParams.pdif) *
                        ((100+(attacker:getMod(tpz.mod.AUGMENTS_TA)))/100)
        end
    end

    -- We've now accounted for any crit from SA/TA, or damage bonus for a Hybrid WS, so nullify them
    calcParams.forcedFirstCrit = false
    calcParams.hybridHit = false
	
	-- Add in individual weaponskill damage on the first hit
	calcParams.specialWSDMG = wsParams.specialWSDMG or 0

    -- For items that apply bonus damage to the first hit of a weaponskill (but not later hits),
    -- store bonus damage for first hit, for use after other calculations are done
    local firstHitBonus = ((finaldmg * attacker:getMod(tpz.mod.ALL_WSDMG_FIRST_HIT) + calcParams.specialWSDMG)/100)
--	printf("weaponskills.lua calculateRawWSDmg firstHitBonus: [%f]", firstHitBonus)

    -- Reset fTP if it's not supposed to carry over across all hits for this WS
    if not wsParams.multiHitfTP then ftp = 1 end -- We'll recalculate our mainhand damage after doing offhand

    -- Do the extra hit for our offhand if applicable
    if calcParams.extraOffhandHit then
        local offhandDmg = (calcParams.weaponDamage[2] + wsMods) * ftp
        hitdmg, calcParams = getSingleHitDamage(attacker, target, offhandDmg, wsParams, calcParams)
        finaldmg = finaldmg + hitdmg
    end

    calcParams.guaranteedHit = false -- Accuracy bonus from SA/TA applies only to first main and offhand hit
    calcParams.tpHitsLanded = calcParams.hitsLanded -- Store number of TP hits that have landed thus far
    calcParams.hitsLanded = 0 -- Reset counter to start tracking additional hits (from WS or Multi-Attacks)

    -- Calculate additional hits if a multiHit WS (or we're supposed to get a DA/TA/QA proc from main hit)
    dmg = mainBase * ftp
    local hitsDone = 1
    local BarrageTurbineShots = attacker:getMod(tpz.mod.BARRAGE_TURBINE_SHOTS)
    local numHits = getMultiAttacks(attacker, target, wsParams.numHits)
    numHits = numHits + BarrageTurbineShots
    
    local burden = 15
    if (BarrageTurbineShots > 0) then
        local master = attacker:getMaster()
        burden = burden * BarrageTurbineShots
        master:addBurden(tpz.magic.ele.WIND-1, burden)
    end
    
    while (hitsDone < numHits) do -- numHits is hits in the base WS _and_ DA/TA/QA procs during those hits
        hitdmg, calcParams = getSingleHitDamage(attacker, target, dmg, wsParams, calcParams)
        finaldmg = finaldmg + hitdmg
        hitsDone = hitsDone + 1
    end
    calcParams.extraHitsLanded = calcParams.hitsLanded

    -- Apply Souleater bonus
    if calcParams.melee then -- souleaterBonus() checks for the effect inside itself
        finaldmg = finaldmg + souleaterBonus(attacker, (calcParams.tpHitsLanded + calcParams.extraHitsLanded))
    end

    -- Factor in "all hits" bonus damage mods
    local bonusdmg = attacker:getMod(tpz.mod.ALL_WSDMG_ALL_HITS) -- ALL_WS_DMG_ALL_HITS for all WS's
    if (attacker:getMod(tpz.mod.WEAPONSKILL_DAMAGE_BASE + wsID) > 0) then -- For specific WS
        bonusdmg = bonusdmg + attacker:getMod(tpz.mod.WEAPONSKILL_DAMAGE_BASE + wsID)
    end

    -- Apply Yaegasumi WS Bonus
    local YaegasumiBonus = attacker:getMod(tpz.mod.YAEGASUMI_WS_BONUS)
    bonusdmg = bonusdmg + YaegasumiBonus

    finaldmg = finaldmg * ((100 + bonusdmg)/100) -- Apply our "all hits" WS dmg bonuses
    finaldmg = finaldmg + firstHitBonus -- Finally add in our "first hit" WS dmg bonus from before

    -- Return our raw damage to then be modified by enemy reductions based off of melee/ranged
    calcParams.finalDmg = finaldmg
    return calcParams
end

-- Sets up the necessary calcParams for a melee WS before passing it to calculateRawWSDmg. When the raw
-- damage is returned, handles reductions based on target resistances and passes off to takeWeaponskillDamage.
function doPhysicalWeaponskill(attacker, target, wsID, wsParams, tp, action, primaryMsg, taChar)
	local alljumpsdmg = wsParams.alljumpsdmg or 0
    -- Determine cratio and ccritratio
    local ignoredDef = 0
    if (wsParams.ignoresDef == not nil and wsParams.ignoresDef == true) then
        ignoredDef = calculatedIgnoredDef(tp, target:getStat(tpz.mod.DEF), wsParams.ignored100, wsParams.ignored200, wsParams.ignored300)
    end
    local cratio, ccritratio = cMeleeRatio(attacker, target, wsParams, ignoredDef, tp)

    -- Set up conditions and wsParams used for calculating weaponskill damage
    local gorgetBeltFTP, gorgetBeltAcc = handleWSGorgetBelt(attacker)
    local attack =
    {
        ['type'] = tpz.attackType.PHYSICAL,
        ['slot'] = tpz.slot.MAIN,
        ['weaponType'] = attacker:getWeaponSkillType(tpz.slot.MAIN),
        ['damageType'] = attacker:getWeaponDamageType(tpz.slot.MAIN)
    }
    local calcParams = {}
    calcParams.weaponDamage = getMeleeDmg(attacker, attack.weaponType, wsParams.kick)
    calcParams.fSTR = fSTR(attacker:getStat(tpz.mod.STR), target:getStat(tpz.mod.VIT), attacker:getWeaponDmgRank())
    calcParams.cratio = cratio
    calcParams.ccritratio = ccritratio
    calcParams.accStat = attacker:getACC()
    calcParams.melee = true
    calcParams.mustMiss = target:hasStatusEffect(tpz.effect.PERFECT_DODGE) or
                          (target:hasStatusEffect(tpz.effect.TOO_HIGH) and not wsParams.hitsHigh)
    calcParams.sneakApplicable = attacker:hasStatusEffect(tpz.effect.SNEAK_ATTACK) and
                                 (attacker:isBehind(target) or attacker:hasStatusEffect(tpz.effect.HIDE) or
                                 target:hasStatusEffect(tpz.effect.DOUBT))
    calcParams.taChar = taChar
    calcParams.trickApplicable = calcParams.taChar ~= nil
    calcParams.assassinApplicable = calcParams.trickApplicable and attacker:hasTrait(68)
    calcParams.guaranteedHit = calcParams.sneakApplicable or calcParams.trickApplicable
    calcParams.mightyStrikesApplicable = attacker:hasStatusEffect(tpz.effect.MIGHTY_STRIKES)
    calcParams.forcedFirstCrit = calcParams.sneakApplicable or calcParams.assassinApplicable
    calcParams.extraOffhandHit = attacker:isDualWielding() or attack.weaponType == tpz.skill.HAND_TO_HAND
    calcParams.hybridHit = wsParams.hybridWS
    calcParams.flourishEffect = attacker:getStatusEffect(tpz.effect.BUILDING_FLOURISH)
    calcParams.fencerBonus = fencerBonus(attacker)
    calcParams.bonusTP = wsParams.bonusTP or 0
    calcParams.bonusfTP = gorgetBeltFTP or 0
    calcParams.bonusAcc = (gorgetBeltAcc or 0) + attacker:getMod(tpz.mod.WSACC)
    calcParams.bonusWSmods = wsParams.bonusWSmods or 0
    calcParams.hitRate = attacker:getHitRate(target, 0, calcParams.bonusAcc)

    -- Send our wsParams off to calculate our raw WS damage, hits landed, and shadows absorbed
    calcParams = calculateRawWSDmg(attacker, target, wsID, tp, action, wsParams, calcParams)
    local finaldmg = calcParams.finalDmg
--	printf("weaponskills.lua doPhysicalWeaponskill  FINAL DMG: [%i]\n", finaldmg)

    -- Delete statuses that may have been spent by the WS
    attacker:delStatusEffectsByFlag(tpz.effectFlag.DETECTABLE)
    attacker:delStatusEffect(tpz.effect.SNEAK_ATTACK)
    attacker:delStatusEffectSilent(tpz.effect.BUILDING_FLOURISH)

    -- Calculate reductions
    if not wsParams.formless then
		-- Check for special damage reduction based on whether the mob is attacked from the front or behind
		if (target:getMod(tpz.mod.FRONTAL_DMG_REDUCTION) > 0 and attacker:isInfront(target, 64)) then
--			printf("weaponskills.lua doPhysicalWeaponskill FRONTAL DMG WS REDUCTION TRIGGERED  DAMAGE BEFORE: [%i]", finaldmg)
			finaldmg = finaldmg - (finaldmg * (target:getMod(tpz.mod.FRONTAL_DMG_REDUCTION) / 100))
--			printf("weaponskills.lua doPhysicalWeaponskill FRONTAL DMG WS REDUCTION TRIGGERED  DAMAGE AFTER: [%i]", finaldmg)
		elseif (target:getMod(tpz.mod.SIDE_DMG_REDUCTION) > 0 and not (attacker:isBehind(target, 64) or attacker:isInfront(target, 64))) then
--			printf("weaponskills.lua doPhysicalWeaponskill SIDE DMG WS REDUCTION TRIGGERED  DAMAGE BEFORE: [%i]", finaldmg)
			finaldmg = finaldmg - (finaldmg * (target:getMod(tpz.mod.SIDE_DMG_REDUCTION) / 100))
--			printf("weaponskills.lua doPhysicalWeaponskill SIDE DMG WS REDUCTION TRIGGERED  DAMAGE AFTER: [%i]", finaldmg)
		elseif (target:getMod(tpz.mod.REAR_DMG_REDUCTION) > 0 and attacker:isBehind(target, 64)) then
--			printf("weaponskills.lua doPhysicalWeaponskill REAR DMG WS REDUCTION TRIGGERED  DAMAGE BEFORE: [%i]", finaldmg)
			finaldmg = finaldmg - (finaldmg * (target:getMod(tpz.mod.REAR_DMG_REDUCTION) / 100))
--			printf("weaponskills.lua doPhysicalWeaponskill REAR DMG WS REDUCTION TRIGGERED  DAMAGE AFTER: [%i]", finaldmg)
		else
			finaldmg = target:physicalDmgTaken(finaldmg, attack.damageType)
		end
		
        if (attack.weaponType == tpz.skill.HAND_TO_HAND) then
            finaldmg = finaldmg * target:getMod(tpz.mod.HTHRES) / 1000
        elseif (attack.weaponType == tpz.skill.DAGGER or attack.weaponType == tpz.skill.POLEARM) then
            finaldmg = finaldmg * target:getMod(tpz.mod.PIERCERES) / 1000
        elseif (attack.weaponType == tpz.skill.CLUB or attack.weaponType == tpz.skill.STAFF) then
            finaldmg = finaldmg * target:getMod(tpz.mod.IMPACTRES) / 1000
        else
            finaldmg = finaldmg * target:getMod(tpz.mod.SLASHRES) / 1000
        end
    end

    finaldmg = finaldmg * WEAPON_SKILL_POWER -- Add server bonus
    
    local posorneg = math.random(0, 1) -- Sets the swing positive or negative
    local randomness = math.random(1,25) -- 25% swing range
    
    if (posorneg == 0) then
        randomness = ((100 + randomness) / 100)
    else
        randomness = ((100 - randomness) / 100)
    end
    
    finaldmg = finaldmg * randomness
	
	-- Handle DRG All Jumps: Adds % of wyvern's max HP as additional damage
	if (alljumpsdmg > 0 and alljumpsdmg ~= nil) then
		finaldmg = finaldmg + alljumpsdmg
	end
    
    calcParams.finalDmg = finaldmg
	
    finaldmg = takeWeaponskillDamage(target, attacker, wsParams, primaryMsg, attack, calcParams, action)
    return finaldmg, calcParams.criticalHit, calcParams.tpHitsLanded, calcParams.extraHitsLanded, calcParams.shadowsAbsorbed
end

-- Sets up the necessary calcParams for a ranged WS before passing it to calculateRawWSDmg. When the raw
-- damage is returned, handles reductions based on target resistances and passes off to takeWeaponskillDamage.
 function doRangedWeaponskill(attacker, target, wsID, wsParams, tp, action, primaryMsg)

    -- Determine cratio and ccritratio
    local ignoredDef = 0
    if (wsParams.ignoresDef == not nil and wsParams.ignoresDef == true) then
        ignoredDef = calculatedIgnoredDef(tp, target:getStat(tpz.mod.DEF), wsParams.ignored100, wsParams.ignored200, wsParams.ignored300)
    end
    local cratio, ccritratio = cRangedRatio(attacker, target, wsParams, ignoredDef, tp)

    -- Set up conditions and params used for calculating weaponskill damage
    local gorgetBeltFTP, gorgetBeltAcc = handleWSGorgetBelt(attacker)
    local attack =
    {
        ['type'] = tpz.attackType.RANGED,
        ['slot'] = tpz.slot.RANGED,
        ['weaponType'] = attacker:getWeaponSkillType(tpz.slot.RANGED),
        ['damageType'] = attacker:getWeaponDamageType(tpz.slot.RANGED)
    }
    local calcParams =
    {
        weaponDamage = {attacker:getRangedDmg()},
        fSTR = fSTR2(attacker:getStat(tpz.mod.STR), target:getStat(tpz.mod.VIT), attacker:getRangedDmgRank()),
        cratio = cratio,
        ccritratio = ccritratio,
        accStat = attacker:getRACC(),
        melee = false,
        mustMiss = false,
        sneakApplicable = false,
        trickApplicable = false,
        assassinApplicable = false,
        mightyStrikesApplicable = false,
        forcedFirstCrit = false,
        extraOffhandHit = false,
        flourishEffect = false,
        fencerBonus = fencerBonus(attacker),
        bonusTP = wsParams.bonusTP or 0,
        bonusfTP = gorgetBeltFTP or 0,
        bonusAcc = (gorgetBeltAcc or 0) + attacker:getMod(tpz.mod.WSACC),
        bonusWSmods = wsParams.bonusWSmods or 0
    }
    calcParams.hitRate = attacker:getRangedHitRate(target, bonusAcc)

    -- Send our params off to calculate our raw WS damage, hits landed, and shadows absorbed
    calcParams = calculateRawWSDmg(attacker, target, wsID, tp, action, wsParams, calcParams)
    local finaldmg = calcParams.finalDmg

    -- Calculate reductions
    finaldmg = target:rangedDmgTaken(finaldmg)
    finaldmg = finaldmg * target:getMod(tpz.mod.PIERCERES) / 1000

    finaldmg = finaldmg * WEAPON_SKILL_POWER -- Add server bonus
    
    local posorneg = math.random(0, 1) -- Sets the swing positive or negative
    local randomness = math.random(1,25) -- 25% swing range
    
    if (posorneg == 0) then
        randomness = ((100 + randomness) / 100)
    else
        randomness = ((100 - randomness) / 100)
    end
    
    finaldmg = finaldmg * randomness
    
    calcParams.finalDmg = finaldmg
    finaldmg = takeWeaponskillDamage(target, attacker, wsParams, primaryMsg, attack, calcParams, action)
    return finaldmg, calcParams.criticalHit, calcParams.tpHitsLanded, calcParams.extraHitsLanded, calcParams.shadowsAbsorbed
end

-- params: ftp100, ftp200, ftp300, wsc_str, wsc_dex, wsc_vit, wsc_agi, wsc_int, wsc_mnd, wsc_chr,
--         ele (tpz.magic.ele.FIRE), skill (tpz.skill.STAFF)

function doMagicWeaponskill(attacker, target, wsID, wsParams, tp, action, primaryMsg)

    -- Set up conditions and wsParams used for calculating weaponskill damage
    local attack =
    {
        ['type'] = tpz.attackType.MAGICAL,
        ['slot'] = tpz.slot.MAIN,
        ['weaponType'] = attacker:getWeaponSkillType(tpz.slot.MAIN),
        ['damageType'] = tpz.damageType.ELEMENTAL + wsParams.ele
    }
    local calcParams =
    {
        ['shadowsAbsorbed'] = 0,
        ['tpHitsLanded'] = 1,
        ['extraHitsLanded'] = 0,
        ['bonusTP'] = wsParams.bonusTP or 0
    }
	
	local weaponLevel = 0
	local baseDMG = 0
	
	if (attacker:isPC()) then
		if (wsParams.skill == tpz.skill.MARKSMANSHIP or wsParams.skill == tpz.skill.ARCHERY) then
			local rangedWeaponID = attacker:getEquipID(tpz.slot.RANGED)
			local rangedItem = GetItem(rangedWeaponID)
			
			baseDMG = attacker:getRangedDmg()
			weaponLevel = rangedItem:getReqLvl()
			
			-- if (attacker:getName() == "Las" or attacker:getName() == "Testranged") then
				-- printf("weaponskills.lua doMagicWeaponskill RANGED DMG: [%i]  AMMO DMG: [%i]", attacker:getRangedDmg(), attacker:getAmmoDmg())
			-- end
			
			if (attacker:getGearILvl(rangedWeaponID) > weaponLevel) then
				weaponLevel = attacker:getGearILvl(rangedWeaponID)
			end
		else
			local WeaponID = attacker:getEquipID(tpz.slot.MAIN)
			local meleeItem = GetItem(WeaponID)
			
			baseDMG = attacker:getWeaponDmg() + attacker:getOffhandDmg()
			weaponLevel = meleeItem:getReqLvl()
			
			if (attacker:getGearILvl(WeaponID) > weaponLevel) then
				weaponLevel = attacker:getGearILvl(WeaponID)
			end
		end
	end
	
	-- if (attacker:getName() == "Las" or attacker:getName() == "Testranged") then
		-- printf("weaponskills.lua doMagicWeaponskill BASE DMG: [%i]", baseDMG)
	-- end
	
	local bonusfTP, bonusacc = handleWSGorgetBelt(attacker)
	bonusacc = bonusacc + attacker:getMod(tpz.mod.WSACC)
	
    local dmg = 0

    -- Magic-based WSes never miss, so we don't need to worry about calculating a miss, only if a shadow absorbed it.
    if not shadowAbsorb(target) then

        -- Begin Checks for bonus wsc bonuses. See the following for details:
        -- https://www.bg-wiki.com/bg/Utu_Grip
        -- https://www.bluegartr.com/threads/108199-Random-Facts-Thread-Other?p=6826618&viewfull=1#post6826618
    
        if attacker:getMod(tpz.mod.WS_STR_BONUS) > 0 then
            wsParams.str_wsc = wsParams.str_wsc + (attacker:getMod(tpz.mod.WS_STR_BONUS) / 100)
        end

        if attacker:getMod(tpz.mod.WS_DEX_BONUS) > 0 then
            wsParams.dex_wsc = wsParams.dex_wsc + (attacker:getMod(tpz.mod.WS_DEX_BONUS) / 100)
        end

        if attacker:getMod(tpz.mod.WS_VIT_BONUS) > 0 then
            wsParams.vit_wsc = wsParams.vit_wsc + (attacker:getMod(tpz.mod.WS_VIT_BONUS) / 100)
        end

        if attacker:getMod(tpz.mod.WS_AGI_BONUS) > 0 then
            wsParams.agi_wsc = wsParams.agi_wsc + (attacker:getMod(tpz.mod.WS_AGI_BONUS) / 100)
        end

        if attacker:getMod(tpz.mod.WS_INT_BONUS) > 0 then
            wsParams.int_wsc = wsParams.int_wsc + (attacker:getMod(tpz.mod.WS_INT_BONUS) / 100)
        end

        if attacker:getMod(tpz.mod.WS_MND_BONUS) > 0 then
            wsParams.mnd_wsc = wsParams.mnd_wsc + (attacker:getMod(tpz.mod.WS_MND_BONUS) / 100)
        end

        if attacker:getMod(tpz.mod.WS_CHR_BONUS) > 0 then
            wsParams.chr_wsc = wsParams.chr_wsc + (attacker:getMod(tpz.mod.WS_CHR_BONUS) / 100)
        end
			 
		local WSC = (attacker:getStat(tpz.mod.STR) * wsParams.str_wsc + attacker:getStat(tpz.mod.DEX) * wsParams.dex_wsc +
					 attacker:getStat(tpz.mod.VIT) * wsParams.vit_wsc + attacker:getStat(tpz.mod.AGI) * wsParams.agi_wsc +
					 attacker:getStat(tpz.mod.INT) * wsParams.int_wsc + attacker:getStat(tpz.mod.MND) * wsParams.mnd_wsc +
					 attacker:getStat(tpz.mod.CHR) * wsParams.chr_wsc)

        -- Applying fTP multiplier
        local ftp = fTP(tp, wsParams.ftp100, wsParams.ftp200, wsParams.ftp300) + bonusfTP

		wsParams.specialWSDMG = wsParams.specialWSDMG or 0

        -- Factor in "all hits" bonus damage mods
        local bonusdmg = attacker:getMod(tpz.mod.ALL_WSDMG_ALL_HITS) -- ALL_WS_DMG_ALL_HITS for all WS's
        if (attacker:getMod(tpz.mod.WEAPONSKILL_DAMAGE_BASE + wsID) > 0) then -- For specific WS
            bonusdmg = bonusdmg + attacker:getMod(tpz.mod.WEAPONSKILL_DAMAGE_BASE + wsID)
        end
        
        -- Apply Yaegasumi WS Bonus
        local YaegasumiBonus = attacker:getMod(tpz.mod.YAEGASUMI_WS_BONUS)
        bonusdmg = bonusdmg + YaegasumiBonus

		local dSTAT = wsParams.dSTAT or 1
		local magicDamage = attacker:getMod(tpz.mod.MAGIC_DAMAGE)
		local levelMod = math.floor((weaponLevel - 99) * 2.45)
		
		if (levelMod < 0) then
			levelMod = 0
		end

		-- if (attacker:getName() == "Las" or attacker:getName() == "Testranged") then
			-- printf("weaponskills.lua doMagicWeaponskill BASE DMG: [%i]  LEVEL MOD: [%i]  WSC: [%f]  FTP: [%f]  DSTAT: [%i]  MAGIC DAMAGE: [%i]", baseDMG, levelMod, WSC, ftp, dSTAT, magicDamage)
		-- end

		dmg = (baseDMG + levelMod + WSC) * ftp + dSTAT + magicDamage
		
		-- Add in bonusdmg
        dmg = dmg * ((100 + bonusdmg) / 100) -- Apply our "all hits" WS dmg bonuses
        dmg = dmg + ((dmg * attacker:getMod(tpz.mod.ALL_WSDMG_FIRST_HIT) + wsParams.specialWSDMG) / 100) -- Add in our "first hit" WS dmg bonus

		-- if (attacker:getName() == "Las" or attacker:getName() == "Testranged") then
			-- printf("weaponskills.lua doMagicWeaponskill MAGIC WS DMG 1: [%i]", dmg)
		-- end

        -- Calculate magical bonuses and reductions
        dmg = addBonusesAbility(attacker, wsParams.ele, target, dmg, wsParams)
		
		-- if (attacker:getName() == "Las" or attacker:getName() == "Testranged") then
			-- printf("weaponskills.lua doMagicWeaponskill MAGIC WS DMG 2: [%i]", dmg)
		-- end
		
        dmg = dmg * applyResistanceAbility(attacker, target, wsParams.ele, wsParams.skill, bonusacc)
		
		-- if (attacker:getName() == "Las" or attacker:getName() == "Testranged") then
			-- printf("weaponskills.lua doMagicWeaponskill MAGIC WS DMG 3: [%i]", dmg)
		-- end
		
        dmg = target:magicDmgTaken(dmg)
		
		-- if (attacker:getName() == "Las" or attacker:getName() == "Testranged") then
			-- printf("weaponskills.lua doMagicWeaponskill MAGIC WS DMG 4: [%i]", dmg)
		-- end
		
        dmg = adjustForTarget(target, dmg, wsParams.ele)
		
		-- if (attacker:getName() == "Las" or attacker:getName() == "Testranged") then
			-- printf("weaponskills.lua doMagicWeaponskill MAGIC WS DMG 5: [%i]", dmg)
		-- end

        dmg = dmg * WEAPON_SKILL_POWER -- Add server bonus
    else
        calcParams.shadowsAbsorbed = 1
    end
    
    local posorneg = math.random(0, 1) -- Sets the swing positive or negative
    local randomness = math.random(1, 10) -- 10% swing range
    
    if (posorneg == 0) then
        randomness = ((100 + randomness) / 100)
    else
        randomness = ((100 - randomness) / 100)
    end
    
    dmg = dmg * randomness
	
	-- if (attacker:getName() == "Las" or attacker:getName() == "Testranged") then
		-- printf("weaponskills.lua doMagicWeaponskill MAGIC WS DMG 6: [%i]", dmg)
	-- end

    calcParams.finalDmg = dmg
    dmg = takeWeaponskillDamage(target, attacker, wsParams, primaryMsg, attack, calcParams, action)
    return dmg, calcParams.criticalHit, calcParams.tpHitsLanded, calcParams.extraHitsLanded, calcParams.shadowsAbsorbed
end

-- After WS damage is calculated and damage reduction has been taken into account by the calling function,
-- handles displaying the appropriate action/message, delivering the damage to the mob, and any enmity from it
function takeWeaponskillDamage(defender, attacker, wsParams, primaryMsg, attack, wsResults, action)
    local finaldmg = wsResults.finalDmg
    if wsResults.tpHitsLanded + wsResults.extraHitsLanded > 0 then
        if finaldmg >= 0 then
            if primaryMsg then
                action:messageID(defender:getID(), tpz.msg.basic.DAMAGE)
            else
                action:messageID(defender:getID(), tpz.msg.basic.DAMAGE_SECONDARY)
            end

            if finaldmg > 0 then
                action:reaction(defender:getID(), tpz.reaction.HIT)
                action:speceffect(defender:getID(), tpz.specEffect.RECOIL)
            end
        else
            if primaryMsg then
                action:messageID(defender:getID(), tpz.msg.basic.SELF_HEAL)
            else
                action:messageID(defender:getID(), tpz.msg.basic.SELF_HEAL_SECONDARY)
            end
        end
        action:param(defender:getID(), finaldmg)
    elseif wsResults.shadowsAbsorbed > 0 then
        action:messageID(defender:getID(), tpz.msg.basic.SHADOW_ABSORB)
        action:param(defender:getID(), wsResults.shadowsAbsorbed)
    else
        if primaryMsg then
            action:messageID(defender:getID(), tpz.msg.basic.SKILL_MISS)
        else
            action:messageID(defender:getID(), tpz.msg.basic.EVADES)
        end
        action:reaction(defender:getID(), tpz.reaction.EVADE)
    end
    local targetTPMult = wsParams.targetTPMult or 1
    finaldmg = defender:takeWeaponskillDamage(attacker, finaldmg, attack.type, attack.damageType, attack.slot, primaryMsg, wsResults.tpHitsLanded, (wsResults.extraHitsLanded * 10) + wsResults.bonusTP, targetTPMult)
    local enmityEntity = wsResults.taChar or attacker
    if (wsParams.overrideCE and wsParams.overrideVE) then
        defender:addEnmity(enmityEntity, wsParams.overrideCE, wsParams.overrideVE)
    else
        local enmityMult = wsParams.enmityMult or 1
        defender:updateEnmityFromDamage(enmityEntity, finaldmg * enmityMult)
    end

    return finaldmg
end

function fencerBonus(attacker)
    if attacker:getObjType() ~= tpz.objType.PC then
        return 0
    end

    local mainEquip = attacker:getStorageItem(0, 0, tpz.slot.MAIN)
    if mainEquip and not mainEquip:isTwoHanded() and not mainEquip:isHandToHand() then
        local subEquip = attacker:getStorageItem(0, 0, tpz.slot.SUB)
        if subEquip == nil or subEquip:getSkillType() == tpz.skill.NONE or subEquip:isShield() then
            return attacker:getMod(tpz.mod.FENCER_CRITHITRATE) / 100
        end
    end
    return 0
end

function souleaterBonus(attacker, numhits)
    if attacker:hasStatusEffect(tpz.effect.SOULEATER) then
        local damage = 0
        local percent = 0.1
        if attacker:getMainJob() ~= tpz.job.DRK then
            percent = percent / 2
        end
        percent = percent + math.min(0.02, 0.01 * attacker:getMod(tpz.mod.SOULEATER_EFFECT))

        local hitscounted = 0
        while (hitscounted < numhits) do
            local health = attacker:getHP()
            if health > 10 then
                damage = damage + health*percent
            end
            hitscounted = hitscounted + 1
        end
        attacker:delHP(numhits*0.10*attacker:getHP())
        return damage
    else
        return 0
    end
end

function accVariesWithTP(hitrate, acc, tp, a1, a2, a3)
    -- sadly acc varies with tp ALL apply an acc PENALTY, the acc at various %s are given as a1 a2 a3
    accpct = fTP(tp, a1, a2, a3)
    acclost = acc - (acc*accpct)
    hrate = hitrate - (0.005*acclost)
    -- cap it
    if (hrate>0.95) then
        hrate = 0.95
    end
    if (hrate<0.2) then
        hrate = 0.2
    end
    return hrate
end

-- Helper function to get Main damage depending on weapon type
function getMeleeDmg(attacker, weaponType, kick)
    local mainhandDamage = attacker:getWeaponDmg()
    local offhandDamage = attacker:getOffhandDmg()

    if weaponType == tpz.skill.HAND_TO_HAND or weaponType == tpz.skill.NONE then
        local h2hSkill = attacker:getSkillLevel(1) * 0.11 + 3

        if kick and attacker:hasStatusEffect(tpz.effect.FOOTWORK) then
            mainhandDamage = attacker:getMod(tpz.mod.KICK_DMG) -- Use Kick damage if footwork is on
        end

        mainhandDamage = mainhandDamage + h2hSkill
        offhandDamage = mainhandDamage
    end

    return {mainhandDamage, offhandDamage}
end

function fTP(tp, ftp1, ftp2, ftp3)
    if (tp >= 1000 and tp < 2000) then
        return ftp1 + ( ((ftp2 - ftp1) / 1000) * (tp - 1000))
    elseif (tp >= 2000 and tp <= 3500) then
        -- generate a straight line between ftp2 and ftp3 and find point @ tp
        return ftp2 + ( ((ftp3 - ftp2) / 1000) * (tp - 2000))
    else
        print("fTP error: TP value is not between 1000-3000! TP VALUE: [%i]", tp)
    end
    return 1 -- no ftp mod
end

function calculatedIgnoredDef(tp, def, ignore1, ignore2, ignore3)
    if (tp >= 1000 and tp < 2000) then
        return (ignore1 + ( ((ignore2 - ignore1) / 1000) * (tp - 1000))) * def
    elseif (tp >= 2000 and tp <= 3000) then
        return (ignore2 + ( ((ignore3 - ignore2) / 1000) * (tp - 2000))) * def
    end
    return 1 -- no def ignore mod
end

-- Given the raw ratio value (atk/def) and levels, returns the cRatio (min then max)
function cMeleeRatio(attacker, defender, params, ignoredDef, tp)
    local mainLvl = attacker:getMainLvl()
    local defLvl = defender:getMainLvl()
--    local attackerILvl = attacker:getWeaponSkillLevel(tpz.slot.MAIN)

	if (attacker:getObjType() == tpz.objType.PC) then
		mainLvl = mainLvl + attacker:getItemLevel()
	end

    local flourisheffect = attacker:getStatusEffect(tpz.effect.BUILDING_FLOURISH)
    if flourisheffect ~= nil and flourisheffect:getPower() > 1 then
        attacker:addMod(tpz.mod.ATTP, 25 + flourisheffect:getSubPower() / 2)
    end
--	printf("weaponskills.lua cMeleeRTio ATTACKER: [%s]", attacker:getName())
    local atkmulti = fTP(tp, params.atk100, params.atk200, params.atk300)
    local cratio = (attacker:getStat(tpz.mod.ATT) * atkmulti) / (defender:getStat(tpz.mod.DEF) - ignoredDef)
	
    cratio = utils.clamp(cratio, 0, 2.25)
	
    if flourisheffect ~= nil and flourisheffect:getPower() > 1 then
        attacker:delMod(tpz.mod.ATTP, 25 + flourisheffect:getSubPower() / 2)
    end
	
    local levelcor = 0
    
    -- if (attackerILvl > 203) then
        -- mainLvl = 119
    -- elseif(attackerILvl > 177) then
        -- mainLvl = 115
    -- elseif(attackerILvl > 153) then
        -- mainLvl = 113
    -- elseif(attackerILvl > 102) then
        -- mainLvl = 109
    -- elseif(attackerILvl > 89) then
        -- mainLvl = 108
    -- elseif(attackerILvl > 76) then
        -- mainLvl = 107
    -- elseif(attackerILvl > 63) then
        -- mainLvl = 106
    -- elseif(attackerILvl > 51) then
        -- mainLvl = 105
    -- end
    
   if (defLvl < 130) and (mainLvl < defLvl) then
        levelcor = 0.05 * (defLvl - mainLvl)
    elseif (defLvl > 130) and (mainLvl < defLvl) then
        levelcor = 0.55
    end

    cratio = cratio - levelcor

    if cratio < 0 then
        cratio = 0
    end
    local pdifmin = 0
    local pdifmax = 0

    -- max

    if cratio < 0.5 then
        pdifmax = cratio + 0.5
    elseif cratio < 0.7 then
        pdifmax = 1
    elseif cratio < 1.2 then
        pdifmax = cratio + 0.3
    elseif cratio < 1.5 then
        pdifmax = cratio * 0.25 + cratio
    elseif cratio < 2.625 then
        pdifmax = cratio + 0.375
    else
        pdifmax = 3
    end
    -- min

    if cratio < 0.38 then
        pdifmin = 0
    elseif (cratio < 1.25) then
        pdifmin = cratio * 1176 / 1024 - 448 / 1024
    elseif cratio < 1.51 then
        pdifmin = 1
    elseif cratio < 2.44 then
        pdifmin = cratio * 1176 / 1024 - 775 / 1024
    else
        pdifmin = cratio - 0.375
    end

    local pdif = {}
    pdif[1] = pdifmin
    pdif[2] = pdifmax

    local pdifcrit = {}
    cratio = cratio + 1
    cratio = utils.clamp(cratio, 0, 3)

--    printf("ratio: %f min: %f max %f", cratio, pdifmin, pdifmax)

    if cratio < 0.5 then
        pdifmax = cratio + 0.5
    elseif cratio < 0.7 then
        pdifmax = 1
    elseif (cratio < 1.2) then
        pdifmax = cratio + 0.3
    elseif cratio < 1.5 then
        pdifmax = cratio * 0.25 + cratio
    elseif cratio < 2.625 then
        pdifmax = cratio + 0.375
    else
        pdifmax = 3
    end
    -- min

    if cratio < 0.38 then
        pdifmin = 0
    elseif cratio < 1.25 then
        pdifmin = cratio * 1176 / 1024 - 448 / 1024
    elseif cratio < 1.51 then
        pdifmin = 1
    elseif cratio < 2.44 then
        pdifmin = cratio * 1176 / 1024 - 775 / 1024
    else
        pdifmin = cratio - 0.375
    end

    local critbonus = attacker:getMod(tpz.mod.CRIT_DMG_INCREASE) - defender:getMod(tpz.mod.CRIT_DEF_BONUS)
    critbonus = utils.clamp(critbonus, 0, 100)
    pdifcrit[1] = pdifmin * (100 + critbonus) / 100
    pdifcrit[2] = pdifmax * (100 + critbonus) / 100

    return pdif, pdifcrit
end

function cRangedRatio(attacker, defender, params, ignoredDef, tp)
    local mainLvl = attacker:getMainLvl()
    local defLvl = defender:getMainLvl()
    local attackerILvl = attacker:getWeaponSkillLevel(tpz.slot.MAIN)

    local atkmulti = fTP(tp, params.atk100, params.atk200, params.atk300)
    local cratio = attacker:getRATT() / (defender:getStat(tpz.mod.DEF) - ignoredDef)

    local levelcor = 0
    
    if (attackerILvl > 203) then
        mainLvl = 119
    elseif(attackerILvl > 177) then
        mainLvl = 115
    elseif(attackerILvl > 153) then
        mainLvl = 113
    elseif(attackerILvl > 102) then
        mainLvl = 109
    elseif(attackerILvl > 89) then
        mainLvl = 108
    elseif(attackerILvl > 76) then
        mainLvl = 107
    elseif(attackerILvl > 63) then
        mainLvl = 106
    elseif(attackerILvl > 51) then
        mainLvl = 105
    end
    
    if (defLvl < 130) and (mainLvl < defLvl) then
        levelcor = 0.025 * (defLvl - mainLvl)
    elseif (defLvl > 130) and (mainLvl < defLvl) then
        levelcor = 0.275
    end

    cratio = cratio - levelcor

    cratio = cratio * atkmulti

    if (cratio > 3 - levelcor) then
        cratio = 3 - levelcor
    end

    if (cratio < 0) then
        cratio = 0
    end

    -- max
    local pdifmax = 0
    if (cratio < 0.9) then
        pdifmax = cratio * (10/9)
    elseif (cratio < 1.1) then
        pdifmax = 1
    else
        pdifmax = cratio
    end

    -- min
    local pdifmin = 0
    if (cratio < 0.9) then
        pdifmin = cratio
    elseif (cratio < 1.1) then
        pdifmin = 1
    else
        pdifmin = (cratio * (20/19))-(3/19)
    end

    pdif = {}
    pdif[1] = pdifmin
    pdif[2] = pdifmax
    -- printf("ratio: %f min: %f max %f\n", cratio, pdifmin, pdifmax)
    pdifcrit = {}

    pdifmin = pdifmin * 1.25
    pdifmax = pdifmax * 1.25

    pdifcrit[1] = pdifmin
    pdifcrit[2] = pdifmax

    return pdif, pdifcrit

end

-- Given the attacker's str and the mob's vit, fSTR is calculated (for melee WS)
function fSTR(atk_str, def_vit, weapon_rank)
    local dSTR = atk_str - def_vit
    local fSTR = 0
    if (dSTR >= 12) then
        fSTR = (dSTR + 4) / 4
    elseif (dSTR >= 6) then
        fSTR = (dSTR + 6) / 4
    elseif (dSTR >= 1) then
        fSTR = (dSTR + 7) / 4
    elseif (dSTR >= -2) then
        fSTR = (dSTR + 8) / 4
    elseif (dSTR >= -7) then
        fSTR = (dSTR + 9) / 4
    elseif (dSTR >= -15) then
        fSTR = (dSTR + 10) / 4
    elseif (dSTR >= -21) then
        fSTR = (dSTR + 12) / 4
    else
        fSTR = (dSTR + 13) / 4
    end

    -- Apply fSTR caps.
    local lower_cap = weapon_rank * -1
    if weapon_rank == 0 then
        lower_cap = -1
    end
    fSTR = utils.clamp(fSTR, lower_cap, weapon_rank + 8)
    return fSTR
end

-- Given the attacker's str and the mob's vit, fSTR2 is calculated (for ranged WS)
function fSTR2(atk_str, def_vit, weapon_rank)
    local dSTR = atk_str - def_vit
    local fSTR2 = 0
    if (dSTR >= 12) then
        fSTR2 = (dSTR + 4) / 2
    elseif (dSTR >= 6) then
        fSTR2 = (dSTR + 6) / 2
    elseif (dSTR >= 1) then
        fSTR2 = (dSTR + 7) / 2
    elseif (dSTR >= -2) then
        fSTR2 = (dSTR + 8) / 2
    elseif (dSTR >= -7) then
        fSTR2 = (dSTR + 9) / 2
    elseif (dSTR >= -15) then
        fSTR2 = (dSTR + 10) / 2
    elseif (dSTR >= -21) then
        fSTR2 = (dSTR + 12) / 2
    else
        fSTR2 = (dSTR + 13) / 2
    end

    -- Apply fSTR2 caps.
    local lower_cap = weapon_rank * -2
    if weapon_rank == 0 then
        lower_cap = -2
    elseif weapon_rank == 1 then
        lower_cap = -3
    end
    fSTR2 = utils.clamp(fSTR2, lower_cap, (weapon_rank + 8) * 2)
    return fSTR2
end

-- Obtains alpha, used for working out WSC on legacy servers
function getAlpha(level)
    -- Retail has no alpha anymore as of 2014. Weaponskill functions
    -- should be checking for USE_ADOULIN_WEAPON_SKILL_CHANGES and
    -- overwriting the results of this function if the server has it set
    alpha = 1.00
    if (level <= 5) then
        alpha = 1.00
    elseif (level <= 11) then
        alpha = 0.99
    elseif (level <= 17) then
        alpha = 0.98
    elseif (level <= 23) then
        alpha = 0.97
    elseif (level <= 29) then
        alpha = 0.96
    elseif (level <= 35) then
        alpha = 0.95
    elseif (level <= 41) then
        alpha = 0.94
    elseif (level <= 47) then
        alpha = 0.93
    elseif (level <= 53) then
        alpha = 0.92
    elseif (level <= 59) then
        alpha = 0.91
    elseif (level <= 61) then
        alpha = 0.90
    elseif (level <= 63) then
        alpha = 0.89
    elseif (level <= 65) then
        alpha = 0.88
    elseif (level <= 67) then
        alpha = 0.87
    elseif (level <= 69) then
        alpha = 0.86
    elseif (level <= 71) then
        alpha = 0.85
    elseif (level <= 73) then
        alpha = 0.84
    elseif (level <= 75) then
        alpha = 0.83
    elseif (level < 99) then
        alpha = 0.85
    else
        alpha = 1
    end
    return alpha
end

function getMultiAttacks(attacker, target, numHits)
    local bonusHits = 0
    local multiChances = 1
    local doubleRate = (attacker:getMod(tpz.mod.DOUBLE_ATTACK) + attacker:getMerit(tpz.merit.DOUBLE_ATTACK_RATE))/100
    local tripleRate = (attacker:getMod(tpz.mod.TRIPLE_ATTACK) + attacker:getMerit(tpz.merit.TRIPLE_ATTACK_RATE))/100
    local quadRate = attacker:getMod(tpz.mod.QUAD_ATTACK)/100
    local oaThriceRate = attacker:getMod(tpz.mod.MYTHIC_OCC_ATT_THRICE)/100
    local oaTwiceRate = attacker:getMod(tpz.mod.MYTHIC_OCC_ATT_TWICE)/100

    -- Add Ambush Augments to Triple Attack
    if (attacker:hasTrait(76) and attacker:isBehind(target, 23)) then -- TRAIT_AMBUSH
        tripleRate = tripleRate + attacker:getMerit(tpz.merit.AMBUSH) / 3 -- Value of Ambush is 3 per mert, augment gives +1 Triple Attack per merit
    end

    -- QA/TA/DA can only proc on the first hit of each weapon or each fist
    if (attacker:getOffhandDmg() > 0 or attacker:getWeaponSkillType(tpz.slot.MAIN) == tpz.skill.HAND_TO_HAND) then
        multiChances = 2
    end

    for i = 1, multiChances, 1 do
        if math.random() < quadRate then
            bonusHits = bonusHits + 3
        elseif math.random() < tripleRate then
            bonusHits = bonusHits + 2
        elseif math.random() < doubleRate then
            bonusHits = bonusHits + 1
        elseif (i == 1 and math.random() < oaThriceRate) then -- Can only proc on first hit
            bonusHits = bonusHits + 2
        elseif (i == 1 and math.random() < oaTwiceRate) then -- Can only proc on first hit
            bonusHits = bonusHits + 1
        end
        if (i == 1) then
            attacker:delStatusEffect(tpz.effect.ASSASSINS_CHARGE)
            attacker:delStatusEffect(tpz.effect.WARRIOR_S_CHARGE)

            -- recalculate DA/TA/QA rate
            doubleRate = (attacker:getMod(tpz.mod.DOUBLE_ATTACK) + attacker:getMerit(tpz.merit.DOUBLE_ATTACK_RATE))/100
            tripleRate = (attacker:getMod(tpz.mod.TRIPLE_ATTACK) + attacker:getMerit(tpz.merit.TRIPLE_ATTACK_RATE))/100
            quadRate = attacker:getMod(tpz.mod.QUAD_ATTACK)/100
        end
    end

    if ((numHits + bonusHits ) > 8) then
        return 8
    end
    return numHits + bonusHits
end

function generatePdif (cratiomin, cratiomax, melee)
    local pdif = math.random(cratiomin*1000, cratiomax*1000) / 1000
    if (melee) then
        pdif = pdif * (math.random(100, 105)/100)
    end
    return pdif
end

function getStepAnimation(skill)
    if skill <= 1 then
        return 15
    elseif skill <= 3 then
        return 14
    elseif skill == 4 then
        return 19
    elseif skill == 5 then
        return 16
    elseif skill <= 7 then
        return 18
    elseif skill == 8 then
        return 20
    elseif skill == 9 then
        return 21
    elseif skill == 10 then
        return 22
    elseif skill == 11 then
        return 17
    elseif skill == 12 then
        return 23
    else
        return 0
    end
end

function getFlourishAnimation(skill)
    if skill <= 1 then
        return 25
    elseif skill <= 3 then
        return 24
    elseif skill == 4 then
        return 29
    elseif skill == 5 then
        return 26
    elseif skill <= 7 then
        return 28
    elseif skill == 8 then
        return 30
    elseif skill == 9 then
        return 31
    elseif skill == 10 then
        return 32
    elseif skill == 11 then
        return 27
    elseif skill == 12 then
        return 33
    else
        return 0
    end
end



function handleWSGorgetBelt(attacker)
    local ftpBonus = 0
    local accBonus = 0
	local dayElement = VanadielDayOfTheWeek() + 1 -- Increase value by 1 to align with elemental table (normally a range of 0-7)
	
    if (attacker:getObjType() == tpz.objType.PC) then
		local wsElement = 0
		local elementalFTPEquip = {tpz.mod.SC_FTP_LIQUEFACTION, tpz.mod.SC_FTP_INDURATION, tpz.mod.SC_FTP_DETONATION, tpz.mod.SC_FTP_SCISSION,
								   tpz.mod.SC_FTP_IMPACTION, tpz.mod.SC_FTP_REVERBERATION, tpz.mod.SC_FTP_TRANSFIXION, tpz.mod.SC_FTP_COMPRESSION}
		local SCProp1, SCProp2, SCProp3 = attacker:getWSSkillchainProp()
		
		-- if (attacker:getName() == "Khalum") then
			-- printf("weaponskills.lua handleWSGorgetBelt SC PROP 1: [%i]  SC PROP 2: [%i]  SC PROP 3: [%i]", SCProp1, SCProp2, SCProp3)
		-- end
		
		if (SCProp1 == nil) then
			SCProp1 = 0
		end
		
		if (SCProp2 == nil) then
			SCProp2 = 0
		end
		
		if (SCProp3 == nil) then
			SCProp3 = 0
		end
		
		for i = 1, 8 do
			if (attacker:getMod(elementalFTPEquip[i]) > 0) then
				wsElement = i
				break
			end
		end
		
		-- Elemental Gorgets & Belts
		if (doesElementMatchWeaponskill(wsElement, SCProp1) or doesElementMatchWeaponskill(wsElement, SCProp2) or doesElementMatchWeaponskill(wsElement, SCProp3)) then
			-- if (attacker:getName() == "Khalum") then
				-- printf("weaponskills.lua handleWSGorgetBelt SINGLE ELEMENT BELT/GORGET TRIGGERED FTP BONUS: [%i]  WS ELEMENT: [%i]", ftpBonus, wsElement)
			-- end
			accBonus = accBonus + attacker:getMod(elementalFTPEquip[wsElement])
			ftpBonus = ftpBonus + (attacker:getMod(elementalFTPEquip[wsElement]) * 3.5 / 100)
			-- if (attacker:getName() == "Khalum") then
				-- printf("weaponskills.lua handleWSGorgetBelt SINGLE ELEMENT BELT/GORGET FTP BONUS: [%1.2f]", ftpBonus)
			-- end
		end
		
		-- Fotia Gorget & Belt
		if (attacker:getMod(tpz.mod.SC_FTP_ALL) > 0) then
			-- if (attacker:getName() == "Khalum") then
				-- printf("weaponskills.lua handleWSGorgetBelt ALL ELEMENT BELT/GORGET TRIGGERED FTP BONUS: [%i]", ftpBonus)
			-- end
			accBonus = accBonus + attacker:getMod(tpz.mod.SC_FTP_ALL)
			ftpBonus = ftpBonus + (attacker:getMod(tpz.mod.SC_FTP_ALL) / 100)
			-- if (attacker:getName() == "Khalum") then
				-- printf("weaponskills.lua handleWSGorgetBelt ALL ELEMENT BELT/GORGET FTP BONUS: [%1.2f]", ftpBonus)
			-- end
		end
		
		-- Athos's Gloves, Mekira-oto, Mekira-oto +1, Gavialis Helm
		if (attacker:getMod(tpz.mod.WS_DAY_FTP_ALL) > 0 and
		    doesElementMatchWeaponskill(dayElement, SCProp1) or doesElementMatchWeaponskill(dayElement, SCProp2) or doesElementMatchWeaponskill(dayElement, SCProp3)) then
			-- if (attacker:getName() == "Khalum") then
				-- printf("weaponskills.lua handleWSGorgetBelt ELEMENT DAY GEAR TRIGGERED FTP BONUS: [%i]", ftpBonus)
			-- end
			accBonus = accBonus + attacker:getMod(tpz.mod.WS_DAY_FTP_ALL)
			ftpBonus = ftpBonus + (attacker:getMod(tpz.mod.WS_DAY_FTP_ALL) / 100)
			-- if (attacker:getName() == "Khalum") then
				-- printf("weaponskills.lua handleWSGorgetBelt ELEMENT DAY GEAR FTP BONUS: [%1.2f]", ftpBonus)
			-- end
		end
    end
	
	-- printf("weaponskills.lua handleWSGorgetBelt ACC BONUS: [%i]  FTP BONUS: [%1.2f]  DAY ELEMENT: [%s]", accBonus, ftpBonus, dayElement)
	
    return ftpBonus, accBonus
end

function shadowAbsorb(target)
    local targShadows = target:getMod(tpz.mod.UTSUSEMI)
    local shadowType = tpz.mod.UTSUSEMI

    if targShadows == 0 then
        if math.random() < 0.8 then
            targShadows = target:getMod(tpz.mod.BLINK)
            shadowType = tpz.mod.BLINK
        end
    end

    if targShadows > 0 then
        if shadowType == tpz.mod.UTSUSEMI then
            local effect = target:getStatusEffect(tpz.effect.COPY_IMAGE)
            if effect then
                if targShadows - 1 == 1 then
                    effect:setIcon(tpz.effect.COPY_IMAGE)
                elseif targShadows - 1 == 2 then
                    effect:setIcon(tpz.effect.COPY_IMAGE_2)
                elseif targShadows - 1 == 3 then
                    effect:setIcon(tpz.effect.COPY_IMAGE_3)
                end
            end
        end
        target:setMod(shadowType, targShadows - 1)
        if targShadows - 1 == 0 then
            target:delStatusEffect(tpz.effect.COPY_IMAGE)
            target:delStatusEffect(tpz.effect.COPY_BLINK)
        end
        return true
    end
    return false
end

require("scripts/globals/status")
require("scripts/globals/magic")

-- The TP modifier
TPMOD_NONE = 0
TPMOD_CRITICAL = 1
TPMOD_DAMAGE = 2
TPMOD_ACC = 3
TPMOD_ATTACK = 4

-- The SC the spell makes
SC_IMPACTION = 0
SC_TRANSFIXION = 1
SC_DETONATION = 2
SC_REVERBERATION = 3
SC_SCISSION = 4
SC_INDURATION = 5
SC_LIQUEFACTION = 6
SC_COMPRESSION = 7

SC_FUSION = 8
SC_FRAGMENTATION = 9
SC_DISTORTION = 10
SC_GRAVITATION = 11

SC_DARK = 12
SC_LIGHT = 13

INT_BASED = 1
CHR_BASED = 2
MND_BASED = 3
MDEF_BASED = 4 -- Used by Blazing Bound
DEF_BASED = 5 -- Used by Cannonball

------------------------------------------
-- Blue Magic Physical Spell Parameters --
------------------------------------------
-- caster - The entity casting the spell.
-- target - The target of the spell.
-- spell - The blue magic spell itself.
-- params - The parameters for the spell. Specify these in the spell's LUA script.
--      .tpmod - The TP modifier for the spell (attack, accuracy, chance of critical hit, damage varies with TP)
--			TPMOD_ACC caps at +100% Accuracy per TP tier (+300% ACC @ 3000 TP)
--			TPMOD_ATTACK caps at +100% Attack per TP tier (+300% ATK @ 3000 TP)
--			TPMOD_CRITICAL caps at 100% Critical Hit Rate total (no TP tier caps)
--			TPMOD_DAMAGE caps at +100% damage per TP tier (+300% damage @ 3000 TP)
--		.tpmodvalue - The TP modifier's value (.tpmod = TPMOD_DAMAGE and .tpmodvalue = 35 gives a 35% attack boost starting at 1 TP, 70% starting at 1500 TP, etc)
--		.damageType - Spell's physical damage type (PIERCING, SLASHING or IMPACT (Blunt))
--		.spellFamily - Monster ecosystem to determine correlation bonus (+/- 25%)(tpz.ecosystem.BEAST/AMORPH/etc.)
--		.attbonus - Base attack bonus which is separate from the bonus applied by TPMOD_ATTACK (see Vanity Dive)
--		.accbonus - Base accuracy bonus which is separate from the bonus applied by TPMOD_ACC (see Heavy Strike)
--		.isACrit - Forces the spell to act as a critical hit regardless of "Chance of Critical Hit Varies with TP"
--      .numHits - The number of hits in the spell.
--		.effect - Used to calculate status effect durations (tpz.effect.PLAGUE, PARALYSIS, etc.)
--      .multiplier - The base damage multiplier for the spell (Listed as fTP 0~1499 on BGWiki)
--      .tp150 - The TP modifier @ 150% TP. (Listed as fTP 1500~2999 on BGWiki)
--      .tp300 - The TP modifier @ 300% TP. (Listed as fTP 3000 on BGWiki)
--      .azuretp - The TP modifier under Azure Lore. (Listed as fTP 3500 on BGWiki)
--      .duppercap - The spell's upper cap for D. All Blue Magic spells under level 75 have upper D caps. All spells over 75 are uncapped.
--			D = ((Blue Magic Skill * 0.11) * 2) + 3 (Assuming 600 max blue magic skill the limit for this is 135)
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
--		.attribute - The main attribute to compare, usually INT (tpz.mod.INT/MND/CHR)
--		.skillType - Should always be tpz.skill.BLUE_MAGIC
--		.damageType - The spell's element (tpz.damageType.FIRE/EARTH/WATER/WIND/ICE/LIGHTNING/THUNDER/LIGHT/DARK)
--		.spellFamily - Monster ecosystem to determine correlation bonus (+/- 25%)(tpz.ecosystem.BEAST/AMORPH/etc.)
--		.multiplier - The base multiplier for the spell. Referred to as fTP on BGWiki
--		.tMultiplier - The dINT/dMND/dCHR multiplier. Referred to as 1.0dINT/2.0dINT/etc on BGWiki
--      .duppercap - The spell's upper cap for D. All spells under level 75 have upper D caps. All spells over 75 are uncapped.
--			D = ((Blue Magic Skill * 0.11) * 2) + 3 (Assuming 600 max blue magic skill the limit for this is 135)
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
--		.attackType = The type of attack (tpz.attackType.BREATH)
--		.damageType = The spell's element (tpz.damageType.FIRE/EARTH/WATER/WIND/ICE/LIGHTNING/THUNDER/LIGHT/DARK)
--		.spellFamily = Monster ecosystem to determine correlation bonus (+/- 25%)(tpz.ecosystem.BEAST/AMORPH/etc.)
--		.hpMod = 50 -- 50%
--		.lvlMod = 0.075 -- fLV
--		.bonus = 1.00 -- +% Base Damage Bonus
--		.multiplier = 1.50 -- Azure Lore Damage multiplier


-------------------------------
-- Blue Physical type spells --
-------------------------------
function BluePhysicalSpell(caster, target, spell, params)
    local blueSkill = caster:getSkillLevel(tpz.skill.BLUE_MAGIC)
	local blueMerits = caster:getMerit(tpz.merit.BLUE)
	local blueGear = caster:getMod(tpz.mod.BLUE)
	local magicskill = (blueSkill + blueMerits + blueGear) -- Skill + Merits + Equipment bonuses
	local tp = caster:getTP()
	local tpModValue = 0
	local isACrit = false
	local accbonus = 0
	
	-- Checks if .tpmodvalue, .isACrit, .accbonus are set in the spell
	if (params.tpmodvalue ~= nil) then
		tpModValue = params.tpmodvalue
		-- printf("\nbluemagic.lua BluePhysicalSpell TP Mod Value: [%i]", tpModValue)
	end
	
	if (params.isACrit ~= nil) then
		isACrit = params.isACrit
	end
	
	if (params.accbonus ~= nil) then
		accbonus = params.accbonus / 100
		-- printf("bluemagic.lua BluePhysicalSpell ACC Bonus: [%f]", accbonus)
	end
	
    -- TODO: Under Efflux?
    -- TODO: Merits.

    ---------------------------------
    -- Calculate the final D value  -
    ---------------------------------
    -- Worked out from http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
    -- Final D value = (floor(D + fSTR + WSC) * Multiplier)

    local D =  (math.floor(magicskill * 0.11) * 2) + 3
    -- cap D
    if (D > params.duppercap) then
        D = params.duppercap
    end

    -- print("D val is ".. D)

    local fStr = BluefSTR(caster:getStat(tpz.mod.STR) - target:getStat(tpz.mod.VIT))
	local casterLvl = caster:getMainLvl()

	-- fStr is capped at 22 for spells below level 75.
	-- fStr is capped at 26 for spells above level 75.
	-- Smite of Rage and Grand Slam ignore the fStr cap.
	if (fStr > 22 and casterLvl <= 75 and not (spell:getID() == 527 or spell:getID() == 622)) then
        fStr = 22
	elseif (fStr > 26 and not (spell:getID() == 527 or spell:getID() == 622)) then
		fStr = 26
    end

    -- print("fStr val is ".. fStr)

    local WSC = BlueGetWsc(caster, params)
	
	local wscCA = 1
	local wscAugBlueMagic = 0
	local augChance = math.random(0, 100)
	local setEffect = caster:getMod(tpz.mod.AUGMENT_BLUE_MAGIC)
	
	if (caster:hasStatusEffect(tpz.effect.CHAIN_AFFINITY) and augChance > setEffect) then
		wscCA = 2
	elseif (caster:hasStatusEffect(tpz.effect.CHAIN_AFFINITY) and augChance < setEffect) then
		wscCA = 1
	end
	
	-- Apply Mavi/Hashishin set effect and Chain Affinity WSC modifier	
	if (setEffect < caster:getMod(tpz.mod.AUGMENT_BLUE_MAGIC)) then
		wscAugBlueMagic = 3
	end
	
	WSC = WSC * (wscCA + wscAugBlueMagic)

    -- print("wsc val is ".. WSC)

	-- Always assume a 1x multiplier so the calculation doesn't zero out
	-- Sets the multiplier to the value specified in the spell if provided
    local multiplier = 1.0
	if (params.multiplier ~= nil) then
		multiplier = params.multiplier
	end
	
    ----------------------------------------------------------------
	-- Applies Chain Affinity, increases base damage, and adjusts --
	-- the multipliers to fTP(multiplier, tp150, tp300)           --
	----------------------------------------------------------------
    local chainAffinity = caster:getStatusEffect(tpz.effect.CHAIN_AFFINITY)
    if chainAffinity ~= nil then
        -- Calculate the total TP available for the fTP multiplier.
		if not (caster:hasStatusEffect(tpz.effect.EFFLUX)) then
			tp = tp + caster:getMerit(tpz.merit.ENCHAINMENT)
		end
		
        if (tp > 3000) then
            tp = 3000
        end

		D = D + caster:getMod(tpz.mod.CHAIN_AFFINITY_EFFECT)
    end
	
	----------------------------------------------------------------
	-- Applies Efflux, increases base damage, and adds a TP Bonus --
	-- the multipliers to fTP(multiplier, tp150, tp300)           --
	----------------------------------------------------------------
	if (caster:hasStatusEffect(tpz.effect.EFFLUX)) then
		if not (caster:hasStatusEffect(tpz.effect.CHAIN_AFFINITY)) then
			tp = tp + 1000 + caster:getMod(tpz.mod.ENH_EFFLUX)
		else
			tp = 1000 + caster:getMod(tpz.mod.ENH_EFFLUX)
		end
		
		if (tp > 3000) then
            tp = 3000
        end

		D = D * 1.5
		
		caster:delStatusEffect(tpz.effect.EFFLUX)
	end
	
	----------------------------------------------------------------
	-- Calculates Blue Magic fTP                                  --
	----------------------------------------------------------------
	multiplier = BluefTP(tp, multiplier, params.tp150, params.tp300)
--	printf("bluemagic.lua BluePhysicalSpell fTP MULTIPLIER: [%f]", multiplier)
	
	------------------------
	-- Applies Azure Lore --
	------------------------
	local AzureLore = caster:getStatusEffect(tpz.effect.AZURE_LORE)
	if AzureLore ~= nil then
		if (tp < 3500) then
			tp = 3500
		end
		
--		multiplier = BluefTP(tp, params.azuretp, params.azuretp, params.azuretp)
		multiplier = params.azuretp
		-- printf("bluemagic.lua BluePhysicalSpell AZURE LORE MULTIPLIER: [%2.2f]", multiplier)
	end

    -- TODO: Modify multiplier to account for family bonus/penalty
    local finalD = math.floor(D + fStr + WSC) * multiplier

    -- printf("bluemagic.lua BluePhysicalSpell FINAL D: [%i]", finalD)
	
    ------------------------------
    -- Gets the caster's Attack and the Spell's Attack bonus --
    ------------------------------
	local casterATT = 0
	local attbonus = 1
	
	if (params.attbonus ~= nil) then
		attbonus = 1 + (params.attbonus / 100)
	end
	-- printf("bluemagic.lua BluePhysicalSpell ATT BONUS: [%f]", attbonus)
	
	-- Check for offcratiomod parameter from spell.
	-- Only Cannonball uses offcratiomod at the moment
	if (params.offcratiomod ~= nil) then
		casterATT = params.offcratiomod
	else
        casterATT = caster:getStat(tpz.mod.ATT)
		casterATT = casterATT * attbonus
    end
	-- printf("bluemagic.lua BluePhysicalSpell CASTER ATT: [%i]", casterATT)
	
	--------------------------------------------------------------
	-- Applies attack bonus from "Attack Varies with TP" Spells --
	--------------------------------------------------------------
	if (params.tpmod == TPMOD_ATTACK) then
		-- Caps maximum attack bonus at 100% per TP tier
		if (tpModValue > 100) then
			tpModValue = 100
		end
		
		--           0 TP = No TP bonus
		--    1 - 1499 TP = Tier 1 bonus
		-- 1500 - 2999 TP = Tier 2 bonus
		--     >= 3000 TP = Tier 3 bonus
		if (tp == 0) then
			tpModValue = 0
		elseif (tp >= 1500 and tp <= 2999) then
			tpModValue = tpModValue * 2
		elseif (tp >= 3000) then
			tpModValue = tpModValue * 3
		end
		
		tpModValue = (tpModValue / 100) + 1
		local attackBeforeAdjust = casterATT
		casterATT = casterATT * tpModValue
		-- printf("bluemagic.lua BluePhysicalSpell ATT BEFORE ADJUST: [%i]  TP ATTACK MOD APPLIED: [%f]  ATT AFTER ADJUST: [%i]", attackBeforeAdjust, tpModValue, casterATT)
	end
	
	---------------------------------------------
	-- Check and apply Cannonball DEF modifier --
	---------------------------------------------
	local statMod = params.statMod
	if (statMod == DEF_BASED) then -- Stat mod is DEF (Cannonball)
		local casterDEF = caster:getMod(tpz.mod.DEF)
		casterATT = casterATT + casterDEF
		-- printf("bluemagic.lua BluePhysicalSpell Caster DEF: [%i]\n", casterDEF);
	end
	
	-----------------------------------------------
    -- Gets the possible pDIF range and hit rate --
    -----------------------------------------------
    local cratio = BluecRatio(casterATT / target:getStat(tpz.mod.DEF), caster:getMainLvl(), target:getMainLvl())
    local hitrate = BlueGetHitRate(caster, target, true)
--	printf("bluemagic.lua BluePhysicalSpell CORRECTED RATIO MIN: [%f]  MAX: [%f]  HIT RATE: [%f]", cratio[1], cratio[2], hitrate)
	
	------------------------------------------------------------------
	-- Applies accuracy bonus from "Accuracy Varies with TP" Spells --
	------------------------------------------------------------------
	if (params.tpmod == TPMOD_ACC) then
		-- Caps maximum accuracy bonus at 100% per TP tier
		if (tpModValue > 100) then
			tpModValue = 100
		end
		
		--           0 TP = No TP bonus
		--    1 - 1499 TP = Tier 1 bonus
		-- 1500 - 2999 TP = Tier 2 bonus
		--     >= 3000 TP = Tier 3 bonus
		if (tp == 0) then
			tpModValue = 0
		elseif (tp >= 1500 and tp <= 2999) then
			tpModValue = tpModValue * 2
		elseif (tp >= 3000) then
			tpModValue = tpModValue * 3
		end
		
		tpModValue = (tpModValue / 100)
		local hitrateBeforeAdjust = hitrate
		hitrate = hitrate + tpModValue
		-- printf("bluemagic.lua BluePhysicalSpell ACC BEFORE ADJUST: [%f]  TP ACCURACY MOD APPLIED: [%f]\n", hitrateBeforeAdjust, tpModValue)
	end
	
	-- printf("bluemagic.lua BluePhysicalSpell HIT RATE: [%f] + ACCURACY BONUS: [%f]", hitrate, accbonus)
	hitrate = hitrate + accbonus

    -- print("pdifmin "..cratio[1].." pdifmax "..cratio[2])

    -------------------------
    -- Perform the attacks --
    -------------------------
    local hitsdone = 0
    local hitslanded = 0
    local finaldmg = 0

    while (hitsdone < params.numhits) do
        -- printf("bluemagic.lua BluePhysicalSpell PERFORMING HIT: [%i]", hitsdone)
		local chance = math.random()
        if (chance <= hitrate) then -- it hit
            -- TODO: Check for shadow absorbs.

            -- Generate a random pDIF between min and max
            local pdif = math.random((cratio[1]*1000),(cratio[2]*1000))
            pdif = pdif/1000
			-- printf("bluemagic.lua BluePhysicalSpell BASE PDIF: [%f]", pdif)
			
			---------------------------------------------------------------------------------------------
			-- Checks for "Chance of Critical Hit Varies with TP" Spells --
			---------------------------------------------------------------------------------------------
			
			if (isACrit == false and params.tpmod == TPMOD_CRITICAL) then
				isACrit = BlueGetCrit(caster, target, tpModValue)
				--           0 TP = No TP bonus
				--    1 - 1499 TP = Tier 1 bonus
				-- 1500 - 2999 TP = Tier 2 bonus
				--     >= 3000 TP = Tier 3 bonus
				if (tp == 0 and isACrit == true) then
					tpModValue = 0
					-- printf("bluemagic.lua BluePhysicalSpell CRITICAL HIT TP BONUS 1: [%i]", tpModValue)
				elseif (tp >= 1500 and tp <= 2999 and isACrit == true) then
					tpModValue = tpModValue * 2
					-- printf("bluemagic.lua BluePhysicalSpell CRITICAL HIT TP BONUS 2: [%i]", tpModValue)
				elseif (tp >= 3000 and isACrit == true) then
					tpModValue = tpModValue * 3
					-- printf("bluemagic.lua BluePhysicalSpell CRITICAL HIT TP BONUS 3: [%i]", tpModValue)
				end
			end
			
			----------------------------------------------------
			-- Applies crits and calculates crit damage bonus --
			----------------------------------------------------
			if (isACrit == true) then
				-- printf("bluemagic.lua BluePhysicalSpell CRITICAL HIT QUALIFIED PDIF: [%f]", pdif)				
				
				local critbonus = (100 + caster:getMod(tpz.mod.CRIT_DMG_INCREASE)) / 100
				-- printf("bluemagic.lua BluePhysicalSpell (PDIF(%f) + 1) * critbonus(%f)", pdif, critbonus)
				pdif = (pdif + 1) * critbonus
				-- Add 5% randomization
				local randomize = 1 + (math.random(1,5)/100)
				pdif = pdif * randomize

				-- printf("bluemagic.lua BluePhysicalSpell RANDOMIZED CRIT PDIF: [%f]", pdif)
			end

            -- Apply it to our final D
            if (hitsdone == 0) then -- Only the first hit benefits from multiplier
                finaldmg = finaldmg + (finalD * pdif)
            else
                finaldmg = finaldmg + ((math.floor(D + fStr + WSC)) * pdif) -- Same as finalD but without multiplier (it should be 1.0)
            end

            hitslanded = hitslanded + 1

            -- Give the target TP (100TP per hit landed)
            target:addTP(100)
        end

        hitsdone = hitsdone + 1
    end
	
	-----------------------------------------
	-- Check and apply Monster Correlation --
	-----------------------------------------
	local ecoBonus = checkEcosystem(caster, target, params)
	finaldmg = finaldmg * ecoBonus
	
	---------------------------------------------
	-- Check and apply Physical Potency merits --
	---------------------------------------------
	local potencyMerits = 1 + caster:getMerit(tpz.merit.PHYSICAL_POTENCY) / 100
	finaldmg = finaldmg * potencyMerits

	--------------------------------------------------------------
	-- Applies damage bonus from "Damage Varies with TP" Spells --
	--------------------------------------------------------------
	if (params.tpmod == TPMOD_DAMAGE) then
		-- Caps maximum damage bonus at 100% per TP tier
		if (tpModValue > 100) then
			tpModValue = 100
		end
		
		--           0 TP = No TP bonus
		--    1 - 1499 TP = Tier 1 bonus
		-- 1500 - 2999 TP = Tier 2 bonus
		--     >= 3000 TP = Tier 3 bonus
		if (tp == 0) then
			tpModValue = 0
		elseif (tp >= 1500 and tp <= 2999) then
			tpModValue = tpModValue * 2
		elseif (tp >= 3000) then
			tpModValue = tpModValue * 3
		end
		
		tpModValue = (tpModValue / 100) + 1
		local dmgBeforeAdjust = finaldmg
		finaldmg = finaldmg * tpModValue
		-- printf("bluemagic.lua BluePhysicalSpell DMG BEFORE ADJUST: [%i]  TP DAMAGE MOD APPLIED: [%f]  DMG AFTER ADJUST: [%i]", dmgBeforeAdjust, tpModValue, finaldmg)
	end

    -- print("Hits landed "..hitslanded.."/"..hitsdone.." for total damage: "..finaldmg)
	
	-- if (caster:hasStatusEffect(tpz.effect.CHAIN_AFFINITY)) then
		-- caster:setTP(0)
		-- caster:delStatusEffectSilent(tpz.effect.CHAIN_AFFINITY)
	-- end
	
	local godModeActive = caster:getCharVar("GodMode")
	
	if (godModeActive == 1) then
		finaldmg = finaldmg + math.random(25000,70000)
		if (finaldmg > 99999) then
			finaldmg = 99999
		end
	end

    return finaldmg
end

------------------------------
-- Blue Magical type spells --
------------------------------
function BlueMagicalSpell(caster, target, spell, params, statMod)
	if (caster:hasStatusEffect(tpz.effect.BURST_AFFINITY) and caster:getLocalVar("BLUAoETrigger") == 0) then
		caster:setLocalVar("BLUAoETargets", spell:getTotalTargets())
		caster:setLocalVar("BLUAoETrigger", 1)
--		printf("thermal_pulse.lua onMagicCastingCheck TARGETS: [%i]", spell:getTotalTargets())
	end

    local D = caster:getMainLvl() + 2

    if (D > params.duppercap) then
        D = params.duppercap
    end

    local ST = BlueGetWsc(caster, params) -- According to Wiki ST is the same as WSC, essentially Blue mage spells that are magical use the dmg formula of Magical type Weapon skills
	
	local stBA = 1
	local baBonus = caster:getMod(tpz.mod.BURST_AFFINITY_EFFECT) / 100
	local stAugBlueMagic = 0
	local augChance = math.random(0, 100)
	local setEffect = caster:getMod(tpz.mod.AUGMENT_BLUE_MAGIC)
	
	if (caster:hasStatusEffect(tpz.effect.BURST_AFFINITY) and augChance > setEffect) then
		stBA = 2 + baBonus
	elseif (caster:hasStatusEffect(tpz.effect.BURST_AFFINITY) and augChance < setEffect) then
		stBA = 1 + baBonus
	end
	
	-- Apply Mavi/Hashishin set effect and Burst Affinity WSC modifier	
	if (augChance < setEffect) then
		stAugBlueMagic = 3
	end
	
	ST = ST * (stBA + stAugBlueMagic)

	-- Always assume a 1x multiplier so the calculation doesn't zero out
	-- Sets the multiplier to the value specified in the spell if provided
    local multiplier = 1.0
	if (params.multiplier ~= nil) then
		multiplier = params.multiplier
	end
	
	local convergenceBonus = 1.0
    if (caster:hasStatusEffect(tpz.effect.CONVERGENCE)) then
        local convergenceEffect = caster:getStatusEffect(tpz.effect.CONVERGENCE)
        local convLvl = convergenceEffect:getPower()
        if (convLvl == 1) then
            convergenceBonus = 1.05
        elseif (convLvl == 2) then
            convergenceBonus = 1.1
        elseif (convLvl == 3) then
            convergenceBonus = 1.15
        end
    end

    local statBonus = 0
    local dStat = 0 -- Please make sure to add an additional stat check if there is to be a spell that uses neither INT, MND, or CHR. None currently exist.
    if (statMod == INT_BASED) then -- Stat mod is INT
        dStat = caster:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT)
        statBonus = (dStat) * params.tMultiplier
    elseif (statMod == CHR_BASED) then -- Stat mod is CHR
        dStat = caster:getStat(tpz.mod.CHR) - target:getStat(tpz.mod.CHR)
        statBonus = (dStat) * params.tMultiplier
    elseif (statMod == MND_BASED) then -- Stat mod is MND
        dStat = caster:getStat(tpz.mod.MND) - target:getStat(tpz.mod.MND)
        statBonus = (dStat) * params.tMultiplier
	elseif (statMod == MDEF_BASED) then -- Stat mod is MDEF
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
	local ecoBonus = checkEcosystem(caster, target, params)
	dmg = dmg * ecoBonus
	-- printf("bluemagic.lua BlueMagicalSpell ECO ADJUSTED DAMAGE: [%i]", dmg)
	
	------------------------
	-- Applies Azure Lore --
	------------------------
	if (caster:hasStatusEffect(tpz.effect.AZURE_LORE)) then
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
	local MaxHP = caster:getMaxHP()
	local hpMod = params.hpMod / 100
	local Lvl = caster:getMainLvl()
	local lvlMod = params.lvlMod
	
	local HP = MaxHP * hpMod
	local fLV = Lvl / lvlMod
	
	local breathDmgMod = 1 + (caster:getMod(tpz.mod.BREATH_DMG_DEALT)/100)
	local dmgBonus = params.bonus

	-------------------------------
	-- Check Monster Correlation --
	-------------------------------
	local ecoBonus = checkEcosystem(caster, target, params)
	
	-----------------------------------
	-- Check for Convergence bonuses --
	-----------------------------------
	local convBonus = 1.0	
    if (caster:hasStatusEffect(tpz.effect.CONVERGENCE)) then
        local convergenceEffect = caster:getStatusEffect(tpz.effect.CONVERGENCE)
        local convLvl = convergenceEffect:getPower()
        if (convLvl == 1) then
            convBonus = 1.05
        elseif (convLvl == 2) then
            convBonus = 1.1
        elseif (convLvl == 3) then
            convBonus = 1.15
        end
    end
	
	--------------------------------------
	-- Check for Chain Affinity bonuses --
	--------------------------------------
	local baBonus = 1.0
	if (caster:hasStatusEffect(tpz.effect.BURST_AFFINITY)) then
		local baMod = caster:getMod(tpz.mod.BURST_AFFINITY_EFFECT) / 100
		baBonus = baBonus + 1 + baMod
	end
	
	----------------------------------
	-- Check for Azure Lore bonuses --
	----------------------------------
	local AzureLoreMult = 1.00
	if (caster:hasStatusEffect(tpz.effect.AZURE_LORE)) and not (params.multiplier == nil) then
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

-----------------------------------------------------------------------------------------
-- Multiplies the total power by the server constant and adjusts for Phalanx/Stoneskin --
-----------------------------------------------------------------------------------------
function BlueFinalAdjustments(caster, target, spell, dmg, params)
    if (dmg < 0) then
        dmg = 0
    end

	if (caster:isSpellAoE(spell:getID())) then
        local total = spell:getTotalTargets()
		
		-- printf("bluemagic.lua BlueFinalAdjustments MULTI TARGET REDUCTION  TARGETS: [%i]  DAMAGE: [%i]", total, dmg)

        if (total > 9) then
            -- AoE spells on 10+ targets = 0.4
            dmg = dmg * 0.4
        elseif (total > 1) then
            -- AoE spells on 2 to 9 targets = 0.9 - 0.05T where T = number of targets
            dmg = dmg * (0.9 - 0.05 * total)
        end

		-- printf("bluemagic.lua BlueFinalAdjustments MULTI TARGET REDUCTION  DAMAGE: [%i]", dmg)
	end

    dmg = dmg * BLUE_POWER

    dmg = dmg - target:getMod(tpz.mod.PHALANX)
    if (dmg < 0) then
        dmg = 0
    end

    -- handling stoneskin
    dmg = utils.stoneskin(target, dmg)
	
	if (target:isPC()) then
		dmg = math.random(100,900)
	end

	local attackType = params.attackType or tpz.attackType.PHYSICAL
    local damageType = params.damageType or tpz.damageType.NONE
	
    target:takeSpellDamage(caster, spell, dmg, attackType, damageType)
    target:updateEnmityFromDamage(caster, dmg)
    target:handleAfflatusMiseryDamage(dmg)
    -- TP has already been dealt with.
	
	local AoETargets = caster:getLocalVar("BLUAoETargets")
	
	if (AoETargets <= 1 and caster:hasStatusEffect(tpz.effect.BURST_AFFINITY)) then
		caster:delStatusEffectSilent(tpz.effect.BURST_AFFINITY)
		caster:setLocalVar("BLUAoETargets", 0)
		caster:setLocalVar("BLUAoETrigger", 0)
	elseif (AoETargets > 1 and caster:hasStatusEffect(tpz.effect.BURST_AFFINITY)) then
		AoETargets = AoETargets - 1
		caster:setLocalVar("BLUAoETargets", AoETargets)
--		printf("bluemagic.lua BlueFinalAdjustments AOE TARGETS: [%i]", AoETargets)		
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
         attacker:getStat(tpz.mod.CHR) * params.chr_wsc) * BlueGetAlpha(attacker:getMainLvl())
	return wsc
end

--------------------------------------------------------------------------
-- Applies level correction to the ratio and returns min and max cRatio --
--------------------------------------------------------------------------
function BluecRatio(ratio, atk_lvl, def_lvl)
    -- Apply level penalty
    local levelcor = 0
    if (atk_lvl < def_lvl) then
        levelcor = 0.05 * (def_lvl - atk_lvl)
    end
    ratio = ratio - levelcor

    -- Apply caps
    if (ratio < 0) then
        ratio = 0
    elseif (ratio > 2) then
        ratio = 2
    end

    -- Obtaining cRatio_MIN
    local cratiomin = 0
    if (ratio < 1.25) then
        cratiomin = 1.2 * ratio - 0.5
    elseif (ratio >= 1.25 and ratio <= 1.5) then
        cratiomin = 1
    elseif (ratio > 1.5 and ratio <= 2) then
        cratiomin = 1.2 * ratio - 0.8
    end
	
	if (cratiomin < 0) then
        cratiomin = 0
    end

    -- Obtaining cRatio_MAX
    local cratiomax = 0
    if (ratio < 0.5) then
        cratiomax = 0.4 + 1.2 * ratio
    elseif (ratio <= 0.833 and ratio >= 0.5) then
        cratiomax = 1
    elseif (ratio <= 2 and ratio > 0.833) then
        cratiomax = 1.2 * ratio
    end
    
	cratio = {}
	
    cratio[1] = cratiomin
    cratio[2] = cratiomax
	
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
    if (tp >= 0 and tp < 1500) then
        return ftp1 + (((ftp2 - ftp1) / 100) * (tp / 10))
    elseif (tp >= 1500 and tp <= 3000) then
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
    if (dSTR >= 12) then
        fSTR2 = ((dSTR + 4) / 2)
    elseif (dSTR >= 6) then
        fSTR2 = ((dSTR + 6) / 2)
    elseif (dSTR >= 1) then
        fSTR2 = ((dSTR + 7 ) / 2)
    elseif (dSTR >= -2) then
        fSTR2 = ((dSTR + 8) / 2)
    elseif (dSTR >= -7) then
        fSTR2 = ((dSTR + 9) / 2)
    elseif (dSTR >= -15) then
        fSTR2 = ((dSTR + 10 ) / 2)
    elseif (dSTR >= -21) then
        fSTR2 = ((dSTR + 12) / 2)
    else
        fSTR2 = ((dSTR + 13) / 2)
    end

    return fSTR2
end

---------------------------------------------------------------------------
-- Determines whether a hit connects based off caster ACC and target EVA --
---------------------------------------------------------------------------
function BlueGetHitRate(attacker, target, capHitRate)
    local acc = attacker:getACC() + attacker:getILvlSkill(tpz.slot.MAIN) + attacker:getILvlSkill(tpz.slot.SUB)
    local eva = target:getEVA()
	local attackerLevel = attacker:getMainLvl()
	
	if (attacker:getObjType() == tpz.objType.PC) then
		attackerLevel = attackerLevel + attacker:getItemLevel()
	end
	
	local targetLevel = target:getMainLvl()

    if (attackerLevel > targetLevel) then -- ACC bonus
        acc = acc + ((attackerLevel - targetLevel) * 4)
    elseif (attackerLevel < targetLevel) then -- ACC penalty
        acc = acc - ((targetLevel - attackerLevel) * 4)
    end

    local hitdiff = 0
    local hitrate = 75
    if (acc > eva) then
		hitdiff = (acc - eva) / 2
    else
		hitdiff = ((-1) * (eva - acc)) / 2
    end

    hitrate = hitrate + hitdiff
    hitrate = hitrate / 100

	-- if (attacker:getName() == "Khalum") then
		-- printf("bluemagic.lia BlueGetHitRate CASTER LEVEL: [%i]  ACC: [%i]  TARGET LEVEL: [%i]  EVA: [%i]  Hit DIFF: [%i]  HIT RATE: [%1.2f]", attackerLevel, acc, targetLevel, eva, hitdiff, hitrate)
	-- end

    -- Applying hitrate caps
    if (capHitRate) then -- This isn't capped for 'ACC varies with TP', as more penalties are due
        if (hitrate > 0.95) then
            hitrate = 0.95
        end
        if (hitrate < 0.2) then
            hitrate = 0.2
        end
    end
    return hitrate
end

--------------------------------------------------------------------------------------------------------------
-- This function was removed because it inadequately handled the variety of status effects and durations    --
-- that BLU can cause. Status effect and duration are now handled inside each spell on an individual basis. --
--------------------------------------------------------------------------------------------------------------
-- -- Function to stagger duration of effects by using the resistance to change the value
-- function getBlueEffectDuration(caster, resist, effect)
    -- local duration = 0

    -- if (resist == 0.125) then
        -- resist = 1
    -- elseif (resist == 0.25) then
        -- resist = 2
    -- elseif (resist == 0.5) then
        -- resist = 3
    -- else
        -- resist = 4
    -- end

    -- if (effect == tpz.effect.BIND) then
        -- duration = math.random(0,5) + resist * 5
    -- elseif (effect == tpz.effect.STUN) then
        -- duration = math.random(2,3) + resist
        -- -- printf("Duration of stun is %i",duration)
    -- elseif (effect == tpz.effect.WEIGHT) then
        -- duration = math.random(20,24) + resist * 9 -- 20-24
    -- elseif (effect == tpz.effect.PARALYSIS) then
        -- duration = math.random(50,60) + resist * 15 -- 50- 60
    -- elseif (effect == tpz.effect.SLOW) then
        -- duration = math.random(60,120) + resist * 15 -- 60- 120 -- Needs confirmation but capped max duration based on White Magic Spell Slow
    -- elseif (effect == tpz.effect.SILENCE) then
        -- duration = math.random(60,180) + resist * 15 -- 60- 180 -- Needs confirmation but capped max duration based on White Magic Spell Silence
    -- elseif (effect == tpz.effect.POISON) then
        -- duration = math.random(20,30) + resist * 9 -- 20-30 -- based on magic spell poison
    -- end

    -- return duration
-- end

---------------------------------------------
-- Obtains alpha, used for working out WSC --
---------------------------------------------
function BlueGetAlpha(level)
    local alpha = 1.00
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
    elseif (level <= 99) then
        alpha = 0.85
    end
    return alpha
end

-------------------------------------------------------------------------------------------------
-- Determines critical hit chance from base crit, caster DEX vs. target AGI, gear, and merits. --
-------------------------------------------------------------------------------------------------
function BlueGetCrit(caster, target, tpModCrit)
	local critBase = 5
	local critGear = caster:getMod(tpz.mod.CRITHITRATE)
	local critMerits = caster:getMerit(tpz.merit.CRIT_HIT_RATE)
	local dDEX = caster:getStat(tpz.mod.DEX) - target:getStat(tpz.mod.AGI)
	
	-- Caps dDEX's maximum benefit at a difference of 50 (+15% crit hit rate)
	if dDEX > 50 then
		dDEX = 50
	end
	
	-- Determines the crit hit rate bonus from caster:DEX - target:AGI
	if (dDEX > 39 and dDEX < 51) then -- 5-15%
		dDEX = dDEX - 35
	elseif (dDEX > 29 and dDEX < 40) then -- 4%
		dDEX = 4
	elseif (dDEX > 19 and dDEX < 30) then -- 3%
		dDEX = 3
	elseif (dDEX > 13 and dDEX < 20) then -- 2%
		dDEX = 2
	elseif (dDEX > 6 and dDEX < 14) then -- 1%
		dDEX = 1
	elseif (dDEX < 6) then -- 0%
		dDEX = 0
	end
	
	local critChance = (critBase + critGear + critMerits + dDEX + tpModCrit) -- Base + Gear + Merits + Stat Difference + Spell TP Crit Mod
	
	-- Caps crit hit chance at 100%
	if (critChance > 100) then
		critChance = 100
	end
	
	local rollForCrit = math.random(1,100)
	local isACrit = false
--	printf("bluemagic.lua BlueGetCrit CRIT CHANCE: [%i]  RANDOM: [%i]\n", critChance, rollForCrit)
	
	if (rollForCrit <= critChance) then
		isACrit = true
	end
	
	return isACrit
end

--------------------------------------------------------------------
-- Compares the spell's ecosystem vs. the target's ecosystem.     --
-- If a correlation is found assigns +25%/-25% effect multiplier. --
--------------------------------------------------------------------
function checkEcosystem(caster, target, params)
	local merits = caster:getMerit(tpz.merit.MONSTER_CORRELATION)
	local mobCorrelation = caster:getMod(tpz.mod.ENH_MONSTER_CORRELATION)
	local mobSystem = target:getSystem()
	local spellSystem = tpz.eco.UNCLASSIFIED
	
	if (params.spellFamily ~= nil) then
		spellSystem = params.spellFamily
	end
	
	local ecoBonus = 0
	
	-- Beast vs Lizard(+25%)/Plantoid(-25%)
	if (spellSystem == tpz.eco.BEAST and mobSystem == tpz.eco.LIZARD) then
		ecoBonus = 25
	elseif (spellSystem == tpz.eco.BEAST and mobSystem == tpz.eco.PLANTOID) then
		ecoBonus = -25
	end
	
	-- Lizard vs Vermin(+25%)/Beast(-25%)
	if (spellSystem == tpz.eco.LIZARD and mobSystem == tpz.eco.VERMIN) then
		ecoBonus = 25
	elseif (spellSystem == tpz.eco.LIZARD and mobSystem == tpz.eco.BEAST) then
		ecoBonus = -25
	end
	
	-- Vermin vs Plantoid(+25%)/Lizard(-25%)
	if (spellSystem == tpz.eco.VERMIN and mobSystem == tpz.eco.PLANTOID) then
		ecoBonus = 25
	elseif (spellSystem == tpz.eco.VERMIN and mobSystem == tpz.eco.LIZARD) then
		ecoBonus = -25
	end
	
	-- Plantoid vs Beast(+25%)/Vermin(-25%)
	if (spellSystem == tpz.eco.PLANTOID and mobSystem == tpz.eco.BEAST) then
		ecoBonus = 25
	elseif (spellSystem == tpz.eco.PLANTOID and mobSystem == tpz.eco.VERMIN) then
		ecoBonus = -25
	end
	
	-- Amorph vs Bird(+25%)/Aquan(-25%)
	if (spellSystem == tpz.eco.AMORPH and mobSystem == tpz.eco.BIRD) then
		ecoBonus = 25
	elseif (spellSystem == tpz.eco.AMORPH and mobSystem == tpz.eco.AQUAN) then
		ecoBonus = -25
	end
	
	-- Bird vs Aquan(+25%)/Amorph(-25%)
	if (spellSystem == tpz.eco.BIRD and mobSystem == tpz.eco.AQUAN) then
		ecoBonus = 25
	elseif (spellSystem == tpz.eco.BIRD and mobSystem == tpz.eco.AMORPH) then
		ecoBonus = -25
	end
	
	-- Aquan vs Amorph(+25%)/Bird(-25%)
	if (spellSystem == tpz.eco.AQUAN and mobSystem == tpz.eco.AMORPH) then
		ecoBonus = 25
	elseif (spellSystem == tpz.eco.AQUAN and mobSystem == tpz.eco.BIRD) then
		ecoBonus = -25
	end
	
	-- Undead vs Arcana (+25%)
	if (spellSystem == tpz.eco.UNDEAD and mobSystem == tpz.eco.ARCANA) then
		ecoBonus = 25
	elseif (spellSystem == tpz.eco.ARCANA and mobSystem == tpz.eco.UNDEAD) then
		ecoBonus = 25
	end
	
	-- Dragon vs Demon (+25%)
	if (spellSystem == tpz.eco.DRAGON and mobSystem == tpz.eco.DEMON) then
		ecoBonus = 25
	elseif (spellSystem == tpz.eco.DEMON and mobSystem == tpz.eco.DRAGON) then
		ecoBonus = 25
	end
	
	ecoBonus = ecoBonus + merits + mobCorrelation
	ecoBonus = 1 + (ecoBonus / 100)
	
	-- printf("bluemagic.lua checkEcosystem SPELL ECOSYSTEM: [%s]    MOB ECOSYSTEM: [%s]    ECO BONUS: [%1.2f]", spellSystem, mobSystem, ecoBonus)
	
	return ecoBonus
end
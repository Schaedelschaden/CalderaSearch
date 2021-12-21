--------------------------------------------------------------
-- func: !checkstats
-- auth: Schaedel
-- desc: Checks the stats of the targeted player/trust.
--------------------------------------------------------------
require("scripts/globals/utils")
--------------------------------------------------------------

cmdprops =
{
    permission = 2,
    parameters = "s"
};

function onTrigger(player, target)

	local targ
    if (target == nil) then
        targ = player:getCursorTarget()
        if (targ == nil or not targ:isPC()) then
            error(player,"You must target a player.")
            return
        end
    else
        targ = GetPlayerByName(target)
        if (targ == nil) then
            error(player,"Invalid target.")
            return
        end
    end

	local jobMagic = {tpz.job.WHM, tpz.job.BLM, tpz.job.RDM, tpz.job.PLD, tpz.job.DRK, tpz.job.NIN, tpz.job.BLU, tpz.job.SCH, tpz.job.GEO}
	local jobMagicSkill = {tpz.skill.DIVINE_MAGIC, tpz.skill.ELEMENTAL_MAGIC, tpz.skill.ENFEEBLING_MAGIC, tpz.skill.DIVINE_MAGIC, tpz.skill.ELEMENTAL_MAGIC, tpz.skill.NINJUTSU, tpz.skill.BLUE_MAGIC, tpz.skill.ELEMENTAL_MAGIC, tpz.skill.ELEMENTAL_MAGIC}
	local mainHandWeapons = {tpz.skill.HAND_TO_HAND, tpz.skill.DAGGER, tpz.skill.SWORD, tpz.skill.AXE, tpz.skill.CLUB, tpz.skill.KATANA, tpz.skill.GREAT_SWORD, tpz.skill.GREAT_AXE, tpz.skill.SCYTHE, tpz.skill.POLEARM, tpz.skill.GREAT_KATANA, tpz.skill.STAFF}
	local weapons = {tpz.skill.DAGGER, tpz.skill.SWORD, tpz.skill.AXE, tpz.skill.CLUB, tpz.skill.KATANA, tpz.skill.GREAT_SWORD, tpz.skill.GREAT_AXE, tpz.skill.SCYTHE, tpz.skill.POLEARM, tpz.skill.GREAT_KATANA, tpz.skill.STAFF}
	local rangedWeapons = {tpz.skill.ARCHERY, tpz.skill.MARKSMANSHIP, tpz.skill.THROWING}

	local weaponType = targ:getWeaponSkillType(tpz.slot.MAIN)
	local rangedWeaponType = targ:getWeaponSkillType(tpz.slot.RANGED)
	local shieldBaseBlockRate = 0
	
	if (targ:getShieldSize() ~= 0) then
		if (targ:getShieldSize() == 1) then
			shieldBaseBlockRate = 55
		elseif (targ:getShieldSize() == 2) then
			shieldBaseBlockRate = 40
		elseif (targ:getShieldSize() == 3) then
			shieldBaseBlockRate = 45
		elseif (targ:getShieldSize() == 4) then
			shieldBaseBlockRate = 30
		end
	end

	local DLTrait = targ:getMod(tpz.mod.DAMAGE_LIMIT_TRAIT)
	local DLGear = targ:getMod(tpz.mod.DAMAGE_LIMIT_GEAR)
	local MainDMG = targ:getMod(tpz.mod.MAIN_DMG_RATING)
	local LVL = targ:getMainLvl() + targ:getItemLevel()
	local STR = targ:getStat(tpz.mod.STR)
	local DEX = targ:getStat(tpz.mod.DEX)
	local VIT = targ:getStat(tpz.mod.VIT)
	local AGI = targ:getStat(tpz.mod.AGI)
	local INT = targ:getStat(tpz.mod.INT)
	local MND = targ:getStat(tpz.mod.MND)
	local CHR = targ:getStat(tpz.mod.CHR)
	local Enmity = targ:getMod(tpz.mod.ENMITY)
	local Regen = targ:getMod(tpz.mod.REGEN)
	local Refresh = targ:getMod(tpz.mod.REFRESH)
	local Regain = targ:getMod(tpz.mod.REGAIN)
	
	local weaponATT = 0
	if (weaponType ~= tpz.skill.HAND_TO_HAND) then
		for i = 1, 11 do
			if (weaponType == weapons[i]) then
				weaponATT = ((targ:getStat(tpz.mod.STR) * 3) / 4) + targ:getSkillLevel(weapons[i]) + targ:getILvlSkill(tpz.slot.MAIN)
			end
		end
	else
		weaponATT = ((targ:getStat(tpz.mod.STR) * 5) / 8) + targ:getSkillLevel(tpz.skill.HAND_TO_HAND) + targ:getILvlSkill(tpz.slot.MAIN)
	end
	
	local ATT = math.floor(8 + targ:getMod(tpz.mod.ATT) + weaponATT)
	ATT = ATT + (math.min(ATT * (targ:getMod(tpz.mod.FOOD_ATTP) / 100), targ:getMod(tpz.mod.FOOD_ATT_CAP)))
	
	local rangedWeaponATT = 0
	for i = 1, 3 do
		if (rangedWeaponType == rangedWeapons[i]) then
			rangedWeaponATT = (targ:getStat(tpz.mod.STR) / 2) + targ:getSkillLevel(rangedWeapons[i]) + targ:getILvlSkill(tpz.slot.RANGED)
		end
	end
	
	local RATT = math.floor(8 + targ:getMod(tpz.mod.RATT) + rangedWeaponATT)
	RATT = RATT + (math.min(RATT * (targ:getMod(tpz.mod.FOOD_RATTP) / 100), targ:getMod(tpz.mod.FOOD_RATT_CAP)))
	
	local MATT = targ:getMod(tpz.mod.MATT)
	local MDMG = targ:getMod(tpz.mod.MAGIC_DAMAGE)
	local MBurst = targ:getMod(tpz.mod.MAG_BURST_BONUS)
	local MCritRate = targ:getMod(tpz.mod.MAGIC_CRITHITRATE)
	local MCritDMG = targ:getMod(tpz.mod.MAGIC_CRIT_DMG_INCREASE)
	
	local weaponACC = 0
	for i = 1, 12 do
		if (weaponType == i) then
			weaponACC = targ:getSkillLevel(i) + targ:getILvlSkill(tpz.slot.MAIN)
			
			if (weaponACC >= 201 and weaponACC <= 400) then
				weaponACC = ((weaponACC - 200) * 0.9) + 200
			elseif (weaponACC >= 401 and weaponACC <= 600) then
				weaponACC = ((weaponACC - 400) * 0.8) + 380
			elseif (weaponACC >= 601) then
				weaponACC = ((weaponACC - 600) * 0.9) + 540
			end
		end
	end
	
	local ACC = math.floor((targ:getStat(tpz.mod.DEX) * 0.75) + targ:getMod(tpz.mod.ACC) + weaponACC)
	ACC = ACC + (math.min(ACC * (targ:getMod(tpz.mod.FOOD_ACCP) / 100), targ:getMod(tpz.mod.FOOD_ACC_CAP)))
	
	local rangedWeaponACC = 0
	for i = 1, 3 do
		if (rangedWeaponType == rangedWeapons[i]) then
			rangedWeaponACC = targ:getSkillLevel(rangedWeapons[i]) + targ:getILvlSkill(tpz.slot.RANGED)
			
			if (rangedWeaponACC >= 201 and rangedWeaponACC <= 400) then
				rangedWeaponACC = ((rangedWeaponACC - 200) * 0.9) + 200
			elseif (rangedWeaponACC >= 401 and rangedWeaponACC <= 600) then
				rangedWeaponACC = ((rangedWeaponACC - 400) * 0.8) + 380
			elseif (rangedWeaponACC >= 601) then
				rangedWeaponACC = ((rangedWeaponACC - 600) * 0.9) + 540
			end
		end
	end
	
	local RACC = math.floor(((targ:getStat(tpz.mod.AGI) * 3) / 4) + targ:getMod(tpz.mod.RACC) + rangedWeaponACC)
	RACC = RACC + (math.min(RACC * (targ:getMod(tpz.mod.FOOD_RACCP) / 100), targ:getMod(tpz.mod.FOOD_RACC_CAP)))
	
	local MACC = targ:getMod(tpz.mod.MACC) + targ:getILvlMacc()
	for i = 1, 9 do
		if (targ:getMainJob() == jobMagic[i]) then
			MACC = MACC + targ:getSkillLevel(jobMagicSkill[i])
		end
	end
	
	if (targ:getMainJob() == tpz.job.BRD) then
		if (rangedWeaponType ~= tpz.skill.STRING or rangedWeaponType ~= tpz.skill.WIND) then
			MACC = MACC + targ:getSkillLevel(tpz.skill.SINGING)
		elseif (rangedWeaponType == tpz.skill.STRING) then
			MACC = MACC + (targ:getSkillLevel(tpz.skill.SINGING) + targ:getSkillLevel(tpz.skill.STRING)) / 2
		elseif (rangedWeaponType == tpz.skill.WIND) then
			MACC = MACC + (targ:getSkillLevel(tpz.skill.SINGING) + targ:getSkillLevel(tpz.skill.WIND)) / 2
		end
	end
	
	local EVA = targ:getSkillLevel(tpz.skill.EVASION)
	if (EVA > 200) then
		EVA = ((EVA - 200) * 0.9) + 200
	end
	
	EVA = math.floor((targ:getStat(tpz.mod.AGI) / 2) + targ:getMod(tpz.mod.EVA) + EVA)
	local MEVA = targ:getMod(tpz.mod.MEVA)
	local MEVAII = targ:getMod(tpz.mod.MAGIC_EVASION_BOOST_II)
	local MDEF = targ:getMod(tpz.mod.MDEF)
	local DT = utils.clamp(targ:getMod(tpz.mod.DMG), -50, 50)
	local PDT = utils.clamp(targ:getMod(tpz.mod.DMGPHYS), -50, 50)
	local PDTII = targ:getMod(tpz.mod.DMGPHYS_II)
	local MDT = utils.clamp(targ:getMod(tpz.mod.DMGMAGIC), -50, 50)
	local MDTII = targ:getMod(tpz.mod.DMGMAGIC_II)
	local BDT = utils.clamp(targ:getMod(tpz.mod.DMGBREATH), -50, 50)
	local SDTFire = targ:getMod(tpz.mod.SDT_FIRE)
	local SDTIce = targ:getMod(tpz.mod.SDT_ICE)
	local SDTWind = targ:getMod(tpz.mod.SDT_WIND)
	local SDTEarth = targ:getMod(tpz.mod.SDT_EARTH)
	local SDTLightning = targ:getMod(tpz.mod.SDT_LIGHTNING)
	local SDTWater = targ:getMod(tpz.mod.SDT_WATER)
	local SDTLight = targ:getMod(tpz.mod.SDT_LIGHT)
	local SDTDark = targ:getMod(tpz.mod.SDT_DARK)
	local AbsorbFire = targ:getMod(tpz.mod.FIRE_ABSORB)
	local AbsorbIce = targ:getMod(tpz.mod.ICE_ABSORB)
	local AbsorbWind = targ:getMod(tpz.mod.WIND_ABSORB)
	local AbsorbEarth = targ:getMod(tpz.mod.EARTH_ABSORB)
	local AbsorbLightning = targ:getMod(tpz.mod.LTNG_ABSORB)
	local AbsorbWater = targ:getMod(tpz.mod.WATER_ABSORB)
	local AbsorbLight = targ:getMod(tpz.mod.LIGHT_ABSORB)
	local AbsorbDark = targ:getMod(tpz.mod.DARK_ABSORB)
	local OccAbsorbDMG = targ:getMod(tpz.mod.ABSORB_DMG_CHANCE)
	local DoubleAttack = targ:getMod(tpz.mod.DOUBLE_ATTACK)
	local DoubleDADMG = targ:getMod(tpz.mod.DA_DOUBLE_DAMAGE)
	local TripleAttack = targ:getMod(tpz.mod.TRIPLE_ATTACK)
	local TATripleDMG = targ:getMod(tpz.mod.TA_TRIPLE_DAMAGE)
	local QuadAttack = targ:getMod(tpz.mod.QUAD_ATTACK)
	local KickAttack = targ:getMod(tpz.mod.KICK_ATTACK_RATE)
	local ExtraKickAttack = targ:getMod(tpz.mod.EXTRA_KICK_ATTACK)
	local DualWield = targ:getMod(tpz.mod.DUAL_WIELD)
	local SubtleBlow = targ:getMod(tpz.mod.SUBTLE_BLOW)
	local SubtleBlowII = targ:getMod(tpz.mod.SUBTLE_BLOW_II)
	local CritHitRate = 5 + targ:getMerit(tpz.merit.CRIT_HIT_RATE) + targ:getMod(tpz.mod.CRITHITRATE)	
	local CritHitDamage = targ:getMod(tpz.mod.CRIT_DMG_INCREASE)
	local CritHitEVA = -targ:getMod(tpz.mod.CRIT_HIT_EVASION)
	local WSDMG = targ:getMod(tpz.mod.ALL_WSDMG_ALL_HITS) + targ:getMod(tpz.mod.YAEGASUMI_WS_BONUS)
	local SCBonus = targ:getMod(tpz.mod.SKILLCHAINBONUS)
	local SCDMG = targ:getMod(tpz.mod.SKILLCHAINDMG)
	local Block = targ:getMod(tpz.mod.SHIELDBLOCKRATE) + shieldBaseBlockRate
	local Guard = targ:getMod(tpz.mod.GUARD)
	local Counter = targ:getMod(tpz.mod.COUNTER)
	local CounterDMG = targ:getMod(tpz.mod.COUNTER_DMG)
	local CounterCHR = targ:getMod(tpz.mod.COUNTER_CRIT_HIT_RATE)
	local ConserveMP = targ:getMod(tpz.mod.CONSERVE_MP)
	local AugConserveMP = targ:getMod(tpz.mod.AUGMENT_CONSERVE_MP)
	local AugComposure = targ:getMod(tpz.mod.AUGMENT_COMPOSURE)
	local EnhMagicDuration = targ:getMod(tpz.mod.ENH_MAGIC_DURATION)
	local EnhRestraint = targ:getMod(tpz.mod.ENH_RESTRAINT)
	local ATKVariesHP = targ:getMod(tpz.mod.OCC_VARIES_ATT_HP)
	local ATKVariesPetHP = targ:getMod(tpz.mod.OCC_VARIES_ATT_PET_HP)
	local Recycle = targ:getMod(tpz.mod.RECYCLE) + targ:getMerit(tpz.merit.RECYCLE)
	local RapidShot = targ:getMod(tpz.mod.RAPID_SHOT) + targ:getMerit(tpz.merit.RAPID_SHOT_RATE)
	local AugRapidShot = targ:getMod(tpz.mod.RAPID_SHOT_DOUBLE_DAMAGE)
	local Snapshot = targ:getMod(tpz.mod.SNAP_SHOT) + targ:getMerit(tpz.merit.SNAPSHOT)
	local DoubleShot = targ:getMod(tpz.mod.DOUBLE_SHOT_RATE)
	local TripleShot = targ:getMod(tpz.mod.TRIPLE_SHOT_RATE)
	local TrueShot = targ:getMod(tpz.mod.TRUE_SHOT)
	local TPBonus = targ:getMod(tpz.mod.TP_BONUS)
	local StoreTP = targ:getMod(tpz.mod.STORETP)
	local SaveTP = targ:getMod(tpz.mod.SAVETP)
	local MoveSPD = targ:getMod(tpz.mod.MOVE)
	local TreasureHunter = targ:getMod(tpz.mod.TREASURE_HUNTER)
	local CPot = targ:getMod(tpz.mod.CURE_POTENCY)
	local CPotII = targ:getMod(tpz.mod.CURE_POTENCY_II)
	local CRPot = targ:getMod(tpz.mod.CURE_POTENCY_RCVD)
	local SID = targ:getMod(tpz.mod.SPELLINTERRUPT)
	local HasteMag = utils.clamp(targ:getMod(tpz.mod.HASTE_MAGIC) / 100, 0, 44)
	local HasteAbil = utils.clamp(targ:getMod(tpz.mod.HASTE_ABILITY) / 100, 0, 25)
	local HasteGear = utils.clamp(targ:getMod(tpz.mod.HASTE_GEAR) / 100, 0, 25)
	local BlitzerRoll = targ:getMod(tpz.mod.DELAYP)
	local FastCast = targ:getMod(tpz.mod.FASTCAST)
	local UFastCast = targ:getMod(tpz.mod.UFASTCAST)
	local SleepRES = targ:getMod(tpz.mod.SLEEPRES) + targ:getMod(tpz.mod.ALLSTATUSRES)
	local PoisonRES = targ:getMod(tpz.mod.POISONRES) + targ:getMod(tpz.mod.ALLSTATUSRES)
	local ParaRES = targ:getMod(tpz.mod.PARALYZERES) + targ:getMod(tpz.mod.ALLSTATUSRES)
	local BlindRES = targ:getMod(tpz.mod.BLINDRES) + targ:getMod(tpz.mod.ALLSTATUSRES)
	local SilenceRES = targ:getMod(tpz.mod.SILENCERES) + targ:getMod(tpz.mod.ALLSTATUSRES)
	local VirusRES = targ:getMod(tpz.mod.VIRUSRES) + targ:getMod(tpz.mod.ALLSTATUSRES)
	local ParalyzeRES = targ:getMod(tpz.mod.PARALYZERES) + targ:getMod(tpz.mod.ALLSTATUSRES)
	local PetrifyRES = targ:getMod(tpz.mod.PETRIFYRES) + targ:getMod(tpz.mod.ALLSTATUSRES)
	local BindRES = targ:getMod(tpz.mod.BINDRES) + targ:getMod(tpz.mod.ALLSTATUSRES)
	local CurseRES = targ:getMod(tpz.mod.CURSERES) + targ:getMod(tpz.mod.ALLSTATUSRES)
	local GravityRES = targ:getMod(tpz.mod.GRAVITYRES) + targ:getMod(tpz.mod.ALLSTATUSRES)
	local SlowRES = targ:getMod(tpz.mod.SLOWRES) + targ:getMod(tpz.mod.ALLSTATUSRES)
	local StunRES = targ:getMod(tpz.mod.STUNRES) + targ:getMod(tpz.mod.ALLSTATUSRES)
	local CharmRES = targ:getMod(tpz.mod.CHARMRES) + targ:getMod(tpz.mod.ALLSTATUSRES)
	local AmnesiaRES = targ:getMod(tpz.mod.AMNESIARES) + targ:getMod(tpz.mod.ALLSTATUSRES)
	local LullabyRES = targ:getMod(tpz.mod.LULLABYRES) + targ:getMod(tpz.mod.ALLSTATUSRES)
	local DeathRES = targ:getMod(tpz.mod.DEATHRES) + targ:getMod(tpz.mod.ALLSTATUSRES)
	local BarNullChance = targ:getMod(tpz.mod.BAR_ELEMENT_NULL_CHANCE)
	local CharmChance = targ:getMod(tpz.mod.CHARM_CHANCE)
	local AllKiller = targ:getMod(tpz.mod.ALL_KILLER_EFFECTS) + targ:getMerit(tpz.merit.KILLER_EFFECTS)
	local RewardAug = targ:getMod(tpz.mod.AUGMENT_REWARD)
	local CallBeast = targ:getMod(tpz.mod.BEAST_AFFINITY) + targ:getMerit(tpz.merit.BEAST_AFFINITY)
	local TacticalParry = targ:getMod(tpz.mod.TACTICAL_PARRY)
	local NinjutsuDMG = targ:getMod(tpz.mod.NIN_NUKE_BONUS)
	local Daken = targ:getMod(tpz.mod.DAKEN)
	local ToolExpertise = targ:getMod(tpz.mod.NINJA_TOOL)
	local UtsusemiCast = targ:getMod(tpz.mod.UTSUSEMI_CAST)
	local BloodBoon = targ:getMod(tpz.mod.BLOOD_BOON)
	local AugBloodBoon = targ:getMod(tpz.mod.AUGMENT_BLOOD_BOON)
	local BPDelay = targ:getMod(tpz.mod.BP_DELAY)
	local BPDelayII = targ:getMod(tpz.mod.BP_DELAY_II)
	local FavorBPDelay = targ:getMod(tpz.mod.AVATARS_FAVOR_BP_DELAY)
	local Perpetuation = targ:getMod(tpz.mod.AVATAR_PERPETUATION)
	local AugmentSongs = targ:getMod(tpz.mod.AUGMENT_SONGS)
	local ZanshinDblDMG = targ:getMod(tpz.mod.ZANSHIN_DOUBLE_DAMAGE)
	local AugYonin = targ:getMod(tpz.mod.AUGMENT_YONIN)
	local SpiritLinkPotency = targ:getMod(tpz.mod.SPIRIT_LINK_POTENCY)
	local AugmentBlueMagic = targ:getMod(tpz.mod.AUGMENT_BLUE_MAGIC)
	
	local RedLotusBladeDMG = targ:getMod(tpz.mod.RED_LOTUS_BLADE_DMG)
	local AsuranFistsDMG = targ:getMod(tpz.mod.ASURAN_FISTS_DMG)
	local SeraphStrikeDMG = targ:getMod(tpz.mod.SERAPH_STRIKE_DMG)
	local SteelCycloneDMG = targ:getMod(tpz.mod.STEEL_CYCLONE_DMG)
	local BlastShotDMG = targ:getMod(tpz.mod.BLAST_SHOT_DMG)
	
	local WaterACC = targ:getMod(tpz.mod.WATERACC)
	local WaterMAB = targ:getMod(tpz.mod.WATERATT)
	
	local ParrySkill = ((targ:getCharSkillLevel(tpz.skill.PARRY) + targ:getMod(tpz.mod.PARRY) + targ:getILvlParry()) * 0.1)
	local Parry = utils.clamp((ParrySkill + 10), 5, 25) + targ:getMod(tpz.mod.PARRY_RATE_BONUS)
	
	local ExpRate = targ:getMod(tpz.mod.EXP_BONUS)
	local DedicationCap = 0
	
	if (targ:hasStatusEffect(tpz.effect.DEDICATION)) then
		DedicationCap = targ:getStatusEffect(tpz.effect.DEDICATION):getSubPower()
	end
	
	if (targ:hasStatusEffect(tpz.effect.ISSEKIGAN)) then
		Parry = Parry + 25
	end
	
	if (CharmRES == nil) then
		CharmRES = 0
	end
	
	player:PrintToPlayer(string.format("PLAYER STATISTICS ---------------------------------------------------------------------------------------------------------------------------------"),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("  LVL: [%i]  STR: [%i]  DEX: [%i]  VIT: [%i]  AGI: [%i]  INT: [%i]  MND: [%i]  CHR: [%i]  Regen: [%i]  Refresh: [%i]  Regain: [%i]", LVL, STR, DEX, VIT, AGI, INT, MND, CHR, Regen, Refresh, Regain),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("  Enmity: [%i%%]  Gear Haste: [%2.2f%%]  Magic Haste: [%2.2f%%]  Ability Haste: [%2.2f%%]  Blitzer's Roll: [%i%%]  Movement Speed: [%i%%]  Treasure Hunter: [%i]", Enmity, HasteGear, HasteMag, HasteAbil, BlitzerRoll, MoveSPD, TreasureHunter),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("  Paralyze RES: [%i]  Bind RES: [%i]  Silence RES: [%i]  Gravity RES: [%i]  Petrify RES: [%i]  Slow RES: [%i]  Stun RES: [%i]  Poison RES: [%i]", ParalyzeRES, BindRES, SilenceRES, GravityRES, PetrifyRES, SlowRES, StunRES, PoisonRES),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("  Virus RES: [%i]  Amnesia RES: [%i]  Sleep RES: [%i]  Blind RES: [%i]  Curse RES: [%i]  Charm RES: [%i]  Lullaby RES: [%i]  Death RES: [%i]", VirusRES, AmnesiaRES, SleepRES, BlindRES, CurseRES, CharmRES, LullabyRES, DeathRES),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("  EXP Bonus: [%i%%]  Dedication: [%i EXP Remaining]", ExpRate, DedicationCap),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("COMBAT STATISTICS ---------------------------------------------------------------------------------------------------------------------------------"),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("  ATK: [%i]  R.ATK: [%i]  Crit Hit Rate: [%i%%]  Crit Hit DMG: [%i%%]  MAB: [%i]  M.DMG: [%i]  M.Burst DMG: [%i]  M.Crit Rate: [%i]  M.Crit DMG: [%i]" , ATT, RATT, CritHitRate, CritHitDamage, MATT, MDMG, MBurst, MCritRate, MCritDMG),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("  Accuracy: [%i]  Ranged Accuracy: [%i]  Magic Accuracy: [%i]  Evasion: [%i]  Magic EVA: [%i]  Magic EVA II: [%i]  Magic DEF: [%i]", ACC, RACC, MACC, EVA, MEVA, MEVAII, MDEF),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("  Damage Taken: [%i%%]  Physical DT: [%i%%]  Physical DT II: [%i%%]  Magic DT: [%i%%]  Magic DT II: [%i%%]  Breath DT: [%i%%]  Crit Hit EVA: [%i%%]", DT, PDT, PDTII, MDT, MDTII, BDT, CritHitEVA),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("  SDT Fire: [%i%%]  Ice: [%i%%]  Wind: [%i%%]  Earth: [%i%%]  Lightning: [%i%%]  Water: [%i%%]  Light: [%i%%]  Dark: [%i%%]", SDTFire, SDTIce, SDTWind, SDTEarth, SDTLightning, SDTWater, SDTLight, SDTDark),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("  Absorb Fire: [%i%%]  Ice: [%i%%]  Wind: [%i%%]  Earth: [%i%%]  Lightning: [%i%%]  Water: [%i%%]  Light: [%i%%]  Dark: [%i%%]", AbsorbFire, AbsorbIce, AbsorbWind, AbsorbEarth, AbsorbLightning, AbsorbWater, AbsorbLight, AbsorbDark),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("  Parry: [%i%%]  Block: [%i%%]  Guard: [%i%%]  Counter: [%i%%]  Counter DMG: [%i]  Counter Crit Hit Rate: [%i%%]  Conserve MP: [%i%%]", Parry, Block, Guard, Counter, CounterDMG, CounterCHR, ConserveMP),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("  Weaponskill Damage: [%i%%]  Skillchain Damage: [%i%%]  Skillchain Bonus: [%i%%]  TP Bonus: [%i]  Store TP: [%i]  Save TP: [%i]", WSDMG, SCDMG, SCBonus, TPBonus, StoreTP, SaveTP),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("TRAIT/ABILITY STATISTICS --------------------------------------------------------------------------------------------------------------------------"),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("  Double Attack: [%i%%]  Triple Attack: [%i%%]  Quad Attack: [%i%%]  Kick Attack: [%i%%]  Dual Wield: [%i]", DoubleAttack, TripleAttack, QuadAttack, KickAttack, DualWield),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("  Subtle Blow: [%i]  Subtle Blow II: [%i]", SubtleBlow, SubtleBlowII),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("  Cure Potency: [%i%%]  Cure Potency II: [%i%%]  Cure Rec. Potency: [%i%%]  Spell Interrupt Down: [%i%%]  Fast Cast: [%i%%]  UFast Cast: [%i]", CPot, CPotII, CRPot, SID, FastCast, UFastCast),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("  Recycle: [%i%%]  Rapid Shot: [%i%%]  Snapshot: [%i%%]  True Shot: [%i%%]  Dbl Shot: [%i%%]  Tpl Shot: [%i%%]", Recycle, RapidShot, Snapshot, TrueShot, DoubleShot, TripleShot),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("  Charm Chance: [%i]  All Killer Effects: [%i]  Augment Reward: [%i]  Call Beast Level: [%i]  Tactical Parry: [%i]", CharmChance, AllKiller, RewardAug, CallBeast, TacticalParry),tpz.msg.channel.SYSTEM_3)	
	player:PrintToPlayer(string.format("  Ninjutsu Damage: [%i]  Daken Chance: [%i%%]  Tool Expertise: [%i%%]  Utsusemi Cast Time: [%i%%]  Blood Boon: [%i%%]", NinjutsuDMG, Daken, ToolExpertise, UtsusemiCast, BloodBoon),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("  BP Delay I: [-%i]  BP Delay II: [-%i]  Favor BP Delay: [-%i]  Perp: [%i]  Damage Limit Trait: [%i]  Damage Limit Gear: [%i%%]", BPDelay, BPDelayII, FavorBPDelay, Perpetuation, DLTrait, DLGear),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("------------------------------------------------------------------------------------------------------------------------------------------------------"),tpz.msg.channel.SYSTEM_3)
	-- player:PrintToPlayer(string.format("  Red Lotus Blade DMG: [%i]", RedLotusBladeDMG),tpz.msg.channel.SYSTEM_3)
	-- player:PrintToPlayer(string.format("  Water MAB: [%i]  Water ACC: [%i]", WaterMAB, WaterACC),tpz.msg.channel.SYSTEM_3)
end
--------------------------------------------------------------
-- func: !stats1
-- auth: Schaedel
-- desc: Gives the player a list of stats. (GM test command)
--------------------------------------------------------------
require("scripts/globals/utils")
--------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
};

function onTrigger(player)
	local jobMagic = {tpz.job.WHM, tpz.job.BLM, tpz.job.RDM, tpz.job.PLD, tpz.job.DRK, tpz.job.NIN, tpz.job.BLU, tpz.job.SCH, tpz.job.GEO}
	local jobMagicSkill = {tpz.skill.DIVINE_MAGIC, tpz.skill.ELEMENTAL_MAGIC, tpz.skill.ENFEEBLING_MAGIC, tpz.skill.DIVINE_MAGIC, tpz.skill.ELEMENTAL_MAGIC, tpz.skill.NINJUTSU, tpz.skill.BLUE_MAGIC, tpz.skill.ELEMENTAL_MAGIC, tpz.skill.ELEMENTAL_MAGIC}
	local mainHandWeapons = {tpz.skill.HAND_TO_HAND, tpz.skill.DAGGER, tpz.skill.SWORD, tpz.skill.AXE, tpz.skill.CLUB, tpz.skill.KATANA, tpz.skill.GREAT_SWORD, tpz.skill.GREAT_AXE, tpz.skill.SCYTHE, tpz.skill.POLEARM, tpz.skill.GREAT_KATANA, tpz.skill.STAFF}
	local weapons = {tpz.skill.DAGGER, tpz.skill.SWORD, tpz.skill.AXE, tpz.skill.CLUB, tpz.skill.KATANA, tpz.skill.GREAT_SWORD, tpz.skill.GREAT_AXE, tpz.skill.SCYTHE, tpz.skill.POLEARM, tpz.skill.GREAT_KATANA, tpz.skill.STAFF}
	local rangedWeapons = {tpz.skill.ARCHERY, tpz.skill.MARKSMANSHIP, tpz.skill.THROWING}

	local weaponType = player:getWeaponSkillType(tpz.slot.MAIN)
	local rangedWeaponType = player:getWeaponSkillType(tpz.slot.RANGED)
	local shieldBaseBlockRate = 0
	
	if (player:getShieldSize() ~= 0) then
		if (player:getShieldSize() == 1) then
			shieldBaseBlockRate = 55
		elseif (player:getShieldSize() == 2) then
			shieldBaseBlockRate = 40
		elseif (player:getShieldSize() == 3) then
			shieldBaseBlockRate = 45
		elseif (player:getShieldSize() == 4) then
			shieldBaseBlockRate = 30
		end
	end

	local DLTrait = player:getMod(tpz.mod.DAMAGE_LIMIT_TRAIT)
	local DLGear = player:getMod(tpz.mod.DAMAGE_LIMIT_GEAR)
	local MainDMG = player:getMod(tpz.mod.MAIN_DMG_RATING)
	local LVL = player:getMainLvl()
	local STR = player:getStat(tpz.mod.STR)
	local DEX = player:getStat(tpz.mod.DEX)
	local VIT = player:getStat(tpz.mod.VIT)
	local AGI = player:getStat(tpz.mod.AGI)
	local INT = player:getStat(tpz.mod.INT)
	local MND = player:getStat(tpz.mod.MND)
	local CHR = player:getStat(tpz.mod.CHR)
	local Enmity = player:getMod(tpz.mod.ENMITY)
	local Regen = player:getMod(tpz.mod.REGEN)
	local Refresh = player:getMod(tpz.mod.REFRESH)
	local Regain = player:getMod(tpz.mod.REGAIN)
	
	local weaponATT = 0
	if (weaponType ~= tpz.skill.HAND_TO_HAND) then
		for i = 1, 11 do
			if (weaponType == weapons[i]) then
				weaponATT = ((player:getStat(tpz.mod.STR) * 3) / 4) + player:getSkillLevel(weapons[i]) + player:getILvlSkill(tpz.slot.MAIN)
			end
		end
	else
		weaponATT = ((player:getStat(tpz.mod.STR) * 5) / 8) + player:getSkillLevel(tpz.skill.HAND_TO_HAND) + player:getILvlSkill(tpz.slot.MAIN)
	end
	
	local ATT = math.floor(8 + player:getMod(tpz.mod.ATT) + weaponATT)
	ATT = ATT + (math.min(ATT * (player:getMod(tpz.mod.FOOD_ATTP) / 100), player:getMod(tpz.mod.FOOD_ATT_CAP)))
	
	local rangedWeaponATT = 0
	for i = 1, 3 do
		if (rangedWeaponType == rangedWeapons[i]) then
			rangedWeaponATT = (player:getStat(tpz.mod.STR) / 2) + player:getSkillLevel(rangedWeapons[i]) + player:getILvlSkill(tpz.slot.RANGED)
		end
	end
	
	local RATT = math.floor(8 + player:getMod(tpz.mod.RATT) + rangedWeaponATT)
	RATT = RATT + (math.min(RATT * (player:getMod(tpz.mod.FOOD_RATTP) / 100), player:getMod(tpz.mod.FOOD_RATT_CAP)))
	
	local MATT = player:getMod(tpz.mod.MATT)
	local MDMG = player:getMod(tpz.mod.MAGIC_DAMAGE)
	local MBurst = player:getMod(tpz.mod.MAG_BURST_BONUS)
	local MCritRate = player:getMod(tpz.mod.MAGIC_CRITHITRATE)
	local MCritDMG = player:getMod(tpz.mod.MAGIC_CRIT_DMG_INCREASE)
	
	local weaponACC = 0
	for i = 1, 12 do
		if (weaponType == i) then
			weaponACC = player:getSkillLevel(i) + player:getILvlSkill(tpz.slot.MAIN)
			
			if (weaponACC >= 201 and weaponACC <= 400) then
				weaponACC = ((weaponACC - 200) * 0.9) + 200
			elseif (weaponACC >= 401 and weaponACC <= 600) then
				weaponACC = ((weaponACC - 400) * 0.8) + 380
			elseif (weaponACC >= 601) then
				weaponACC = ((weaponACC - 600) * 0.9) + 540
			end
		end
	end
	
	local ACC = math.floor((player:getStat(tpz.mod.DEX) * 0.75) + player:getMod(tpz.mod.ACC) + weaponACC)
	ACC = ACC + (math.min(ACC * (player:getMod(tpz.mod.FOOD_ACCP) / 100), player:getMod(tpz.mod.FOOD_ACC_CAP)))
	
	local rangedWeaponACC = 0
	for i = 1, 3 do
		if (rangedWeaponType == rangedWeapons[i]) then
			rangedWeaponACC = player:getSkillLevel(rangedWeapons[i]) + player:getILvlSkill(tpz.slot.RANGED)
			
			if (rangedWeaponACC >= 201 and rangedWeaponACC <= 400) then
				rangedWeaponACC = ((rangedWeaponACC - 200) * 0.9) + 200
			elseif (rangedWeaponACC >= 401 and rangedWeaponACC <= 600) then
				rangedWeaponACC = ((rangedWeaponACC - 400) * 0.8) + 380
			elseif (rangedWeaponACC >= 601) then
				rangedWeaponACC = ((rangedWeaponACC - 600) * 0.9) + 540
			end
		end
	end
	
	local RACC = math.floor(((player:getStat(tpz.mod.AGI) * 3) / 4) + player:getMod(tpz.mod.RACC) + rangedWeaponACC)
	RACC = RACC + (math.min(RACC * (player:getMod(tpz.mod.FOOD_RACCP) / 100), player:getMod(tpz.mod.FOOD_RACC_CAP)))
	
	local MACC = player:getMod(tpz.mod.MACC) + player:getILvlMacc()
	for i = 1, 9 do
		if (player:getMainJob() == jobMagic[i]) then
			MACC = MACC + player:getSkillLevel(jobMagicSkill[i])
		end
	end
	
	if (player:getMainJob() == tpz.job.BRD) then
		if (rangedWeaponType ~= tpz.skill.STRING or rangedWeaponType ~= tpz.skill.WIND) then
			MACC = MACC + player:getSkillLevel(tpz.skill.SINGING)
		elseif (rangedWeaponType == tpz.skill.STRING) then
			MACC = MACC + (player:getSkillLevel(tpz.skill.SINGING) + player:getSkillLevel(tpz.skill.STRING)) / 2
		elseif (rangedWeaponType == tpz.skill.WIND) then
			MACC = MACC + (player:getSkillLevel(tpz.skill.SINGING) + player:getSkillLevel(tpz.skill.WIND)) / 2
		end
	end
	
	local EVA = player:getSkillLevel(tpz.skill.EVASION)
	if (EVA > 200) then
		EVA = ((EVA - 200) * 0.9) + 200
	end
	
	EVA = math.floor((player:getStat(tpz.mod.AGI) / 2) + player:getMod(tpz.mod.EVA) + EVA)
	local MEVA = player:getMod(tpz.mod.MEVA)
	local MEVAII = player:getMod(tpz.mod.MAGIC_EVASION_BOOST_II)
	local MDEF = player:getMod(tpz.mod.MDEF)
	local DT = utils.clamp(player:getMod(tpz.mod.DMG), -50, 50)
	local PDT = utils.clamp(player:getMod(tpz.mod.DMGPHYS), -50, 50)
	local PDTII = player:getMod(tpz.mod.DMGPHYS_II)
	local MDT = utils.clamp(player:getMod(tpz.mod.DMGMAGIC), -50, 50)
	local MDTII = player:getMod(tpz.mod.DMGMAGIC_II)
	local BDT = utils.clamp(player:getMod(tpz.mod.DMGBREATH), -50, 50)
	local SDTFire = player:getMod(tpz.mod.SDT_FIRE)
	local SDTIce = player:getMod(tpz.mod.SDT_ICE)
	local SDTWind = player:getMod(tpz.mod.SDT_WIND)
	local SDTEarth = player:getMod(tpz.mod.SDT_EARTH)
	local SDTLightning = player:getMod(tpz.mod.SDT_LIGHTNING)
	local SDTWater = player:getMod(tpz.mod.SDT_WATER)
	local SDTLight = player:getMod(tpz.mod.SDT_LIGHT)
	local SDTDark = player:getMod(tpz.mod.SDT_DARK)
	local AbsorbFire = player:getMod(tpz.mod.FIRE_ABSORB)
	local AbsorbIce = player:getMod(tpz.mod.ICE_ABSORB)
	local AbsorbWind = player:getMod(tpz.mod.WIND_ABSORB)
	local AbsorbEarth = player:getMod(tpz.mod.EARTH_ABSORB)
	local AbsorbLightning = player:getMod(tpz.mod.LTNG_ABSORB)
	local AbsorbWater = player:getMod(tpz.mod.WATER_ABSORB)
	local AbsorbLight = player:getMod(tpz.mod.LIGHT_ABSORB)
	local AbsorbDark = player:getMod(tpz.mod.DARK_ABSORB)
	local OccAbsorbDMG = player:getMod(tpz.mod.ABSORB_DMG_CHANCE)
	local DoubleAttack = player:getMod(tpz.mod.DOUBLE_ATTACK)
	local DoubleDADMG = player:getMod(tpz.mod.DA_DOUBLE_DAMAGE)
	local TripleAttack = player:getMod(tpz.mod.TRIPLE_ATTACK)
	local TATripleDMG = player:getMod(tpz.mod.TA_TRIPLE_DAMAGE)
	local QuadAttack = player:getMod(tpz.mod.QUAD_ATTACK)
	local KickAttack = player:getMod(tpz.mod.KICK_ATTACK_RATE)
	local ExtraKickAttack = player:getMod(tpz.mod.EXTRA_KICK_ATTACK)
	local DualWield = player:getMod(tpz.mod.DUAL_WIELD)
	local SubtleBlow = player:getMod(tpz.mod.SUBTLE_BLOW)
	local SubtleBlowII = player:getMod(tpz.mod.SUBTLE_BLOW_II)
	local CritHitRate = 5 + player:getMerit(tpz.merit.CRIT_HIT_RATE) + player:getMod(tpz.mod.CRITHITRATE)	
	local CritHitDamage = player:getMod(tpz.mod.CRIT_DMG_INCREASE)
	local CritHitEVA = -player:getMod(tpz.mod.CRIT_HIT_EVASION)
	local WSDMG = player:getMod(tpz.mod.ALL_WSDMG_ALL_HITS) + player:getMod(tpz.mod.YAEGASUMI_WS_BONUS)
	local SCBonus = player:getMod(tpz.mod.SKILLCHAINBONUS)
	local SCDMG = player:getMod(tpz.mod.SKILLCHAINDMG)
	local Block = player:getMod(tpz.mod.SHIELDBLOCKRATE) + shieldBaseBlockRate
	local Guard = player:getMod(tpz.mod.GUARD)
	local Counter = player:getMod(tpz.mod.COUNTER)
	local CounterDMG = player:getMod(tpz.mod.COUNTER_DMG)
	local CounterCHR = player:getMod(tpz.mod.COUNTER_CRIT_HIT_RATE)
	local ConserveMP = player:getMod(tpz.mod.CONSERVE_MP)
	local AugConserveMP = player:getMod(tpz.mod.AUGMENT_CONSERVE_MP)
	local AugComposure = player:getMod(tpz.mod.AUGMENT_COMPOSURE)
	local EnhMagicDuration = player:getMod(tpz.mod.ENH_MAGIC_DURATION)
	local EnhRestraint = player:getMod(tpz.mod.ENH_RESTRAINT)
	local ATKVariesHP = player:getMod(tpz.mod.OCC_VARIES_ATT_HP)
	local ATKVariesPetHP = player:getMod(tpz.mod.OCC_VARIES_ATT_PET_HP)
	local Recycle = player:getMod(tpz.mod.RECYCLE) + player:getMerit(tpz.merit.RECYCLE)
	local RapidShot = player:getMod(tpz.mod.RAPID_SHOT) + player:getMerit(tpz.merit.RAPID_SHOT_RATE)
	local AugRapidShot = player:getMod(tpz.mod.RAPID_SHOT_DOUBLE_DAMAGE)
	local Snapshot = player:getMod(tpz.mod.SNAP_SHOT) + player:getMerit(tpz.merit.SNAPSHOT)
	local DoubleShot = player:getMod(tpz.mod.DOUBLE_SHOT_RATE)
	local TripleShot = player:getMod(tpz.mod.TRIPLE_SHOT_RATE)
	local TrueShot = player:getMod(tpz.mod.TRUE_SHOT)
	local TPBonus = player:getMod(tpz.mod.TP_BONUS)
	local StoreTP = player:getMod(tpz.mod.STORETP)
	local SaveTP = player:getMod(tpz.mod.SAVETP)
	local MoveSPD = player:getMod(tpz.mod.MOVE)
	local TreasureHunter = player:getMod(tpz.mod.TREASURE_HUNTER)
	local CPot = player:getMod(tpz.mod.CURE_POTENCY)
	local CPotII = player:getMod(tpz.mod.CURE_POTENCY_II)
	local CRPot = player:getMod(tpz.mod.CURE_POTENCY_RCVD)
	local SID = player:getMod(tpz.mod.SPELLINTERRUPT)
	local HasteMag = utils.clamp(player:getMod(tpz.mod.HASTE_MAGIC) / 100, 0, 44)
	local HasteAbil = utils.clamp(player:getMod(tpz.mod.HASTE_ABILITY) / 100, 0, 25)
	local HasteGear = utils.clamp(player:getMod(tpz.mod.HASTE_GEAR) / 100, 0, 25)
	local BlitzerRoll = player:getMod(tpz.mod.DELAYP)
	local FastCast = player:getMod(tpz.mod.FASTCAST)
	local UFastCast = player:getMod(tpz.mod.UFASTCAST)
	local SleepRES = player:getMod(tpz.mod.SLEEPRES)
	local PoisonRES = player:getMod(tpz.mod.POISONRES)
	local ParaRES = player:getMod(tpz.mod.PARALYZERES)
	local BlindRES = player:getMod(tpz.mod.BLINDRES)
	local SilenceRES = player:getMod(tpz.mod.SILENCERES)
	local VirusRES = player:getMod(tpz.mod.VIRUSRES)
	local ParalyzeRES = player:getMod(tpz.mod.PARALYZERES)
	local PetrifyRES = player:getMod(tpz.mod.PETRIFYRES)
	local BindRES = player:getMod(tpz.mod.BINDRES)
	local CurseRES = player:getMod(tpz.mod.CURSERES)
	local GravityRES = player:getMod(tpz.mod.GRAVITYRES)
	local SlowRES = player:getMod(tpz.mod.SLOWRES)
	local StunRES = player:getMod(tpz.mod.STUNRES)
	local CharmRES = player:getMod(tpz.mod.CHARMRES)
	local AmnesiaRES = player:getMod(tpz.mod.AMNESIARES)
	local LullabyRES = player:getMod(tpz.mod.LULLABYRES)
	local DeathRES = player:getMod(tpz.mod.DEATHRES)
	local BarNullChance = player:getMod(tpz.mod.BAR_ELEMENT_NULL_CHANCE)
	local CharmChance = player:getMod(tpz.mod.CHARM_CHANCE)
	local AllKiller = player:getMod(tpz.mod.ALL_KILLER_EFFECTS) + player:getMerit(tpz.merit.KILLER_EFFECTS)
	local RewardAug = player:getMod(tpz.mod.AUGMENT_REWARD)
	local CallBeast = player:getMod(tpz.mod.BEAST_AFFINITY) + player:getMerit(tpz.merit.BEAST_AFFINITY)
	local TacticalParry = player:getMod(tpz.mod.TACTICAL_PARRY)
	local NinjutsuDMG = player:getMod(tpz.mod.NIN_NUKE_BONUS)
	local Daken = player:getMod(tpz.mod.DAKEN)
	local ToolExpertise = player:getMod(tpz.mod.NINJA_TOOL)
	local UtsusemiCast = player:getMod(tpz.mod.UTSUSEMI_CAST)
	local BloodBoon = player:getMod(tpz.mod.BLOOD_BOON)
	local AugBloodBoon = player:getMod(tpz.mod.AUGMENT_BLOOD_BOON)
	local BPDelay = player:getMod(tpz.mod.BP_DELAY)
	local BPDelayII = player:getMod(tpz.mod.BP_DELAY_II)
	local FavorBPDelay = player:getMod(tpz.mod.AVATARS_FAVOR_BP_DELAY)
	local Perpetuation = player:getMod(tpz.mod.AVATAR_PERPETUATION)
	local AugmentSongs = player:getMod(tpz.mod.AUGMENT_SONGS)
	local ZanshinDblDMG = player:getMod(tpz.mod.ZANSHIN_DOUBLE_DAMAGE)
	local AugYonin = player:getMod(tpz.mod.AUGMENT_YONIN)
	local SpiritLinkPotency = player:getMod(tpz.mod.SPIRIT_LINK_POTENCY)
	local AugmentBlueMagic = player:getMod(tpz.mod.AUGMENT_BLUE_MAGIC)
	
	local RedLotusBladeDMG = player:getMod(tpz.mod.RED_LOTUS_BLADE_DMG)
	local AsuranFistsDMG = player:getMod(tpz.mod.ASURAN_FISTS_DMG)
	local SeraphStrikeDMG = player:getMod(tpz.mod.SERAPH_STRIKE_DMG)
	local SteelCycloneDMG = player:getMod(tpz.mod.STEEL_CYCLONE_DMG)
	local BlastShotDMG = player:getMod(tpz.mod.BLAST_SHOT_DMG)
	
	local WaterACC = player:getMod(tpz.mod.WATERACC)
	local WaterMAB = player:getMod(tpz.mod.WATERATT)
	
	local ParrySkill = ((player:getCharSkillLevel(tpz.skill.PARRY) + player:getMod(tpz.mod.PARRY) + player:getILvlParry()) * 0.1)
	local Parry = utils.clamp((ParrySkill + 10), 5, 25) + player:getMod(tpz.mod.PARRY_RATE_BONUS)
	
	local ExpRate = player:getMod(tpz.mod.EXP_BONUS)
	local DedicationCap = 0
	
	if (player:hasStatusEffect(tpz.effect.DEDICATION)) then
		DedicationCap = player:getStatusEffect(tpz.effect.DEDICATION):getSubPower()
	end
	
	if (player:hasStatusEffect(tpz.effect.ISSEKIGAN)) then
		Parry = Parry + 25
	end
	
	if (CharmRES == nil) then
		CharmRES = 0
	end
	
	-- player:PrintToPlayer(string.format("PLAYER STATISTICS ---------------------------------------------------------------------------------------------------------------------------------"),tpz.msg.channel.SYSTEM_3)
	-- player:PrintToPlayer(string.format("  LVL: [%i]  STR: [%i]  DEX: [%i]  VIT: [%i]  AGI: [%i]  INT: [%i]  MND: [%i]  CHR: [%i]  Regen: [%i]  Refresh: [%i]  Regain: [%i]", LVL, STR, DEX, VIT, AGI, INT, MND, CHR, Regen, Refresh, Regain),tpz.msg.channel.SYSTEM_3)
	-- player:PrintToPlayer(string.format("  Enmity: [%i%%]  Gear Haste: [%2.2f%%]  Magic Haste: [%2.2f%%]  Ability Haste: [%2.2f%%]  Blitzer's Roll: [%i%%]  Movement Speed: [%i%%]  Treasure Hunter: [%i]", Enmity, HasteGear, HasteMag, HasteAbil, BlitzerRoll, MoveSPD, TreasureHunter),tpz.msg.channel.SYSTEM_3)
	-- player:PrintToPlayer(string.format("  Paralyze RES: [%i]  Bind RES: [%i]  Silence RES: [%i]  Gravity RES: [%i]  Petrify RES: [%i]  Slow RES: [%i]  Stun RES: [%i]  Poison RES: [%i]", ParalyzeRES, BindRES, SilenceRES, GravityRES, PetrifyRES, SlowRES, StunRES, PoisonRES),tpz.msg.channel.SYSTEM_3)
	-- player:PrintToPlayer(string.format("  Virus RES: [%i]  Amnesia RES: [%i]  Sleep RES: [%i]  Blind RES: [%i]  Curse RES: [%i]  Charm RES: [%i]  Lullaby RES: [%i]  Death RES: [%i]", VirusRES, AmnesiaRES, SleepRES, BlindRES, CurseRES, CharmRES, LullabyRES, DeathRES),tpz.msg.channel.SYSTEM_3)
	-- player:PrintToPlayer(string.format("  EXP Bonus: [%i%%]  Dedication: [%i EXP Remaining]", ExpRate, DedicationCap),tpz.msg.channel.SYSTEM_3)
	-- player:PrintToPlayer(string.format("COMBAT STATISTICS ---------------------------------------------------------------------------------------------------------------------------------"),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("  ATK: [%i]  R.ATK: [%i]  Crit Hit Rate: [%i%%]  Crit Hit DMG: [%i%%]  MAB: [%i]  M.DMG: [%i]  M.Burst DMG: [%i]  M.Crit Rate: [%i]  M.Crit DMG: [%i]" , ATT, RATT, CritHitRate, CritHitDamage, MATT, MDMG, MBurst, MCritRate, MCritDMG),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("  Accuracy: [%i]  Ranged Accuracy: [%i]  Magic Accuracy: [%i]  Evasion: [%i]  Magic EVA: [%i]  Magic EVA II: [%i]  Magic DEF: [%i]", ACC, RACC, MACC, EVA, MEVA, MEVAII, MDEF),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("  Damage Taken: [%i%%]  Physical DT: [%i%%]  Physical DT II: [%i%%]  Magic DT: [%i%%]  Magic DT II: [%i%%]  Breath DT: [%i%%]  Crit Hit EVA: [%i%%]", DT, PDT, PDTII, MDT, MDTII, BDT, CritHitEVA),tpz.msg.channel.SYSTEM_3)
	-- player:PrintToPlayer(string.format("  SDT Fire: [%i%%]  Ice: [%i%%]  Wind: [%i%%]  Earth: [%i%%]  Lightning: [%i%%]  Water: [%i%%]  Light: [%i%%]  Dark: [%i%%]", SDTFire, SDTIce, SDTWind, SDTEarth, SDTLightning, SDTWater, SDTLight, SDTDark),tpz.msg.channel.SYSTEM_3)
	-- player:PrintToPlayer(string.format("  Absorb Fire: [%i%%]  Ice: [%i%%]  Wind: [%i%%]  Earth: [%i%%]  Lightning: [%i%%]  Water: [%i%%]  Light: [%i%%]  Dark: [%i%%]", AbsorbFire, AbsorbIce, AbsorbWind, AbsorbEarth, AbsorbLightning, AbsorbWater, AbsorbLight, AbsorbDark),tpz.msg.channel.SYSTEM_3)
	-- player:PrintToPlayer(string.format("  Parry: [%i%%]  Block: [%i%%]  Guard: [%i%%]  Counter: [%i%%]  Counter DMG: [%i]  Counter Crit Hit Rate: [%i%%]  Conserve MP: [%i%%]", Parry, Block, Guard, Counter, CounterDMG, CounterCHR, ConserveMP),tpz.msg.channel.SYSTEM_3)
	-- player:PrintToPlayer(string.format("  Weaponskill Damage: [%i%%]  Skillchain Damage: [%i%%]  Skillchain Bonus: [%i%%]  TP Bonus: [%i]  Store TP: [%i]  Save TP: [%i]", WSDMG, SCDMG, SCBonus, TPBonus, StoreTP, SaveTP),tpz.msg.channel.SYSTEM_3)
	-- player:PrintToPlayer(string.format("TRAIT/ABILITY STATISTICS --------------------------------------------------------------------------------------------------------------------------"),tpz.msg.channel.SYSTEM_3)
	-- player:PrintToPlayer(string.format("  Double Attack: [%i%%]  Triple Attack: [%i%%]  Quad Attack: [%i%%]  Kick Attack: [%i%%]  Dual Wield: [%i]", DoubleAttack, TripleAttack, QuadAttack, KickAttack, DualWield),tpz.msg.channel.SYSTEM_3)
	-- player:PrintToPlayer(string.format("  Subtle Blow: [%i]  Subtle Blow II: [%i]", SubtleBlow, SubtleBlowII),tpz.msg.channel.SYSTEM_3)
	-- player:PrintToPlayer(string.format("  Cure Potency: [%i%%]  Cure Potency II: [%i%%]  Cure Rec. Potency: [%i%%]  Spell Interrupt Down: [%i%%]  Fast Cast: [%i%%]  UFast Cast: [%i]", CPot, CPotII, CRPot, SID, FastCast, UFastCast),tpz.msg.channel.SYSTEM_3)
	-- player:PrintToPlayer(string.format("  Recycle: [%i%%]  Rapid Shot: [%i%%]  Snapshot: [%i%%]  True Shot: [%i%%]  Dbl Shot: [%i%%]  Tpl Shot: [%i%%]", Recycle, RapidShot, Snapshot, TrueShot, DoubleShot, TripleShot),tpz.msg.channel.SYSTEM_3)
	-- player:PrintToPlayer(string.format("  Charm Chance: [%i]  All Killer Effects: [%i]  Augment Reward: [%i]  Call Beast Level: [%i]  Tactical Parry: [%i]", CharmChance, AllKiller, RewardAug, CallBeast, TacticalParry),tpz.msg.channel.SYSTEM_3)	
	-- player:PrintToPlayer(string.format("  Ninjutsu Damage: [%i]  Daken Chance: [%i%%]  Tool Expertise: [%i%%]  Utsusemi Cast Time: [%i%%]  Blood Boon: [%i%%]", NinjutsuDMG, Daken, ToolExpertise, UtsusemiCast, BloodBoon),tpz.msg.channel.SYSTEM_3)
	-- player:PrintToPlayer(string.format("  BP Delay I: [-%i]  BP Delay II: [-%i]  Favor BP Delay: [-%i]  Perp: [%i]  Damage Limit Trait: [%i]  Damage Limit Gear: [%i%%]", BPDelay, BPDelayII, FavorBPDelay, Perpetuation, DLTrait, DLGear),tpz.msg.channel.SYSTEM_3)
	-- player:PrintToPlayer(string.format("------------------------------------------------------------------------------------------------------------------------------------------------------"),tpz.msg.channel.SYSTEM_3)
	-- player:PrintToPlayer(string.format("  Red Lotus Blade DMG: [%i]", RedLotusBladeDMG),tpz.msg.channel.SYSTEM_3)
	-- player:PrintToPlayer(string.format("  Water MAB: [%i]  Water ACC: [%i]", WaterMAB, WaterACC),tpz.msg.channel.SYSTEM_3)
end
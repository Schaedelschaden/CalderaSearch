--------------------------------------------------------------
-- func: !stats
-- auth: Schaedel
-- desc: Gives the player a list of stats.
--------------------------------------------------------------
require("scripts/globals/utils")
--------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
};

function onTrigger(player)
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
	local Regen = player:getMod(tpz.mod.REGEN)
	local Refresh = player:getMod(tpz.mod.REFRESH)
	local Regain = player:getMod(tpz.mod.REGAIN)
	local ATT = player:getMod(tpz.mod.ATT)
	local RATT = player:getMod(tpz.mod.RATT)
	local MATT = player:getMod(tpz.mod.MATT)
	local MDMG = player:getMod(tpz.mod.MAGIC_DAMAGE)
	local MBurst = player:getMod(tpz.mod.MAG_BURST_BONUS)
	local MCritRate = player:getMod(tpz.mod.MAGIC_CRITHITRATE)
	local MCritDMG = player:getMod(tpz.mod.MAGIC_CRIT_DMG_INCREASE)	
	local ACC = player:getMod(tpz.mod.ACC)
	local RACC = player:getMod(tpz.mod.RACC)
	local MACC = player:getMod(tpz.mod.MACC)
	local EVA = player:getMod(tpz.mod.EVA)
	local MEVA = player:getMod(tpz.mod.MEVA)
	local MEVAII = player:getMod(tpz.mod.MAGIC_EVASION_BOOST_II)
	local MDEF = player:getMod(tpz.mod.MDEF)
	local DT = player:getMod(tpz.mod.DMG)
	local PDT = player:getMod(tpz.mod.DMGPHYS)
	local PDTII = player:getMod(tpz.mod.DMGPHYS_II)
	local MDT = player:getMod(tpz.mod.DMGMAGIC)
	local MDTII = player:getMod(tpz.mod.DMGMAGIC_II)
	local BDT = player:getMod(tpz.mod.DMGBREATH)
	local SDTFire = -player:getMod(tpz.mod.SDT_FIRE)
	local SDTIce = -player:getMod(tpz.mod.SDT_ICE)
	local SDTWind = -player:getMod(tpz.mod.SDT_WIND)
	local SDTEarth = -player:getMod(tpz.mod.SDT_EARTH)
	local SDTLightning = -player:getMod(tpz.mod.SDT_LIGHTNING)
	local SDTWater = -player:getMod(tpz.mod.SDT_WATER)
	local SDTLight = -player:getMod(tpz.mod.SDT_LIGHT)
	local SDTDark = -player:getMod(tpz.mod.SDT_DARK)
	local AbsorbFire = player:getMod(tpz.mod.FIRE_ABSORB)
	local AbsorbIce = player:getMod(tpz.mod.ICE_ABSORB)
	local AbsorbWind = player:getMod(tpz.mod.WIND_ABSORB)
	local AbsorbEarth = player:getMod(tpz.mod.EARTH_ABSORB)
	local AbsorbLightning = player:getMod(tpz.mod.LTNG_ABSORB)
	local AbsorbWater = player:getMod(tpz.mod.WATER_ABSORB)
	local AbsorbLight = player:getMod(tpz.mod.LIGHT_ABSORB)
	local AbsorbDark = player:getMod(tpz.mod.DARK_ABSORB)
	local DoubleAttack = player:getMod(tpz.mod.DOUBLE_ATTACK)
	local TripleAttack = player:getMod(tpz.mod.TRIPLE_ATTACK)
	local QuadAttack = player:getMod(tpz.mod.QUAD_ATTACK)
	local DualWield = player:getMod(tpz.mod.DUAL_WIELD)
	local SubtleBlow = player:getMod(tpz.mod.SUBTLE_BLOW)
	local SubtleBlowII = player:getMod(tpz.mod.SUBTLE_BLOW_II)
	local CritHitRate = 5 + player:getMerit(tpz.merit.CRIT_HIT_RATE) + player:getMod(tpz.mod.CRITHITRATE)	
	local CritHitDamage = player:getMod(tpz.mod.CRIT_DMG_INCREASE)
	local CritHitEVA = -player:getMod(tpz.mod.CRIT_HIT_EVASION)
	local WSDMG = player:getMod(tpz.mod.ALL_WSDMG_ALL_HITS) + player:getMod(tpz.mod.YAEGASUMI_WS_BONUS)
	local SCBonus = player:getMod(tpz.mod.SKILLCHAINBONUS)
	local SCDMG = player:getMod(tpz.mod.SKILLCHAINDMG)
	local Block = player:getMod(tpz.mod.SHIELDBLOCKRATE)
	local Counter = player:getMod(tpz.mod.COUNTER)
	local CounterDMG = player:getMod(tpz.mod.COUNTER_DMG)
	local CounterCHR = player:getMod(tpz.mod.COUNTER_CRIT_HIT_RATE)
	local ConserveMP = player:getMod(tpz.mod.CONSERVE_MP)
	local Recycle = player:getMod(tpz.mod.RECYCLE) + player:getMerit(tpz.merit.RECYCLE)
	local RapidShot = player:getMod(tpz.mod.RAPID_SHOT) + player:getMerit(tpz.merit.RAPID_SHOT_RATE)
	local Snapshot = player:getMod(tpz.mod.SNAP_SHOT) + player:getMerit(tpz.merit.SNAPSHOT)
	local DoubleShot = player:getMod(tpz.mod.DOUBLE_SHOT_RATE)
	local TripleShot = player:getMod(tpz.mod.TRIPLE_SHOT_RATE)
	local TrueShot = player:getMod(tpz.mod.TRUE_SHOT)
	local StoreTP = player:getMod(tpz.mod.STORETP)
	local SaveTP = player:getMod(tpz.mod.SAVETP)
	local MoveSPD = player:getMod(tpz.mod.MOVE)
	local TreasureHunter = player:getMod(tpz.mod.TREASURE_HUNTER)
	local CPot = player:getMod(tpz.mod.CURE_POTENCY)
	local CPotII = player:getMod(tpz.mod.CURE_POTENCY_II)
	local CRPot = player:getMod(tpz.mod.CURE_POTENCY_RCVD)
	local SID = player:getMod(tpz.mod.SPELLINTERRUPT)
	local HasteMag = utils.clamp(player:getMod(tpz.mod.HASTE_MAGIC)/100, 0, 44)
	local HasteAbil = utils.clamp(player:getMod(tpz.mod.HASTE_ABILITY)/100, 0, 25)
	local HasteGear = utils.clamp(player:getMod(tpz.mod.HASTE_GEAR)/100, 0, 25)
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
	local AmnesiaRES = player:getMod(tpz.mod.AMNESIARES)
	local LullabyRES = player:getMod(tpz.mod.LULLABYRES)
	local DeathRES = player:getMod(tpz.mod.DEATHRES)
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
	local BPDelay = player:getMod(tpz.mod.BP_DELAY)
	local BPDelayII = player:getMod(tpz.mod.BP_DELAY_II)
	local FavorBPDelay = player:getMod(tpz.mod.AVATARS_FAVOR_BP_DELAY)
	local Perpetuation = player:getMod(tpz.mod.AVATAR_PERPETUATION)
	
	local ParrySkill = ((player:getCharSkillLevel(tpz.skill.PARRY) + player:getMod(tpz.mod.PARRY) + player:getILvlParry()) * 0.1)
	local Parry = utils.clamp((ParrySkill + 10), 5, 25) + player:getMod(tpz.mod.PARRY_RATE_BONUS)
	
	if (player:hasStatusEffect(tpz.effect.ISSEKIGAN)) then
		Parry = Parry + 25
	end
	
	if (CharmRES == nil) then
		CharmRES = 0
	end
	
	player:PrintToPlayer(string.format("PLAYER STATISTICS ---------------------------------------------------------------------------------------------------------------------------------"),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("  LVL: [%i]  STR: [%i]  DEX: [%i]  VIT: [%i]  AGI: [%i]  INT: [%i]  MND: [%i]  CHR: [%i]  Regen: [%i]  Refresh: [%i]  Regain: [%i]", LVL, STR, DEX, VIT, AGI, INT, MND, CHR, Regen, Refresh, Regain),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("  Gear Haste: [%i%%]  Magic Haste: [%i%%]  Ability Haste: [%i%%]  Blitzer's Roll: [%i%%]  Movement Speed: [%i%%]  Treasure Hunter: [%i]", HasteGear, HasteMag, HasteAbil, BlitzerRoll, MoveSPD, TreasureHunter),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("  Paralyze RES: [%i]  Bind RES: [%i]  Silence RES: [%i]  Gravity RES: [%i]  Petrify RES: [%i]  Slow RES: [%i]  Stun RES: [%i]  Poison RES: [%i]", ParalyzeRES, BindRES, SilenceRES, GravityRES, PetrifyRES, SlowRES, StunRES, PoisonRES),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("  Virus RES: [%i]  Amnesia RES: [%i]  Sleep RES: [%i]  Blind RES: [%i]  Curse RES: [%i]  Charm RES: [%i]  Lullaby RES: [%i]  Death RES: [%i]", VirusRES, AmnesiaRES, SleepRES, BlindRES, CurseRES, CharmRES, LullabyRES, DeathRES),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("COMBAT STATISTICS ---------------------------------------------------------------------------------------------------------------------------------"),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("  ATK: [%i]  R.ATK: [%i]  Crit Hit Rate: [%i%%]  Crit Hit DMG: [%i%%]  MAB: [%i]  M.DMG: [%i]  M.Burst DMG: [%i]  M.Crit Rate: [%i]  M.Crit DMG: [%i]" , ATT, RATT, CritHitRate, CritHitDamage, MATT, MDMG, MBurst, MCritRate, MCritDMG),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("  Accuracy: [%i]  Ranged Accuracy: [%i]  Magic Accuracy: [%i]  Evasion: [%i]  Magic EVA: [%i]  Magic EVA II: [%i]  Magic DEF: [%i]", ACC, RACC, MACC, EVA, MEVA, MEVAII, MDEF),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("  Damage Taken: [%i%%]  Physical DT: [%i%%]  Physical DT II: [%i%%]  Magic DT: [%i%%]  Magic DT II: [%i%%]  Breath DT: [%i%%]  Crit Hit EVA: [%i%%]", DT, PDT, PDTII, MDT, MDTII, BDT, CritHitEVA),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("  SDT Fire: [%i%%]  Ice: [%i%%]  Wind: [%i%%]  Earth: [%i%%]  Lightning: [%i%%]  Water: [%i%%]  Light: [%i%%]  Dark: [%i%%]", SDTFire, SDTIce, SDTWind, SDTEarth, SDTLightning, SDTWater, SDTLight, SDTDark),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("  Absorb Fire: [%i%%]  Ice: [%i%%]  Wind: [%i%%]  Earth: [%i%%]  Lightning: [%i%%]  Water: [%i%%]  Light: [%i%%]  Dark: [%i%%]", AbsorbFire, AbsorbIce, AbsorbWind, AbsorbEarth, AbsorbLightning, AbsorbWater, AbsorbLight, AbsorbDark),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("  Parry: [%i%%]  Block: [%i%%]  Counter: [%i%%]  Counter DMG: [%i]  Counter Crit Hit Rate: [%i%%]  Conserve MP: [%i%%]", Parry, Block, Counter, CounterDMG, CounterCHR, ConserveMP),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("  Weaponskill Damage: [%i%%]  Skillchain Damage: [%i%%]  Skillchain Bonus: [%i%%]  Store TP: [%i]  Save TP: [%i]", WSDMG, SCDMG, SCBonus, StoreTP, SaveTP),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("TRAIT/ABILITY STATISTICS --------------------------------------------------------------------------------------------------------------------------"),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("  Double Attack: [%i%%]  Triple Attack: [%i%%]  Quad Attack: [%i%%]  Dual Wield: [%i]  Subtle Blow: [%i]  Subtle Blow II: [%i]", DoubleAttack, TripleAttack, QuadAttack, DualWield, SubtleBlow, SubtleBlowII),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("  Cure Potency: [%i%%]  Cure Potency II: [%i%%]  Cure Rec. Potency: [%i%%]  Spell Interrupt Down: [%i%%]  Fast Cast: [%i%%]  UFast Cast: [%i]", CPot, CPotII, CRPot, SID, FastCast, UFastCast),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("  Recycle: [%i%%]  Rapid Shot: [%i%%]  Snapshot: [%i%%]  True Shot: [%i%%]  Dbl Shot: [%i%%]  Tpl Shot: [%i%%]", Recycle, RapidShot, Snapshot, TrueShot, DoubleShot, TripleShot),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("  Charm Chance: [%i]  All Killer Effects: [%i]  Augment Reward: [%i]  Call Beast Level: [%i]  Tactical Parry: [%i]", CharmChance, AllKiller, RewardAug, CallBeast, TacticalParry),tpz.msg.channel.SYSTEM_3)	
	player:PrintToPlayer(string.format("  Ninjutsu Damage: [%i]  Daken Chance: [%i%%]  Tool Expertise: [%i%%]  Utsusemi Cast Time: [%i%%]  Blood Boon: [%i%%]", NinjutsuDMG, Daken, ToolExpertise, UtsusemiCast, BloodBoon),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("  BP Delay I: [-%i]  BP Delay II: [-%i]  Favor BP Delay: [-%i]  Perp:[%i]  Damage Limit Trait: [%i]  Damage Limit Gear: [%i%%]", BPDelay, BPDelayII, FavorBPDelay, Perpetuation, DLTrait, DLGear),tpz.msg.channel.SYSTEM_3)
	if (player:hasPet() == true) then
		local pet = player:getPet()
		local PetLvl = pet:getMainLvl()
		local PetCurrentHP = pet:getHP()
		local PetMaxHP = pet:getMaxHP()
		local PetRegen = pet:getMod(tpz.mod.REGEN) - pet:getMod(tpz.mod.REGEN_DOWN)
		local PetRefresh = pet:getMod(tpz.mod.REFRESH)
		local PetRegain = pet:getMod(tpz.mod.REGAIN)
		local PetMeleeDMG = pet:getMod(tpz.mod.MAIN_DMG_RATING)
		local PetRangedDMG = pet:getMod(tpz.mod.RANGED_DMG_RATING)
		local PetBaseATT = pet:getStat(tpz.mod.ATT)
		local PetATT = pet:getMod(tpz.mod.ATT)
		local PetATTP = pet:getMod(tpz.mod.ATTP)
		local PetACC = pet:getMod(tpz.mod.ACC)
		local PetRACC = pet:getMod(tpz.mod.RACC)
		local PetDEF = pet:getMod(tpz.mod.DEF)
		local PetDEFP = pet:getMod(tpz.mod.DEFP)
		local PetMDEF = pet:getMod(tpz.mod.MDEF)
		local PetMATT = pet:getMod(tpz.mod.MATT)
		local PetMACC = pet:getMod(tpz.mod.MACC)
		local PetMEVA = pet:getMod(tpz.mod.MEVA)
		local PetEVA = pet:getMod(tpz.mod.EVA)
		local PetSTR = pet:getStat(tpz.mod.STR)
		local PetDEX = pet:getStat(tpz.mod.DEX)
		local PetVIT = pet:getStat(tpz.mod.VIT)
		local PetAGI = pet:getStat(tpz.mod.AGI)
		local PetINT = pet:getStat(tpz.mod.INT)
		local PetMND = pet:getStat(tpz.mod.MND)
		local PetCHR = pet:getStat(tpz.mod.CHR)
		local PetSleepRES = pet:getMod(tpz.mod.SLEEPRES)
		local PetPoisonRES = pet:getMod(tpz.mod.POISONRES)
		local PetParaRES = pet:getMod(tpz.mod.PARALYZERES)
		local PetBlindRES = pet:getMod(tpz.mod.BLINDRES)
		local PetSilenceRES = pet:getMod(tpz.mod.SILENCERES)
		local PetVirusRES = pet:getMod(tpz.mod.VIRUSRES)
		local PetPetrifyRES = pet:getMod(tpz.mod.PETRIFYRES)
		local PetBindRES = pet:getMod(tpz.mod.BINDRES)
		local PetCurseRES = pet:getMod(tpz.mod.CURSERES)
		local PetGravityRES = pet:getMod(tpz.mod.GRAVITYRES)
		local PetSlowRES = pet:getMod(tpz.mod.SLOWRES)
		local PetStunRES = pet:getMod(tpz.mod.STUNRES)
		local PetAmnesiaRES = pet:getMod(tpz.mod.AMNESIARES)
		local PetLullabyRES = pet:getMod(tpz.mod.LULLABYRES)
		local PetDeathRES = pet:getMod(tpz.mod.DEATHRES)
		local PetDT = pet:getMod(tpz.mod.DMG)
		local PetPDT = pet:getMod(tpz.mod.DMGPHYS)
		local PetMDT = pet:getMod(tpz.mod.DMGMAGIC)
		local PetDoubleAttack = pet:getMod(tpz.mod.DOUBLE_ATTACK)
		local PetCritHitRate = 5 + pet:getMod(tpz.mod.CRITHITRATE)
		local PetSCDMG = pet:getMod(tpz.mod.SKILLCHAINDMG)
		local PetBlock = pet:getMod(tpz.mod.SHIELDBLOCKRATE)
		local PetShieldBash = pet:getMod(tpz.mod.AUTO_SHIELD_BASH_DELAY)
		local PetShieldMastery = pet:getMod(tpz.mod.SHIELD_MASTERY_TP)
		
		if (PetATTP == nil) then
			PetATTP = 0
		elseif (PetATTP > 0) then
			PetATT = PetATT * (1 + (PetATTP / 100))
		end
		if (PetDEFP == nil) then
			PetDEFP = 0
		elseif (PetDEFP > 0) then
			PetDEF = PetDEF * (1 + (PetDEFP / 100))
		end
		
		player:PrintToPlayer(string.format("PET STATISTICS -------------------------------------------------------------------------------------------------------------------------------------"),tpz.msg.channel.SYSTEM_3)
		player:PrintToPlayer(string.format("  LVL: [%i]  STR: [%i]  DEX: [%i]  VIT: [%i]  AGI: [%i]  INT: [%i]  MND: [%i]  CHR: [%i]  Melee DMG: [%i]  Ranged DMG: [%i]", PetLvl, PetSTR, PetDEX, PetVIT, PetAGI, PetINT, PetMND, PetCHR, PetMeleeDMG, PetRangedDMG),tpz.msg.channel.SYSTEM_3)
		player:PrintToPlayer(string.format("  HP: [%i/%i]  ATT: [%i]  ATTP: [%i%%]  DEF: [%i]  DEFP: [%i%%]  ACC: [%i]  RACC: [%i]  EVA: [%i]  MATT: [%i]  MACC: [%i]  MEVA: [%i]", PetCurrentHP, PetMaxHP, PetATT, PetATTP, PetDEF, PetDEFP, PetACC, PetRACC, PetEVA, PetMATT, PetMACC, PetMEVA),tpz.msg.channel.SYSTEM_3)
		player:PrintToPlayer(string.format("  Poison RES: [%i]  Paralyze RES: [%i]  Blind RES: [%i]  Silence RES: [%i]  Virus RES: [%i]  Petrify RES: [%i]  Curse RES: [%i]", PetPoisonRES, PetParaRES, PetBlindRES, PetSilenceRES, PetVirusRES, PetPetrifyRES, PetCurseRES),tpz.msg.channel.SYSTEM_3)
		player:PrintToPlayer(string.format("  Regen: [%i]  Refresh: [%i]  Regain: [%i]  Dbl Atk: [%i]  MDEF: [%i]  DT: [%i%%]  PDT: [%i%%]  MDT: [%i%%]  Crit Hit Rate: [%i%%]  SC DMG: [%i%%]", PetRegen, PetRefresh, PetRegain, PetDoubleAttack, PetMDEF, PetDT, PetPDT, PetMDT, PetCritHitRate, PetSCDMG),tpz.msg.channel.SYSTEM_3)
		player:PrintToPlayer(string.format("  Block Rate: [%i]  Shield Bash Delay: [%i]  Shield Mastery: [%i]", PetBlock, PetShieldBash, PetShieldMastery) ,tpz.msg.channel.SYSTEM_3)
		player:PrintToPlayer(string.format("--------------------------------------------------------------------------------------------------------------------------------------------------------"),tpz.msg.channel.SYSTEM_3)
	else
		player:PrintToPlayer(string.format("------------------------------------------------------------------------------------------------------------------------------------------------------"),tpz.msg.channel.SYSTEM_3)
	end
end
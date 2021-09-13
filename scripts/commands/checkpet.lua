--------------------------------------------------------------
-- func: !checkpet
-- auth: Schaedel
-- desc: Checks the stats of the targeted player's pet.
--------------------------------------------------------------
require("scripts/globals/utils")
--------------------------------------------------------------

cmdprops =
{
    permission = 2,
    parameters = ""
};

function onTrigger(player)
	local targ = player:getCursorTarget()
	if (targ:hasPet() == true) then
		local targName = targ:getName()
		
		local pet = targ:getPet()
		local petName = pet:getName()
		
		local weaponType = pet:getWeaponSkillType(tpz.slot.MAIN)
		
		local PetLvl = pet:getMainLvl()
		local PetCurrentHP = pet:getHP()
		local PetMaxHP = pet:getMaxHP()
		local PetFoodHPP = pet:getMod(tpz.mod.FOOD_HPP)
		local PetRegen = pet:getMod(tpz.mod.REGEN) - pet:getMod(tpz.mod.REGEN_DOWN)
		local PetRefresh = pet:getMod(tpz.mod.REFRESH)
		local PetRegain = pet:getMod(tpz.mod.REGAIN)
		local PetMeleeDMG = pet:getMod(tpz.mod.MAIN_DMG_RATING)
		local PetRangedDMG = pet:getMod(tpz.mod.RANGED_DMG_RATING)
		local PetBaseATT = pet:getStat(tpz.mod.ATT)
		local PetATT = pet:getMod(tpz.mod.ATT)
		local PetATTP = pet:getMod(tpz.mod.ATTP)
		local PetFoodATTP = pet:getMod(tpz.mod.FOOD_ATTP)
		local PetRATT = pet:getMod(tpz.mod.RATT)
		local PetRATTP = pet:getMod(tpz.mod.RATTP)
		local PetFoodRATTP = pet:getMod(tpz.mod.FOOD_RATTP)
		
		local weaponACC = 0
		for i = 1, 12 do
			if (weaponType == i) then
				weaponACC = pet:getSkillLevel(i) + pet:getILvlSkill(tpz.slot.MAIN)
				
				if (weaponACC >= 201 and weaponACC <= 400) then
					weaponACC = ((weaponACC - 200) * 0.9) + 200
				elseif (weaponACC >= 401 and weaponACC <= 600) then
					weaponACC = ((weaponACC - 400) * 0.8) + 380
				elseif (weaponACC >= 601) then
					weaponACC = ((weaponACC - 600) * 0.9) + 540
				end
			end
		end
	
		local PetACC = math.floor(((pet:getStat(tpz.mod.DEX) * 0.75) / 2) + pet:getMod(tpz.mod.ACC) + weaponACC)
		local PetFoodACCP = pet:getMod(tpz.mod.FOOD_ACCP)
		local PetRACC = pet:getMod(tpz.mod.RACC)
		local PetFoodRACCP = pet:getMod(tpz.mod.FOOD_RACCP)
		local PetDEF = pet:getMod(tpz.mod.DEF)
		local PetFoodDEFP = pet:getMod(tpz.mod.FOOD_DEFP)
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
		local PetHasteMag = utils.clamp(pet:getMod(tpz.mod.HASTE_MAGIC) / 100, 0, 44)
		local PetHasteAbil = utils.clamp(pet:getMod(tpz.mod.HASTE_ABILITY) / 100, 0, 25)
		local PetHasteGear = utils.clamp(pet:getMod(tpz.mod.HASTE_GEAR) / 100, 0, 25)
		local PetHaste = PetHasteMag + PetHasteAbil + PetHasteGear
		local PetDT = utils.clamp(pet:getMod(tpz.mod.DMG), -50, 50)
		local PetPDT = utils.clamp(pet:getMod(tpz.mod.DMGPHYS), -50, 50)
		local PetMDT = utils.clamp(pet:getMod(tpz.mod.DMGMAGIC), -50, 50)
		local PetDoubleAttack = pet:getMod(tpz.mod.DOUBLE_ATTACK)
		local PetTripleAttack = pet:getMod(tpz.mod.TRIPLE_ATTACK)
		local PetCritHitRate = 5 + pet:getMod(tpz.mod.CRITHITRATE)
		local PetSCDMG = pet:getMod(tpz.mod.SKILLCHAINDMG)
		local PetStoreTP = pet:getMod(tpz.mod.STORETP)
		local PetSicReadySTP = pet:getMod(tpz.mod.ENH_SIC_READY)
		local PetGuard = pet:getMod(tpz.mod.GUARD)
		local PetCounter = pet:getMod(tpz.mod.COUNTER)
		local PetBlock = pet:getMod(tpz.mod.SHIELDBLOCKRATE)
		local PetShieldBash = pet:getMod(tpz.mod.AUTO_SHIELD_BASH_DELAY)
		local PetShieldMastery = pet:getMod(tpz.mod.SHIELD_MASTERY_TP)
		local PetTH = pet:getMod(tpz.mod.TREASURE_HUNTER)
		local PetBeastKiller = pet:getMod(tpz.mod.BEAST_KILLER)
		local PetAmorphKiller = pet:getMod(tpz.mod.AMORPH_KILLER)
		local PetUndeadKiller = pet:getMod(tpz.mod.UNDEAD_KILLER)
		
		PetATT = PetATT + (PetATT * (PetATTP / 100)) + utils.clamp((PetATT * (PetFoodATTP / 100)), 0, pet:getMod(tpz.mod.FOOD_ATT_CAP))
		PetRATT = PetRATT + (PetRATT * (PetRATTP / 100)) + utils.clamp((PetRATT * (PetFoodRATTP / 100)), 0, pet:getMod(tpz.mod.FOOD_RATT_CAP))
		PetACC = PetACC + utils.clamp((PetACC * (PetFoodACCP / 100)), 0, pet:getMod(tpz.mod.FOOD_ACC_CAP))
		PetDEF = PetDEF + (PetDEF * (PetDEFP / 100)) + utils.clamp((PetDEF * (PetFoodDEFP / 100)), 0, pet:getMod(tpz.mod.FOOD_DEF_CAP))
		
		player:PrintToPlayer(string.format("PET STATISTICS -------------------------------------------------------------------------------------------------------------------------------------"),tpz.msg.channel.SYSTEM_3)
		player:PrintToPlayer(string.format("  PLAYER NAME: [%s]  PET NAME: [%s]", targName, petName),tpz.msg.channel.SYSTEM_3)
		player:PrintToPlayer(string.format("  LVL: [%i]  STR: [%i]  DEX: [%i]  VIT: [%i]  AGI: [%i]  INT: [%i]  MND: [%i]  CHR: [%i]  Melee DMG: [%i]  Ranged DMG: [%i]", PetLvl, PetSTR, PetDEX, PetVIT, PetAGI, PetINT, PetMND, PetCHR, PetMeleeDMG, PetRangedDMG),tpz.msg.channel.SYSTEM_3)
		player:PrintToPlayer(string.format("  HP: [%i/%i]  ATT: [%i]  RATT: [%i]  MATT: [%i]  DEF: [%i]  MDEF: [%i]  ACC: [%i]  MACC: [%i]  RACC: [%i]  EVA: [%i]  MEVA: [%i]", PetCurrentHP, PetMaxHP, PetATT, PetRATT, PetMATT, PetDEF, PetMDEF, PetACC, PetMACC, PetRACC, PetEVA, PetMEVA),tpz.msg.channel.SYSTEM_3)
		player:PrintToPlayer(string.format("  Poison RES: [%i]  Paralyze RES: [%i]  Blind RES: [%i]  Silence RES: [%i]  Virus RES: [%i]  Petrify RES: [%i]  Curse RES: [%i]", PetPoisonRES, PetParaRES, PetBlindRES, PetSilenceRES, PetVirusRES, PetPetrifyRES, PetCurseRES),tpz.msg.channel.SYSTEM_3)
		player:PrintToPlayer(string.format("  Regen: [%i]  Refresh: [%i]  Regain: [%i]  Dbl Atk: [%i%%]  Tpl Atk: [%i%%]  DT: [%i%%]  PDT: [%i%%]  MDT: [%i%%]  Crit Hit Rate: [%i%%]  SC DMG: [%i%%]", PetRegen, PetRefresh, PetRegain, PetDoubleAttack, PetTripleAttack, PetDT, PetPDT, PetMDT, PetCritHitRate, PetSCDMG),tpz.msg.channel.SYSTEM_3)
		player:PrintToPlayer(string.format("  TH: [%i]  Store TP: [%i]  Guard: [%i%%]  Counter: [%i%%]  Block: [%i%%]  Shield Bash Delay: [%i]  Shield Mastery: [%i]", PetTH, PetStoreTP, PetGuard, PetCounter, PetBlock, PetShieldBash, PetShieldMastery) ,tpz.msg.channel.SYSTEM_3)
		player:PrintToPlayer(string.format("  Haste Gear: [%i%%]  Haste Ability: [%i%%]  Haste Magic: [%i%%]", PetHasteGear, PetHasteAbil, PetHasteMag) ,tpz.msg.channel.SYSTEM_3)
		-- player:PrintToPlayer(string.format("  Food ATTP: [%i%%]  Food ACCP: [%i%%]", PetFoodATTP, PetFoodACCP) ,tpz.msg.channel.SYSTEM_3)
		-- player:PrintToPlayer(string.format("  Beast Killer: [%i%%]  Amorph Killer: [%i%%]  Undead Killer: [%i%%]", PetBeastKiller, PetAmorphKiller, PetUndeadKiller) ,tpz.msg.channel.SYSTEM_3)
		player:PrintToPlayer(string.format("--------------------------------------------------------------------------------------------------------------------------------------------------------"),tpz.msg.channel.SYSTEM_3)
	else
		player:PrintToPlayer(string.format("Target must have a pet for you to use that command."),tpz.msg.channel.SYSTEM_3)
	end
end
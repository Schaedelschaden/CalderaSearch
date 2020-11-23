--------------------------------------------------------------
-- func: !petstats
-- auth: Schaedel
-- desc: Gives the player a list of their pets' stats.
--------------------------------------------------------------
require("scripts/globals/utils")
--------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
};

function onTrigger(player)
	if (player:hasPet() == true) then
		local pet = player:getPet()
		local PetLvl = pet:getMainLvl()
		local PetCurrentHP = pet:getHP()
		local PetMaxHP = pet:getMaxHP()
		local PetRegen = pet:getMod(tpz.mod.REGEN)
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
	end
end
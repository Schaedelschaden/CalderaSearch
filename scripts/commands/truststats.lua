--------------------------------------------------------------
-- func: !truststats
-- auth: Schaedel
-- desc: Gives the player a list of their trusts' stats.
--------------------------------------------------------------
require("scripts/globals/utils")
--------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
};

function onTrigger(player)
	local trust
	
	if (player:getCursorTarget() ~= nil) then
		trust = player:getCursorTarget()
		
		if (trust:getObjType() == tpz.objType.TRUST) then
			local weaponType = trust:getWeaponSkillType(tpz.slot.MAIN)
			
			local trustLvl = trust:getMainLvl()
			local trustCurrentHP = trust:getHP()
			local trustMaxHP = trust:getMaxHP()
			local trustFoodHPP = trust:getMod(tpz.mod.FOOD_HPP)
			local trustRegen = trust:getMod(tpz.mod.REGEN) - trust:getMod(tpz.mod.REGEN_DOWN)
			local trustRefresh = trust:getMod(tpz.mod.REFRESH)
			local trustRegain = trust:getMod(tpz.mod.REGAIN)
			local trustMeleeDMG = trust:getMod(tpz.mod.MAIN_DMG_RATING)
			local trustRangedDMG = trust:getMod(tpz.mod.RANGED_DMG_RATING)
			local trustBaseATT = trust:getStat(tpz.mod.ATT)
			local trustATT = trust:getMod(tpz.mod.ATT)
			local trustATTP = trust:getMod(tpz.mod.ATTP)
			local trustFoodATTP = trust:getMod(tpz.mod.FOOD_ATTP)
			local trustBaseRATT = trust:getStat(tpz.mod.RATT)
			local trustRATT = trust:getMod(tpz.mod.RATT)
			local trustRATTP = trust:getMod(tpz.mod.RATTP)
			local trustFoodRATTP = trust:getMod(tpz.mod.FOOD_RATTP)
			
			local weaponACC = 0
			for i = 1, 12 do
				if (weaponType == i) then
					weaponACC = trust:getSkillLevel(i) + trust:getILvlSkill(tpz.slot.MAIN)
					
					if (weaponACC >= 201 and weaponACC <= 400) then
						weaponACC = ((weaponACC - 200) * 0.9) + 200
					elseif (weaponACC >= 401 and weaponACC <= 600) then
						weaponACC = ((weaponACC - 400) * 0.8) + 380
					elseif (weaponACC >= 601) then
						weaponACC = ((weaponACC - 600) * 0.9) + 540
					end
				end
			end
		
			local trustACC = trust:getACC() -- math.floor(((trust:getStat(tpz.mod.DEX) * 0.75) / 2) + trust:getMod(tpz.mod.ACC) + weaponACC)
			local trustFoodACCP = trust:getMod(tpz.mod.FOOD_ACCP)
			local trustRACC = trust:getMod(tpz.mod.RACC)
			local trustFoodRACCP = trust:getMod(tpz.mod.FOOD_RACCP)
			local trustDEF = trust:getMod(tpz.mod.DEF)
			local trustFoodDEFP = trust:getMod(tpz.mod.FOOD_DEFP)
			local trustDEFP = trust:getMod(tpz.mod.DEFP)
			local trustMDEF = trust:getMod(tpz.mod.MDEF)
			local trustMATT = trust:getMod(tpz.mod.MATT)
			local trustMACC = trust:getMod(tpz.mod.MACC)
			local trustMEVA = trust:getMod(tpz.mod.MEVA)
			local trustEVA = trust:getMod(tpz.mod.EVA)
			local trustSTR = trust:getStat(tpz.mod.STR)
			local trustDEX = trust:getStat(tpz.mod.DEX)
			local trustVIT = trust:getStat(tpz.mod.VIT)
			local trustAGI = trust:getStat(tpz.mod.AGI)
			local trustINT = trust:getStat(tpz.mod.INT)
			local trustMND = trust:getStat(tpz.mod.MND)
			local trustCHR = trust:getStat(tpz.mod.CHR)
			local trustSleepRES = trust:getMod(tpz.mod.SLEEPRES)
			local trustPoisonRES = trust:getMod(tpz.mod.POISONRES)
			local trustParaRES = trust:getMod(tpz.mod.PARALYZERES)
			local trustBlindRES = trust:getMod(tpz.mod.BLINDRES)
			local trustSilenceRES = trust:getMod(tpz.mod.SILENCERES)
			local trustVirusRES = trust:getMod(tpz.mod.VIRUSRES)
			local trusttrustrifyRES = trust:getMod(tpz.mod.trustRIFYRES)
			local trustBindRES = trust:getMod(tpz.mod.BINDRES)
			local trustCurseRES = trust:getMod(tpz.mod.CURSERES)
			local trustGravityRES = trust:getMod(tpz.mod.GRAVITYRES)
			local trustSlowRES = trust:getMod(tpz.mod.SLOWRES)
			local trustStunRES = trust:getMod(tpz.mod.STUNRES)
			local trustAmnesiaRES = trust:getMod(tpz.mod.AMNESIARES)
			local trustLullabyRES = trust:getMod(tpz.mod.LULLABYRES)
			local trustDeathRES = trust:getMod(tpz.mod.DEATHRES)
			local trustHasteMag = utils.clamp(trust:getMod(tpz.mod.HASTE_MAGIC) / 100, 0, 44)
			local trustHasteAbil = utils.clamp(trust:getMod(tpz.mod.HASTE_ABILITY) / 100, 0, 25)
			local trustHasteGear = utils.clamp(trust:getMod(tpz.mod.HASTE_GEAR) / 100, 0, 25)
			local trustHaste = trustHasteMag + trustHasteAbil + trustHasteGear
			local trustDT = trust:getMod(tpz.mod.DMG)
			local trustPDT = trust:getMod(tpz.mod.DMGPHYS)
			local trustMDT = trust:getMod(tpz.mod.DMGMAGIC)
			local trustDoubleAttack = trust:getMod(tpz.mod.DOUBLE_ATTACK)
			local trustTripleAttack = trust:getMod(tpz.mod.TRIPLE_ATTACK)
			local trustCritHitRate = 5 + trust:getMod(tpz.mod.CRITHITRATE)
			local trustSCDMG = trust:getMod(tpz.mod.SKILLCHAINDMG)
			local trustStoreTP = trust:getMod(tpz.mod.STORETP)
			local trustSicReadySTP = trust:getMod(tpz.mod.ENH_SIC_READY)
			local trustGuard = trust:getMod(tpz.mod.GUARD)
			local trustCounter = trust:getMod(tpz.mod.COUNTER)
			local trustBlock = trust:getMod(tpz.mod.SHIELDBLOCKRATE)
			local trustShieldBash = trust:getMod(tpz.mod.AUTO_SHIELD_BASH_DELAY)
			local trustShieldMastery = trust:getMod(tpz.mod.SHIELD_MASTERY_TP)
			local trustTH = trust:getMod(tpz.mod.TREASURE_HUNTER)
			local trustBeastKiller = trust:getMod(tpz.mod.BEAST_KILLER)
			local trustAmorphKiller = trust:getMod(tpz.mod.AMORPH_KILLER)
			local trustUndeadKiller = trust:getMod(tpz.mod.UNDEAD_KILLER)
			local trustCurePot = trust:getMod(tpz.mod.CURE_POTENCY)
			local trustCureCastTime = trust:getMod(tpz.mod.WHITE_MAGIC_CAST)
			
			trustATT = trustATT + (trustATT * (trustATTP / 100)) + utils.clamp((trustATT * (trustFoodATTP / 100)), 0, trust:getMod(tpz.mod.FOOD_ATT_CAP))
			trustRATT = trustRATT + (trustRATT * (trustRATTP / 100)) + utils.clamp((trustRATT * (trustFoodRATTP / 100)), 0, trust:getMod(tpz.mod.FOOD_RATT_CAP))
			trustACC = trustACC + utils.clamp((trustACC * (trustFoodACCP / 100)), 0, trust:getMod(tpz.mod.FOOD_ACC_CAP))
			trustDEF = trustDEF + (trustDEF * (trustDEFP / 100)) + utils.clamp((trustDEF * (trustFoodDEFP / 100)), 0, trust:getMod(tpz.mod.FOOD_DEF_CAP))
			
			player:PrintToPlayer(string.format("TRUST STATISTICS -----------------------------------------------------------------------------------------------------------------------------------"),tpz.msg.channel.SYSTEM_3)
			player:PrintToPlayer(string.format("  LVL: [%i]  STR: [%i]  DEX: [%i]  VIT: [%i]  AGI: [%i]  INT: [%i]  MND: [%i]  CHR: [%i]  Melee DMG: [%i]  Ranged DMG: [%i]", trustLvl, trustSTR, trustDEX, trustVIT, trustAGI, trustINT, trustMND, trustCHR, trustMeleeDMG, trustRangedDMG),tpz.msg.channel.SYSTEM_3)
			player:PrintToPlayer(string.format("  HP: [%i/%i]  ATT: [%i]  RATT: [%i]  MATT: [%i]  DEF: [%i]  MDEF: [%i]  ACC: [%i]  MACC: [%i]  RACC: [%i]  EVA: [%i]  MEVA: [%i]", trustCurrentHP, trustMaxHP, trustATT, trustRATT, trustMATT, trustDEF, trustMDEF, trustACC, trustMACC, trustRACC, trustEVA, trustMEVA),tpz.msg.channel.SYSTEM_3)
			player:PrintToPlayer(string.format("  Poison RES: [%i]  Paralyze RES: [%i]  Blind RES: [%i]  Silence RES: [%i]  Virus RES: [%i]  Petrify RES: [%i]  Curse RES: [%i]", trustPoisonRES, trustParaRES, trustBlindRES, trustSilenceRES, trustVirusRES, trusttrustrifyRES, trustCurseRES),tpz.msg.channel.SYSTEM_3)
			player:PrintToPlayer(string.format("  Regen: [%i]  Refresh: [%i]  Regain: [%i]  Dbl Atk: [%i%%]  Tpl Atk: [%i%%]  DT: [%i%%]  PDT: [%i%%]  MDT: [%i%%]  Crit Hit Rate: [%i%%]  SC DMG: [%i%%]", trustRegen, trustRefresh, trustRegain, trustDoubleAttack, trustTripleAttack, trustDT, trustPDT, trustMDT, trustCritHitRate, trustSCDMG),tpz.msg.channel.SYSTEM_3)
			player:PrintToPlayer(string.format("  TH: [%i]  Store TP: [%i]  Guard: [%i%%]  Counter: [%i%%]  Block: [%i%%]  Shield Bash Delay: [%i]  Shield Mastery: [%i]", trustTH, trustStoreTP, trustGuard, trustCounter, trustBlock, trustShieldBash, trustShieldMastery) ,tpz.msg.channel.SYSTEM_3)
			player:PrintToPlayer(string.format("  Haste Gear: [%i%%]  Haste Ability: [%i%%]  Haste Magic: [%i%%]", trustHasteGear, trustHasteAbil, trustHasteMag) ,tpz.msg.channel.SYSTEM_3)
			player:PrintToPlayer(string.format("  Cure Potency: [%i%%]  Cure Casting Time: [%i%%]", trustCurePot, trustCureCastTime) ,tpz.msg.channel.SYSTEM_3)
			-- player:PrintToPlayer(string.format("  Food ATTP: [%i%%]  Food ACCP: [%i%%]", trustFoodATTP, trustFoodACCP) ,tpz.msg.channel.SYSTEM_3)
			-- player:PrintToPlayer(string.format("  Beast Killer: [%i%%]  Amorph Killer: [%i%%]  Undead Killer: [%i%%]", trustBeastKiller, trustAmorphKiller, trustUndeadKiller) ,tpz.msg.channel.SYSTEM_3)
			player:PrintToPlayer(string.format("--------------------------------------------------------------------------------------------------------------------------------------------------------"),tpz.msg.channel.SYSTEM_3)
		end
	else
		player:PrintToPlayer(string.format("You must target a summoned trust to use that command."),tpz.msg.channel.SYSTEM_3)
	end
end
--------------------------------------------------------------
-- func: !check
-- auth: Schaedel
-- desc: Check the targeted monster for useful information.
--------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "i"
};

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!check <t>")
end

function onTrigger(player, mobId)

    -- validate mobId
    local targ
    if (mobId == nil) then
        targ = player:getCursorTarget()
        if (targ == nil or not targ:isMob()) then
            error(player,"You must target a mob.")
            return
        end
    else
        targ = GetMobByID(mobId)
        if (targ == nil) then
            error(player,"Invalid mobID.")
            return
        end
    end

    -- Provide mob information.
	local weaponType = targ:getWeaponSkillType(tpz.slot.MAIN)
	local mainHandWeapons = {tpz.skill.HAND_TO_HAND, tpz.skill.DAGGER, tpz.skill.SWORD, tpz.skill.AXE, tpz.skill.CLUB, tpz.skill.KATANA, tpz.skill.GREAT_SWORD, tpz.skill.GREAT_AXE, tpz.skill.SCYTHE, tpz.skill.POLEARM, tpz.skill.GREAT_KATANA, tpz.skill.STAFF}
	
	local Name = targ:getName()
	local fixedName = string.gsub(Name, "_", " ")
	local ID = targ:getID()
	local MainLvl = targ:getMainLvl()
	local HP = targ:getHP()
	local MaxHP = targ:getMaxHP()
	local MP = targ:getMP()
	local TP = targ:getTP()
	local Respawn = targ:getRespawnTime()/60000
	local STR = targ:getStat(tpz.mod.STR)
	local DEX = targ:getStat(tpz.mod.DEX)
	local VIT = targ:getStat(tpz.mod.VIT)
	local AGI = targ:getStat(tpz.mod.AGI)
	local INT = targ:getStat(tpz.mod.INT)
	local MND = targ:getStat(tpz.mod.MND)
	local CHR = targ:getStat(tpz.mod.CHR)
	local Regen = targ:getMod(tpz.mod.REGEN)
	local ATTP = targ:getMod(tpz.mod.ATTP)
	
	local weaponATT = 0
	for i = 1, 12 do
		if (weaponType == mainHandWeapons[i]) then
			weaponATT = targ:getSkillLevel(mainHandWeapons[i])
			
			if (weaponATT > 200) then
				weaponATT = ((weaponATT - 200) * 0.9) + 200
			end
		end
	end
	
	local ATT = 8 + targ:getMod(tpz.mod.ATT) + ((targ:getStat(tpz.mod.STR) * 3) / 4) + weaponATT
	local DEF = 8 + targ:getMod(tpz.mod.DEF) + (targ:getStat(tpz.mod.VIT) / 2)
	local DEFP = targ:getMod(tpz.mod.DEFP)
	local MDEF = targ:getMod(tpz.mod.MDEF)
	
	local weaponACC = 0
	for i = 1, 12 do
		if (weaponType == mainHandWeapons[i]) then
			weaponACC = targ:getSkillLevel(mainHandWeapons[i])
			
			if (weaponACC > 200) then
				weaponACC = ((weaponACC - 200) * 0.9) + 200
			end
		end
	end
	
	local ACC = math.floor((targ:getStat(tpz.mod.DEX) * 0.75) + targ:getMod(tpz.mod.ACC) + weaponACC)
	
	local EVA = targ:getSkillLevel(tpz.skill.EVASION)
	if (EVA > 200) then
		EVA = ((EVA - 200) * 0.9) + 200
	end
	
	EVA = math.floor((targ:getStat(tpz.mod.AGI) / 2) + targ:getMod(tpz.mod.EVA) + EVA)
	local MEVA = targ:getMod(tpz.mod.MEVA)
	local MACC = targ:getMod(tpz.mod.MACC)
	local MATT = targ:getMod(tpz.mod.MATT)
	local StoreTP = targ:getMod(tpz.mod.STORETP)
	local CritHitEVA = -targ:getMod(tpz.mod.CRIT_HIT_EVASION)
	local DT = targ:getMod(tpz.mod.DMG)
	local PDT = targ:getMod(tpz.mod.DMGPHYS)
	local RDT = targ:getMod(tpz.mod.DMGRANGE)
	local MDT = targ:getMod(tpz.mod.DMGMAGIC)
	local BDT = targ:getMod(tpz.mod.DMGBREATH)
	local FireRES = targ:getMod(tpz.mod.FIRERES)
	local IceRES = targ:getMod(tpz.mod.ICERES)
	local WindRES = targ:getMod(tpz.mod.WINDRES)
	local EarthRES = targ:getMod(tpz.mod.EARTHRES)
	local ThunderRES = targ:getMod(tpz.mod.THUNDERRES)
	local WaterRES = targ:getMod(tpz.mod.WATERRES)
	local LightRES = targ:getMod(tpz.mod.LIGHTRES)
	local DarkRES = targ:getMod(tpz.mod.DARKRES)
	local SDTFire = targ:getMod(tpz.mod.SDT_FIRE)
	local SDTIce = targ:getMod(tpz.mod.SDT_ICE)
	local SDTWind = targ:getMod(tpz.mod.SDT_WIND)
	local SDTEarth = targ:getMod(tpz.mod.SDT_EARTH)
	local SDTLightning = targ:getMod(tpz.mod.SDT_LIGHTNING)
	local SDTWater = targ:getMod(tpz.mod.SDT_WATER)
	local SDTLight = targ:getMod(tpz.mod.SDT_LIGHT)
	local SDTDark = targ:getMod(tpz.mod.SDT_DARK)
	local HasteGear = targ:getMod(tpz.mod.HASTE_GEAR)
	local HasteMagic = targ:getMod(tpz.mod.HASTE_MAGIC)
	local HasteAbility = targ:getMod(tpz.mod.HASTE_ABILITY)
	local MoveSpd = targ:getMod(tpz.mod.MOVE)
	local BeastKiller = targ:getMod(tpz.mod.BEAST_KILLER)
	local LizardKiller = targ:getMod(tpz.mod.LIZARD_KILLER)
	local VerminKiller = targ:getMod(tpz.mod.VERMIN_KILLER)
	local PlantoidKiller = targ:getMod(tpz.mod.PLANTOID_KILLER)
	local AquanKiller = targ:getMod(tpz.mod.AQUAN_KILLER)
	local AmorphKiller = targ:getMod(tpz.mod.AMORPH_KILLER)
	local BirdKiller = targ:getMod(tpz.mod.BIRD_KILLER)
	
	-- local strBonus = (STR / 1.78) -- STR bonus for one-handed weapon ATT
	
	-- ATT = ATT + strBonus
--	printf("check.lua Base ATT: [%i]\n", ATT)
	local bonus = ATT * (ATTP / 100)
--	printf("check.lua ATTP Bonus: [%f]\n", bonus)
	ATT = ATT + bonus
--	printf("check.lua Adjusted ATT: [%i]\n",ATT)

	local defbonus = DEF * (DEFP / 100)
--	printf("check.lua DEFP Bonus: [%f]\n", defbonus)
	DEF = DEF + defbonus
--	printf("check.lua Adjusted DEF: [%i]\n", DEF)
	
	local Haste = (HasteGear + HasteMagic + HasteAbility) / 100
	
    player:PrintToPlayer(string.format("Mob Name: %s  ID: %i  Level: %i  HP: %i/%i  MP: %i  TP: %i  Respawn: %i minutes", fixedName, ID, MainLvl, HP, MaxHP, MP, TP, Respawn),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("STR: [%i]  DEX: [%i]  VIT: [%i]  AGI: [%i]  INT: [%i]  MND: [%i]  CHR: [%i]  Regen: [%i]  Haste: [%i%%]  Move Spd: [%i%%]", STR, DEX, VIT, AGI, INT, MND, CHR, Regen, Haste, MoveSpd),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("ATK: [%i]  DEF: [%i]  MDEF: [%i]  ACC: [%i]  EVA: [%i]  MEVA: [%i]  MACC: [%i]  MATT: [%i]  Store TP: [%i]  Crit Hit EVA: [%i%%]", ATT, DEF, MDEF, ACC, EVA, MEVA, MACC, MATT, StoreTP, CritHitEVA),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("DMG Taken - All: [%i%%]  Physical: [%i%%]  Ranged: [%i%%]  Magic: [%i%%]  Breath: [%i%%]", DT, PDT, RDT, MDT, BDT),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("Resist - Fire: [%i]  Ice: [%i]  Wind: [%i]  Earth: [%i]  Lightning: [%i]  Water: [%i]  Light: [%i]  Dark: [%i]", FireRES, IceRES, WindRES, EarthRES, ThunderRES, WaterRES, LightRES, DarkRES),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("SDT - Fire: [%i%%]  Ice: [%i%%]  Wind: [%i%%]  Earth: [%i%%]  Lightning: [%i%%]  Water: [%i%%]  Light: [%i%%]  Dark: [%i%%]", SDTFire, SDTIce, SDTWind, SDTEarth, SDTLightning, SDTWater, SDTLight, SDTDark),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("Killer Effects - Beast: [%i%%]  Lizard: [%i%%]  Vermin: [%i%%]  Plantoid: [%i%%]  Aquan: [%i%%]  Amorph: [%i%%]  Bird: [%i%%]", BeastKiller, LizardKiller, VerminKiller, PlantoidKiller, AquanKiller, AmorphKiller, BirdKiller),tpz.msg.channel.SYSTEM_3)
end
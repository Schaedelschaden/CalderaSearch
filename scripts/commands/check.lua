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
	local Name = targ:getName()
	local fixedName = string.gsub(Name, "_", " ")
	local ID = targ:getID()
	local MainLvl = targ:getMainLvl()
	local HP = targ:getHP()
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
	local ATTP = targ:getMod(tpz.mod.ATTP)
	local ATT = targ:getMod(tpz.mod.ATT)
	local DEF = targ:getMod(tpz.mod.DEF)
	local MDEF = targ:getMod(tpz.mod.MDEF)
	local ACC = targ:getMod(tpz.mod.ACC)
	local EVA = targ:getMod(tpz.mod.EVA)
	local MEVA = targ:getMod(tpz.mod.MEVA)
	local MACC = targ:getMod(tpz.mod.MACC)
	local StoreTP = targ:getMod(tpz.mod.STORETP)
	local CritHitEVA = -targ:getMod(tpz.mod.CRIT_HIT_EVASION)
	local FireRES = targ:getMod(tpz.mod.FIRERES)
	local IceRES = targ:getMod(tpz.mod.ICERES)
	local WindRES = targ:getMod(tpz.mod.WINDRES)
	local EarthRES = targ:getMod(tpz.mod.EARTHRES)
	local ThunderRES = targ:getMod(tpz.mod.THUNDERRES)
	local WaterRES = targ:getMod(tpz.mod.WATERRES)
	local LightRES = targ:getMod(tpz.mod.LIGHTRES)
	local DarkRES = targ:getMod(tpz.mod.DARKRES)
	local SDTFire = -targ:getMod(tpz.mod.SDT_FIRE)
	local SDTIce = -targ:getMod(tpz.mod.SDT_ICE)
	local SDTWind = -targ:getMod(tpz.mod.SDT_WIND)
	local SDTEarth = -targ:getMod(tpz.mod.SDT_EARTH)
	local SDTLightning = -targ:getMod(tpz.mod.SDT_LIGHTNING)
	local SDTWater = -targ:getMod(tpz.mod.SDT_WATER)
	local SDTLight = -targ:getMod(tpz.mod.SDT_LIGHT)
	local SDTDark = -targ:getMod(tpz.mod.SDT_DARK)
	
	local strBonus = (STR / 1.78) -- STR bonus for one-handed weapon ATT
	
	ATT = ATT + strBonus
--	printf("check.lua Base ATT: [%i]\n", ATT)
	local bonus = ATT * (ATTP / 100)
--	printf("check.lua ATTP Bonus: [%f]\n", bonus)
	ATT = ATT + bonus
--	printf("check.lua Adjusted ATT: [%i]\n",ATT)
	
    player:PrintToPlayer(string.format("Mob Name: %s  ID: %i  Level: %i  HP: %i  MP: %i  TP: %i  Respawn: %i minutes", fixedName, ID, MainLvl, HP, MP, TP, Respawn),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("STR: [%i]  DEX: [%i]  VIT: [%i]  AGI: [%i]  INT: [%i]  MND: [%i] CHR: [%i]", STR, DEX, VIT, AGI, INT, MND, CHR),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("ATT: [%i]  DEF: [%i]  MDEF: [%i]  ACC: [%i]  EVA: [%i]  MEVA: [%i]  MACC: [%i]  Store TP: [%i]  Crit Hit EVA: [%i%%]", ATT, DEF, MDEF, ACC, EVA, MEVA, MACC, StoreTP, CritHitEVA),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("Resist Fire: [%i%%]  Ice: [%i%%]  Wind: [%i%%]  Earth: [%i%%]  Lightning: [%i%%]  Water: [%i%%]  Light: [%i%%]  Dark: [%i%%]", FireRES, IceRES, WindRES, EarthRES, ThunderRES, WaterRES, LightRES, DarkRES),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("SDT Fire: [%i%%]  Ice: [%i%%]  Wind: [%i%%]  Earth: [%i%%]  Lightning: [%i%%]  Water: [%i%%]  Light: [%i%%]  Dark: [%i%%]", SDTFire, SDTIce, SDTWind, SDTEarth, SDTLightning, SDTWater, SDTLight, SDTDark),tpz.msg.channel.SYSTEM_3)
end
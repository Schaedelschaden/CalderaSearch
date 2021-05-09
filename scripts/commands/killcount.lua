---------------------------------------------------------------------------------------------------
-- func: !killcount
-- desc: Gets the player's Character Variables that have stored their kill counts
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
	-- Sky
	local kcUllikummi = player:getCharVar("KillCounter_Ullikummi")
	local kcDespot = player:getCharVar("KillCounter_Despot")
	local kcOlla = player:getCharVar("KillCounter_Olla")
	local kcZipacna = player:getCharVar("KillCounter_Zipacna")
	local kcMotherGlobe = player:getCharVar("KillCounter_MotherGlobe")
	local kcSteamCleaner = player:getCharVar("KillCounter_SteamCleaner")
	local kcFaust = player:getCharVar("KillCounter_Faust")
	local kcBrigBlade = player:getCharVar("KillCounter_BrigandishBlade")
	local kcByakko = player:getCharVar("KillCounter_Byakko")
	local kcGenbu = player:getCharVar("KillCounter_Genbu")
	local kcSeiryu = player:getCharVar("KillCounter_Seiryu")
	local kcSuzaku = player:getCharVar("KillCounter_Suzaku")
	local kcKirin = player:getCharVar("KillCounter_Kirin")
	-- Sea
	local kcIxAernMNK = player:getCharVar("KillCounter_IxAernMNK")
	local kcIxAernDRK = player:getCharVar("KillCounter_IxAernDRK")
	local kcIxAernDRG = player:getCharVar("KillCounter_IxAernDRG")
	local kcJailOfTemp = player:getCharVar("KillCounter_JailOfTemp")
	local kcJailOfFort = player:getCharVar("KillCounter_JailOfFort")
	local kcJailOfFaith = player:getCharVar("KillCounter_JailOfFaith")
	local kcJailOfHope = player:getCharVar("KillCounter_JailOfHope")
	local kcJailOfJust = player:getCharVar("KillCounter_JailOfJust")
	local kcJailOfPrud = player:getCharVar("KillCounter_JailOfPrud")
	local kcJailOfLove = player:getCharVar("KillCounter_JailOfLove")
	local kcAbsoluteVirtue = player:getCharVar("KillCounter_AbsoluteVirtue")
	-- Abyssea
	local kcRabbit = player:getCharVar("KillCounter_Rabbits")
	local kcMarvin = player:getCharVar("KillCounter_MangyTailedMarvin")
	player:PrintToPlayer(string.format("SKY ------------------------------------------------------------------------------------------------------------------------------------------------"),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("  Ullikummi: [%i]  Despot: [%i]  Olla: [%i]  Zipacna: [%i]  Mother Globe: [%i]  Steam Cleaner: [%i]  Faust: [%i]  Brigandish Blade: [%i]", kcUllikummi, kcDespot, kcOlla, kcZipacna, kcMotherGlobe, kcSteamCleaner, kcFaust, kcBrigBlade),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("  Byakko: [%i]  Genbu: [%i]  Seiryu: [%i]  Suzaku: [%i]  Kirin: [%i]", kcByakko, kcGenbu, kcSeiryu, kcSuzaku, kcKirin),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("SEA ------------------------------------------------------------------------------------------------------------------------------------------------"),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("  Ix'Aern (MNK): [%i]  Ix'Aern (DRK): [%i]  Ix'Aern (DRG): [%i]  Jailer of Temperance: [%i]  Jailer of Fortitude: [%i]  Jailer of Faith: [%i]", kcIxAernMNK, kcIxAernDRK, kcIxAernDRG, kcJailOfTemp, kcJailOfFort, kcJailOfFaith),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("  Jailer of Hope: [%i]  Jailer of Justice: [%i]  Jailer of Prudence: [%i]  Jailer of Love: [%i]  Absolute Virtue: [%i]", kcJailOfHope, kcJailOfJust, kcJailOfPrud, kcJailOfLove, kcAbsoluteVirtue),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("ABYSSEA -------------------------------------------------------------------------------------------------------------------------------------------"),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("  Rabbits: [%i]  Mangy-Tailed Marvin: [%i]", kcRabbit, kcMarvin),tpz.msg.channel.SYSTEM_3)
end
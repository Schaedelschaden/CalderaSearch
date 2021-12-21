--------------------------------------------------------------
-- func: !killhaste
-- auth: Klutix
-- desc: Allows Skeletor to kill his alt Haste.
--------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "" 
}

function onTrigger(player)
	if (player:getName() == "Skeletor" or player:getName() == "Cleavage" or player:getName() == "Haste" or player:getName() == "Avarice") then
		local targ = GetPlayerByName("Haste")
		
		-- targ:injectActionPacket(6, 93) -- Mijin Gakure
		targ:injectActionPacket(4, 219) -- Comet
		-- targ:injectActionPacket(4, 241) -- Meteor
		-- targ:injectActionPacket(4, 280) -- Meteor II
		
		KillPlayerByName(targ:getName())
	else
		printf("killhaste.lua onTrigger NOT AUTHORIZED TO USE THIS!")
	end
end
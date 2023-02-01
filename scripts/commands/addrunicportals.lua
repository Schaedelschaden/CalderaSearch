---------------------------------------------------------------------------------------------------
-- func: !addrunicportals
-- desc: Adds all ToAU Runic Portals to the player.
---------------------------------------------------------------------------------------------------

require("scripts/globals/besieged")

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
	tpz.besieged.addRunicPortal(player, tpz.teleport.runic_portal.AZOUPH)
    tpz.besieged.addRunicPortal(player, tpz.teleport.runic_portal.MAMOOL)
    tpz.besieged.addRunicPortal(player, tpz.teleport.runic_portal.HALVUNG)
    tpz.besieged.addRunicPortal(player, tpz.teleport.runic_portal.DVUCCA)
    tpz.besieged.addRunicPortal(player, tpz.teleport.runic_portal.ILRUSI)
    tpz.besieged.addRunicPortal(player, tpz.teleport.runic_portal.NYZUL)
    player:PrintToPlayer(string.format("%s now has all ToAU Staging Points unlocked.", player:getName()))
end

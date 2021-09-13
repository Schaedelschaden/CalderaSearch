--------------------------------------------------------------
-- func: !signt
-- auth: Schaedel
-- desc: Gives the player signet.
--------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
	player:delStatusEffect(tpz.effect.SIGNET)
	player:injectActionPacket(6,254)
	player:addStatusEffect(tpz.effect.SIGNET, 1, 0, 28800) --Adds Signet, normal strength, 0 tick time, 28,800 seconds (8 hours)
end
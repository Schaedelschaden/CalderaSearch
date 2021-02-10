---------------------------------------------------------------------------------------------------
-- func: !pettest
-- desc: Unlocks DRG in an attempt to force the DB to update.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
}

function onTrigger(player)
    player:unlockJob(tpz.job.DRG)
	player:setPetName(tpz.pet.type.WYVERN, 32)
end
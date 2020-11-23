---------------------------------------------------------------------------------------------------
-- func: !spawnkirin
-- desc: Spawns Kirin.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
}

function onTrigger(player)
    SpawnMob(17506670)
    player:PrintToPlayer( string.format("Spawned Kirin.") )
end
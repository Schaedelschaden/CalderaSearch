---------------------------------------------------------------------------------------------------
-- func: !spawnav
-- desc: Spawns Absolute Virtue.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
}

function onTrigger(player)
    SpawnMob(16912876)
    player:PrintToPlayer( string.format("Spawned Absolute Virtue.") )
end
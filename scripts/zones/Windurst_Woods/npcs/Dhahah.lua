-----------------------------------
-- Area: Windurst Woods
-- NPC: Dhahah
-- Non interactable NPC (Dhalmel)
-----------------------------------
require("scripts/globals/pathfind")

local path =
{
    {3.000, 0.000, 59.000},
    {6.000, 0.000, 72.600},
    {-8.000, 0.000, 82.000},
    { 22.000, 0.000, 82.000},
}

function onSpawn(npc)
    npc:initNpcPathing(path[1][1], path[1][2], path[1][3])
    onPath(npc)
end

function onPath(npc)
    tpz.path.randomPoint(npc, path, false)
end
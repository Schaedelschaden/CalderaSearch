-----------------------------------
-- Area: Windurst Woods
-- NPC: Dhahih
-- Non interactable NPC (Dhalmel)
-----------------------------------
require("scripts/globals/pathfind")

local path =
{
    {20.000, 0.000, 111.000},
    {20.000, 0.000, 87.000},
}

function onSpawn(npc)
    npc:initNpcPathing(path[1][1], path[1][2], path[1][3])
    onPath(npc)
end

function onPath(npc)
    tpz.path.randomPoint(npc, path, false)
end
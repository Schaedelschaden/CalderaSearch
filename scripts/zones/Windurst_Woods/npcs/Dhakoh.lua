-----------------------------------
-- Area: Windurst Woods
-- NPC: Dhakih
-- Non interactable NPC (Dhalmel)
-----------------------------------
require("scripts/globals/pathfind")

local path =
{
    {-22.000, 0.000, 95.000},
    {-18.000, 0.000, 114.000},
	{-10.000, 0.000, 105.000},
}

function onSpawn(npc)
    npc:initNpcPathing(path[1][1], path[1][2], path[1][3])
    onPath(npc)
end

function onPath(npc)
    tpz.path.randomPoint(npc, path, false)
end

function onTrigger(player, npc)
	printf("HACKER!\n")
	player:setHP(0)
end
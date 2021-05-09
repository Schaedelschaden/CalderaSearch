-----------------------------------------
-- ID: 26963
-- Item: Onca Suit
-----------------------------------------
require("scripts/globals/msg")
require("scripts/globals/npc_util")
require("scripts/globals/magic")
-----------------------------------------

function onItemCheck(target)
    return 0
end

function onItemUse(player, target)
	printf("onca_suit.lua onItemUse TRIGGERED")
end
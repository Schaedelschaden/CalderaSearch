-----------------------------------
-- Area: Moh_Gates
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[tpz.zone.MOH_GATES] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6384, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6389, -- Obtained: <item>.
        GIL_OBTAINED            = 6390, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6392, -- Obtained key item: <keyitem>.
		CLIMBING_POSSIBLE       = 7711, -- You might be able to descend/ascend using these vines if you only had <key item>.
		CLIMB_DOWN_UP           = 7712, -- Descend/Ascend? Yes/No.
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[tpz.zone.MOH_GATES]

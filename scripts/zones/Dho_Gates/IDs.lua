-----------------------------------
-- Area: Dho_Gates
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[tpz.zone.DHO_GATES] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6384, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6389, -- Obtained: <item>.
        GIL_OBTAINED            = 6390, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6392, -- Obtained key item: <keyitem>.
		INVENTORY_FULL          = 7165, -- Inventory is full.
		MINING_IS_POSSIBLE_HERE = 7258, -- Mining is possible here if you have a pickaxe.
		PICKAXE_BROKE           = 7262, -- Your pickaxe broke!
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[tpz.zone.DHO_GATES]

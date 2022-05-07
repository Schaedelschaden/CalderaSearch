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
        ITEM_OBTAINED           = 6390, -- Obtained: <item>.
        GIL_OBTAINED            = 6391, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6393, -- Obtained key item: <keyitem>.
        CARRIED_OVER_POINTS     = 7001, -- You have carried over <number> login point[/s].
        LOGIN_CAMPAIGN_UNDERWAY = 7002, -- The [/January/February/March/April/May/June/July/August/September/October/November/December] <number> Login Campaign is currently underway!<space>
        LOGIN_NUMBER            = 7003, -- In celebration of your most recent login (login no. <number>), we have provided you with <number> points! You currently have a total of <number> points.
		INVENTORY_FULL          = 7172, -- Inventory is full.
		MINING_IS_POSSIBLE_HERE = 7265, -- Mining is possible here if you have a pickaxe.
		PICKAXE_BROKE           = 7269, -- Your pickaxe breaks!
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[tpz.zone.DHO_GATES]

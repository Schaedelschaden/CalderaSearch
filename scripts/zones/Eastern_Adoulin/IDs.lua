-----------------------------------
-- Area: Eastern Adoulin (257)
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[tpz.zone.EASTERN_ADOULIN] =
{
    text =
    {
		CANNOT_OBTAIN_MORE      = 6382, -- You cannot obtain any more.
        ITEM_CANNOT_BE_OBTAINED = 6384, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6389, -- Obtained: <item>.
        GIL_OBTAINED            = 6390, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6392, -- Obtained key item: <keyitem>.
        YOU_CAN_NOW_BECOME      = 7010, -- You can now become a [geomancer/rune fencer]!
        MOG_LOCKER_OFFSET       = 7575, -- Your Mog Locker lease is valid until <timestamp>, kupo.
        HOMEPOINT_SET           = 8291, -- Home point set!
        COMMON_SENSE_SURVIVAL   = 13853, -- It appears that you have arrived at a new survival guide provided by the Adventurers' Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[tpz.zone.EASTERN_ADOULIN]

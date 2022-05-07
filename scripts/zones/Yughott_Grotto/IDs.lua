-----------------------------------
-- Area: Yughott Grotto (142)
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[tpz.zone.YUGHOTT_GROTTO] =
{
    text =
    {
        CONQUEST_BASE           = 0,    -- Tallying conquest results...
        ITEM_CANNOT_BE_OBTAINED = 6543, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6549, -- Obtained: <item>.
        GIL_OBTAINED            = 6550, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6552, -- Obtained key item: <keyitem>.
        FELLOW_MESSAGE_OFFSET   = 6578, -- I'm ready. I suppose.
        CARRIED_OVER_POINTS     = 7160, -- You have carried over <number> login point[/s].
        LOGIN_CAMPAIGN_UNDERWAY = 7161, -- The [/January/February/March/April/May/June/July/August/September/October/November/December] <number> Login Campaign is currently underway!<space>
        LOGIN_NUMBER            = 7162, -- In celebration of your most recent login (login no. <number>), we have provided you with <number> points! You currently have a total of <number> points.
        GEOMAGNETRON_ATTUNED    = 7171, -- Your <keyitem> has been attuned to a geomagnetic fount in the corresponding locale.
        FISHING_MESSAGE_OFFSET  = 7216, -- You can't fish here.
        CHEST_UNLOCKED          = 7342, -- You unlock the chest!
        MINING_IS_POSSIBLE_HERE = 7350, -- Mining is possible here if you have <item>.
        HOMEPOINT_SET           = 7450, -- Home point set!
    },
    mob =
    {
        ASHMAKER_GOTBLUT_PH =
        {
            [17358926] = 17358932, -- 16.179 -1.321 -27.321
            [17358920] = 17358932, -- 11.790 -1.379 -19.023
            [17358913] = 17358932, -- -8.000 -0.500 -53.000
            [17358929] = 17358932, -- 16.061 -1.383 10.996
            [17358925] = 17358932, -- 10.890 -1.256 2.267
        },
    },
    npc =
    {
        TREASURE_CHEST = 17359052,
        MINING =
        {
            17359053,
            17359054,
            17359055,
            17359056,
            17359057,
            17359058,
        },
    },
}

return zones[tpz.zone.YUGHOTT_GROTTO]

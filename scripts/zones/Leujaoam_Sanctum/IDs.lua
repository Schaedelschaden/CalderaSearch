-----------------------------------
-- Area: Leujaoam_Sanctum
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[tpz.zone.LEUJAOAM_SANCTUM] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED    = 6384, -- You cannot obtain the <item>. Come back after sorting your inventory.
        FULL_INVENTORY_AFTER_TRADE = 6388, -- You cannot obtain the <item>. Try trading again after sorting your inventory.
        ITEM_OBTAINED              = 6390, -- Obtained: <item>.
        GIL_OBTAINED               = 6391, -- Obtained <number> gil.
        KEYITEM_OBTAINED           = 6393, -- Obtained key item: <keyitem>.
        KEYITEM_LOST               = 6394, -- Lost key item: <keyitem>.
        NOT_HAVE_ENOUGH_GIL        = 6395, -- You do not have enough gil.
        ITEMS_OBTAINED             = 6399, -- You obtain <number> <item>!
        CARRIED_OVER_POINTS        = 7001, -- You have carried over <number> login point[/s].
        LOGIN_CAMPAIGN_UNDERWAY    = 7002, -- The [/January/February/March/April/May/June/July/August/September/October/November/December] <number> Login Campaign is currently underway!<space>
        LOGIN_NUMBER               = 7003, -- In celebration of your most recent login (login no. <number>), we have provided you with <number> points! You currently have a total of <number> points.
        PLAYER_OBTAINS_ITEM        = 7316, -- <name> obtains <item>!
        ASSAULT_START_OFFSET       = 7451, -- Max MP Down removed for <name>.
        TIME_TO_COMPLETE           = 7512, -- You have <number> [minute/minutes] (Earth time) to complete this mission.
        MISSION_FAILED             = 7513, -- The mission has failed. Leaving area.
        RUNE_UNLOCKED_POS          = 7514, -- ission objective completed. Unlocking Rune of Release ([A/B/C/D/E/F/G/H/I/J/K/L/M/N/O/P/Q/R/S/T/U/V/W/X/Y/Z]-#).
        ASSAULT_POINTS_OBTAINED    = 7516, -- You gain <number> [Assault point/Assault points]!
        TIME_REMAINING_MINUTES     = 7517, -- ime remaining: <number> [minute/minutes] (Earth time).
        TIME_REMAINING_SECONDS     = 7518, -- ime remaining: <number> [second/seconds] (Earth time).
        PARTY_FALLEN               = 7520, -- ll party members have fallen in battle. Mission failure in <number> [minute/minutes].
    },

    mob =
    {
        -- Leujaoam Cleansing
        [1] =
        {
            LEUJAOAM_WORM1  = 17059841,
            LEUJAOAM_WORM2  = 17059842,
            LEUJAOAM_WORM3  = 17059843,
            LEUJAOAM_WORM4  = 17059844,
            LEUJAOAM_WORM5  = 17059845,
            LEUJAOAM_WORM6  = 17059846,
            LEUJAOAM_WORM7  = 17059847,
            LEUJAOAM_WORM8  = 17059848,
            LEUJAOAM_WORM9  = 17059849,
            LEUJAOAM_WORM10 = 17059850,
            LEUJAOAM_WORM11 = 17059851,
            LEUJAOAM_WORM12 = 17059852,
            LEUJAOAM_WORM13 = 17059853,
            LEUJAOAM_WORM14 = 17059854,
            LEUJAOAM_WORM15 = 17059855,
        }
    },

    npc =
    {
        ANCIENT_LOCKBOX = 17060014,
        RUNE_OF_RELEASE = 17060015,
        _1X1            = 17060116,
        _1X2            = 17060117,
        _1X3            = 17060118,
        _1X4            = 17060119,
        _1X5            = 17060120,
        _1X6            = 17060121,
        _1X7            = 17060122,
        _1X8            = 17060123,
        _1X9            = 17060124,
        _1XA            = 17060125,
        _1XB            = 17060126,
        _1XC            = 17060127,
        _1XD            = 17060128,
        _1XE            = 17060129,
        _1XF            = 17060130,
        _1XG            = 17060131,
        _1XH            = 17060132,
        _1XI            = 17060133,
        _1XJ            = 17060134,
        _1XK            = 17060135,
        _1XL            = 17060136,
        _1XM            = 17060137,
        _1XN            = 17060138,
        _1XO            = 17060139,
        _1XP            = 17060140,
        _1XQ            = 17060141,
        _1XR            = 17060142,
        _1XS            = 17060143,
        _1XT            = 17060144,
        _1XU            = 17060145,
        _1XV            = 17060146,
        _1XW            = 17060147,
        _1XX            = 17060148,
        _1XY            = 17060149,
        _1XZ            = 17060150,
        _JX0            = 17060151,
        _JX1            = 17060152,
        _JX2            = 17060153,
        _JX3            = 17060154,
        _JX4            = 17060155,
        _JX5            = 17060156,
        _JX6            = 17060157,
        _JX7            = 17060158,
        _JX8            = 17060159,
        _JX9            = 17060160,
        _JXA            = 17060161,
        _JXB            = 17060162,
        _JXC            = 17060163,
        _JXD            = 17060164,
        _JXE            = 17060165,
        _JXF            = 17060166,
        _JXG            = 17060167,
        _JXH            = 17060168,
        _JXI            = 17060169,
        _JXJ            = 17060170,
        _JXK            = 17060171,
    }
}

return zones[tpz.zone.LEUJAOAM_SANCTUM]

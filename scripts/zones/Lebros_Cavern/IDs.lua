-----------------------------------
-- Area: Lebros_Cavern
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[tpz.zone.LEBROS_CAVERN] =
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
        MINE_COUNTDOWN             = 6982, -- <number>...
        CARRIED_OVER_POINTS        = 7001, -- You have carried over <number> login point[/s].
        LOGIN_CAMPAIGN_UNDERWAY    = 7002, -- The [/January/February/March/April/May/June/July/August/September/October/November/December] <number> Login Campaign is currently underway!<space>
        LOGIN_NUMBER               = 7003, -- In celebration of your most recent login (login no. <number>), we have provided you with <number> points! You currently have a total of <number> points.
        TEMP_ITEM                  = 7215, -- Obtained temporary item: <item>!
        PLAYER_OBTAINS_ITEM        = 7216, -- <name> obtains <item>!
        ASSAULT_START_OFFSET       = 7351, -- Max MP Down removed for <name>.
        TIME_TO_COMPLETE           = 7412, -- You have <number> [minute/minutes] (Earth time) to complete this mission.
        MISSION_FAILED             = 7413, -- The mission has failed. Leaving area.
        RUNE_UNLOCKED_POS          = 7414, -- ission objective completed. Unlocking Rune of Release ([A/B/C/D/E/F/G/H/I/J/K/L/M/N/O/P/Q/R/S/T/U/V/W/X/Y/Z]-#).
        ASSAULT_POINTS_OBTAINED    = 7416, -- You gain <number> [Assault point/Assault points]!
        TIME_REMAINING_MINUTES     = 7417, -- ime remaining: <number> [minute/minutes] (Earth time).
        TIME_REMAINING_SECONDS     = 7418, -- ime remaining: <number> [second/seconds] (Earth time).
        PARTY_FALLEN               = 7420, -- ll party members have fallen in battle. Mission failure in <number> [minute/minutes].
    },

    mob = {
        -- Escavation Duty
        [21] =
        {
            VOLCANIC_BOMB1   = 17035265,
            VOLCANIC_BOMB2   = 17035266,
            VOLCANIC_BOMB3   = 17035267,
            QIQIRN_CERAMIST1 = 17035268,
            QIQIRN_VOLCANIS1 = 17035269,
            VOLCANIC_BOMB4   = 17035270,
            VOLCANIC_BOMB5   = 17035271,
            VOLCANIC_BOMB6   = 17035272,
            QIQIRN_CERAMIST2 = 17035273,
            QIQIRN_VOLCANIS2 = 17035274,
            QIQIRN_VOLCANIS3 = 17035275,
            QIQIRN_CERAMIST3 = 17035276,
            QIQIRN_CERAMIST4 = 17035277,
            QIQIRN_CERAMIST5 = 17035278,
            QIQIRN_VOLCANIS4 = 17035279,
            VOLCANIC_BOMB7   = 17035280,
            VOLCANIC_BOMB8   = 17035281,
            BRITTLE_ROCK1    = 17035282,
            BRITTLE_ROCK2    = 17035284,
            BRITTLE_ROCK3    = 17035286,
            BRITTLE_ROCK4    = 17035288,
            BRITTLE_ROCK5    = 17035290,
        },
        -- Lebros Suplies
        [22] =
        {
        },
        -- Troll Figitives
        [23] =
        {
            TROLL_FUGITIVE1  = 17035310,
            TROLL_FUGITIVE2  = 17035311,
            TROLL_FUGITIVE3  = 17035312,
            TROLL_FUGITIVE4  = 17035313,
            TROLL_FUGITIVE5  = 17035314,
            TROLL_FUGITIVE6  = 17035315,
            TROLL_FUGITIVE7  = 17035316,
            TROLL_FUGITIVE8  = 17035317,
            TROLL_FUGITIVE9  = 17035318,
            TROLL_FUGITIVE10 = 17035319,
            TROLL_FUGITIVE11 = 17035320,
            TROLL_FUGITIVE12 = 17035321,
            TROLL_FUGITIVE13 = 17035322,
            TROLL_FUGITIVE14 = 17035323,
            TROLL_FUGITIVE15 = 17035324,

        },
        -- Evade and Escape
        [24] =
        {
        },
        -- Siegemaster Assassination
        [25] =
        {
        },
        -- Apkallu Breeding
        [26] =
        {
        },
        -- Wamoura Farm Raid Assault
        [27] =
        {
            RANCH_WAMOURA1  = 17035359,
            RANCH_WAMOURA2  = 17035360,
            RANCH_WAMOURA3  = 17035361,
            RANCH_WAMOURA4  = 17035362,
            RANCH_WAMOURA5  = 17035363,
            RANCH_WAMOURA6  = 17035365,
            RANCH_WAMOURA7  = 17035367,
            RANCH_WAMOURA8  = 17035368,
            RANCH_WAMOURA9  = 17035369,
            RANCH_WAMOURA10 = 17035370,
            RANCH_WAMOURA11 = 17035371,
            RANCH_WAMOURA12 = 17035372,
            RANCH_WAMOURA13 = 17035376,
            RANCH_WAMOURA14 = 17035377,
            RANCH_WAMOURA15 = 17035378,
        },
        -- Egg Conservation
        [28] =
        {
        },
        -- Operation Black Pearl
        [29] =
        {
        },
        -- Better Than One
        [30] =
        {
        }
    },

    npc =
    {
        ANCIENT_LOCKBOX = 17035478,
        RUNE_OF_RELEASE = 17035479,
        _1r8            = 17035512,
        _1rd            = 17035517,
        _1rg            = 17035520,
        _1rm            = 17035526,
        _1rn            = 17035527,
        _1rx            = 17035537,
        _1ry            = 17035538,
        _1rz            = 17035539,
        _jr0            = 17035540,
        _jr1            = 17035541,
        _jrc            = 17035552,
        _jre            = 17035554,
        QIQIRN_MINE1    = 17037312,
        QIQIRN_MINE2    = 17037313,
        QIQIRN_MINE3    = 17037314,
        QIQIRN_MINE4    = 17037315,
    }
}

return zones[tpz.zone.LEBROS_CAVERN]

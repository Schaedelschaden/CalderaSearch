-----------------------------------
-- Area: Escha_RuAun
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[tpz.zone.ESCHA_RUAUN] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6384, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6390, -- Obtained: <item>.
        GIL_OBTAINED            = 6391, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6393, -- Obtained key item: <keyitem>.
        ITEMS_OBTAINED          = 6399, -- You obtain <number> <item>!
        CARRIED_OVER_POINTS     = 7001, -- You have carried over <number> login point[/s].
        LOGIN_CAMPAIGN_UNDERWAY = 7002, -- The [/January/February/March/April/May/June/July/August/September/October/November/December] <number> Login Campaign is currently underway!<space>
        LOGIN_NUMBER            = 7003, -- In celebration of your most recent login (login no. <number>), we have provided you with <number> points! You currently have a total of <number> points.
    },
    mob =
    {
        WARDER_OF_COURAGE_1  = 17961616, -- Three spawns possible
        WARDER_OF_COURAGE_2  = 17961617,
        WARDER_OF_COURAGE_3  = 17961618,
        WARDERS_WYNAV        = 17961619, -- Up to 18 Wynavs can be active at any given time. Warder of Courage uses the first 9 (base ID and + 1 to + 8)
        WARDER_OF_TEMPERANCE = 17961330,
        WARDER_OF_FORTITUDE  = 17961331,
        WARDER_OF_FAITH      = 17961334,
        WARDER_OF_JUSTICE    = 17961335,
        WARDER_OF_HOPE       = 17961342,
        WARDER_OF_PRUDENCE_1 = 17961343, -- Spawns both versions of the NM simultaneously
        WARDER_OF_PRUDENCE_2 = 17961344, -- Spawns both versions of the NM simultaneously
        WARDER_OF_LOVE       = 17961345,
        WARDER_OF_DIGNITY    = 17961373,
        WARDER_OF_LOYALTY    = 17961374,
        WARDER_OF_MERCY      = 17961375,
    },
    npc =
    {
    },
}

return zones[tpz.zone.ESCHA_RUAUN]

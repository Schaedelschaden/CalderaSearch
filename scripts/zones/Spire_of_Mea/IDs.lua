-----------------------------------
-- Area: Spire_of_Mea
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[tpz.zone.SPIRE_OF_MEA] =
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
        FAINT_SCRAPING          = 7089, -- You can hear a faint scraping sound from within, but the way is barred by some strange membrane...
        CANT_REMEMBER           = 7641, -- You cannot remember when exactly, but you have obtained <item>!
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[tpz.zone.SPIRE_OF_MEA]

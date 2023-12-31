-----------------------------------
-- Area: Ceizak Battlegrounds (261)
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[tpz.zone.CEIZAK_BATTLEGROUNDS] =
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
        HOMEPOINT_SET           = 7791, -- Home point set!
        UNCANNY_SENSATION       = 8033, -- You are assaulted by an uncanny sensation.
        ENERGIES_COURSE         = 8034, -- The arcane energies begin to course within your veins.
        MYSTICAL_WARMTH         = 8035, -- You feel a mystical warmth welling up inside you!
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[tpz.zone.CEIZAK_BATTLEGROUNDS]

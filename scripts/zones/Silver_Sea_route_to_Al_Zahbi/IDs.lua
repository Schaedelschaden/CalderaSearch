-----------------------------------
-- Area: Silver_Sea_route_to_Al_Zahbi
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[tpz.zone.SILVER_SEA_ROUTE_TO_AL_ZAHBI] =
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
        FISHING_MESSAGE_OFFSET  = 7057, -- You can't fish here.
        DOCKING_IN_AL_ZAHBI     = 7314, -- We are now docking in Al Zahbi.
        NEARING_AL_ZAHBI        = 7315, -- We are nearing Al Zahbi.
        YAHLIQ_SHOP_DIALOG      = 7317, -- You've picked the best place to shop for your items, guaranteed!
        ON_WAY_TO_AL_ZAHBI      = 7318, -- We are on our way to Al Zahbi. We will be arriving soon.
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[tpz.zone.SILVER_SEA_ROUTE_TO_AL_ZAHBI]

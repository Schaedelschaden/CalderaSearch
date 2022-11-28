-----------------------------------
-- Area: Ship_bound_for_Selbina
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[tpz.zone.SHIP_BOUND_FOR_SELBINA] =
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
        FISHING_MESSAGE_OFFSET  = 7238, -- You can't fish here.
        ON_WAY_TO_SELBINA       = 7339, -- We're on our way to Selbina. We should be there in [less than an hour/about 1 hour/about 2 hours/about 3 hours/about 4 hours/about 5 hours/about 6 hours/about 7 hours] (# [minute/minutes] in Earth time).
        RAJMONDA_SHOP_DIALOG    = 7344, -- There's nothing like fishing to pass the time!
        MAERA_SHOP_DIALOG       = 7345, -- May I offer you items to help you on your journey?
        ARRIVING_SOON_SELBINA   = 7346, -- We are on our way to Selbina. We will be arriving soon.<space>
    },
    mob =
    {
        ENAGAKURE     = 17678351,
        SEA_HORROR    = 17678350,
        SEA_HORROR_PH =
        {
            17678341, -- Sea Monk
            17678346, -- Sea Monk
        },
        SPAWN_GROUP_1 =
        {
            17678337, -- Sea Pugil
            17678338, -- Ocean Crab
        },
        SPAWN_GROUP_2 =
        {
            17678339, -- Ocean Pugil
            17678340, -- Pirate Pugil
        },
        SPAWN_GROUP_3 =
        {
            17678341, -- Sea Monk
            17678342, -- Sea Crab
        },
        SPAWN_GROUP_4 =
        {
            17678343, -- Sea Crab
            17678344, -- Sea Pugil
        },
        SPAWN_GROUP_5 =
        {
            17678345, -- Sea Pugil
            17678346, -- Sea Monk
        },
    },
    npc =
    {
    },
}

return zones[tpz.zone.SHIP_BOUND_FOR_SELBINA]
